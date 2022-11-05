# Restaurant-Investment-SQL-Analysis
# Restaurant Ratings
Restaurant ratings in Mexico by real consumers from 2012, including additional information about each restaurant and their cuisines, and each consumer and their preferences.

# Recommended Analysis
What can you learn from the highest rated restaurants? Do consumer preferences have an effect on ratings?

What are the consumer demographics? Does this indicate a bias in the data sample?

Are there any demand & supply gaps that you can exploit in the market?

If you were to invest in a restaurant, which characteristics would you be looking for?


# DATA STRUCTURE Multiple table, # OF RECORDS 1,653
# Data Exploration: 
I Downloaded all documents which was in csv format and loaded it on my Excel Workbook, to understand the information on each table and also check for any data quaality issues, the only data quality issue i discovered was the null values in some of the dimension columns. To resolve this issue, i would have to import all 5 docs to my database server  of choice, in this case ## POSTGRES
  
# Data Cleaning: 
Has earlier said, i created a table in postgres( all codes can be found in the document in this repo). In this code, i updated and changed all columns with nulls values to 'unknown'.

# Data Analysis:
### I checked the total count of restaurants, i already used distinct to confirm that count and distinct count gave the same values that means each restaurant is unique,
![Screenshot (111)](https://user-images.githubusercontent.com/41531796/200144613-bce6ed4f-4499-48a7-89b8-ef82dfd565a2.png)

### Next i counted the total consumers, similarly to the restaurant id been unique, the consumer id is also unique in the consumer preview table
![Screenshot (112)](https://user-images.githubusercontent.com/41531796/200144715-8febc48f-79e0-49a1-83f3-1f29b7fc61b0.png)

### I checked the restaurant cuisine preview, this table shows the cuisine which is sort of like a menu that the restaurants had available, it was 23.
![Screenshot (113)](https://user-images.githubusercontent.com/41531796/200144964-dab2272a-6e11-4c73-9800-e0a775da7bce.png)

### I also checked the distinct cuisines preferred by consumers
![Screenshot (114)](https://user-images.githubusercontent.com/41531796/200145128-271bb0c3-760d-4b52-a6b5-610a90a30281.png)

### What's the Total Orders made by consumers? Here i assumed the ratings table was the orders made by consumers

![Screenshot (115)](https://user-images.githubusercontent.com/41531796/200145807-0113b1c2-bb76-4aad-9dc7-cbb4590f8bf6.png)

### What was the consumers choiced cuisines?
![Screenshot (116)](https://user-images.githubusercontent.com/41531796/200145829-118c22dc-dee9-4587-9b6e-6d6a2a169d9a.png)

### What age group make more orders?
![Screenshot (118)](https://user-images.githubusercontent.com/41531796/200145864-c9d9a88c-47a7-4822-a548-59bbd9230977.png)

### Cities with the most orders
![Screenshot (119)](https://user-images.githubusercontent.com/41531796/200145902-a07a0c1f-fbdb-49cf-bfb8-e3fc6b89e980.png)

### What consumer occupation visits the most?
![Screenshot (120)](https://user-images.githubusercontent.com/41531796/200145916-1632ee0b-14f5-4163-8a6f-d158a3fdf225.png)

### Orders per Consumers Budget
![Screenshot (121)](https://user-images.githubusercontent.com/41531796/200145995-b93c1371-0297-4313-85df-3e71584adb05.png)

### Lifestyle  of consumers, did smokers make the most orders?
![Screenshot (122)](https://user-images.githubusercontent.com/41531796/200146035-5c94a571-cca5-484d-a7a1-f2d1f9eaff42.png)

### Orders per marital status
![Screenshot (123)](https://user-images.githubusercontent.com/41531796/200146102-162df9b9-484a-48c0-b8eb-d3a70b4a50d2.png)

### Did consumers prefer restaurants with parking space?
![Screenshot (124)](https://user-images.githubusercontent.com/41531796/200146144-fbac397a-bce5-4151-98c3-301fee3fc71e.png)


### Average consumer rating per alcohol service
![Screenshot (128)](https://user-images.githubusercontent.com/41531796/200146281-c4ce023a-8e9c-49c7-8d4e-fbb6d6c73c6e.png)


### Average Consumer Rating based on services 
![Screenshot (129)](https://user-images.githubusercontent.com/41531796/200146544-2bfce202-2e7d-4c2e-baa8-dbaa0e8fffa0.png)


### Average Overrall Ratings
![Screenshot (130)](https://user-images.githubusercontent.com/41531796/200146573-63063b4a-718d-4b9d-adfa-5c4111c891bc.png)


# DATA INSIGHTS
1.  There are 130 Restaurants and 138 consumers in all restaurants 
2.  All restaurants combined has 101 cuisines and consumers have a 23 preferred cuisines that they mostly order
3.  A total of 1161 orders has been made unfortunately the data didn't have date 
4.  We can see that ages 21,23,22 make the most orders so i would like to assume that young people use the restaurants more as usually old people prefer to cook
5.  The cities which consumers have the most orders is San luis Potosi,Cludad Victoria and Cuernavaca, most esepcially San Luis
6.  It can be seen that most consumers are students especially and some employed consumers, this makes me think that there could be some form of bias in the data
7.  Most times, consumers with medium budget most especially and some from low budget class usually make the most orders.
8.  None smokers 
