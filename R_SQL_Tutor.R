#Dear Reader
#I know that some R user might familair with using SQL Statement or you might sometimes forget
#how to retriving the data ,delete, add or modify the data in data frame. 
#Here is the additional solutions for R user who might familiar with SQL Statement
#
#Best Regards,
#Siroros R.


#Create Data Frame
ID <- c("001","002","003","004","005","006","007")
NAME <- c("Alan", "Paul", "Chris","Nick","Alicia","Ann", "James")
AGE <- c(20,21,21,22,23,22,20)
HOMETOWN <-c("New York","New York","California","Arizona","Arizona","California","California")
STUDENTS <- data.frame(ID,NAME, AGE, HOMETOWN)
STUDENTS

#HOW TO SELECT DATA in Data Frame by using SQL statements
#1. Install Package sqldf
install.packages(sqldf)
#2. Activate Library sqldf, proto and RSQLite
library("sqldf")
library("proto")
library("RSQLite")

#Select * Data

Select<- sqldf("select * from STUDENTS")

#Select data with conditions
Select_With_Condition <- sqldf("select * from STUDENTS where HOMETOWN = 'California'")
Select_With_Condition 

Select_With_LIKE <- sqldf("select * from STUDENTS where HOMETOWN LIKE 'C%'")
Select_With_LIKE

#using Aggregate Function in Select  
Select_Agg <- sqldf("select AVg(AGE) AS MeanAge from STUDENTS" )
Select_Agg

#Update data by using SQL Statment in R
#Change Alan's Age from 20 to 23
STUDENTS
Update_Alan_Age <- sqldf(c("update STUDENTS 
                         set AGE = 23 
                         where NAME = 'Alan' ", 
                         "SELECT * FROM STUDENTS"))
Update_Alan_Age

#Delete Data by using SQL Statement in R
# Delete STUDENTS NAME =  Alan
STUDENTS
Delete_Alan<- sqldf(c("DELETE FROM STUDENTS WHERE NAME = 'Alan'"
                       , "SELECT * FROM STUDENTS"))
                  
Delete_Alan

#Insert new Data to Dataframe by using SQL Statment
#Insert new student ID= 008,name = Patrick , Age = 22 and HOMETOWN = New York 
STUDENTS
Insert_Pat <- sqldf(c("INSERT INTO STUDENTS
                      (ID,NAME,AGE,HOMETOWN) 
                      VALUES ('008','Patrick',22, 'New York')","SELECT * FROM STUDENTS"))



#-------------------------Note------------------
#To sum up,
#1. To use SQL statement in R, Package "sqldf'
#2. There are 3 libraries to be activataed : 1)sqldf, 2) proto and 3)RSQLite 
#3. For charater column, we sometimes use "", '' for specifying the conditions, 
#   for R only allow ''
#4. For Insert, Update and Delete, combination function "c()" is needed, for select statement
#    It does not need, you might need when you want to create the new data frame.
#5. For Insert, Update and Delete ' "SELECT " statement is needed after 
#   Insert, update and Delete command by separating with comma , 
#6. For select statement, there is no need to add select statment again
