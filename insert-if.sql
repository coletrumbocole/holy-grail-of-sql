1) Can you add a UNIQUE constraint on (myid, theirid)? If yes, add this constraint and use:

INSERT INTO mytable (myid, theirid) 
  VALUES (5, 1) ;
and ignore the produce warnings (or replace the above with INSERT IGNORE)

2) If you can't add such a constraint (e.g. you sometimes want to allow such duplicates and other times you don't), you can use this:

INSERT INTO mytable (myid, theirid) 
  SELECT 5, 1 
  FROM dual 
  WHERE NOT EXISTS
        ( SELECT *
          FROM mytable
          WHERE myid = 5
            AND theirid = 1
        ) ; 