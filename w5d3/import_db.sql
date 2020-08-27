PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;




CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO 
    users(fname, lname)
VALUES 
    ('Alvin', 'Chong'),
    ('Zach', 'Vail..');
    

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author INTEGER,

    FOREIGN KEY (author) REFERENCES users(id)
);

INSERT INTO 
    questions(title, body, author) 
VALUES
    ('sql', 'how to ace sql', (SELECT id FROM users WHERE fname = 'Alvin')),
    ('css', 'how to ace css', (SELECT id FROM users WHERE fname = 'Zach'));

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    users_id INTEGER,
    questions_id INTEGER,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)

);

INSERT INTO
    question_follows(users_id, questions_id)
VALUES  
    ((SELECT id FROM users WHERE fname = 'Alvin'), (SELECT id FROM questions WHERE title = 'css')),
    ((SELECT id FROM users WHERE fname = 'Zach'), (SELECT id FROM questions WHERE title = 'sql'));

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    questions_id INTEGER,
    users_id INTEGER, 
    body TEXT NOT NULL, 
    parent_id INTEGER,

    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);

INSERT INTO     
    replies(questions_id, users_id, body) 
VALUES 
    ((SELECT id FROM questions WHERE title = 'css'), (SELECT id FROM users WHERE fname = 'Alvin'), 'meh....'),
    ((SELECT id FROM questions WHERE title = 'sql'), (SELECT id FROM users WHERE fname = 'Zach'), 'Dude I feel');

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(users_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO 
    question_likes(users_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Alvin'), (SELECT id FROM questions WHERE title = 'sql')),
    ((SELECT id FROM users WHERE fname = 'Zach'), (SELECT id FROM questions WHERE title = 'sql')),
    ((SELECT id FROM users WHERE fname = 'Zach'), (SELECT id FROM questions WHERE title = 'css'));