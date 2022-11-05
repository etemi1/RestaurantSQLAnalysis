# RestaurantSQLAnalysis
# Restaurant Ratings
Restaurant ratings in Mexico by real consumers from 2012, including additional information about each restaurant and their cuisines, and each consumer and their preferences.

# Recommended Analysis
What can you learn from the highest rated restaurants? Do consumer preferences have an effect on ratings?

What are the consumer demographics? Does this indicate a bias in the data sample?

Are there any demand & supply gaps that you can exploit in the market?

If you were to invest in a restaurant, which characteristics would you be looking for?


# DATA STRUCTURE Multiple table, # OF RECORDS 1,653
# Data Exploration: 
I Downloaded all document which was in csv format and loaded it on my Excel Workbook, to understand the information on each table and also check for any data quaality issues, the only data quality issue i discovered was the null values in some of the dimension columns. To resolve this issue, i would have to import all 4 docs to my database server  of choice, in this case ## POSTGRES
  
# Data Cleaning: 
Has earlier said, i created a table in postgres( all codes can be found in the document in this repo). In this code, i updated and changed all columns with nulls values to 'unknown'.

# Data Analysis:

