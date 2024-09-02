# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

This approach ensures that the load is evenly distributed across all boats, maximizing resource utilization.
The queries may become slower, as they need to be run on every boat to retrieve complete data
Prevents overloading a single boat


## Partitioning by Hour

This approach makes it faster and easier to query observations within a specific time range
Leads to uneven load distribution, potentially overloading a single boat with all the observations from a busy time period.
Some boats may remain underutilized, leading to inefficient use of available resources.

## Partitioning by Hash Value

This approach ensures an even distribution of observations across all boats, balancing the load and maximizing resource utilization.
If you know the specific date of an observation, you can efficiently target the correct boat for your query.
If you need to query for a specific time range you need to perform the query on every boat
