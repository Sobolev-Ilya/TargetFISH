-- Table: public.fish

-- DROP TABLE public.fish;

CREATE TABLE public.fish
(
  owner character varying,
  ship character varying,
  ship_code integer,
  region character varying,
  catch_object character varying,
  date date,
  catch double precision,
  code_or_catch integer,
  or_catch character varying,
  code_or_catch_short integer,
  or_catch_2 character varying,
  operations_count integer,
  depth double precision,
  latitude double precision,
  longitude double precision,
  duty_code integer,
  mode character varying,
  ship_type character varying,
  ship_type_2 character varying,
  ship_type_3 character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.fish
  OWNER TO postgres;
