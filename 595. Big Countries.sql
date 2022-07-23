-- APPROACH 1
SELECT NAME, POPULATION, AREA
FROM WORLD
WHERE AREA >= 3000000 OR POPULATION >= 25000000

-- APPROACH 2 SLOWER
SELECT
    name, population, area
FROM
    world
WHERE
    area >= 3000000
UNION
SELECT
    name, population, area
FROM
    world
WHERE
    population >= 25000000
