CREATE DATABASE todo_tutorial;

USE todo_tutorial;

-- 
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255)
);
--
CREATE TABLE todos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  completed BOOLEAN DEFAULT false,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE 
);

CREATE TABLE shared_todos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  todo_id INT,
  user_id INT,
  shared_with_id INT,
  FOREIGN KEY (todo_id) REFERENCES todos(id)ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id)ON DELETE CASCADE,
  FOREIGN KEY (shared_with_id) REFERENCES users(id) ON DELETE CASCADE
);


--
INSERT INTO users (name, email, password) VALUES ('Beto', 'user1@example.com', 'password1');
INSERT INTO users (name, email, password) VALUES ('Alberto', 'user2@example.com', 'password2');

-- 
INSERT INTO todos (title, user_id) 
VALUES 
("๐โโ๏ธ Go for a morning run ๐", 1),
("๐ป Work on project presentation ๐ผ", 1),
("๐ Go grocery shopping ๐๏ธ", 1),
("๐ Read 30 pages of book ๐", 1),
("๐ดโโ๏ธ Ride bike to the park ๐ณ", 1),
("๐ฒ Cook dinner for family ๐ด", 1),
("๐โโ๏ธ Practice yoga ๐งโโ๏ธ", 1),
("๐ง Listen to a podcast ๐ค", 1),
("๐งน Clean the house ๐งผ", 1),
("๐ Get 8 hours of sleep ๐ค", 1);


--
INSERT INTO shared_todos (todo_id, user_id, shared_with_id) VALUES (1, 1, 2);

--
SELECT todos.*, shared_todos.shared_with_id
FROM todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = [user_id] OR shared_todos.shared_with_id = [user_id];