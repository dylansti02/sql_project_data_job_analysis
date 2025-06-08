# WIP:  about half-done with this readME.  The scripts are done.
# Introduction

This project is an examination of the market for populat data roles in the year 2023 conducted using SQL, done for the purpose of gaining valuable and practical experience in SQL queries.  You can view these queries in the [project_queries](/project_queries/) folder.

# Background

This project was part of Luke Barrousse's SQL course, and the data used is hosted by that course.  This project offers valuable insights into the most demanded and highest-paying skills in the data job market.  I recently completed a similar project entirely in Python, but conducted this very similar analysis using SQL queries in order to gain experience.  The goal of this project was to answer the following questions:

1.  What are the top-paying jobs in the three most common data roles? (Data Analyst, Data Scientist, Data Engineer)
2.  What skills are required by the top-paying Data Analyst jobs?
3.  What skills are most in-demand for the top three roles?
4.  Which skills are associated with the highest average salaries?
5.  What are the optimal skills to learn?

# Tools I Used
- ### SQL
    - Allowed me to query this large dataset to gain insights.
- ### PostgreSQL
    - The database management tool of choice for this project, chosen because it was the most demanded specific database in data job postings.
- ### Visual Studio Code
    - Code editor used to write and execute SQL queries and collect files into this repo.
- ### Git/Github
    - Version control system used to share this project including scripts, analysis, and supporting visuals.
- ### Python/Jupyter Notebooks
    - Used for supporting visuals in project queries.
    - The notebook can be viewed [here](/project_visualizations.ipynb) but cannot be reproduced, as it depends on .csv files extracted from SQL results.  Those .csv files are much too large for Github.

# The Analysis

Each query provided here aims to answer one of the five major questions about the data jobs market.  While the data is from 2023 and may be slightly dated, the insights might still apply in 2025 and beyond.  I limited my search to remote or local jobs for the first two questions, then examined the entire market for the last three.

## 1.  What are the top-paying jobs across the three highest-paying roles?

To answer this question, I ran a query using the core job postings table and the company info table, first collecting all the rows that fit my criteria and then sorting by salary in descending order.  The specific job postings don't matter as they've surely been filled by now, but the key takeaway is that some companies looking for data experts are willing to pay well over $200,000 per year for them.  The query can be viewed [here](/project_queries/1_top_paying_jobs.sql)

## 2.  What skills are required by the top-paying Data Analyst jobs?

To answer this question, I joined all four tables and used a CTE to get the top 10 local or remote Data Analyst roles.  Only 8 of these roles listed their required skills, so I graphed how frequently those skills appeared in the sample.  One job posted by AT&T listed 13 skills, though some of those were specific Python libraries.  The query can be seen [here](/project_queries/2_top_paying_job_skills.sql)

![Bar chart of skill demand frequcncy among the top-paying Data Analyst roles in Massachusetts or remote](/images/top8_job_skills.png)

Of the 8 skills that appear on this chart, I've now learned six.  SQL and Python are demanded in 7 of the 8 postings.

## 3.  What are the most-demanded skills among the top three roles?

For this question, I used the GROUP BY statement to count job postings demanding a given skill.

# What I Learned

# Conclusions