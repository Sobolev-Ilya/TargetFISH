-- Function: public.getmaps(date, date, double precision, text)

-- DROP FUNCTION public.getmaps(date, date, double precision, text);

CREATE OR REPLACE FUNCTION public.getmaps(
    fromdate date,
    todate date,
    step double precision,
    path text)
  RETURNS double precision[] AS
$BODY$

DECLARE  
  years_diff int := DATE_PART('year', toDate) - DATE_PART('year', fromDate);
  months_diff int := years_diff*12+ (DATE_PART('month', toDate) - DATE_PART('month', fromDate));

  x int;  
  toDate date := fromDate+Interval '1 month'; 
  

BEGIN

  FOR x IN 1..months_diff LOOP     
     execute format ($x$copy(
    SELECT 
	-WIDTH_BUCKET(longitude,0,-30,60)*0.5+%3$s  as центроид_по_долготе
	,WIDTH_BUCKET(latitude,0,30,60)*0.5-%3$s as центроид_по_широте
	,sum(catch) as catch
	,count(1)

	FROM fish table1
	WHERE 
	
	date >= %1$L And 
	date < %2$L And  
	catch_object='скумбрия' And
	catch>=0.5*(
	 SELECT sum(catch)
	 FROM fish table2
	 WHERE table2.ship_code=table1.ship_code And
	
	 date >= %1$L And
	 date < %2$L And
	 table2.date=table1.date
	)
	GROUP BY 1,2
	order by 1,2
	) to  '%4$s\%1$s-map.csv' With CSV DELIMITER ',' 
	$x$,fromDate,toDate,step,path);

    fromDate := fromDate+Interval '1 month';
    toDate := fromDate+Interval '1 month';
  END LOOP;
  
  RETURN array[years_diff,months_diff,step];
  
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.getmaps(date, date, double precision, text)
  OWNER TO postgres;
