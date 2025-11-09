--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30),
    composition character varying(50) NOT NULL,
    discovery_year integer NOT NULL,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    description text NOT NULL,
    type character varying(30) NOT NULL
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
    age_in_millions_of_years integer NOT NULL,
    planet_name character varying(30) NOT NULL,
    has_atmosphere boolean NOT NULL,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL,
    number_of_human_life_in_millions numeric(10,1) NOT NULL,
    number_of_moon integer,
    is_spherical boolean NOT NULL,
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
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    description text NOT NULL,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Rocky and icy', 1801, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Rocky with basaltic surface', 1807, 2);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Metallic and rocky', 1802, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Our home galaxy, containing the Solar System and billions of stars.', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Nearest spiral galaxy to the Milky Way, expected to collide with it in the future.', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 'A smaller spiral galaxy in the Local Group, with active star formation.', 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 9000, 'Notable for its bright nucleus and large central bulge, resembling a sombrero hat.', 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 13000, 'A giant elliptical galaxy in the Virgo Cluster, known for its supermassive black hole.', 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 9000, 'Famous spiral galaxy with well-defined arms, interacting with a smaller companion galaxy.', 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500, 'Earth', false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 'Mars', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 'Mars', false, 2);
INSERT INTO public.moon VALUES (4, 'Venus Moon', 4600, 'Venus', false, 3);
INSERT INTO public.moon VALUES (5, 'Proxima-b I', 4500, 'Proxima b', false, 4);
INSERT INTO public.moon VALUES (6, 'Rigel-1 Moon', 8, 'Rigel-1', false, 5);
INSERT INTO public.moon VALUES (7, 'Rigel-2 Moon', 8, 'Rigel-2', false, 6);
INSERT INTO public.moon VALUES (8, 'Betelgeuse-1 Moon', 10, 'Betelgeuse-1', false, 7);
INSERT INTO public.moon VALUES (9, 'Betelgeuse-2 Moon', 10, 'Betelgeuse-2', false, 8);
INSERT INTO public.moon VALUES (10, 'Vega-Prime Moon', 455, 'Vega-Prime', false, 9);
INSERT INTO public.moon VALUES (11, 'Vega-Secundus Moon', 455, 'Vega-Secundus', false, 10);
INSERT INTO public.moon VALUES (12, 'Sirius-A Moon', 242, 'Sirius-A', false, 11);
INSERT INTO public.moon VALUES (13, 'Sirius-B Moon', 242, 'Sirius-B', false, 12);
INSERT INTO public.moon VALUES (14, 'Earth-2', 4500, 'Earth', false, 1);
INSERT INTO public.moon VALUES (15, 'Earth-3', 4500, 'Earth', false, 1);
INSERT INTO public.moon VALUES (16, 'Mars-3', 4500, 'Mars', false, 2);
INSERT INTO public.moon VALUES (17, 'Mars-4', 4500, 'Mars', false, 2);
INSERT INTO public.moon VALUES (18, 'Vega-Prime-2', 455, 'Vega-Prime', false, 9);
INSERT INTO public.moon VALUES (19, 'Vega-Prime-3', 455, 'Vega-Prime', false, 9);
INSERT INTO public.moon VALUES (20, 'Sirius-A-2', 242, 'Sirius-A', false, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4600, true, 8000.0, 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4500, false, 0.0, 2, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4600, false, 0.0, 0, true, 1);
INSERT INTO public.planet VALUES (4, 'Proxima b', 4500, false, 0.0, 0, true, 2);
INSERT INTO public.planet VALUES (5, 'Rigel-1', 8, false, 0.0, 1, true, 3);
INSERT INTO public.planet VALUES (6, 'Rigel-2', 8, false, 0.0, 0, true, 3);
INSERT INTO public.planet VALUES (7, 'Betelgeuse-1', 10, false, 0.0, 0, true, 4);
INSERT INTO public.planet VALUES (8, 'Betelgeuse-2', 10, false, 0.0, 0, true, 4);
INSERT INTO public.planet VALUES (9, 'Vega-Prime', 455, false, 0.0, 3, true, 5);
INSERT INTO public.planet VALUES (10, 'Vega-Secundus', 455, false, 0.0, 0, true, 5);
INSERT INTO public.planet VALUES (11, 'Sirius-A', 242, false, 0.0, 0, true, 6);
INSERT INTO public.planet VALUES (12, 'Sirius-B', 242, false, 0.0, 0, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 'The star at the center of our Solar System, providing energy for life on Earth.', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4500, 'The closest known star to the Sun, a red dwarf with a small planet.', 1);
INSERT INTO public.star VALUES (3, 'Rigel', 8, 'A bright blue supergiant star in the Orion constellation.', 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 10, 'A red supergiant star in Orion, nearing the end of its life.', 2);
INSERT INTO public.star VALUES (5, 'Vega', 455, 'A bright star in the Lyra constellation, often used as a reference in astronomy.', 3);
INSERT INTO public.star VALUES (6, 'Sirius', 242, 'The brightest star in the night sky, part of the Canis Major constellation.', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

