# PostgreSQL DateRange
Subtracts one date range from another in PostgreSQL.

## Function
extract_range(outer_range, inner_range) - removes inner range from outer range.

Returns:

- 0 ranges - if ranges are equal
- 1 range - if ranges don't overlap (returns original outer)
- 2 ranges - if inner range is inside outer (left and right parts)
## Example
```
SELECT * FROM extract_range('[2018-01-01,
2019-01-01)', '[2018-03-01,2018-04-01)');
```
Result: [2018-01-01,2018-03-01) and [2018-04-01,2019-01-01)

## Files
- extract_range.sql - main function
- test_extract_range.sql - tests
- DB Fiddle - online demo
## Use Cases
Useful for schedules, bookings, and excluding specific periods from larger date ranges.
