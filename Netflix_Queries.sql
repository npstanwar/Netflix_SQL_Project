1.Select 
show_id, title , type 
From Netflix

2.Select *
From netflix
Where type = 'Movie' ;

3.Select title,show_id, type,release_year
From netflix
where type = 'Tv Show' and release_year = 2021 ;

4.Select title,show_id, type,description
From netflix
Where description like '%family%' ;

5.SELECT
  type,
  COUNT(*) AS count,
  ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM netflix), 1) AS pct
FROM netflix
GROUP BY type
ORDER BY count DESC;

6.Select count(title) as total_title
From netflix; 

7.Select avg(duration) as 'Average Duration' 
From netflix 
Where type = 'movie';

8.SELECT show_id, title, date_added_date
FROM netflix
Order by date_added_date desc
LIMIT 5;

9.SELECT 
    n.show_id,
    n.title,
    n.director,
    d.total_titles - 1 AS number_of_other_titles_by_director
FROM netflix n
JOIN (
    SELECT director, COUNT(*) AS total_titles
    FROM netflix
    WHERE director IS NOT NULL AND director <> 'No Data Available'
    GROUP BY director
) d 
    ON n.director = d.director;

10.SELECT country, count(*) as total_title
FROM netflix
WHERE country <> 'No Data Available'
GROUP BY  country
ORDER BY total_title desc;

11.SELECT show_id, title, type,
    CASE
        WHEN rating IN ("G", "PG", "PG-13") THEN "Family"
        WHEN rating IN ("TV-Y", "TV-Y7", "TV-G") THEN "Kids"
        ELSE "Adult"
    END AS category
FROM netflix;

12.SELECT show_id, title, duration,
CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS minutes
FROM netflix
WHERE duration LIKE '%min%'
ORDER BY minutes DESC
LIMIT 1;





