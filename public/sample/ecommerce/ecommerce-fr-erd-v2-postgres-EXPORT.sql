--
-- PostgreSQL database dump
--

-- Dumped from database version 13.16 (Postgres.app)
-- Dumped by pg_dump version 14.13 (Homebrew)

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
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    numero integer NOT NULL,
    nom character varying(255),
    prenom character varying(255),
    rue character varying(255),
    codepostal character varying(255),
    ville character varying(255),
    telephone character varying(20),
    categorie character varying(2),
    compte double precision
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: commandes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commandes (
    numero integer NOT NULL,
    numeroclient integer,
    datecommande date,
    statut character varying(255)
);


ALTER TABLE public.commandes OWNER TO postgres;

--
-- Name: details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.details (
    numerocommande integer NOT NULL,
    numeroproduit integer NOT NULL,
    quantite integer
);


ALTER TABLE public.details OWNER TO postgres;

--
-- Name: produits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produits (
    numero integer NOT NULL,
    nom character varying(255),
    prix double precision,
    stock integer
);


ALTER TABLE public.produits OWNER TO postgres;

--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (numero, nom, prenom, rue, codepostal, ville, telephone, categorie, compte) FROM stdin;
1	Lebreton	Éléonore	6 avenue Françoise Olivier	38240	Meylan	0776059929	A1	10000
2	Vasseur	Georges	54, avenue Jean	38000	Grenoble	+33 1 44 68 49 74	B2	1903.54
3	Da Costa	Léon	18, boulevard Brigitte Faivre	75000	Paris	0568740044	C3	-1500
4	Rey	Michel	49, avenue de Adam	38220	Vizille	\N	B1	3251
5	Weiss	Dominique	98, boulevard Remy	59000	Lille	\N	B2	0
6	Berlioz	Diane	27 avenue de la Chartreuse	75000	Paris	\N	\N	123094
\.


--
-- Data for Name: commandes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commandes (numero, numeroclient, datecommande, statut) FROM stdin;
1	1	2024-02-01	livrée
2	1	2024-03-15	livrée
3	3	2024-04-28	livrée
4	4	2024-06-24	annulée
5	5	2024-06-30	en cours
6	5	2024-07-12	en cours
7	4	2024-08-19	annulée
\.


--
-- Data for Name: details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.details (numerocommande, numeroproduit, quantite) FROM stdin;
1	1	3
1	2	1
1	3	1
2	4	1
2	5	1
3	1	4
3	2	1
3	3	2
3	4	1
3	5	1
4	1	7
4	2	1
5	1	2
5	2	1
5	3	1
6	1	10
7	1	1
\.


--
-- Data for Name: produits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produits (numero, nom, prix, stock) FROM stdin;
1	T-shirt	25	30
2	Pantalon	60	50
3	Chaussures	120	100
4	Casquette	15	10
5	Sac à dos	80	5
6	Pull	70	150
\.


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (numero);


--
-- Name: commandes commandes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_pkey PRIMARY KEY (numero);


--
-- Name: details details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_pkey PRIMARY KEY (numerocommande, numeroproduit);


--
-- Name: produits produits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT produits_pkey PRIMARY KEY (numero);


--
-- Name: commandes commandes_numeroclient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_numeroclient_fkey FOREIGN KEY (numeroclient) REFERENCES public.clients(numero);


--
-- Name: details details_numerocommande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_numerocommande_fkey FOREIGN KEY (numerocommande) REFERENCES public.commandes(numero);


--
-- Name: details details_numeroproduit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_numeroproduit_fkey FOREIGN KEY (numeroproduit) REFERENCES public.produits(numero);


--
-- PostgreSQL database dump complete
--

