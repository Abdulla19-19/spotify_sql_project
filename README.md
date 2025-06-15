# spotify_sql_project
![spotify_logo](https://github.com/user-attachments/assets/cfe9dd95-6204-4343-98b3-b2d73d3a7756)
## Project Steps

### 1. Data Exploration
Before diving into SQL, it’s important to understand the dataset thoroughly. The dataset contains attributes such as:
- `Artist`: The performer of the track.
- `Track`: The name of the song.
- `Album`: The album to which the track belongs.
- `Album_type`: The type of album (e.g., single or album).
- Various metrics such as `danceability`, `energy`, `loudness`, `tempo`, and more.

### 4. Querying the Data
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into **easy**, **medium**, and **advanced** levels to help progressively develop SQL proficiency.

#### Easy Queries
- Simple data retrieval, filtering, and basic aggregations.
  
#### Medium Queries
- More complex queries involving grouping, aggregation functions, and joins.
  
#### Advanced Queries
- Nested subqueries, window functions, CTEs, and performance optimization.

#### Business Requirements Analysis

## Easy Level Insights

1. ## Tracks with Over 1 Billion Streams
**Query**: SELECT * FROM spotifytable WHERE Stream > 1000000000

**Insight**: Identifies blockbuster tracks with massive popularity. These tracks are likely global hits, and their artists or genres could guide marketing campaigns or playlist curation.


2. ## Albums and Artists
**Query**: SELECT DISTINCT Album, Artist FROM spotifytable ORDER BY 1

**Insight**: Provides a catalog of albums linked to artists, useful for organizing discographies or identifying collaborations. Duplicate artists across albums may indicate prolific creators.


3. ## Comments for Licensed Tracks
**Query**: SELECT * FROM spotifytable WHERE Licensed = 'TRUE'

**Insight**: Licensed tracks may have higher engagement (comments), reflecting official releases. Summing comments for these tracks can quantify fan interaction.


4. ## Single Tracks
**Query**: SELECT Track FROM spotifytable WHERE Album_type = 'single'

**Insight**: Singles are often promotional releases. Identifying these tracks helps focus on trending or new content for playlists or radio..


5. ## Tracks per Artist
Query: SELECT Artist, COUNT(*) AS total_no_songs FROM spotifytable GROUP BY Artist
Insight: Artists with high track counts are prolific, potentially indicating established careers or high output. This can inform artist partnerships or fan targeting.

## Medium Level Insights
6. ## Average Danceability by Album
**Query**: SELECT Album, AVG(Danceability) AS avg_danceability FROM spotifytable GROUP BY Album

**Insight**: Albums with high danceability are suited for dance playlists or club settings. Low danceability may indicate genres like ballads or classical.



7. ## Top 5 High-Energy Tracks
**Query**: SELECT TOP 5 Track, MAX(Energy) FROM spotifytable GROUP BY Track

**Insight:** High-energy tracks are ideal for workout or party playlists. The top 5 can be promoted for high-impact scenarios, though the query should use ORDER BY Energy DESC for accuracy.



8. ## Tracks with Official Videos
**Query**: SELECT Track, SUM(Views) AS total_views, SUM(Likes) AS total_likes FROM spotifytable WHERE Official_video = 'TRUE' GROUP BY Track

**Insight**: Official videos drive engagement. Tracks with high views/likes indicate strong visual appeal, guiding video production investments.



9. ## Total Views by Album
**Query**: SELECT Album, Track, SUM(Views) FROM spotifytable GROUP BY Album, Track ORDER BY 1, 2 DESC

**Insight**: Albums with high total views reflect popularity. This can inform album promotion or identify standout tracks within albums.



10. ## Spotify-Dominant Tracks
**Query**: Compares streams on Spotify vs. YouTube.

**Insight**: Tracks streamed more on Spotify may appeal to audio-focused listeners, guiding platform-specific campaigns. Non-zero YouTube streams ensure fair comparison.

Complex Level Insights





11. ## Top 3 Most-Viewed Tracks per Artist
**Query**: Uses DENSE_RANK() to rank tracks by views within each artist.

**Insight**: Highlights each artist’s most popular tracks, useful for creating artist-specific playlists or identifying signature songs.



12. ## Above-Average Liveness Tracks
**Query**: SELECT Track, Artist, Liveness FROM spotifytable WHERE Liveness > (SELECT AVG(Liveness) FROM spotifytable)

**Insight**: High liveness indicates live recordings or energetic performances, ideal for concert promotions or live music playlists.



13. ## Energy Difference by Album
**Query**: Uses a CTE to calculate MAX(Energy) - MIN(Energy) per album.

**Insight**: Albums with large energy differences offer variety, appealing to diverse audiences. Small differences suggest consistent vibes, suitable for genre-specific playlists.

## Recommendations
Playlist Curation: Use danceability, energy, and liveness metrics to create genre-specific playlists (e.g., high-energy for workouts, high-liveness for live music fans).Marketing Focus: Promote tracks with over 1 billion streams and top-viewed tracks per artist to capitalize on existing popularity.

***Platform Strategy***: Tailor campaigns to Spotify for audio-focused tracks and YouTube for video-driven tracks.


***Data Quality***: Investigate zero-duration tracks and ensure consistent data for metrics like views and streams.


***Artist Partnerships***: Prioritize prolific artists and those with high engagement (views, likes) for collaborations or sponsorships.

## Conclusion

The Spotify table provides a rich dataset for understanding music trends, artist performance, and listener preferences. By leveraging streaming, engagement, and audio feature metrics, stakeholders can make data-driven decisions to enhance playlist curation, marketing strategies, and artist investments. Further analysis, such as genre trends or temporal streaming patterns, could yield additional insights.

