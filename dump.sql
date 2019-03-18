--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: guest_book; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.guest_book (
    nama_tamu character varying(40) NOT NULL,
    jenis_kelamin character varying(10) NOT NULL,
    email character varying(40),
    alamat character varying(100),
    pesan text,
    id_tamu integer NOT NULL,
    tanggal date
);


--
-- Name: guest_book_id_tamu_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.guest_book_id_tamu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guest_book_id_tamu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.guest_book_id_tamu_seq OWNED BY public.guest_book.id_tamu;


--
-- Name: guestbook; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.guestbook (
    id_tamu integer NOT NULL,
    nama_tamu character varying(40) NOT NULL,
    jenis_kelamin character varying(40) NOT NULL,
    alamat character varying(50) NOT NULL,
    email character varying(50),
    tanggal date,
    pesan text
);


--
-- Name: guestbook_id_tamu_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.guestbook_id_tamu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guestbook_id_tamu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.guestbook_id_tamu_seq OWNED BY public.guestbook.id_tamu;


--
-- Name: test; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test (
    id integer NOT NULL,
    nama character varying NOT NULL
);


--
-- Name: guest_book id_tamu; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guest_book ALTER COLUMN id_tamu SET DEFAULT nextval('public.guest_book_id_tamu_seq'::regclass);


--
-- Name: guestbook id_tamu; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guestbook ALTER COLUMN id_tamu SET DEFAULT nextval('public.guestbook_id_tamu_seq'::regclass);


--
-- Data for Name: guest_book; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.guest_book (nama_tamu, jenis_kelamin, email, alamat, pesan, id_tamu, tanggal) FROM stdin;
habibi	Laki-laki	joko@gmail.com	serpong	halo halo halo	8	2019-03-16
\.


--
-- Data for Name: guestbook; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.guestbook (id_tamu, nama_tamu, jenis_kelamin, alamat, email, tanggal, pesan) FROM stdin;
2	Yandri	Laki - laki	Banten	yandri@gmail.com	2019-03-16	halo halo halo
3	Yuniar	Perempuan	Nganjuk	yuniar@gmail.com	2019-03-16	semoga kita cepat nikah ya
4	Johan	Laki - laki	Jember	johann@gmail.com	2019-03-17	Selamat Menikah
5	Hany	Perempuan	Malang	hany@gmail.com	2019-03-17	Ayok nikah muda
1	Meru Rendy	Laki - laki	Serpong	merurw@gmail.com	2019-03-17	Halo halo halo
22	Jono	Laki - laki	serpong	jono@gmail.com	2019-03-18	halo halo halo
6	dwi purwanto	Perempuan	Jombang	dwi@gmail.com	2019-03-18	ayok yok nikah
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.test (id, nama) FROM stdin;
1	Joko
\.


--
-- Name: guest_book_id_tamu_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.guest_book_id_tamu_seq', 8, true);


--
-- Name: guestbook_id_tamu_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.guestbook_id_tamu_seq', 22, true);


--
-- Name: guestbook guestbook_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guestbook
    ADD CONSTRAINT guestbook_pkey PRIMARY KEY (id_tamu);


--
-- Name: guest_book id_tamu; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guest_book
    ADD CONSTRAINT id_tamu PRIMARY KEY (id_tamu);


--
-- Name: test pk_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

