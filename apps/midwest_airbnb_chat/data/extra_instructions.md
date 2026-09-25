# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.

- `host_is_superhost` and `instant_bookable` are stored as text values. Use 't' for true and 'f' for false when filtering these columns. Do not treat them as SQL booleans.

- When filtering listings by city, match city names without regard to capitalization. The three valid city values are 'Chicago', 'Columbus', and 'Twin Cities'.

- When calculating average review ratings, exclude listings where `review_scores_rating` is NULL. Round the resulting average to two decimal places.
