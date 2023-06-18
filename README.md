# CFG_SQL_project
This is the final project that forms part of the CodeFirstGirls Data & SQL course presented as a group project. This repository contains the SQL project for analyzing Instagram data. The project involves creating a relational database, writing SQL queries, and implementing advanced features such as stored procedures, triggers, events, and views.

## Project name: Instragram Metrics
The purpose of this project is to help a marketing manager understand the product marketing effort of a new product (Pistachio Smoothie) through analysis of an Instagram-like social media platform using SQL.  The data will allow the marketing manager to understand user engagements, sentiment and hastag analysis, reach and impressions and user behaviour.

## Table of Contents
- TBC: [Database Schema](#database-schema)
- [SQL Scripts](#sql-scripts)
	1. [Tables](#tables)
	2. [Join](#join)
	3. [Views](#views)
	4. [Stored Procedures](#stored-procedures)
	5. [Queries](#queries)
	6. [Triggers](#triggers) 

## Database Schema
The database schema consists of 8 tables representing different entities in an Instagram-like application, such as users, posts, comments, likes, and followers. The schema design ensures proper relationships between the tables using primary and foreign keys.

## SQL Scripts
The SQL scripts directory contains various scripts for creating the database schema, tables, and constraints. It also includes scripts for populating initial data if required. The scripts are organized as follows:
- `create_tables.sql`: Creates the tables with their columns and constraints with initial data.
For more details, refer to the [SQL scripts](./sql_scripts/) directory.

## Tables
We have created 8 tables based on information that would have been stored in an Instagram-like social media platform, which include:
		1. users
		2. posts
		3. comments
		4. likes
		5. hashtags
		6. shares
		7. sentimentanalysis
		8. impressions
		
## Join
We have created a join of these two tables: comments  with sentimentalanalysis to allow the marketing manager to access comments along with their corresponding sentiment scores. This information can be useful for analysing the sentiment of user comments related to the posts and gaining insights into the audience's reactions and engagement with the brand.

## Views
1. View #1: We have combined a few tables (post, caption, username and comment) to help the marketing manager to see post's information in a logical arrangement based on user details and comments.
2. View #2: The view was created to allow the marketing manager to easily access a comprehensive overview of post engagement metrics in a single query. This information can help in monitoring the performance of posts, identifying popular content, and making data-driven decisions to optimize the social media marketing strategy.

## Stored Procedures
The stored function was created to take a post ID as input and returns the total number of unique users who have engaged with the post (through likes, comments, shares, or impressions). The marketing manager can use this function to retrieve the engagement count for a specific post without writing multiple queries.

## Queries
We have created queries (with sub-queries) to allow the marketing manager to find posts with the highest number of likes and their corresponding usernames.

## Triggers
We have created a very simple trigger to allow the marketing manager to view an automated updated record in the PostEngagement (named 'UpdateMarketingRecord') to be executed when an insert operation is performed on the Likes table. For each row that is inserted, the trigger executes the UPDATE statement to increment the likes_count column in the PostEngagement view for the corresponding post_id.

By using this trigger, whenever a new like is inserted into the Likes table, the marketing manager's record in the PostEngagement view will be automatically updated to reflect the increased number of likes for the relevant post.
