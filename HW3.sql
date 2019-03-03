--You will need to separate the year from the title and store the year in its own column. 
--You will also need to separate the repeating groups in Category. 
--A separate table is preferred for the Movie-Category relationship.
create or replace procedure pro1 as

    Year number(4);
    MovieTitle varchar(256);
begin
    DBMS_OUTPUT.PUT_LINE('Parsing Year From MovieTitle...');
    
    DBMS_OUTPUT.PUT_LINE('Creating Categories Table');
    DROP TABLE IF EXISTS Categories;
    CREATE TABLE Categories (
      id integer NOT NULL,
      name varchar(255),
      PRIMARY KEY (id)
    );
    INSERT INTO Categories VALUES 
        (1,'Action'),
        (2,'Adventure'),
        (3,'Animation'),
        (4,'Children''s'),
        (5,'Comedy'),
        (6,'Crime'),
        (7,'Documentary'),
        (8,'Drama'),
        (9,'Fantasy'),
        (10,'Film-Noir'),
        (11,'Horror'),
        (12,'Musical'),
        (13,'Mystery'),
        (14,'Romance'),
        (15,'Sci-Fi'),
        (16,'Thriller'),
        (17,'War'),
        (18,'Western');
      
end pro1;
/

--Study the README file included in the zip. 
--Create extra tables that decode the age and occupation. 
--Include column constraints in your table definitions that correspond to the README file.
create or replace procedure pro2 as 
begin
   DROP TABLE IF EXISTS occupations;
    CREATE TABLE occupations (
      id integer NOT NULL,
      name varchar(255),
      PRIMARY KEY (id)
    );
    INSERT INTO occupations VALUES 
        (0,'Other or not specified')
        (1,'academic/educator'),
        (2,'Artist'),
        (3,'Dclerical/admin'),
        (4,'college/grad student'),
        (5,'Customer Service'),
        (6,'doctor/health care'),
        (7,'Executive/managerial'),
        (8,'farmer'),
        (9,'Homemaker'),
        (10,'k-12 student'),
        (11,'lawyer'),
        (12,'programmer'),
        (13,'retired'),
        (14,'sales/marketing'),
        (15,'scientist'),
        (16,'self-employed'),
        (17,'technician/engineer'),
        (18,'tradesman/craftsman'),
        (19,'Unemployed'),
        (20,'Writer');
    DROP TABLE IF EXISTS age;
    CREATE TABLE age (
      id integer NOT NULL,
      descrption varchar(255),
      PRIMARY KEY (id)
    );
    INSERT INTO age VALUES 
        (1,'under 18'),
        (18,'18-24'),
        (25,'25-34'),
        (35,'35-44'),
        (45,'45-49'),
        (50,'50-55'),
        (56,'56+');
end pro2;
/

--Convert timestamp into appropriate times
CREATE OR REPLACE FUNCTION unix_to_date(unix_sec NUMBER)
RETURN date
IS
ret_date DATE;
BEGIN
    ret_date:=TO_DATE('19700101','YYYYMMDD')+( 1/ 24/ 60/ 60)*unix_sec;
    RETURN ret_date;
END;
--After all the tables are loaded, create an interesting query about the data 
--and execute the query via SQL or PL/SQL. Describe your results.
create or replace procedure pro3 as 
begin
   null;
end pro3;
/





