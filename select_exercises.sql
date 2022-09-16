-- 1 Create a new file called select_exercises.sql. Store your code for this exercise in that file. You should be testing your code in MySQL Workbench as you go.
-- Completed

-- 2 Use the albums_db database.
    USE albums_db

/*
 3 Explore the structure of the albums table.
    SHOW TABLE STATUS

a. How many rows are in the albums table?
    31

b. How many unique artist names are in the albums table?
    commands used:
        DESCRIBE albums
        SELECT DISTING artist FROM albums
    answer:
        23

c. What is the primary key for the albums table?
     command used:
        DESCRIBE albums
    answer:
        id

d. What is the oldest release date for any album in the albums table? What is the most recent release date?
    commands used:
        SELECT release_date FROM albums WHERE release_date > 2000
        SELECT release_date FROM albums WHERE release_date < 1980
    answers:
        Most recent release date: 2011
        Oldest release date: 1969
*/

4 Write queries to find the following information:

a. The name of all albums by Pink Floyd
    SELECT name FROM albums WHERE artist = "Pink Floyd"

b. The year Sgt. Pepper's Lonely Hearts Club Band was released
    SELECT release_date, name FROM albums 
    WHERE name = "Sgt. Pepper's Lonely Hearts Club Band"

c. The genre for the album Nevermind

d. Which albums were released in the 1990s

e. Which albums had less than 20 million certified sales

f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

Be sure to add, commit, and push your work.