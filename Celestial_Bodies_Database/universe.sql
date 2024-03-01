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
    galaxy_type character varying(20),
    lightyear_from_earth numeric(4,1),
    description text
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
    name character varying(30) NOT NULL,
    is_artifical boolean,
    age_in_millions integer,
    planet_id integer
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
-- Name: placeholder; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.placeholder (
    placeholder_id integer NOT NULL,
    name character varying(50) NOT NULL,
    command character varying(15)
);


ALTER TABLE public.placeholder OWNER TO freecodecamp;

--
-- Name: placeholder_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.placeholder_placeholder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.placeholder_placeholder_id_seq OWNER TO freecodecamp;

--
-- Name: placeholder_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.placeholder_placeholder_id_seq OWNED BY public.placeholder.placeholder_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_alone boolean,
    age_in_millions integer,
    star_id integer
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
    is_alive boolean,
    age_in_millions integer,
    galaxy_id integer
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
-- Name: placeholder placeholder_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.placeholder ALTER COLUMN placeholder_id SET DEFAULT nextval('public.placeholder_placeholder_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100.0, 'The galaxy where Earth is located.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220.0, 'The nearest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 300.0, 'Third-largest galaxy in the Local Group, after the Andromeda and Milky Way galaxies.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 530.0, 'Contains one of the most massive black holes ever discovered.');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 110.0, 'A giant elliptical galaxy in the constellation Centaurus.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 280.0, 'Named for its resemblance to the broad-brimmed Mexican hat.');
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 'Ring', 500.0, 'A ring galaxy located about 500 million light-years away in the constellation Sculptor.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (16, 'Luna', false, 4500, 1);
INSERT INTO public.moon VALUES (17, 'Phobos', false, 4000, 2);
INSERT INTO public.moon VALUES (18, 'Deimos', false, 4600, 2);
INSERT INTO public.moon VALUES (19, 'Europa', false, 4600, 4);
INSERT INTO public.moon VALUES (20, 'Ganymede', false, 4600, 4);
INSERT INTO public.moon VALUES (21, 'Callisto', false, 4600, 4);
INSERT INTO public.moon VALUES (22, 'Titan', false, 4600, 5);
INSERT INTO public.moon VALUES (23, 'Enceladus', false, 4600, 5);
INSERT INTO public.moon VALUES (24, 'Mimas', false, 4600, 5);
INSERT INTO public.moon VALUES (25, 'Triton', false, 4600, 6);
INSERT INTO public.moon VALUES (26, 'Charon', false, 4600, 9);
INSERT INTO public.moon VALUES (27, 'Miranda', false, 4600, 10);
INSERT INTO public.moon VALUES (28, 'Umbriel', false, 4600, 10);
INSERT INTO public.moon VALUES (29, 'Ariel', false, 4600, 10);
INSERT INTO public.moon VALUES (30, 'Triton_1', false, 4600, 11);
INSERT INTO public.moon VALUES (31, 'Nereid', false, 4600, 12);
INSERT INTO public.moon VALUES (32, 'Proteus', false, 4600, 12);
INSERT INTO public.moon VALUES (33, 'Larissa', false, 4600, 13);
INSERT INTO public.moon VALUES (34, 'Despina', false, 4600, 13);
INSERT INTO public.moon VALUES (35, 'Galatea', false, 4600, 13);
INSERT INTO public.moon VALUES (36, 'Naiad', false, 4600, 13);


--
-- Data for Name: placeholder; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.placeholder VALUES (1, 'naruhodo_ryuichi', 'Obiection');
INSERT INTO public.placeholder VALUES (3, 'naruhodo_ryunosuke', 'Obiection');
INSERT INTO public.placeholder VALUES (4, 'mikotoba_susato', 'Obiection');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', false, 4500, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 4000, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 4600, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 4600, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 4600, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', false, 4600, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 4600, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 4600, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 4600, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', true, 1400, 4);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', true, 1400, 5);
INSERT INTO public.planet VALUES (12, 'Trappist-1e', true, 1400, 6);
INSERT INTO public.planet VALUES (13, 'HD 219134 c', true, 1400, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 4500, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', true, 800, 1);
INSERT INTO public.star VALUES (3, 'Sirius', true, 250, 2);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', true, 600, 2);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', true, 1000, 2);
INSERT INTO public.star VALUES (6, 'Polaris', true, 70, 1);
INSERT INTO public.star VALUES (7, 'Vega', true, 455, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 36, true);


--
-- Name: placeholder_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.placeholder_placeholder_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: placeholder placeholder_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.placeholder
    ADD CONSTRAINT placeholder_name_key UNIQUE (name);


--
-- Name: placeholder placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.placeholder
    ADD CONSTRAINT placeholder_pkey PRIMARY KEY (placeholder_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

