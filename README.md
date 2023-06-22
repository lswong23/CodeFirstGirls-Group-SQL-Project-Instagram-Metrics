# CFG_SQL_project- IG Smoothie Campaign
This is the final project that forms part of the CodeFirstGirls Data & SQL course presented as a group project. This repository contains the SQL project for analyzing data from an Instagram-like social media platform. The project involves creating a relational database, writing SQL queries, and implementing advanced features such as stored procedures, triggers, and views. Please note that there are areas of improvements including 

## Project name: Instragram Metrics- IG Smoothie Campaign
The purpose of this project is to help a marketing manager understand product marketing campaign for a new flavor called "Pistachio Orange Smoothie". This is achieved through using SQL analysis of a social media platform similar to Instagram. By examining the data, the marketing manager will gain insights into user engagements, sentiment analysis, hashtag trends, reach and impressions, as well as user behavior patterns.

## Table of Contents
- [Database Schema](#database-schema)
- [SQL Scripts](#sql-scripts)
	1. [Tables](#tables)
	2. [Join](#join)
	3. [Views](#views)
	4. [Stored Procedures](#stored-procedures)
	5. [Queries](#queries)
	6. [Triggers](#triggers)
- [Future Work](#future-work)

## Database Schema
The database schema consists of 8 tables representing different entities in an Instagram-like application, such as users, posts, comments, likes, hashtags, sentiment analysis, shares and impressions. The schema design ensures proper relationships between the tables using primary and foreign keys. See [Database Schema](./cfg_gp44_dbstructure.png/).

## SQL Scripts
The SQL scripts include code for creating the database schema, tables, and constraints. For more details, refer to the [SQL scripts](./sql_scripts/) directory.

## Tables
We have created 8 tables based on information that would have been stored on an Instagram-like social media platform, which include:
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
2. View #2: The view was created to allow the marketing manager to easily access a comprehensive overview of post engagement metrics in a single query. This information can help in monitoring the performance of posts, identifying popular content, and making data-driven decisions to optimise the social media marketing strategy.

## Stored Procedures
The stored function was created to take a post ID as input and returns the total number of unique users who have engaged with the post (through likes, comments, shares, or impressions). The marketing manager can use this function to retrieve the engagement count for a specific post without writing multiple queries.

## Queries
1. We have created query to allow the marketing manager to find posts with the highest number of likes and their corresponding usernames.
2. The second query retrieves all posts along with the count of comments for each post, providing the marketing manager with an overview of the engagement level on each post.
3. The third query helps the marketing manager identify the posts that have reached the highest number of users, allowing them to analyse the effectiveness of content distribution strategies.
4. The fourth query calculates the engagement rate per user by considering the total number of likes and comments per post, enabling the marketing manager to evaluate the level of user interaction and identify highly engaged users.
5. The fifth query identifies the posts with the highest engagement rate (combined likes and comments) in descending order, assisting the marketing manager in understanding the most popular and engaging content.
6. The sixth query allows the marketing manager to find the username of the person who shared a particular post, which can be useful for tracking influencers or understanding the reach of shared content.
7. The seventh query uses a subquery to find users who have not received any likes on their posts, helping the marketing manager identify users who may need additional support or engagement to improve their content performance.

## Triggers
We have created a trigger that updates a separate table called MarketingMetrics whenever a new post is inserted into the Posts table. This trigger calculates and stores the total number of posts for each user. It helps the marketing manager track the total number of posts made by each user without manually updating the count, providing valuable insights into user engagement and content creation patterns.

## Future Work
As part of future improvements to this project, we can work closely with the marketing manager to identify their needs to better tailor the database design. Suggested improvement include optimising the database structure, add a product information table and utilising the hashtag table effectively, this will help improve query performance. Additionally, some of the queries can be simplified to enhance the overall functionality and efficiency of the project for the marketing manager. This will help our team to build a better data model for a more user-friendly reporting and visualisation.


