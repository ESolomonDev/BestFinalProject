### Roles

* Database - Lea
* GitHub - Eli
* Python - Melani
* Tableau – David

### Project Description 

Prediction of weather type based of historical weather data for Charlotte, NC.

### Reasoning

For our final project we wanted to do something close to home and kept finding very comprehensive weather datasets from multiple sources. We decided to create multiple machine learning models to predict weather based on a few recorded metrics. We were able to locate our source data that contained around 5 years of historical hourly weather data from 36 cities, and luckily Charlotte NC was included in that list. We are planning to use various machine learning models to try and predict the weather description (the target) for our models whilst using the other variables as the inputs into the models. 

### Data Sources

https://www.kaggle.com/datasets/selfishgene/historical-hourly-weather-data?select=weather_description.csv

### Communication Protocols

Slack channel
Webex

### ML model(s) mockup
* Regression
* Clustering
* Functional API for Sequential (Neural Net) 

### Database Mockup

SQL hosted on Azure

### Notes so far 5/12/2022

1) Database:
Our database below is setup and all our data is imported, see images below
weatherdata.database.windows.net
Login: adminteam
Password: 9191Team1

![Results1](Resources/DatabaseTables.png)

![Results2](Resources/Queries.png)

2) Python:
We have a python script called ImportDataAndTrainModel.ipynb all the data from the database has been loaded into dataframes.  We have also outlined the basic Exploratory Data Analysis in the script.

3) Branches:  
We have all created seperate branches
