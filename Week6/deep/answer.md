# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Random partitioning ensures that data is evenly distributed across all available boats, preventing any single boat from becoming a bottleneck due to high volumes of observations.

However, a major drawback is that queries for a range of timestamps (such as those between midnight and 1am) must be executed across all boats, as related data is scattered unpredictably.

## Partitioning by Hour

Partitioning by hour makes querying straightforward and efficient for specific time ranges, since all observations from a given time window reside on a designated boat (like Boat A for morning hours).

 The downside is that this approach leads to severe load imbalance; because observations are heavily concentrated in the evening and early morning hours, Boat A will be heavily overworked while other boats remain underutilized.

## Partitioning by Hash Value

Partitioning by hash value guarantees an even distribution of data across all boats regardless of when observations are collected, and it allows for efficient point-lookups for specific individual timestamps.

However, range queries suffer because consecutive timestamps receive completely arbitrary hash values, forcing researchers to query every boat to retrieve a full range of observations.
