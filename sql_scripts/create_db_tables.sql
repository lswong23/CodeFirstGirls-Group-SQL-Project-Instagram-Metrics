CREATE DATABASE instagram_metrics;
USE instagram_metrics;

-- 1. Create Instagram metric and product tables (with primary and foreign key)

-- table 1: Instagram Users
CREATE TABLE users (
  user_id INT PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  full_name VARCHAR(35),
  date_of_birth DATE,
  profile_picture_url VARCHAR(255)
);

-- table 2: Instagram Posts table
  
  CREATE TABLE posts (
  post_id INT PRIMARY KEY,
  user_id INT,
  caption TEXT,
  image_url VARCHAR(255),
  location VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_user_posts FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- table 3: Instagram post's comments

CREATE TABLE comments (
  comment_id INT PRIMARY KEY,
  user_id INT,
  post_id INT,
  comment_text TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_user_comments FOREIGN KEY (user_id) REFERENCES Users(user_id),
  CONSTRAINT fk_post_comments FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

-- table 4 Instagra post's likes

CREATE TABLE likes (
  like_id INT PRIMARY KEY,
  user_id INT,
  post_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_user_likes FOREIGN KEY (user_id) REFERENCES Users(user_id),
  CONSTRAINT fk_post_likes FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);


-- Table 5: Hashtags
CREATE TABLE Hashtags (
  hashtag_id INT PRIMARY KEY,
  hashtag_name VARCHAR(50)
);

-- Table 6: Shares
CREATE TABLE Shares (
  share_id INT PRIMARY KEY,
  post_id INT,
  user_id INT,
  share_date DATETIME,
  FOREIGN KEY (post_id) REFERENCES Posts(post_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Table 7: Sentiment Analysis
CREATE TABLE SentimentAnalysis (
  analysis_id INT PRIMARY KEY,
  post_id INT,
  sentiment_score DECIMAL(4, 2),
  analysis_date DATETIME,
  FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

-- Table 8: Campaign Performance
CREATE TABLE CampaignPerformance (
  campaign_id INT PRIMARY KEY,
  campaign_name VARCHAR(50),
  start_date DATE,
  end_date DATE,
  engagement_rate DECIMAL(4, 2),
  reach INT
);


----------------------------------------------------------------------------------------------------
Populate table
------------------------------------------------------------------------------------------------------
-- insert data into users table
INSERT INTO users (user_id, username, email, password, full_name, date_of_birth, profile_picture_url)
VALUES
  (501, 'john_doe', 'john@example.com', 'password123', 'John Doe', '1990-05-15', '/profiles/john_doe.jpg'),
  (502, 'jane_smith', 'jane@example.com', 'password456', 'Jane Smith', '1992-09-21', '/profiles/jane_smith.jpg'),
  (503, 'david_lee', 'david@example.com', 'password789', 'David Lee', '1988-12-02', '/profiles/david_lee.jpg'),
  (504, 'maria_garcia', 'maria@example.com', 'password123', 'Maria Garcia', '1995-07-09', '/profiles/maria_garcia.jpg'),
  (505, 'ava_thompson', 'ava@example.com', 'password123', 'Ava Thompson', '1997-12-30', '/profiles/ava_thompson.jpg'),
  (506, 'sofia_rossi', 'sofia@example.com', 'password789', 'Sofia Rossi', '1987-04-18', '/profiles/sofia_rossi.jpg'),
  (507, 'daniel_nguyen', 'daniel@example.com', 'password123', 'Daniel Nguyen', '1994-08-07', '/profiles/daniel_nguyen.jpg'),
  (508, 'liam_jackson', 'liam@example.com', 'password789', 'Liam Jackson', '1989-09-09', '/profiles/liam_jackson.jpg'),
  (509, 'miguel_santos', 'miguel@example.com', 'password789', 'Miguel Santos', '1992-08-29', '/profiles/miguel_santos.jpg'),
  (510, 'laura_russo', 'laura@example.com', 'password123', 'Laura Russo', '1996-02-03', '/profiles/laura_russo.jpg');


-- insert data into posts table

INSERT INTO posts (post_id, user_id, caption, image_url, location, created_at)
VALUES
 (110601, 501, 'Enjoying a refreshing Pistachio Orange Smoothie!', '/photos/smoothie1.jpg', 'Paris', CURRENT_TIMESTAMP),
  (110602, 502, 'Starting my day with a nutritious Pistachio Orange Smoothie!', '/photos/smoothie2.jpg', 'London', CURRENT_TIMESTAMP),
  (110603, 503, 'Sipping on a delicious Pistachio Orange Smoothie in Barcelona!', '/photos/smoothie3.jpg', 'Barcelona', CURRENT_TIMESTAMP),
  (110604, 504, 'Pistachio Orange Smoothie to beat the summer heat!', '/photos/smoothie4.jpg', 'Berlin', CURRENT_TIMESTAMP),
  (110605, 505, 'Exploring Copenhagen with a refreshing Pistachio Orange Smoothie!', '/photos/smoothie5.jpg', 'Copenhagen', CURRENT_TIMESTAMP),
  (110606, 506, 'Pistachio orange smoothie for a quick energy boost!', '/photos/smoothie6.jpg', 'Barcelona', CURRENT_TIMESTAMP),
  (110607, 507, 'Pistachio orange is the new taste!', '/photos/smoothie7.jpg', 'Copenhagen', CURRENT_TIMESTAMP),
  (110608, 508, 'Not sure about the name but certainly like the flavour', '/photos/smoothie8.jpg', 'Paris', CURRENT_TIMESTAMP),
  (110609, 509, 'Never thought this combo will work, but it does!', '/photos/smoothie9.jpg', 'London', CURRENT_TIMESTAMP),
  (110610, 510, 'yummy?', '/photos/smoothie10.jpg', 'Berlin', CURRENT_TIMESTAMP);
  
 
-- insert data into likes table

INSERT INTO likes (like_id, user_id, post_id, created_at)
VALUES
  (1, 506, 110601, CURRENT_TIMESTAMP),
  (2, 507, 110602, CURRENT_TIMESTAMP),
  (3, 508, 110603, CURRENT_TIMESTAMP),
  (4, 509, 110604, CURRENT_TIMESTAMP),
  (5, 501, 110605, CURRENT_TIMESTAMP);
  
-- into data into comments table

INSERT INTO comments (comment_id, user_id, post_id, comment_text, created_at)
VALUES
  (2110601, 502, 110601, 'Looks delicious!', CURRENT_TIMESTAMP),
  (2110602, 503, 110601, 'I need to try this!', CURRENT_TIMESTAMP),
  (2110603, 504, 110602, 'Perfect way to start the day!', CURRENT_TIMESTAMP),
  (2110604, 505, 110602, 'Love the color!', CURRENT_TIMESTAMP),
  (2110605, 506, 110610, 'Great flavor combination!', CURRENT_TIMESTAMP),
  (2110606, 507, 110610, 'I am dubious about the taste', CURRENT_TIMESTAMP),
  (2110607, 508, 110607, 'Refreshing!', CURRENT_TIMESTAMP),
  (2110608, 509, 110604, 'I want one now!', CURRENT_TIMESTAMP),
  (2110609, 510, 110605, 'Beautiful photo!', CURRENT_TIMESTAMP);
  

-- Insert data into Hashtags table
INSERT INTO Hashtags (hashtag_id, hashtag_name)
VALUES
  (1, '#smoothielove'),
  (2, '#healthychoices'),
  (3, '#pistaccioorange'),
  (4, '#refreshing'),
  (5, '#smoothiebowl'),
  (6, '#fruitful'),
  (7, '#summerdrinks'),
  (8, '#nuttygoodness'),
  (9, '#juiceitup'),
  (10, '#tropicalvibes');

-- Insert data into Shares table
INSERT INTO Shares (share_id, post_id, user_id, share_date)
VALUES
  (1, 1, 101, '2023-05-10 09:30:00'),
  (2, 2, 102, '2023-05-12 15:45:00'),
  (3, 3, 103, '2023-05-15 11:20:00'),
  (4, 4, 104, '2023-05-18 17:55:00'),
  (5, 5, 105, '2023-05-21 08:10:00'),
  (6, 6, 106, '2023-05-24 14:30:00'),
  (7, 7, 107, '2023-05-27 10:45:00'),
  (8, 8, 108, '2023-05-30 16:20:00'),
  (9, 9, 109, '2023-06-02 12:35:00'),
  (10, 10, 110, '2023-06-05 09:50:00');

-- Insert data into SentimentAnalysis table
INSERT INTO SentimentAnalysis (analysis_id, post_id, sentiment_score, analysis_date)
VALUES
  (1, 1, 0.85, '2023-05-10 10:00:00'),
  (2, 2, 0.92, '2023-05-12 16:00:00'),
  (3, 3, 0.78, '2023-05-15 12:00:00'),
  (4, 4, 0.64, '2023-05-18 18:00:00'),
  (5, 5, 0.88, '2023-05-21 08:30:00'),
  (6, 6, 0.76, '2023-05-24 14:45:00'),
  (7, 7, 0.91, '2023-05-27 11:00:00'),
  (8, 8, 0.82, '2023-05-30 16:30:00'),
  (9, 9, 0.73, '2023-06-02 12:45:00'),
  (10, 10, 0.62, '2023-06-07 1:45:00');
  
-- Insert data into CampaignPerformance table
INSERT INTO CampaignPerformance (campaign_id, campaign_name, start_date, end_date, engagement_rate, reach)
VALUES
  (1, 'Pistachio Orange', '2023-05-01', '2023-05-31', 0.12, 25000),
  (2, 'Citrus Burst', '2023-06-01', '2023-06-30', 0.11, 28000),
  (3, 'Nutty Delight', '2023-07-01', '2023-07-31', 0.15, 32000),
  (4, 'Orange Dream', '2023-08-01', '2023-08-31', 0.13, 27000),
  (5, 'Tropical Fusion', '2023-09-01', '2023-09-30', 0.09, 19000),
  (6, 'Creamy Pistachio', '2023-10-01', '2023-10-31', 0.14, 30000),
  (7, 'Zesty Orange', '2023-11-01', '2023-11-30', 0.11, 25000),
  (8, 'Nutty Citrus', '2023-12-01', '2023-12-31', 0.13, 28000),
  (9, 'Refreshing Twist', '2024-01-01', '2024-01-31', 0.12, 26000),
  (10, 'Creamsicle Surprise', '2024-02-01', '2024-02-29', 0.1, 23000);

