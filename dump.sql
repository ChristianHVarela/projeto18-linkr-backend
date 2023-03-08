--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

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
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    link text NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone
);


--
-- Name: posts_hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts_hashtags (
    id integer NOT NULL,
    post_id integer NOT NULL,
    hashtag_id integer NOT NULL
);


--
-- Name: posts_hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_hashtags_id_seq OWNED BY public.posts_hashtags.id;


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: posts_likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts_likes (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: posts_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_likes_id_seq OWNED BY public.posts_likes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    password character varying(60) NOT NULL,
    email character varying(60) NOT NULL,
    image text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts_hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_hashtags ALTER COLUMN id SET DEFAULT nextval('public.posts_hashtags_id_seq'::regclass);


--
-- Name: posts_likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_likes ALTER COLUMN id SET DEFAULT nextval('public.posts_likes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, 1, 'https://www.youtube.com/watch?v=HiBrj8asp3Y', 'Pensando mais a longo prazo, o consenso sobre a necessidade de qualificação representa uma abertura para a melhoria das direções preferenciais no sentido do progresso.', NULL);
INSERT INTO public.posts VALUES (2, 1, 'https://www.youtube.com/watch?v=HiBrj8asp3Y', 'Pensando mais a longo prazo, o consenso sobre a necessidade de qualificação representa uma abertura para a melhoria das direções preferenciais no sentido do progresso.', NULL);
INSERT INTO public.posts VALUES (3, 1, 'https://github.com/ChristianHVarela/projeto18-linkr-backend', 'DNOIQWNDOIWQNDIOQWNIDOQWD', NULL);
INSERT INTO public.posts VALUES (4, 1, 'https://github.com/ChristianHVarela/projeto18-linkr-backend', 'DNOIQWNDOIWQNDIOQWNIDOQWD', NULL);
INSERT INTO public.posts VALUES (5, 1, 'https://www.figma.com/file/EzaDbiWc5y0qb8idmXQt0V/linkr-T4?node-id=7%3A37&t=yQu1vtN3uFkQYYQF-0', 'Podemos já vislumbrar o modo pelo qual a contínua expansão de nossa atividade desafia a capacidade de equalização dos modos de operação convencionais.
', NULL);
INSERT INTO public.posts VALUES (6, 1, 'https://trello.com/b/Pl8Td7NT/linkr', 'Evidentemente, o consenso sobre a necessidade de qualificação obstaculiza a apreciação da importância das novas proposições.', NULL);
INSERT INTO public.posts VALUES (7, 1, 'https://github.com/ChristianHVarela/projeto18-linkr-backend/pulls', 'É importante questionar o quanto a revolução dos costumes não pode mais se dissociar do remanejamento dos quadros funcionais.
', NULL);


--
-- Data for Name: posts_hashtags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts_likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'driven', 'driven', 'driven@driven.com', 'https://static.poder360.com.br/2021/08/Lula-Boxe-2-868x644-1-e1629756322652.png');


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 1, false);


--
-- Name: posts_hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_hashtags_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 7, true);


--
-- Name: posts_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_likes_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: posts_hashtags posts_hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_hashtags
    ADD CONSTRAINT posts_hashtags_pkey PRIMARY KEY (id);


--
-- Name: posts_likes posts_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_likes
    ADD CONSTRAINT posts_likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: posts_hashtags posts_hashtags_hashtag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_hashtags
    ADD CONSTRAINT posts_hashtags_hashtag_id_fkey FOREIGN KEY (hashtag_id) REFERENCES public.hashtags(id);


--
-- Name: posts_hashtags posts_hashtags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_hashtags
    ADD CONSTRAINT posts_hashtags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: posts_likes posts_likes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_likes
    ADD CONSTRAINT posts_likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: posts_likes posts_likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_likes
    ADD CONSTRAINT posts_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

