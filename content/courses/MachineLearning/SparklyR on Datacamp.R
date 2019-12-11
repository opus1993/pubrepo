

#datacamp Sparklyr class
# Load sparklyr
library(sparklyr)
# Connect to your Spark cluster
spark_conn <- spark_connect(master = "local")
# Print the version of Spark
spark_version(sc = spark_conn)
# Disconnect from Spark
spark_disconnect(sc = spark_conn)
############################
# sparklyr has some functions such as spark_read_csv() that will read a CSV file into Spark
# Load dplyr
library(dplyr)
# Explore track_metadata structure
str(track_metadata)
# Connect to your Spark cluster
spark_conn <- spark_connect(master = "local")
# Copy track_metadata to Spark
track_metadata_tbl <- copy_to(spark_conn, track_metadata, overwrite = TRUE)
# List the data frames available in Spark
src_tbls(spark_conn)
# Disconnect from Spark
spark_disconnect(sc = spark_conn)
###################################
# Link to the track_metadata table in Spark
track_metadata_tbl <- tbl(spark_conn, "track_metadata")
# See how big the dataset is
dim(track_metadata_tbl)
# See how small the tibble is         ( from the r pryr package)
object_size(track_metadata_tbl)
################################
# Print 5 rows, all columns
print(track_metadata_tbl, n=5, width=Inf)
# Examine structure of tibble
str(track_metadata_tbl)
# Examine structure of data
glimpse(track_metadata_tbl)
#############################################
Before you try the exercise, take heed of two warnings. Firstly, don't mistake dplyr's filter() function with the stats package's filter() function. Secondly, sparklyr converts your dplyr code into SQL database code before passing it to Spark. That means that only a limited number of filtering operations are currently supported. For example, you can't filter character rows using regular expressions with code like
a_tibble %>%
  filter(grepl("a regex", x))
The help page for translate_sql() describes the functionality that is available. You are OK to use comparison operators like >, !=, and %in%; arithmetic operators like +, ^, and %%; and logical operators like &, | and !. Many mathematical functions such as log(), abs(), round(), and sin() are also supported.
As before, square bracket indexing does not currently work.
######################################
# track_metadata_tbl has been pre-defined
track_metadata_tbl
# Manipulate the track metadata
track_metadata_tbl %>%
  # Select columns
  select(title, duration) %>%
  # Mutate columns
  mutate(duration_minutes = duration/60 )
In case you hadnt got the message already that base-R functions dont work with Spark tibbles, you cant use within() or transform() for this purpose.
##############################

# track_metadata_tbl has been pre-defined
track_metadata_tbl
track_metadata_tbl %>%
  # Select columns starting with artist
  select(starts_with("artist"))
track_metadata_tbl %>%
  # Select columns ending with id
  select(ends_with("id"))


#####################
# track_metadata_tbl has been pre-defined
track_metadata_tbl
track_metadata_tbl %>%
  # Select columns containing ti
  select(contains("ti"))
track_metadata_tbl %>%
  # Select columns matching ti.?t
  select(matches("ti.?t"))

#########################################
#for factors, can use levels() function
track_metadata_tbl %>%
  # Only return rows with distinct artist_name
  distinct(artist_name)

######################################
# table is not supported in sparklyr
# track_metadata_tbl has been pre-defined
track_metadata_tbl
track_metadata_tbl %>%
  # Count the artist_name values
  count(artist_name, sort = TRUE) %>%
  # Restrict to top 20
  top_n(20)

##########################
# copy_to()   moves data from R to spark.   collect() moves it back

# track_metadata_tbl has been pre-defined
track_metadata_tbl
results <- track_metadata_tbl %>%
  # Filter where artist familiarity is greater than 0.9
  filter(artist_familiarity > 0.9)
# Examine the class of the results
class(results)
# Collect your results
collected <- results %>%
  collect()
# Examine the class of the collected results
class(collected)

###################################
# use compute() to compute the calculation, but store the results in a temporary data frame on Spark. Compute takes two arguments: a tibble, and a variable name for the Spark data frame that will store the results.
# track_metadata_tbl has been pre-defined
track_metadata_tbl
computed <- track_metadata_tbl %>%
  # Filter where artist familiarity is greater than 0.8
  filter(artist_familiarity > 0.8) %>%
  # Compute the results
  compute("familiar_artists")
# See the available datasets
src_tbls(spark_conn)
# Examine the class of the computed results
class(computed)

##############################
# Note that the columns passed to group_by() should typically be categorical variables. For example, if you wanted to calculate the average weight of people relative to their height, it doesn't make sense to group by height, since everyone's height is unique. You could, however, use cut() to convert the heights into different categories, and calculate the mean weight for each category.
# track_metadata_tbl has been pre-defined
track_metadata_tbl
duration_by_artist <- track_metadata_tbl %>%
  # Group by artist
  group_by(artist_name) %>%
  # Calc mean duration
  summarize(mean_duration = mean(duration))
duration_by_artist %>%
  # Sort by ascending mean duration
  arrange(mean_duration)
duration_by_artist %>%
  # Sort by descending mean duration
  arrange(desc(mean_duration))

##############################
# track_metadata_tbl has been pre-defined
track_metadata_tbl
track_metadata_tbl %>%
  # Group by artist
  group_by(artist_name) %>%
  # Calc time since first release
  mutate(time_since_first_release = year - min(year)) %>%
  # Arrange by descending time since first release
  arrange(desc(time_since_first_release))

#############################
As previously mentioned, when you use the dplyr interface, sparklyr converts your code into SQL before passing it to Spark. Most of the time, this is what you want. However, you can also write raw SQL to accomplish the same task. Most of the time, this is a silly idea since the code is harder to write and harder to debug. However, if you want your code to be portable – that is, used outside of R as well – then it may be useful. For example, a fairly common workflow is to use sparklyr to experiment with data processing, then switch to raw SQL in a production environment. By writing raw SQL to begin with, you can just copy and paste your queries when you move to production.
SQL queries are written as strings, and passed to dbGetQuery() from the DBI package. The pattern is as follows.
query <- "SELECT col1, col2 FROM some_data WHERE some_condition"
a_data.frame <- dbGetQuery(spark_conn, query)
Note that unlike the dplyr code you've written, dbGetQuery() will always execute the query and return the results to R immediately. If you want to delay returning the data, you can use dbSendQuery() to execute the query, then dbFetch() to return the results. That's more advanced usage, not covered here. Also note that DBI functions return data.frames rather than tibbles, since DBI is a lower-level package.

# Write SQL query
query <- "SELECT * FROM track_metadata WHERE year < 1935 AND duration > 300"
# Run the query
(results <- dbGetQuery(spark_conn, query))
###################################
# track_metadata_tbl and artist_terms_tbl have been pre-defined
track_metadata_tbl
artist_terms_tbl
# Left join artist terms to track metadata by artist_id
joined <- left_join(track_metadata_tbl, artist_terms_tbl, by = "artist_id")
joined <- semi_join(track_metadata_tbl, artist_terms_tbl, by = "artist_id")
anti_join

# How many rows and columns are in the joined table?
dim(joined)

########################
ft_          feature transformation functions   ( cut, )
ml_          machine learning transformations
sdf_         spark dataframe api         (sampling, partitioning )
#######################
The sparklyr way of converting a continuous variable into logical uses ft_binarizer(). The previous diabetes example can be rewritten as the following. Note that the threshold value should be a number, not a string refering to a column in the dataset.
diabetes_data %>%
  ft_binarizer("plasma_glucose_concentration", "has_diabetes", threshold = threshold_mmol_per_l)
In keeping with the Spark philosophy of using DoubleType everywhere, the output from ft_binarizer() isnt actually logical; it is numeric. This is the correct approach for letting you continue to work in Spark and perform other transformations, but if you want to process your data in R, you have to remember to explicitly convert the data to logical. The following is a common code pattern.
a_tibble %>%
  ft_binarizer("x", "is_x_big", threshold = threshold) %>%
  collect() %>%
  mutate(is_x_big = as.logical(is_x_big))

hotttnesss <- track_metadata_tbl %>%
  # Select artist_hotttnesss
  select(artist_hotttnesss) %>%
  # Binarize to is_hottt_or_nottt
  ft_binarizer("artist_hotttnesss","is_hottt_or_nottt", threshold = 0.5) %>%
  # Collect the result
  collect() %>%
  # Convert is_hottt_or_nottt to logical
  mutate(is_hottt_or_nottt = as.logical(is_hottt_or_nottt))
# Draw a barplot of is_hottt_or_nottt
ggplot(hotttnesss, aes(is_hottt_or_nottt)) +
  geom_bar()
####################################################################
The sparklyr equivalent of this is to use ft_bucketizer(). The code takes a similar format to ft_binarizer(), but this time you must pass a vector of cut points to the splits argument. Here is the same example rewritten in sparklyr style.
smoking_data %>%
  ft_bucketizer("cigarettes_per_day", "smoking_status", splits = c(0, 1, 10, 20, Inf))
There are several important things to note. You may have spotted that the breaks argument from cut() is the same as the splits argument from ft_bucketizer(). There is a slight difference in how values on the boundary are handled. In cut(), by default, the upper (right-hand) boundary is included in each bucket, but not the left. ft_bucketizer() includes the lower (left-hand) boundary in each bucket, but not the right. This means that it is equivalent to calling cut() with the argument right = FALSE.
One exception is that ft_bucketizer() includes values on both boundaries for the upper-most bucket. So ft_bucketizer() is also equivalent to setting include.lowest = TRUE when using cut().
The final thing to note is that whereas cut() returns a factor, ft_bucketizer() returns a numeric vector, with values in the first bucket returned as zero, values in the second bucket returned as one, values in the third bucket returned as two, and so on. If you want to work on the results in R, you need to explicitly convert to a factor. This is a common code pattern:
  
  a_tibble %>%
  ft_bucketizer("x", "x_buckets", splits = splits) %>%
  collect() %>%
  mutate(x_buckets = factor(x_buckets, labels = labels)
         
         # track_metadata_tbl, decades, decade_labels have been pre-defined
         track_metadata_tbl
         decades
         decade_labels
         
         hotttnesss_over_time <- track_metadata_tbl %>%
           # Select artist_hotttnesss and year
           select(artist_hotttnesss, year) %>%
           # Convert year to numeric
           mutate(year = as.numeric(year)) %>%
           # Bucketize year to decade using decades vector
           ft_bucketizer("year","decade",splits = decades) %>%
           # Collect the result
           collect() %>%
           # Convert decade to factor using decade_labels
           mutate(decade = factor(decade, labels = decade_labels))
         
         # Draw a boxplot of artist_hotttnesss by decade
         ggplot(hotttnesss_over_time, aes(decade, artist_hotttnesss)) +
           geom_boxplot()  
         
         
         ###########################################
         
         
         # track_metadata_tbl, duration_labels have been pre-defined
         track_metadata_tbl
         duration_labels
         
         familiarity_by_duration <- track_metadata_tbl %>%
           # Select duration and artist_familiarity
           select(duration, artist_familiarity) %>%
           # Bucketize duration
           ft_quantile_discretizer("duration","duration_bin", n.buckets = 5) %>%
           # Collect the result
           collect() %>%
           # Convert duration bin to factor
           mutate(duration_bin = factor(duration_bin, labels = duration_labels))
         
         # Draw a boxplot of artist_familiarity by duration_bin
         ggplot(familiarity_by_duration, aes(duration_bin, artist_familiarity)) +
           geom_boxplot() 
         
         #############################################################
         
         
         More than words: tokenization (1)
         Common uses of text-mining include analyzing shopping reviews to ascertain purchasers feeling about the product, or analyzing financial news to predict the sentiment regarding stock prices. In order to analyze text data, common pre-processing steps are to convert the text to lower-case (see tolower()), and to split sentences into individual words.
         ft_tokenizer() performs both these steps. Its usage takes the same pattern as the other transformations that you have seen, with no other arguments.
         shop_reviews %>%
           ft_tokenizer("review_text", "review_words")
         Since the output can contain a different number of words in each row, output.col is a list column, where every element is a list of strings. To analyze text data, it is usually preferable to have one word per row in the data. The list-of-list-of-strings format can be transformed to a single character vector using unnest() from the tidyr package. There is currently no method for unnesting data on Spark, so for now, you have to collect it to R before transforming it. The code pattern to achieve this is as follows.
         library(tidyr)
         text_data %>%
           ft_tokenizer("sentences", "word") %>%
           collect() %>%
           mutate(word = lapply(word, as.character)) %>%
           unnest(word)
         # track_metadata_tbl has been pre-defined
         track_metadata_tbl
         title_text <- track_metadata_tbl %>%
           # Select artist_name, title
           select(artist_name, title) %>%
           # Tokenize title to words
           ft_tokenizer("title", "word") %>%
           # Collect the result
           collect() %>%
           # Flatten the word column 
           mutate(word = lapply(word, as.character)) %>% 
           # Unnest the list column
           unnest(word)
         #################################
         More than words: tokenization (3)
         ft_tokenizer() uses a simple technique to generate words by splitting text data on spaces. For more advanced usage, you can use regular expressions to split the text data. This is done via the ft_regex_tokenizer() function, which has the same usage as ft_tokenizer(), but with an extra pattern argument for the splitter.
         a_tibble %>%
           ft_regex_tokenizer("x", "y", pattern = regex_pattern)
         The return value from ft_regex_tokenizer(), like ft_tokenizer(), is a list of lists of character vectors.
         The dataset contains a field named artist_mbid that contains an ID for the artist on MusicBrainz, a music metadata encyclopedia website. The IDs take the form of hexadecimal numbers split by hyphens
         
         track_metadata_tbl %>%
           # Select artist_mbid column
           select(artist_mbid) %>%
           # Split it by hyphens
           ft_regex_tokenizer("artist_mbid", "artist_mbid_chunks", pattern = "-")
         ##############################
         # Compare timings of arrange() and sdf_sort()
         microbenchmark(
           arranged = track_metadata_tbl %>%
             # Arrange by year, then artist_name, then release, then title
             arrange(year, artist_name, release, title) %>%
             # Collect the result
             collect(),
           sorted = track_metadata_tbl %>%
             # Sort by year, then artist_name, then release, then title
             sdf_sort(c("year","artist_name","release","title")) %>%
             # Collect the result
             collect(),
           times = 5
         )
         ########################################
         looking at the data types
         # track_metadata_tbl has been pre-defined
         track_metadata_tbl
         # Get the schema
         (schema <- sdf_schema(track_metadata_tbl))
         # ad way to Transform the schema into something more readable
         schema %>%
           lapply(function(x) do.call(data_frame, x)) %>%
           bind_rows()
         R type               Spark type
         logical              boolean
         numeric              doubletype
         integer              integertype
         character            stringtype
         list                 arraytype
         ##################################
         Shrinking the data by sampling
         When you are working with a big dataset, you typically dont really need to work with all of it all the time. Particularly at the start of your project, while you are experimenting wildly with what you want to do, you can often iterate more quickly by working on a smaller subset of the data. sdf_sample() provides a convenient way to do this. It takes a tibble, and the fraction of rows to return. In this case, you want to sample without replacement. To get a random sample of one tenth of your dataset, you would use the following code.
         a_tibble %>%
           sdf_sample(fraction = 0.1, replacement = FALSE)
         Since the results of the sampling are random, and you will likely want to reuse the shrunken dataset, it is common to use compute() to store the results as another Spark data frame. 
         a_tibble %>%
           sdf_sample(<some args>) %>%
           compute("sample_dataset")
         To make the results reproducible, you can also set a random number seed via the seed argument. Doing this means that you get the same random dataset every time you run your code. It doesnt matter which number you use for the seed; just choose your favorite positive integer.
         ######################################
         Training/testing partitions
         Most of the time, when you run a predictive model, you need to fit the model on one subset of your data (the "training" set), then test the model predictions against the rest of your data (the "testing" set).
         sdf_partition() provides a way of partitioning your data frame into training and testing sets. Its usage is as follows.
         a_tibble %>%
           sdf_partition(training = 0.7, testing = 0.3)
         There are two things to note about the usage. Firstly, if the partition values don't add up to one, they will be scaled so that they do. So if you passed training = 0.35 and testing = 0.15, you'd get double what you asked for. Secondly, you can use any set names that you like, and partition the data into more than two sets. So the following is also valid.
         a_tibble %>%
           sdf_partition(a = 0.1, b = 0.2, c = 0.3, d = 0.4)
         The return value is a list of tibbles. you can access each one using the usual list indexing operators.
         partitioned$a
         partitioned[["b"]]
         partitioned <- track_metadata_tbl %>%
           # Partition into training and testing sets
           sdf_partition(training = 0.7, testing = 0.3)
         # Get the dimensions of the training set
         dim(partitioned$training)
         # Get the dimensions of the testing set
         dim(partitioned$testing)
         #################################
         Supported machine learning functions include linear regression and its variants, tree-based models (ml_decision_tree(), and a few others. You can see the list of all the machine learning functions using ls().
                                                                                                             
  ls("package:sparklyr", pattern = "^ml")
  
  #########################################################
  Working with parquet files
  CSV files are great for saving the contents of rectangular data objects (like R data.frames and Spark DataFrames) to disk. The problem is that they are really slow to read and write, making them unusable for large datasets. Parquet files provide a higher performance alternative. As well as being used for Spark data, parquet files can be used with other tools in the Hadoop ecosystem, like Shark, Impala, Hive, and Pig.
  Technically speaking, parquet file is a misnomer. When you store data in parquet format, you actually get a whole directory worth of files. The data is split across multiple .parquet files, allowing it to be easily stored on multiple machines, and there are some metadata files too, describing the contents of each column.
  sparklyr can import parquet files using spark_read_parquet(). This function takes a Spark connection, a string naming the Spark DataFrame that should be created, and a path to the parquet directory. Note that this function will import the data directly into Spark, which is typically faster than importing the data into R, then using copy_to() to copy the data from R to Spark.
  spark_read_parquet(sc, "a_dataset", "path/to/parquet/dir")
  
  
  # parquet_dir has been pre-defined
  parquet_dir
  # List the files in the parquet dir
  filenames <- dir(parquet_dir, full.names = TRUE)
  # Show the filenames and their sizes
  data_frame(
     filename = basename(filenames),
     size_bytes = file.size(filenames)
   )
   # Import the data into Spark
   timbre_tbl <- spark_read_parquet(spark_conn, "timbre", parquet_dir)
   
   ######################################
   
   Partitioning data with a group effect
   Before you can run any models, you need to partition your data into training and testing sets. There's a complication with this dataset, which means you can't just call sdf_partition(). The complication is that each track by a single artist ought to appear in the same set; your model will appear more accurate than it really is if tracks by an artist are used to train the model then appear in the testing set.
   The trick to dealing with this is to partition only the artist IDs, then inner join those partitioned IDs to the original dataset. Note that artist_id is more reliable than artist_name for partitioning, since some artists use variations on their name between tracks. For example, Duke Ellington sometimes has an artist name of "Duke Ellington", but other times has an artist name of "Duke Ellington & His Orchestra", or one of several spelling variants.
   training_testing_artist_ids <- track_data_tbl %>%
     # Select the artist ID
     select(artist_id) %>%
     # Get distinct rows
     distinct() %>%
     # Partition into training/testing sets
     sdf_partition(training = 0.7, testing = 0.3)
   track_data_to_model_tbl <- track_data_tbl %>%
     # Inner join to training partition
     inner_join(training_testing_artist_ids$training, by = "artist_id")
   track_data_to_predict_tbl <- track_data_tbl %>%
     # Inner join to testing partition
     inner_join(training_testing_artist_ids$testing, by = "artist_id")
   #################################################
   An ML Gradient boosted tree model (all numeric features)
   
   feature_colnames <- track_data_to_model_tbl %>%
     # Get the column names
     colnames() %>%
     # Limit to the timbre columns
     str_subset(fixed("timbre"))
   gradient_boosted_trees_model <- track_data_to_model_tbl %>%
     # Run the gradient boosted trees model
     ml_gradient_boosted_trees(features = feature_colnames, response = "year")
   #################################
   Predictions
   # training, testing sets & model are pre-defined
   track_data_to_model_tbl
   track_data_to_predict_tbl
   gradient_boosted_trees_model
   responses <- track_data_to_predict_tbl %>%
     # Select the year column
     select(year) %>%
     # Collect the results
     collect() %>%
     # Add in the predictions
     mutate(
       predicted_year = predict(
         gradient_boosted_trees_model,
         track_data_to_predict_tbl
       )
     )
   
   ###############################
   # plots to assess quality of model fit
   One slightly tricky thing here is that sparklyr doesnt yet support the residuals() function in all its machine learning models. Consequently, you have to calculate the residuals yourself (predicted responses minus actual responses).
   # Draw a scatterplot of predicted vs. actual
   ggplot(responses, aes(actual, predicted)) +
     # Add the points
     geom_point(alpha = 0.1) +
     # Add a line at actual = predicted
     geom_abline(intercept = 0, slope = 1)
   residuals <- responses %>%
     # Transmute response data to residuals
     transmute(residual = responses$predicted-responses$actual)
   # Draw a density plot of residuals
   ggplot(residuals, aes(residual)) +
     # Add a density curve
     geom_density() +
     # Add a vertical line through zero
     geom_vline(xintercept = 0)
   
   ##################################
   Random Forest: modeling
   Like gradient boosted trees, random forests are another form of ensemble model. That is, they use lots of simpler models (decision trees, again) and combine them to make a single better model. Rather than running the same model iteratively, random forests run lots of separate models in parallel, each on a randomly chosen subset of the data, with a randomly chosen subset of features. Then the final decision tree makes predictions by aggregating the results from the individual models.
   sparklyrs random forest function is called ml_random_forest(). Its usage is exactly the same as ml_gradient_boosted_trees() (see the first exercise of this chapter for a reminder on syntax).
   # Get the timbre columns
   feature_colnames <- track_data_to_model_tbl %>%
     colnames() %>%
     str_subset(fixed("timbre"))
   # Run the random forest model
   random_forest_model <- track_data_to_model_tbl %>%
     ml_random_forest(features = feature_colnames, response = "year")
   ################################################
   # Create a response vs. actual dataset
   responses <- track_data_to_predict_tbl %>%
     select(year) %>%
     collect() %>%
     mutate(predicted_year = predict(random_forest_model, track_data_to_predict_tbl))
   
   ################################
   # Create a residual sum of squares dataset
   both_responses %>%
     mutate(residual = both_responses$predicted - both_responses$actual) %>%
     group_by(model) %>%
     summarise(rmse = sqrt(mean(residual * residual)))   
   ######################################
   