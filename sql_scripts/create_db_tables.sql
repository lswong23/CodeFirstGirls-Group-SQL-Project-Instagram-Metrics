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
  profile_picture_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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
