-- Count the number of cats
SELECT COUNT(*) AS total_cats FROM cats;


-- Find the oldest cat
SELECT name, birth_year AS oldest_birth_year
FROM cats
WHERE birth_year = (SELECT MIN(birth_year) FROM cats);

-- Find the youngest cat
SELECT name, birth_year as youngest_birth_year
from cats
where birth_year = (SELECT MAX(birth_year) FROM cats);

-- Find both the oldest and youngest cats
SELECT
    MIN(birth_year) AS oldest_birth_year,
    MAX(birth_year) AS youngest_birth_year
FROM cats;

--  Number of toys per cat
SELECT
    cats.name AS cat_name,
    COUNT(toys.id) AS toy_count
FROM toys
JOIN cats ON toys.cat_id = cats.id
GROUP BY cats.id;

-- Cats with two or more toys
SELECT
    cats.name AS cat_name,
    COUNT(toys.id) AS toy_count
FROM toys
JOIN cats ON toys.cat_id = cats.id
GROUP BY cats.id
HAVING COUNT(toys.id) >= 2;
