--EDA

select * from spotifytable

select count(distinct Artist) from spotifytable

select distinct Album_type from spotifytable

select max(duration_min) from spotifytable

select min(duration_min) from spotifytable

select * from spotifytable
where Duration_min = 0;

select distinct most_playedon as most_played from spotifytable

--Business requirements
-- Easy Level
--1. Retrieve the names of all tracks that have more than 1 billion streams.

select * from spotifytable
where Stream >1000000000

--2. List all albums along with their respective artists.

select distinct Album, Artist
from spotifytable
order by 1

--3. Get the total number of comments for tracks where `licensed = TRUE`.

select * from spotifytable
where licensed = 'TRUE'

--4. Find all tracks that belong to the album type `single`.
select Track
from spotifytable
where Album_type = 'single'

--5. Count the total number of tracks by each artist.
select artist, count(*) as total_no_songs
from spotifytable
group by artist

-- Medium Level

--6. Calculate the average danceability of tracks in each album.

select Album, avg(Danceability) as avg_dencebility
from spotifytable
group by Album

--7. Find the top 5 tracks with the highest energy values.
select top 5 Track, max(energy)
from spotifytable
group by Track

--8. List all tracks along with their total views and likes where `official_video = TRUE`.
select Track, sum(views) as total_views,
sum(likes) as total_likes
from spotifytable
where official_video='True'
group by Track

--9. For each album, calculate the total views of all associated tracks.
select album,Track, sum(Views)
from spotifytable
group by Album,Track
order by  1, 2 desc

--10. Retrieve the track names that have been streamed on Spotify more than YouTube.

select 
    track
from (
    select 
        track,
      coalesce(sum(case when most_playedon = 'Youtube' then stream end), 0) as streamed_on_youtube,
        coalesce(sum(case when most_playedon = 'Spotify' then stream end), 0) as streamed_on_spotify
    from spotifytable
    group by track
) as tl
 where
    streamed_on_spotify > streamed_on_youtube
    and streamed_on_youtube <> 0;

--11. Find the top 3 most-viewed tracks for each artist using window functions.
with ranking_artist
as
(select artist,track,sum(views) as total_view,
DENSE_RANK() over(partition by artist order by sum(views) desc) as rank
from spotifytable
group by artist,Track
)
select * from ranking_artist
where rank <= 3

--12. Write a query to find tracks where the liveness score is above the average.
select track, artist, liveness
from spotifytable 
where Liveness > (select avg(Liveness) from spotifytable)

--Use a 'WITH' clause to calculate the difference between the highest and lowest energy values for tracks in each album.
with cte as (
    select 
        album,
        max(energy) as highest_energy,
        min(energy) as lowest_energy
    from spotifytable
    group by album
)
select 
    album,
    highest_energy - lowest_energy as energy_diff
from cte
order by energy_diff desc;