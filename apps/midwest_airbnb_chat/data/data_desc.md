# Midwest Airbnb Listings: Data Dictionary

**Dataset:** `listings` table in `midwest_airbnb.db` (SQLite), 14,887 rows and 29 columns
**Source:** Inside Airbnb (https://insideairbnb.com/get-the-data/), the detailed `listings.csv.gz` file for each of three regions: Chicago (snapshot 2026-07-20), Columbus (snapshot 2026-07-23), and Twin Cities MSA (snapshot 2026-07-21). Column meanings follow Inside Airbnb's data dictionary and assumptions (https://insideairbnb.com/data-assumptions/).
**Course:** ISA 401, Miami University

> One row is one listing that showed a nightly price on the snapshot date; listings with no price were dropped. Empty cells are stored as SQL `NULL`.

---

## Field Definitions

| Field | Type | Description |
|---|---|---|
| `city` | text | Which Inside Airbnb region the listing came from: `Chicago` (7,439 rows), `Columbus` (2,587), or `Twin Cities` (4,861). The Twin Cities file covers the Minneapolis-St. Paul metro area, not just the two cities. |
| `snapshot_date` | text | Date Inside Airbnb compiled the file, stored as an ISO text string, not a date: `2026-07-20` for Chicago, `2026-07-23` for Columbus, `2026-07-21` for Twin Cities. Every row of a city shares the same value. |
| `id` | text | Airbnb's listing id. Unique across the table (14,887 distinct values). Stored as text even though it looks numeric, so compare it to a quoted string. |
| `name` | text | Listing title as shown on Airbnb (for example "Tiny Studio Apartment 94 Walk Score"). Never empty. |
| `price` | real | Nightly price in U.S. dollars on the snapshot date, with the dollar sign and commas removed. Ranges from 2.56 to 11,412; never `NULL` (rows without a price were dropped). |
| `room_type` | text | Airbnb's four listing categories: `Entire home/apt` (11,652 rows), `Private room` (2,951), `Hotel room` (246), or `Shared room` (38). |
| `host_id` | text | Unique identifier for the Airbnb host. Stored as text even though it looks numeric. |
| `host_name` | text | First name or display name of the host associated with the listing. |
| `host_since` | text | Date the host joined Airbnb, stored as an ISO date string. May be `NULL` when the information is unavailable. |
| `host_is_superhost` | text | Indicates whether the host is an Airbnb Superhost: `t` for true and `f` for false. May be `NULL`. |
| `neighbourhood` | text | Neighbourhood assigned to the listing based on its geographic location. This comes from Inside Airbnb's `neighbourhood_cleansed` field. |
| `latitude` | real | Approximate latitude of the listing. Airbnb anonymizes listing locations, so the coordinates do not represent an exact street address. |
| `longitude` | real | Approximate longitude of the listing. Airbnb anonymizes listing locations, so the coordinates do not represent an exact street address. |
| `property_type` | text | Airbnb's description of the type of property or space, such as `Entire rental unit`, `Private room in condo`, or `Room in boutique hotel`. |
| `accommodates` | integer | Maximum number of guests the listing says it can accommodate. |
| `bedrooms` | real | Number of bedrooms reported for the listing. May be `NULL` when bedroom information is unavailable. |
| `beds` | real | Number of beds reported for the listing. May be `NULL` when bed information is unavailable. |
| `bathrooms_text` | text | Text description of the listing's bathroom arrangement, such as `1 bath`, `1 shared bath`, or `1 private bath`. |
| `minimum_nights` | integer | Minimum number of nights required for a booking according to the listing. |
| `availability_365` | integer | Number of days the listing is shown as available during the next 365 days. An unavailable day may be booked or blocked by the host, so this should not be interpreted directly as occupancy. |
| `number_of_reviews` | integer | Total number of reviews recorded for the listing. |
| `number_of_reviews_ltm` | integer | Number of reviews the listing received during the last twelve months. |
| `first_review` | text | Date of the listing's first recorded review, stored as an ISO date string. May be `NULL` for listings without reviews. |
| `last_review` | text | Date of the listing's most recent recorded review, stored as an ISO date string. May be `NULL` for listings without reviews. |
| `review_scores_rating` | real | Overall Airbnb review rating for the listing. May be `NULL` when a listing does not have a rating. |
| `reviews_per_month` | real | Average number of reviews the listing has received per month over the period used by Airbnb/Inside Airbnb. May be `NULL` for listings without review history. |
| `instant_bookable` | text | Indicates whether the listing can be booked without requiring the host to manually approve the reservation: `t` for true and `f` for false. May be `NULL`. |
| `estimated_revenue_l365d` | real | Estimated listing revenue in U.S. dollars over the last 365 days, based on Inside Airbnb's occupancy and revenue estimation methodology. This is an estimate, not reported host revenue. |
| `amenities_count` | integer | Number of items in the listing's amenities list. This field was computed for this course and is not an original Inside Airbnb column. |


Two hints: `neighbourhood` is Inside Airbnb's `neighbourhood_cleansed` column, and `amenities_count` is not an Inside Airbnb column; it was computed for this course as the number of items in each listing's `amenities` list. Everything else keeps its Inside Airbnb name, so the data dictionary linked above explains it.
