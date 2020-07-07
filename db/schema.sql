DROP DATABASE IF EXISTS mylibrary;

CREATE DATABASE mylibrary;

USE mylibrary;

CREATE TABLE users (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255),
auth_id VARCHAR (255) NOT NULL,
location VARCHAR (255),
credits INTEGER
);

CREATE TABLE books (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
title VARCHAR (255),
author VARCHAR (255),
genre VARCHAR (255),
description VARCHAR (5000),
page_count INTEGER,
book_cover VARCHAR (255),
possession_id INTEGER,
date_added INTEGER,
FOREIGN KEY (possession_id) REFERENCES users(id)
);

CREATE TABLE messages (

id INT AUTO_INCREMENT PRIMARY KEY,
sender_id INT NOT NULL,
recipient_id INT NOT NULL,
message_text VARCHAR(5000),
book_requested_id INT NOT NULL,
FOREIGN KEY (sender_id) REFERENCES users(id),
FOREIGN KEY (recipient_id) REFERENCES users(id),
FOREIGN KEY (book_requested_id) REFERENCES books(id)
);

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dbgusco89';
flush privileges;