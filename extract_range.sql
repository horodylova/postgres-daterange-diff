CREATE OR REPLACE FUNCTION extract_range(
    outer_range daterange,
    inner_range daterange
)
RETURNS TABLE(result_range daterange)
LANGUAGE plpgsql
AS $$
BEGIN
 
    IF NOT (outer_range && inner_range) THEN
 
        RETURN QUERY SELECT outer_range;
        RETURN;
    END IF;
     
    IF inner_range @> outer_range THEN
        
        RETURN;
    END IF;
    
  
    DECLARE
        outer_start date := lower(outer_range);
        outer_end date := upper(outer_range);
        inner_start date := lower(inner_range);
        inner_end date := upper(inner_range);
        outer_start_inc boolean := lower_inc(outer_range);
        outer_end_inc boolean := upper_inc(outer_range);
        inner_start_inc boolean := lower_inc(inner_range);
        inner_end_inc boolean := upper_inc(inner_range);
    BEGIN
        
        IF outer_start < inner_start OR 
           (outer_start = inner_start AND outer_start_inc AND NOT inner_start_inc) THEN
            RETURN QUERY SELECT daterange(
                outer_start, 
                inner_start, 
                CASE WHEN outer_start_inc THEN '[' ELSE '(' END ||
                CASE WHEN inner_start_inc THEN ')' ELSE ']' END
            );
        END IF;
         
        IF inner_end < outer_end OR 
           (inner_end = outer_end AND NOT inner_end_inc AND outer_end_inc) THEN
            RETURN QUERY SELECT daterange(
                inner_end, 
                outer_end, 
                CASE WHEN inner_end_inc THEN ')' ELSE ']' END ||
                CASE WHEN outer_end_inc THEN ']' ELSE ')' END
            );
        END IF;
    END;
END;
$$;