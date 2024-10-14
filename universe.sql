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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_million_kg numeric(15,2),
    number_of_asteroids integer,
    width_in_km numeric(15,2)
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_structure character varying(30) NOT NULL,
    galaxy_size_in_ly numeric(7,2),
    mass_in_tsm numeric(7,2),
    number_of_stars_in_b numeric(7,2),
    galactic_center_is_black_hole boolean
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    weight_in_million_kg bigint,
    diameter_in_km integer
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_km numeric(10,2),
    mass_in_em numeric(7,2),
    orbital_period_in_days integer,
    surface_temp_in_celsius integer,
    is_habitable boolean,
    number_of_moons integer,
    greek_mythology_link text
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(30) NOT NULL,
    mass_in_sm numeric(7,2),
    diameter_in_km integer,
    age_in_years integer,
    can_become_black_hole boolean,
    temperature_in_celsius integer
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
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


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
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 'Main Asteroid Belt', 1, 4.10, 1000000, 1000000.00);
INSERT INTO public.asteroid_belt VALUES (2, 'Kuiper Belt', 1, 0.20, 100000, 1000000.00);
INSERT INTO public.asteroid_belt VALUES (3, 'Oort Cloud', 1, 0.05, 1000000, 200000000.00);
INSERT INTO public.asteroid_belt VALUES (4, 'Themis Asteroids', 1, 0.03, 10000, 50000.00);
INSERT INTO public.asteroid_belt VALUES (5, 'Hilda Family', 1, 0.02, 3000, 30000.00);
INSERT INTO public.asteroid_belt VALUES (6, 'Cybele Asteroids', 1, 0.02, 1500, 25000.00);
INSERT INTO public.asteroid_belt VALUES (7, 'Jupiter Trojans', 1, 0.10, 8000, 30000.00);
INSERT INTO public.asteroid_belt VALUES (8, 'Centaur Objects', 1, 0.08, 500, 100000.00);
INSERT INTO public.asteroid_belt VALUES (9, 'Scattered Disc Objects', 1, 0.04, 2000, 75000.00);
INSERT INTO public.asteroid_belt VALUES (10, 'Sednoid Objects', 1, 0.02, 200, 10000.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 99090.00, 1.50, 200.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 22000.00, 0.50, 1000.00, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 6000.00, 0.05, 40.00, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 3000.00, 0.10, 200.00, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 5000.00, 0.15, 800.00, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 15000.00, 0.90, 100.00, true);
INSERT INTO public.galaxy VALUES (7, 'Sculptor A', 'Irregular', 3000.00, 0.02, 30.00, false);
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'Irregular', 1500.00, 0.01, 20.00, false);
INSERT INTO public.galaxy VALUES (9, 'Small Magellanic Cloud', 'Irregular', 750.00, 0.01, 10.00, false);
INSERT INTO public.galaxy VALUES (10, 'Virgo A', 'Elliptical', 30000.00, 1.00, 2000.00, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 7, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 0, 12);
INSERT INTO public.moon VALUES (4, 'Io', 3, 9, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 5, 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 148, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 18, 4821);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 135, 5151);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 4, 1528);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 1, 1469);
INSERT INTO public.moon VALUES (11, 'Enceladus', 4, 0, 505);
INSERT INTO public.moon VALUES (12, 'Miranda', 5, 0, 472);
INSERT INTO public.moon VALUES (13, 'Ariel', 5, 0, 1166);
INSERT INTO public.moon VALUES (14, 'Umbriel', 5, 0, 1169);
INSERT INTO public.moon VALUES (15, 'Titania', 5, 0, 1578);
INSERT INTO public.moon VALUES (16, 'Oberon', 5, 0, 1524);
INSERT INTO public.moon VALUES (17, 'Triton', 6, 0, 2707);
INSERT INTO public.moon VALUES (18, 'Nereid', 6, 0, 340);
INSERT INTO public.moon VALUES (19, 'Charon', 1, 2, 1212);
INSERT INTO public.moon VALUES (20, 'Hyperion', 4, 0, 270);
INSERT INTO public.moon VALUES (21, 'Phoebe', 4, 0, 220);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4879.00, 0.06, 88, 167, false, 0, 'Hermes');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104.00, 0.82, 225, 464, false, 0, 'Aphrodite');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742.00, 1.00, 365, 15, true, 1, 'Gaia');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779.00, 0.11, 687, -63, false, 2, 'Ares');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820.00, 317.80, 4333, -108, false, 79, 'Zeus');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116460.00, 95.20, 10759, -139, false, 83, 'Cronus');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 50724.00, 14.50, 30687, -197, false, 27, 'Uranus');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 49244.00, 17.10, 60190, -201, false, 14, 'Poseidon');
INSERT INTO public.planet VALUES (9, 'Proxima b', 5, 11300.00, 0.98, 11, 30, true, 0, NULL);
INSERT INTO public.planet VALUES (10, 'Sirius b I', 2, 70.00, 0.00, 5, -40, false, 0, NULL);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Bb', 3, 6000.00, 1.00, 365, 20, true, 1, NULL);
INSERT INTO public.planet VALUES (12, 'Betelgeuse b', 7, 1800.00, 0.50, 30, 100, false, 0, NULL);
INSERT INTO public.planet VALUES (13, 'Gliese 581 g', 8, 12000.00, 1.20, 37, 15, true, 0, NULL);
INSERT INTO public.planet VALUES (14, 'Kepler-186f', 9, 4900.00, 0.40, 130, 12, true, 0, NULL);
INSERT INTO public.planet VALUES (15, 'HD 209458 b', 10, 1400.00, 0.69, 4, 1200, false, 0, NULL);
INSERT INTO public.planet VALUES (16, 'HD 40307g', 12, 11000.00, 1.00, 200, 5, true, 0, NULL);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1e', 14, 10000.00, 0.76, 6, 25, true, 0, NULL);
INSERT INTO public.planet VALUES (18, 'Kepler-62f', 15, 8600.00, 0.50, 267, -20, true, 0, NULL);
INSERT INTO public.planet VALUES (19, 'HD 97658 b', 16, 10000.00, 1.10, 10, 120, false, 0, NULL);
INSERT INTO public.planet VALUES (20, 'K2-18b', 17, 12000.00, 1.50, 34, 30, true, 0, NULL);
INSERT INTO public.planet VALUES (21, 'LHS 1140 b', 18, 14000.00, 1.50, 24, 20, true, 0, NULL);
INSERT INTO public.planet VALUES (22, 'GJ 1132 b', 19, 7300.00, 1.60, 2, 40, true, 0, NULL);
INSERT INTO public.planet VALUES (23, 'WASP-39b', 20, 1280.00, 0.25, 5, 700, false, 0, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius A', 1, 'A1V', 2.00, 139, 200, false, 9940);
INSERT INTO public.star VALUES (2, 'Sirius B', 1, 'DA2', 0.98, 70, 120, true, 2500);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G2V', 1.10, 109, 5000, false, 5790);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 1, 'K1V', 0.90, 86, 5000, false, 5200);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'M5.5Ve', 0.12, 1, 4000, false, 3000);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 'M2Ia', 18.50, 887, 800000, true, 3500);
INSERT INTO public.star VALUES (7, 'Rigel', 1, 'B8Ia', 21.00, 78, 1000000, true, 12000);
INSERT INTO public.star VALUES (8, 'Aldebaran', 1, 'K5III', 1.50, 44, 650000, false, 4000);
INSERT INTO public.star VALUES (9, 'Altair', 1, 'A7V', 1.79, 138, 10000, false, 7500);
INSERT INTO public.star VALUES (10, 'Vega', 1, 'A0V', 2.10, 50, 450000000, false, 8500);
INSERT INTO public.star VALUES (11, 'Andromeda I', 2, 'M4', 0.08, 1, 10000, false, 2500);
INSERT INTO public.star VALUES (12, 'Andromeda II', 2, 'G0', 1.00, 1, 1000000, false, 5800);
INSERT INTO public.star VALUES (13, 'Andromeda III', 2, 'K2', 0.90, 1, 300000, false, 4900);
INSERT INTO public.star VALUES (14, 'Triangulum I', 3, 'F0', 1.50, 1, 500000, false, 6500);
INSERT INTO public.star VALUES (15, 'Triangulum II', 3, 'M0', 0.70, 1, 100000, false, 3000);
INSERT INTO public.star VALUES (16, 'Whirlpool I', 4, 'B2', 3.50, 1, 2000000, true, 14000);
INSERT INTO public.star VALUES (17, 'Whirlpool II', 4, 'A5', 2.00, 1, 500000, false, 8000);
INSERT INTO public.star VALUES (18, 'Sombrero I', 5, 'K3', 1.00, 1, 800000, false, 5000);
INSERT INTO public.star VALUES (19, 'Sombrero II', 5, 'B5', 5.00, 2, 300000, true, 12000);
INSERT INTO public.star VALUES (20, 'Centaurus A I', 6, 'A0', 2.00, 2, 4000000, false, 8500);


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid_belt unique_asteroid_belt_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT unique_asteroid_belt_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


