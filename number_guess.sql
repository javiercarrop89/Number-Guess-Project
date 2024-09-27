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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (77, 31, 345);
INSERT INTO public.games VALUES (78, 31, 11);
INSERT INTO public.games VALUES (79, 32, 980);
INSERT INTO public.games VALUES (80, 32, 100);
INSERT INTO public.games VALUES (81, 31, 434);
INSERT INTO public.games VALUES (82, 31, 659);
INSERT INTO public.games VALUES (83, 31, 6);
INSERT INTO public.games VALUES (84, 33, 8);
INSERT INTO public.games VALUES (85, 33, 9);
INSERT INTO public.games VALUES (86, 34, 11);
INSERT INTO public.games VALUES (87, 33, 9);
INSERT INTO public.games VALUES (88, 35, 434);
INSERT INTO public.games VALUES (89, 35, 818);
INSERT INTO public.games VALUES (90, 36, 923);
INSERT INTO public.games VALUES (91, 36, 9);
INSERT INTO public.games VALUES (92, 35, 878);
INSERT INTO public.games VALUES (93, 35, 966);
INSERT INTO public.games VALUES (94, 35, 397);
INSERT INTO public.games VALUES (95, 37, 792);
INSERT INTO public.games VALUES (96, 37, 42);
INSERT INTO public.games VALUES (97, 38, 956);
INSERT INTO public.games VALUES (98, 38, 318);
INSERT INTO public.games VALUES (99, 37, 326);
INSERT INTO public.games VALUES (100, 37, 669);
INSERT INTO public.games VALUES (101, 37, 90);
INSERT INTO public.games VALUES (102, 39, 143);
INSERT INTO public.games VALUES (103, 39, 617);
INSERT INTO public.games VALUES (104, 40, 98);
INSERT INTO public.games VALUES (105, 40, 505);
INSERT INTO public.games VALUES (106, 39, 713);
INSERT INTO public.games VALUES (107, 39, 343);
INSERT INTO public.games VALUES (108, 39, 219);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (31, 'user_1727479544514');
INSERT INTO public.users VALUES (32, 'user_1727479544513');
INSERT INTO public.users VALUES (33, 'javier');
INSERT INTO public.users VALUES (34, 'test1');
INSERT INTO public.users VALUES (35, 'user_1727479758787');
INSERT INTO public.users VALUES (36, 'user_1727479758786');
INSERT INTO public.users VALUES (37, 'user_1727479801661');
INSERT INTO public.users VALUES (38, 'user_1727479801660');
INSERT INTO public.users VALUES (39, 'user_1727479845060');
INSERT INTO public.users VALUES (40, 'user_1727479845059');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 108, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 40, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

