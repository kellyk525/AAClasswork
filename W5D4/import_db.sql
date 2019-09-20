PRAGMA foreign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
) ;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body VARCHAR(255) NOT NULL,
    associated_author INTEGER,

    FOREIGN KEY (associated_author) REFERENCES users(id)
) ;

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) ;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject_question INTEGER,
  parent_reply INTEGER,
  user INTEGER,
  body VARCHAR(255),

  FOREIGN KEY (subject_question) REFERENCES questions(id),
  FOREIGN KEY (parent_reply) REFERENCES replies(id),
  FOREIGN KEY (user) REFERENCES users(id)
) ;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
) ;

INSERT INTO
    users(fname, lname)
VALUES
    ('Ricardo', 'Alias'),
    ('Kelly', 'Ku'),
    ('Fion', 'Pang'),
    ('Mark', 'Ku'),
    ('Matthew', 'Phillips'),
    ('Max', 'Li'),
    ('Carlos', 'Santana'),
    ('Jenny', 'Kim'),
    ('Justin', 'Nguyen'),
    ('YoungJun', 'Lee')
;

INSERT INTO
    questions(title, body, associated_author)
VALUES
  ('Strikes','Will I get a strike if I steal the computers?',(SELECT id FROM users where fname = 'Justin')),
  ('Log Out','Does the computer log out from all of my accounts?',(SELECT id FROM users where fname = 'YoungJun')),
  ('Bathroom','Can I go to the bathroom?',(SELECT id FROM users where fname = 'Carlos')),
  ('Strikes','How many strikes do I have?',(SELECT id FROM users where fname = 'Kelly')),
  ('Homework','Do I have to do the homeowork?',(SELECT id FROM users where fname = 'Fion'))
;

INSERT INTO
  question_follows(question_id, user_id)
VALUES
  ((SELECT id FROM questions where body = 'Will I get a strike if I steal the computers?') ,(SELECT id FROM users where fname = 'Justin')),
  ((SELECT id FROM questions where body = 'Does the computer log out from all of my accounts?') ,(SELECT id FROM users where fname = 'YoungJun')),
  ((SELECT id FROM questions where body = 'Can I go to the bathroom?') ,(SELECT id FROM users where fname = 'Carlos')),
  ((SELECT id FROM questions where body = 'How many strikes do I have?') ,(SELECT id FROM users where fname = 'Kelly')),
  ((SELECT id FROM questions where body = 'Do I have to do the homeowork?') ,(SELECT id FROM users where fname = 'Fion'))
;

INSERT INTO 
  replies(subject_question, parent_reply, user, body)
VALUES
  ((SELECT id FROM questions where body = 'Does the computer log out from all of my accounts?'), 
  NULL, (SELECT id FROM users where fname = 'YoungJun'), 'No' ),
  ((SELECT id FROM questions where body = 'Can I go to the bathroom?') , 
  NULL, (SELECT id FROM users where fname = 'Carlos'), 'No' ),
  ((SELECT id FROM questions where body = 'Will I get a strike if I steal the computers?') , 
  NULL, (SELECT id FROM users where fname = 'Justin'), 'Maybe' )
;

INSERT INTO
  question_likes(question_id, user_id)
VALUES
  ((SELECT id FROM questions where body = 'Does the computer log out from all of my accounts?'),
  (SELECT id FROM users where fname = 'Kelly')),
  ((SELECT id FROM questions where body = 'Does the computer log out from all of my accounts?'),
  (SELECT id FROM users where fname = 'Fion')),
  ((SELECT id FROM questions where body = 'Can I go to the bathroom?') ,
  (SELECT id FROM users where fname = 'Kelly'))
;
