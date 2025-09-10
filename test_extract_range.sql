SELECT 'Test 1: Inner range in the middle' as test_name, * FROM extract_range(
    '[2018-01-01,2018-12-31]'::daterange,
    '[2018-03-01,2018-03-31]'::daterange
);

SELECT 'Test 2: No intersection' as test_name, * FROM extract_range(
    '[2018-01-01,2018-02-28]'::daterange,
    '[2018-03-01,2018-03-31]'::daterange
);

SELECT 'Test 3: Complete overlap (inner covers outer)' as test_name, * FROM extract_range(
    '[2018-02-01,2018-02-28]'::daterange,
    '[2018-01-01,2018-03-31]'::daterange
);

SELECT 'Test 4: Equal ranges' as test_name, * FROM extract_range(
    '[2018-01-01,2018-12-31]'::daterange,
    '[2018-01-01,2018-12-31]'::daterange
);

SELECT 'Test 5: Left overlap' as test_name, * FROM extract_range(
    '[2018-01-01,2018-12-31]'::daterange,
    '[2017-12-01,2018-06-30]'::daterange
);

SELECT 'Test 6: Right overlap' as test_name, * FROM extract_range(
    '[2018-01-01,2018-12-31]'::daterange,
    '[2018-06-01,2019-01-31]'::daterange
);

SELECT 'Test 7: Inner touches left boundary' as test_name, * FROM extract_range(
    '[2018-01-01,2018-12-31]'::daterange,
    '[2018-01-01,2018-03-31]'::daterange
);

SELECT 'Test 8: Inner touches right boundary' as test_name, * FROM extract_range(
    '[2018-01-01,2018-12-31]'::daterange,
    '[2018-10-01,2018-12-31]'::daterange
);

SELECT 'Test 9: Ranges just touch (no overlap)' as test_name, * FROM extract_range(
    '[2018-01-01,2018-03-01)'::daterange,
    '[2018-03-01,2018-06-01]'::daterange
);