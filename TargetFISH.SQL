-- View: public."allData"

-- DROP VIEW public."allData";

CREATE OR REPLACE VIEW public."allData" AS 
 SELECT table1.owner,
    table1.ship,
    table1.ship_code,
    table1.catch_object,
    table1.date,
    table1.catch,
    table1.latitude,
    table1.longitude
   FROM fish table1
  WHERE table1.date >= '2015-01-01'::date AND table1.date <= '2015-12-31'::date AND table1.catch_object::text = 'скумбрия'::text AND table1.catch >= (0.5::double precision * (( SELECT sum(table2.catch) AS sum
           FROM fish table2
          WHERE table2.ship_code = table1.ship_code AND table2.date >= '2015-01-01'::date AND table2.date <= '2015-12-31'::date AND table2.date = table1.date)))
  GROUP BY table1.owner, table1.ship, table1.ship_code, table1.catch_object, table1.date, table1.catch, table1.latitude, table1.longitude
  ORDER BY table1.catch;

ALTER TABLE public."allData"
  OWNER TO postgres;
