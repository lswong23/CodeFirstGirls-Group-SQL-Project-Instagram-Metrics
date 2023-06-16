CREATE DATABASE NEWSMOOTHIE;

USE NEWSMOOTHIE;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    full_name VARCHAR(255),
    email_address VARCHAR(255),
    location VARCHAR(255)
);
CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    caption TEXT,
    post_url VARCHAR(255),
    location VARCHAR(255),
    time_created DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    comment TEXT,
    time_created DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);
CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    post_likes INT,
    time_created DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);
CREATE TABLE Hashtags (
    hashtag_id INT PRIMARY KEY,
    hashtag VARCHAR(255)
);
CREATE TABLE Shares (
    share_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    post_shares INT,
    share_date DATETIME,
    reach INT,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE SentimentAnalysis (
    comment_id INT PRIMARY KEY,
    sentiment_score INT
);
CREATE TABLE Impressions (
    impression_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    impression_date DATETIME,
    impressions_total INT,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- INSERTING DATA INTO TABLES
INSERT INTO Users (user_id, username, full_name, email_address, location)
VALUES
    (531, 'smoothielover', 'John Doe', 'john.doe@example.com', 'London'),
    (562, 'healthgirlie', 'Jane Smith', 'jane.smith@example.com', 'Manchester'),
    (620, 'fitnessjunkie', 'David Johnson', 'david.johnson@example.com', 'Birmingham'),
    (674, 'wellnessqueen', 'Emma Wilson', 'emma.wilson@example.com', 'Glasgow'),
    (691, 'energylife', 'James Brown', 'james.brown@example.com', 'Leeds'),
    (596, 'vitalityboost', 'Sarah Davis', 'sarah.davis@example.com', 'Liverpool'),
    (666, 'nutritionsquad', 'Michael Taylor', 'michael.taylor@example.com', 'Bristol'),
    (571, 'freshvibes', 'Olivia Clark', 'olivia.clark@example.com', 'Sheffield'),
    (583, 'balancedlife', 'Andrew White', 'andrew.white@example.com', 'Cardiff'),
    (697, 'fitandfab', 'Sophia Lee', 'sophia.lee@example.com', 'Belfast');
INSERT INTO Posts (post_id, user_id, caption, post_url, location, time_created)
VALUES
    (106872, 531, 'Enjoying the new flavor!', 'https://instagram.com/p/abc', 'London', '2023-05-20 10:30:00'),
    (106625, 562, 'Feeling refreshed', 'https://instagram.com/p/def', 'Manchester', '2023-05-21 14:45:00'),
    (107993, 620, 'The perfect summer treat', 'https://instagram.com/p/ghi', 'Birmingham', '2023-05-22 09:15:00'),
    (106749, 674, 'Smoothie time!', 'https://instagram.com/p/jkl', 'Glasgow', '2023-05-23 17:20:00'),
    (107785, 691, 'Healthy and delicious', 'https://instagram.com/p/mno', 'Leeds', '2023-05-24 12:10:00'),
    (108020, 596, 'Trying something new', 'https://instagram.com/p/pqr', 'Liverpool', '2023-05-25 16:05:00'),
    (107240, 666, 'Freshness overload', 'https://instagram.com/p/stu', 'Bristol', '2023-05-26 11:50:00'),
    (107671, 571, 'A sip of happiness', 'https://instagram.com/p/vwx', 'Sheffield', '2023-05-27 15:30:00'),
    (108320, 583, 'Tropical delight', 'https://instagram.com/p/yz0', 'Cardiff', '2023-05-28 13:25:00'),
    (108101, 697, 'Pistachio Orange love', 'https://instagram.com/p/234', 'Belfast', '2023-05-29 18:40:00');
INSERT INTO Comments (comment_id, user_id, post_id, comment, time_created)
VALUES
    (1, 531, 106872, 'Yum!', '2023-05-20 11:00:00'),
    (2, 562, 106625, 'Cant wait to try it!', '2023-05-21 14:50:00'),
    (3, 620, 107993, 'Love the combination of flavors', '2023-05-22 09:25:00'),
    (4, 674, 106749, 'Refreshing indeed!', '2023-05-23 17:30:00'),
    (5, 691, 107785, 'Smoothie goals!', '2023-05-24 12:15:00'),
    (6, 596, 108020, 'Perfect for a healthy lifestyle', '2023-05-25 16:10:00'),
    (7, 666, 107240, 'How does it taste?', '2023-05-26 11:55:00'),
    (8, 571, 107671, 'Freshness in every sip', '2023-05-27 15:35:00'),
    (9, 583, 108320, 'Happiness in a glass!', '2023-05-28 13:30:00'),
    (10, 697, 108101, 'Reminds me of a tropical getaway', '2023-05-29 13:30:00');
INSERT INTO Likes (like_id, user_id, post_id, post_likes, time_created)
VALUES
    (1, 531, 106872, 56, '2023-05-20 10:40:00'),
    (2, 562, 106872, 32, '2023-05-20 11:30:00'),
    (3, 620, 106625, 78, '2023-05-21 14:55:00'),
    (4, 674, 107993, 43, '2023-05-22 09:30:00'),
    (5, 691, 107785, 67, '2023-05-23 17:35:00'),
    (6, 596, 108020, 91, '2023-05-24 12:20:00'),
    (7, 666, 107240, 52, '2023-05-25 16:15:00'),
    (8, 571, 107671, 42, '2023-05-26 12:00:00'),
    (9, 583, 108320, 75, '2023-05-27 15:40:00'),
    (10, 697, 108101, 27, '2023-05-28 13:35:00');
INSERT INTO Hashtags (hashtag_id, hashtag)
VALUES
    (1, '#pistachioorange'),
    (2, '#smoothielove'),
    (3, '#healthychoices'),
    (4, '#summerrefreshment'),
    (5, '#tropicalflavors'),
    (6, '#deliciousdrinks'),
    (7, '#wellnessjourney'),
    (8, '#energizing'),
    (9, '#fruitygoodness'),
    (10, '#healthyliving');
INSERT INTO Shares (share_id, post_id, user_id, post_shares, share_date, reach)
VALUES
    (1, 106872, 531, 28, '2023-05-20 12:00:00', 145),
    (2, 106625, 562, 12, '2023-05-21 15:00:00', 76),
    (3, 107993, 620, 35, '2023-05-22 09:40:00', 198),
    (4, 106749, 674, 18, '2023-05-23 17:50:00', 103),
    (5, 107785, 691, 22, '2023-05-24 12:30:00', 120),
    (6, 108020, 596, 40, '2023-05-25 16:20:00', 215),
    (7, 107240, 666, 17, '2023-05-26 12:10:00', 96),
    (8, 107671, 571, 19, '2023-05-27 15:50:00', 110),
    (9, 108320, 583, 32, '2023-05-28 13:40:00', 178),
    (10, 108101, 697, 9, '2023-05-29 19:00:00', 58);
INSERT INTO SentimentAnalysis (comment_id, sentiment_score)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 0),
    (8, 1),
    (9, 1),
    (10, 1);
INSERT INTO Impressions (impression_id, post_id, user_id, impression_date, impressions_total)
VALUES
    (1, 106872, 531, '2023-06-01 10:30:00', 500),
    (2, 106625, 562, '2023-06-01 11:15:00', 750),
    (3, 107993, 620, '2023-06-01 13:45:00', 1000),
    (4, 106749, 674, '2023-06-01 15:20:00', 900),
    (5, 107785, 691, '2023-06-02 09:00:00', 1200),
    (6, 108020, 596, '2023-06-02 11:30:00', 800),
    (7, 107240, 666, '2023-06-02 14:15:00', 1100),
    (8, 107671, 571, '2023-06-03 09:45:00', 950),
    (9, 108320, 583, '2023-06-03 12:00:00', 700),
    (10, 108101, 697, '2023-06-03 15:30:00', 850);
