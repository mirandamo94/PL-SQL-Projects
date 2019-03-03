--You will need to separate the year from the title and store the year in its own column.
--You will also need to separate the repeating groups in Category.
--A separate table is preferred for the Movie-Category relationship.




BEGIN 
    dbms_output.put_line('Parsing Year From MovieTitle...');
    dbms_output.put_line('Printing Table');

    EXECUTE IMMEDIATE 'SELECT MovieID, 
                        SUBSTR(title, 0, LENGTH(title) + 1 - 7) AS MovieTitle, 
                        SUBSTR(title, -6) AS ReleaseYear , 
                        Categories FROM Movies';
    dbms_output.put_line('Create Categories Table');

   
END;
/

--SELECT * FROM MOVIES;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE categories CASCADE CONSTRAINTS';

    EXECUTE IMMEDIATE 'CREATE TABLE categories (
    id     INTEGER NOT NULL,
    name   VARCHAR(255),
    PRIMARY KEY ( id )
)';

EXECUTE IMMEDIATE 'INSERT INTO categories VALUES (
    1,
    'Action'
);

INSERT INTO categories VALUES (
    2,
    'Adventure'
);

INSERT INTO categories VALUES (
    3,
    'Animation'
);

INSERT INTO categories VALUES (
    4,
    'Children''s'
);

INSERT INTO categories VALUES (
    5,
    'Comedy'
);

INSERT INTO categories VALUES (
    6,
    'Crime'
);

INSERT INTO categories VALUES (
    7,
    'Documentary'
);

INSERT INTO categories VALUES (
    8,
    'Drama'
);

INSERT INTO categories VALUES (
    9,
    'Fantasy'
);

INSERT INTO categories VALUES (
    10,
    'Film-Noir'
);

INSERT INTO categories VALUES (
    11,
    'Horror'
);

INSERT INTO categories VALUES (
    12,
    'Musical'
);

INSERT INTO categories VALUES (
    13,
    'Mystery'
);

INSERT INTO categories VALUES (
    14,
    'Romance'
);

INSERT INTO categories VALUES (
    15,
    'Sci-Fi'
);

INSERT INTO categories VALUES (
    16,
    'Thriller'
);

INSERT INTO categories VALUES (
    17,
    'War'
);

INSERT INTO categories VALUES (
    18,
    'Western'
)';

END;
/

 
--Study the README file included in the zip.
--Create extra tables that decode the age and occupation.
--Include column constraints in your table definitions that correspond to the README file.

DROP TABLE age CASCADE CONSTRAINTS;

CREATE TABLE age (
    id            INTEGER NOT NULL,
    description   VARCHAR(255),
    PRIMARY KEY ( id )
);

INSERT INTO age VALUES (
    1,
    'Under 18'
);

INSERT INTO age VALUES (
    18,
    '18-24'
);

INSERT INTO age VALUES (
    25,
    '25-34'
);

INSERT INTO age VALUES (
    35,
    '35-44'
);

INSERT INTO age VALUES (
    45,
    '45-49'
);

INSERT INTO age VALUES (
    50,
    '50-55'
);

INSERT INTO age VALUES (
    56,
    '56+'
);

SELECT
    *
FROM
    age;

DROP TABLE occupations CASCADE CONSTRAINTS;

CREATE TABLE occupations (
    id     INTEGER NOT NULL,
    name   VARCHAR(255),
    PRIMARY KEY ( id )
);

INSERT INTO occupations VALUES (
    1,
    'Administrator'
);

INSERT INTO occupations VALUES (
    2,
    'Artist'
);

INSERT INTO occupations VALUES (
    3,
    'Doctor'
);

INSERT INTO occupations VALUES (
    4,
    'Educator'
);

INSERT INTO occupations VALUES (
    5,
    'Engineer'
);

INSERT INTO occupations VALUES (
    6,
    'Entertainment'
);

INSERT INTO occupations VALUES (
    7,
    'Executive'
);

INSERT INTO occupations VALUES (
    8,
    'Healthcare'
);

INSERT INTO occupations VALUES (
    9,
    'Homemaker'
);

INSERT INTO occupations VALUES (
    10,
    'Lawyer'
);

INSERT INTO occupations VALUES (
    11,
    'Librarian'
);

INSERT INTO occupations VALUES (
    12,
    'Marketing'
);

INSERT INTO occupations VALUES (
    13,
    'None'
);

INSERT INTO occupations VALUES (
    14,
    'Other'
);

INSERT INTO occupations VALUES (
    15,
    'Programmer'
);

INSERT INTO occupations VALUES (
    16,
    'Retired'
);

INSERT INTO occupations VALUES (
    17,
    'Salesman'
);

INSERT INTO occupations VALUES (
    18,
    'Scientist'
);

INSERT INTO occupations VALUES (
    19,
    'Student'
);

INSERT INTO occupations VALUES (
    20,
    'Technician'
);

INSERT INTO occupations VALUES (
    21,
    'Writer'
);

SELECT
    *
FROM
    occupations;

--Convert timestamp into appropriate times
--After all the tables are loaded, create an interesting query about the data
--and execute the query via SQL or PL/SQL. Describe your results.

BEGIN
    dbms_output.put_line('CONVERTING TIMESTAMP...');
    SELECT
        ( TO_DATE(timestamp, 'yyyy-mm-dd hh24') + ( 1519232926891 ) / 1000 / 60 / 60 / 24 )
    FROM
        ratings;

    dbms_output.put_line('listing top rated movies by average rating');
    dbms_output.put_line('without movies that are not rated by 5 or more users');
    SELECT
        movieid,
        avg_rating
    FROM
        (
            SELECT
                movieid,
                AVG(rating) AS avg_rating,
                COUNT(rating) AS rating_count
            FROM
                ratings
            GROUP BY
                movieid
        )
    WHERE
        rating_count >= 5
    ORDER BY
        avg_rating DESC;

END;
/