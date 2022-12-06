--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

-- 
ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    stars_overall integer,
    info text,
    blackhole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    first_encounter date,
    size_in_km numeric(1000,2),
    info text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    circumference_in_km numeric(10,2),
    atmosphere boolean,
    star_id integer,
    first_encounter date,
    info text,
    moon_num integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    planet_num integer,
    info text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'G1', 20, 'SOME INFOS....', false);
INSERT INTO public.galaxy VALUES (2, 'G2', 50, 'SOME INFOS....', true);
INSERT INTO public.galaxy VALUES (3, 'G3', 77, 'afoifsjfoisjfsf adsa ad~ ', false);
INSERT INTO public.galaxy VALUES (4, 'G4', 220, 'SOME INFOS..asdasd..', false);
INSERT INTO public.galaxy VALUES (5, 'G5', 2420, 'SOME adsadcydadetgINFOS....', false);
INSERT INTO public.galaxy VALUES (6, 'G6', 2770, 'SOadsaoijp dkpd adakpodsapod akposdkposakdopa daspodME INFOS....', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'M1', 5, '1998-12-22', 500.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (2, 'M2', 1, '1991-12-22', 220.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (3, 'M3', 1, '1938-12-22', 50.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (4, 'M4', 1, '1998-12-12', 10.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (5, 'M5', 2, '1998-12-30', 5220.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (6, 'M6', 10, '1998-12-11', 1500.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (7, 'M7', 11, '1998-12-06', 110.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (8, 'M8', 5, '1998-02-12', 80.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (9, 'M9', 6, '1998-12-15', 99.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (10, 'M10', 2, '1998-12-13', 9.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (11, 'M11', 8, '1998-12-24', 95.00, 'SOME INFOS....');
INSERT INTO public.moon VALUES (12, 'M12', 2, '1998-11-22', 500.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (13, 'M13', 11, '1998-08-22', 34500.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (14, 'M14', 10, '1998-12-12', 5.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (15, 'M15', 7, '1998-12-02', 53245.00, 'SOME INFOS....');
INSERT INTO public.moon VALUES (16, 'M16', 4, '1998-12-11', 55.55, 'SOME INFOS....');
INSERT INTO public.moon VALUES (17, 'M17', 5, '1998-12-19', 123.40, 'ME INFOS....');
INSERT INTO public.moon VALUES (18, 'M18', 5, '1128-12-22', 44.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (19, 'M19', 1, '1992-12-22', 52.50, 'SOME INFOS....');
INSERT INTO public.moon VALUES (20, 'M20', 1, '1998-12-03', 500.34, 'SOME INFOS....');
INSERT INTO public.moon VALUES (21, 'M21', 11, '1998-12-22', 500443.50, 'SOME INFOS....');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'P1', 20.50, false, 3, '2000-12-12', 'SOME INFOS....', 2);
INSERT INTO public.planet VALUES (2, 'P2', 320.45, false, 1, '2000-02-12', 'SOME INFOS....', 5);
INSERT INTO public.planet VALUES (3, 'P3', 2044.50, false, 1, '2200-12-12', 'SOME INFOS....', 22);
INSERT INTO public.planet VALUES (4, 'P4', 5345.50, true, 4, '2001-12-12', 'SOME INFOS....', 42);
INSERT INTO public.planet VALUES (5, 'P5', 20.51, false, 2, '2000-12-10', 'SOME INFOS....', 10);
INSERT INTO public.planet VALUES (6, 'P6', 20.54, false, 2, '2000-12-02', 'SOME INFOS....', 43);
INSERT INTO public.planet VALUES (7, 'P7', 23.50, false, 3, '1999-10-10', 'SOME INFOS....', 1);
INSERT INTO public.planet VALUES (8, 'P8', 202.50, false, 4, '2000-12-12', 'SOME INFOS....', 2);
INSERT INTO public.planet VALUES (9, 'P9', 210.50, false, 3, '2055-12-12', 'SOME INFOS....', 0);
INSERT INTO public.planet VALUES (10, 'P10', 110.50, true, 2, '2001-12-12', 'SOME INFOS....', 2);
INSERT INTO public.planet VALUES (11, 'P11', 440.50, false, 1, '2000-10-12', 'SOME INFOS....', 222);
INSERT INTO public.planet VALUES (12, 'P12', 2123.00, false, 5, '2000-02-12', 'SOME INFOS....', 11);
INSERT INTO public.planet VALUES (13, 'P13', 3220.50, false, 5, '2000-12-04', 'SOME INFOS....', 0);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 1, 'SS1');
INSERT INTO public.solar_system VALUES (2, 2, 'SS2');
INSERT INTO public.solar_system VALUES (3, 3, 'SS3');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'S1', 1, 5, 'dont see me');
INSERT INTO public.star VALUES (2, 'S2', 1, 10, 'dodasdnt see me');
INSERT INTO public.star VALUES (3, 'S3', 2, 550, 'dodasdgdasdnt see me');
INSERT INTO public.star VALUES (4, 'S4', 2, 50, 'dodasdgdasdme');
INSERT INTO public.star VALUES (5, 'S5', 3, 50, 'dodsfdasdgdasdme');
INSERT INTO public.star VALUES (6, 'S6', 5, 330, 'dome');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: solar_system solar_system_solar_system_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_solar_system_id_key UNIQUE (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: solar_system solar_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

