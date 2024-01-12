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
    size_in_light_years numeric(10,0),
    has_black_hole boolean,
    number_of_stars integer NOT NULL,
    is_spiral_galaxy boolean,
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
    name character varying(50),
    size_in_km numeric(10,0),
    orbital_period_days integer NOT NULL,
    is_habitable boolean,
    planet_id integer,
    has_water_ice boolean
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
    name character varying(50),
    type character varying(20),
    distance_from_star numeric(10,0) NOT NULL,
    has_atmosphere boolean,
    star_id integer,
    is_inhabited boolean,
    description text
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(50),
    type character varying(20),
    orbital_distance numeric(10,0) NOT NULL,
    is_manned boolean,
    planet_id integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    type character varying(20),
    mass numeric(10,0) NOT NULL,
    is_main_sequence boolean,
    galaxy_id integer,
    description text
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, 200, true, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 140000, false, 400, true, 'Closest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, false, 40, true, 'Third-largest galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000, true, 20, false, 'Known for its large central bulge and wide, flat disk.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 35000, false, 60, true, 'Famous for its classic spiral arm structure.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 60000, true, 100, false, 'Home to the first image of a black hole.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 3475, 27, false, 11, false);
INSERT INTO public.moon VALUES (22, 'Phobos', 22, 0, false, 12, false);
INSERT INTO public.moon VALUES (23, 'Deimos', 12, 1, false, 12, false);
INSERT INTO public.moon VALUES (24, 'Europa', 3122, 4, true, 13, true);
INSERT INTO public.moon VALUES (25, 'Ganymede', 5268, 7, false, 13, true);
INSERT INTO public.moon VALUES (26, 'Callisto', 4800, 17, false, 13, false);
INSERT INTO public.moon VALUES (27, 'Titan', 5150, 16, false, 14, true);
INSERT INTO public.moon VALUES (28, 'Enceladus', 504, 1, true, 14, true);
INSERT INTO public.moon VALUES (29, 'Io', 3637, 2, false, 13, false);
INSERT INTO public.moon VALUES (30, 'Triton', 2705, -6, false, 16, true);
INSERT INTO public.moon VALUES (31, 'Charon', 1212, 6, false, 17, true);
INSERT INTO public.moon VALUES (32, 'Phoebe', 213, 550, false, 18, false);
INSERT INTO public.moon VALUES (33, 'Dione', 1122, 3, false, 14, false);
INSERT INTO public.moon VALUES (34, 'Mimas', 396, 1, false, 14, false);
INSERT INTO public.moon VALUES (35, 'Rhea', 1528, 5, false, 14, false);
INSERT INTO public.moon VALUES (36, 'Ariel', 1157, 3, false, 15, false);
INSERT INTO public.moon VALUES (37, 'Umbriel', 1169, 4, false, 15, false);
INSERT INTO public.moon VALUES (38, 'Titania', 1578, 9, false, 15, false);
INSERT INTO public.moon VALUES (39, 'Oberon', 1523, 13, false, 15, false);
INSERT INTO public.moon VALUES (40, 'Miranda', 235, 1, false, 15, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (10, 'Earth', 'Terrestrial', 147, true, 1, true, 'The only known planet with life.');
INSERT INTO public.planet VALUES (11, 'Mars', 'Terrestrial', 228, true, 1, false, 'Known as the "Red Planet."');
INSERT INTO public.planet VALUES (12, 'Jupiter', 'Gas giant', 778, true, 2, false, 'Largest planet in our solar system.');
INSERT INTO public.planet VALUES (13, 'Saturn', 'Gas giant', 1, true, 3, false, 'Famous for its spectacular ring system.');
INSERT INTO public.planet VALUES (14, 'Venus', 'Terrestrial', 108, true, 1, false, 'Similar in size and composition to Earth.');
INSERT INTO public.planet VALUES (15, 'Neptune', 'Ice giant', 5, true, 4, false, 'Known for its deep blue color.');
INSERT INTO public.planet VALUES (16, 'Uranus', 'Ice giant', 3, true, 5, false, 'Rotates on its side, unique among the planets.');
INSERT INTO public.planet VALUES (17, 'Mercury', 'Terrestrial', 58, false, 1, false, 'Closest planet to the Sun.');
INSERT INTO public.planet VALUES (18, 'Kepler-186f', 'Exoplanet', 61, true, 1, false, 'First Earth-sized exoplanet discovered in the habitable zone.');
INSERT INTO public.planet VALUES (19, 'Gliese 581g', 'Exoplanet', 43, true, 1, false, 'Potential habitable exoplanet in the Gliese 581 system.');
INSERT INTO public.planet VALUES (20, 'HD 209458 b', 'Hot Jupiter', 5, true, 1, false, 'First exoplanet to have its atmosphere detected.');
INSERT INTO public.planet VALUES (21, 'TrES-2b', 'Hot Jupiter', 3, false, 1, false, 'One of the darkest known exoplanets.');


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 'Observation', 547, false, NULL);
INSERT INTO public.satellite VALUES (2, 'ISS', 'Space Station', 408, true, NULL);
INSERT INTO public.satellite VALUES (3, 'GPS Satellite', 'Navigation', 20, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 2, true, 1, 'The star at the center of our solar system.');
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type main-sequence', 2, true, 1, 'Brightest star in the night sky.');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant', 9, false, 2, 'One of the largest known stars.');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'M-type main-sequence', 2, true, 2, 'Closest known star to the Sun.');
INSERT INTO public.star VALUES (5, 'Aldebaran', 'K-type giant', 4, false, 3, 'Bright, orange giant star.');
INSERT INTO public.star VALUES (6, 'Vega', 'A-type main-sequence', 2, true, 4, 'One of the brightest stars in the northern sky.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star unique_name2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name2 UNIQUE (name);


--
-- Name: planet unique_name3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name3 UNIQUE (name);


--
-- Name: moon unique_name4; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name4 UNIQUE (name);


--
-- Name: satellite unique_name5; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT unique_name5 UNIQUE (name);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

