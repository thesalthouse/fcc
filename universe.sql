--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    size character varying(15),
    spiral boolean,
    star_count integer,
    planet_count integer
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
    name character varying(30),
    type text,
    diameter numeric NOT NULL,
    planet_id integer NOT NULL,
    inhabited boolean
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
    name character varying(30),
    type character varying(40),
    orbital_period numeric,
    atmosphere boolean,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type character varying(30),
    age integer,
    mass numeric
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
-- Name: telescopes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.telescopes (
    telescopes_id integer NOT NULL,
    name character varying(40) NOT NULL,
    city character varying(30),
    state character varying(3)
);


ALTER TABLE public.telescopes OWNER TO freecodecamp;

--
-- Name: telescopes_telescope_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.telescopes_telescope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telescopes_telescope_id_seq OWNER TO freecodecamp;

--
-- Name: telescopes_telescope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.telescopes_telescope_id_seq OWNED BY public.telescopes.telescopes_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: telescopes telescopes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescopes ALTER COLUMN telescopes_id SET DEFAULT nextval('public.telescopes_telescope_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Large', true, 200, 8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Very Large', true, 150, 6);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small', false, 50, 3);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Griant', true, 300, 10);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Medium', true, 80, 4);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Medium', true, 70, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Rocky', 3474, 1, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Rocky', 11, 2, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Rocky', 6, 2, false);
INSERT INTO public.moon VALUES (4, 'Europa', 'Rocky', 3121, 3, false);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Rocky', 5262, 3, false);
INSERT INTO public.moon VALUES (6, 'Io', 'Rocky', 3642, 3, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Rocky', 4820, 3, false);
INSERT INTO public.moon VALUES (8, 'Titan', 'Rocky', 5150, 4, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Rocky', 252, 4, false);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Rocky', 1527, 5, false);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Rocky', 1469, 5, false);
INSERT INTO public.moon VALUES (13, 'Triton', 'Rocky', 1353, 5, false);
INSERT INTO public.moon VALUES (14, 'Charon', 'Rocky', 606, 7, false);
INSERT INTO public.moon VALUES (15, 'Dione', 'Rocky', 1122, 7, false);
INSERT INTO public.moon VALUES (16, 'Tethys', 'Rocky', 1062, 7, false);
INSERT INTO public.moon VALUES (17, 'Miranda', 'Rocky', 235, 6, false);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Rocky', 578, 6, false);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Rocky', 584, 6, false);
INSERT INTO public.moon VALUES (20, 'Titania', 'Rocky', 789, 6, false);
INSERT INTO public.moon VALUES (10, 'Triton 2', 'Rocky', 1353, 6, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 365.25, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 687, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 4332.59, true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 10759.22, true, 1);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Ice Giant', 30688, true, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice Giant', 60182, true, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Terrestrial', 88, true, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'Terrestrial', 224.7, true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'Terrestrial', 130, true, 3);
INSERT INTO public.planet VALUES (10, 'Gliese 581c', 'Terrestrial', 13, true, 3);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 'Terrestrial', 37, true, 3);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Gas Giant', 3.5, true, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence', 500000, 1.989);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red dwarf', 50000, 0.123);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type main-sequence', 2500000, 2.063);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red supergiant', 1000000, 7.7);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 2, 'A-type main-sequence', 600000, 2.2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 2, 'K-type main sequence', 600000, 1.7);


--
-- Data for Name: telescopes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.telescopes VALUES (1, 'Mt Lemmon', NULL, NULL);
INSERT INTO public.telescopes VALUES (2, 'Mt Graham', NULL, NULL);
INSERT INTO public.telescopes VALUES (3, 'Kitt Peak', NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: telescopes_telescope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.telescopes_telescope_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_uni; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_uni UNIQUE (name);


--
-- Name: galaxy name_uni; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_uni UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_uni; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_uni UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_uni; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_uni UNIQUE (name);


--
-- Name: telescopes telescopes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescopes
    ADD CONSTRAINT telescopes_pkey PRIMARY KEY (telescopes_id);


--
-- Name: telescopes telescopes_telescope_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescopes
    ADD CONSTRAINT telescopes_telescope_id_key UNIQUE (telescopes_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

