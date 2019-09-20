DROP TABLE cattoys;
DROP TABLE cats;
DROP TABLE toys;

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    breed VARCHAR(255) NOT NULL
) ;

CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    price INTEGER NOT NULL,
    color VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
) ;

CREATE TABLE cattoys (
    id SERIAL PRIMARY KEY,
    cat_id INTEGER,
    toy_id INTEGER,
    FOREIGN KEY (cat_id) REFERENCES cats(id),
    FOREIGN KEY (toy_id) REFERENCES toys(id)
) ;


INSERT INTO
    cats(name, color, breed)
VALUES
    ('Kelly', 'pink', 'maltese'),
    ('Boba', 'brown', 'ragdoll'),
    ('Miso', 'dark brown', 'mixed'),
    ('Maru', 'white grey', 'scottish fold'),
    ('Bubble', 'white', 'kitten')
;

INSERT INTO
    toys(price, color, name)
VALUES
    (20, 'pink', 'ball'),
    (5, 'black', 'teaser'),
    (100, 'brown', 'tree'),
    (50, 'grey', 'moving mouse'),
    (300, 'white', 'laser toy')
;

INSERT INTO
    cattoys(cat_id, toy_id)
VALUES
    ((SELECT id FROM cats WHERE name = 'Kelly'), (SELECT id FROM toys WHERE name = 'laser toy')),
    ((SELECT id FROM cats WHERE name = 'Boba'), (SELECT id FROM toys WHERE name = 'moving mouse')),
    ((SELECT id FROM cats WHERE name = 'Bubble'), (SELECT id FROM toys WHERE name = 'moving mouse')),
    ((SELECT id FROM cats WHERE name = 'Miso'), (SELECT id FROM toys WHERE name = 'tree')),
    ((SELECT id FROM cats WHERE name = 'Maru'), (SELECT id FROM toys WHERE name = 'ball')),
    ((SELECT id FROM cats WHERE name = 'Maru'), (SELECT id FROM toys WHERE name = 'laser toy')),
    ((SELECT id FROM cats WHERE name = 'Kelly'), (SELECT id FROM toys WHERE name = 'tree'))
;


UPDATE toys
SET color = 'rainbow'
WHERE name = 'laser toy';

UPDATE cats
SET color = 'blue'
WHERE id = 5;

UPDATE cattoys
SET cat_id = 3
WHERE id = 1;

UPDATE toys
SET color = 'gold'
WHERE price > 50;

DELETE FROM toys
WHERE toys.name = 'teaser';

-- DELETE FROM toys
-- WHERE toys.name = 'laser toy';


-- EXPLAIN SELECT * FROM cats WHERE name = 'Kelly';
EXPLAIN 
SELECT
  toys.name
FROM
  cattoys
JOIN
  toys
  ON
    toys.id = cattoys.toy_id
WHERE
  cattoys.cat_id = 4;


select cats.name, toys.name 
from cats 
full join toys 
on cats.color = toys.color
where cats.color = 'pink';


SELECT 
  name
FROM
  toys
WHERE
  id = 
    (SELECT
      toy_id
    FROM
      cats
    JOIN
      cattoys
        ON 
          cats.id = cattoys.cat_id
    WHERE
      breed = 'maltese');


EXPLAIN ANALYZE SELECT
  name
FROM
  cats
WHERE
  name = 'Kelly';

  
  

