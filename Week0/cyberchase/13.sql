-- Personal query question

-- What's the title, topic, episode in season and air date of the first or the last episode of any season?

-- FIRST EPISODE
SELECT "title", "topic", "episode_in_season", "air_date" FROM "episodes" WHERE "season" = 5 ORDER BY "episode_in_season" ASC LIMIT 1;

-- LAST EPISODE
--SELECT "title", "topic", "episode_in_season", "air_date" FROM "episodes" WHERE "season" = 5 ORDER BY "episode_in_season" DESC LIMIT 1;


/*
Write a SQL query to find the titles of episodes that have aired during the holiday season, usually in December in the United States.
Your query should output a table with a single column for the title of each episode.
Try to find a better solution than LIKE if you can!
*/

--SELECT "title" FROM "episodes" WHERE "air_date" LIKE '%-12-%';
--SELECT "title" FROM "episodes" WHERE strftime('%m', "air_date") = '12';

/*
Write a SQL query to find, for each year, the first day of the year that PBS released a Cyberchase episode.
Your query should output a table with two columns, one for the year and one for the earliest month and day an episode was released that year.
*/
--SELECT strftime('%Y', "air_date") AS "year", strftime('%m/%d', MIN("air_date")) AS "month/day" FROM "episodes" GROUP BY "year";
