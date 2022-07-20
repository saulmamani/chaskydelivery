--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6 (Ubuntu 13.6-0ubuntu0.21.10.1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-0ubuntu0.22.04.1)

-- Started on 2022-07-20 17:38:44 -04

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 56867)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 56865)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 209
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 212 (class 1259 OID 56877)
-- Name: empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresas (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    ciudad character varying(50) NOT NULL,
    direccion character varying(100),
    localizacion character varying(255),
    celular character varying(20) NOT NULL,
    email character varying(50),
    estado character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT empresas_estado_check CHECK (((estado)::text = ANY ((ARRAY['Abierto'::character varying, 'Cerrado'::character varying])::text[])))
);


ALTER TABLE public.empresas OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 56875)
-- Name: empresas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresas_id_seq OWNER TO postgres;

--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 211
-- Name: empresas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresas_id_seq OWNED BY public.empresas.id;


--
-- TOC entry 206 (class 1259 OID 56839)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 56837)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 205
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 201 (class 1259 OID 56811)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 56809)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 200
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 204 (class 1259 OID 56830)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 56853)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 56851)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 207
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 214 (class 1259 OID 56891)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id bigint NOT NULL,
    codigo character varying(20) NOT NULL,
    nombre character varying(250) NOT NULL,
    descripcion text,
    precio numeric(10,2) NOT NULL,
    oferta numeric(10,2),
    categoria_id bigint NOT NULL,
    empresa_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 56889)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 213
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 203 (class 1259 OID 56819)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 56817)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2980 (class 2604 OID 56870)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 2981 (class 2604 OID 56880)
-- Name: empresas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas ALTER COLUMN id SET DEFAULT nextval('public.empresas_id_seq'::regclass);


--
-- TOC entry 2977 (class 2604 OID 56842)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2975 (class 2604 OID 56814)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2979 (class 2604 OID 56856)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 2983 (class 2604 OID 56894)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 2976 (class 2604 OID 56822)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3152 (class 0 OID 56867)
-- Dependencies: 210
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nombre, created_at, updated_at) FROM stdin;
1	Comidas Nacionales	\N	\N
2	Comidas Internacionales	\N	\N
3	Abarrotes	\N	\N
4	Bebidas	\N	\N
5	Carnes	\N	\N
6	Embutidos	\N	\N
7	Frutas y verduras	\N	\N
8	Lácteos	\N	\N
9	Huevos	\N	\N
10	Artículos de higiene	\N	\N
11	Artículos de mascotas	\N	\N
12	Varios	\N	\N
\.


--
-- TOC entry 3154 (class 0 OID 56877)
-- Dependencies: 212
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresas (id, nombre, ciudad, direccion, localizacion, celular, email, estado, created_at, updated_at) FROM stdin;
1	Schamberger LLC	Oruro	7049 Howell Stravenue\nRosendoville, NJ 62016	-78.327284,21.341176	320-749-8818	mosciski.gladys@yahoo.com	Cerrado	1975-01-29 13:27:30	2018-11-21 06:56:33
2	O'Conner Group	Cochabamba	711 Koepp Plaza Suite 982\nSouth Velmaburgh, AZ 86816	-80.713842,-55.56223	+1.951.910.8576	kirk.ernser@rempel.org	Cerrado	1992-07-01 05:06:59	1999-08-01 17:09:06
3	Terry, Emard and Howe	Cochabamba	1362 Ledner Motorway Apt. 023\nGayberg, WA 61985-5547	10.013945,77.97843	+13463986921	daron.wuckert@gmail.com	Abierto	2005-07-31 23:54:08	1981-09-03 14:41:25
4	Harris, Kris and Hodkiewicz	Santa Cruz	3516 Smitham Parkways Apt. 064\nBirdieburgh, TX 10296-2842	-41.96761,151.818209	1-854-924-0561	kendra.oconnell@yahoo.com	Cerrado	2005-10-14 04:55:20	1994-12-09 05:12:54
5	Kutch, Balistreri and Fisher	Cochabamba	3691 Hagenes Mall\nLake Lewisland, OR 71030-5289	24.546126,100.627891	+1 (351) 751-1577	zackery.kerluke@yahoo.com	Abierto	1977-03-04 04:58:42	1995-10-05 09:23:02
\.


--
-- TOC entry 3148 (class 0 OID 56839)
-- Dependencies: 206
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 56811)
-- Dependencies: 201
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2022_07_19_140035_create_categorias_table	1
6	2022_07_19_140045_create_empresas_table	1
7	2022_07_19_140046_create_productos_table	1
\.


--
-- TOC entry 3146 (class 0 OID 56830)
-- Dependencies: 204
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 56853)
-- Dependencies: 208
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 56891)
-- Dependencies: 214
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, codigo, nombre, descripcion, precio, oferta, categoria_id, empresa_id, created_at, updated_at) FROM stdin;
1	5301693	Pizza con tomate y champiñones	Dolores quod distinctio impedit consectetur consequuntur.	15.45	33.14	11	2	2006-03-06 01:32:35	2017-03-23 12:00:19
2	1350225	Pepino.	Accusamus iure vel dolorem accusamus.	40.46	47.16	1	1	1997-02-10 23:56:29	1980-06-03 07:20:04
3	3304416	Papa cocida	Aut laborum et autem enim.	6.19	21.46	12	3	1996-09-01 05:54:00	1974-12-05 11:11:14
4	9886825	vodka	Debitis voluptatem explicabo aperiam ipsum quidem consequatur.	24.12	34.20	1	1	2016-12-01 09:57:27	2003-04-19 04:15:00
5	2176057	Lavandina	Necessitatibus harum quis magnam ipsa harum omnis tempora blanditiis.	29.65	65.51	7	3	2010-06-21 16:12:58	1993-12-09 15:45:43
6	7296199	Pizza con tomate y cebolla	Culpa vel enim sed sunt laborum mollitia.	53.04	68.26	11	1	1981-01-26 04:18:00	2019-08-11 01:23:54
7	7149244	Tomate.	Voluptatem accusamus voluptas sunt voluptates.	26.45	92.90	7	2	1996-08-31 23:41:58	1971-01-24 09:31:00
8	1562680	Líquido lavaplatos	Deleniti ullam sequi voluptates ut quo.	62.77	34.61	2	5	1999-03-05 08:19:25	2010-10-02 00:57:19
9	7902380	Cerveza	Cumque aut sed quidem omnis velit accusamus.	40.27	65.01	7	4	2004-03-16 01:41:42	2021-12-03 20:24:57
10	4867409	Pollo a la parrilla	Nam soluta deleniti et beatae.	68.69	95.94	4	1	2009-12-01 17:47:44	1982-05-27 10:29:49
11	8274583	Detergentes para el lavado de ropas	Aut laborum fuga quo ducimus quidem eos harum.	32.11	41.11	7	1	2005-06-10 17:06:27	1994-02-08 21:36:44
12	6574341	whisky	Voluptatem maxime voluptas nihil aut in et quaerat.	31.14	26.35	6	1	2021-02-10 06:57:15	2015-07-06 20:19:41
13	3547985	Pizza con tomate y cebolla	Quasi delectus sed fugit quia velit et ut.	74.62	97.83	3	4	2006-11-03 08:06:56	1978-11-24 10:52:46
14	6002761	ginebra	Et tempore dolorum fugit et.	36.64	63.31	9	2	1979-04-10 23:13:55	1996-03-29 13:10:27
15	527208	coñac	Qui eum sunt facilis recusandae nihil quibusdam.	31.46	19.39	10	1	2004-04-11 01:43:41	2011-06-02 17:39:14
16	6080030	Huevos fritos	Praesentium consectetur accusantium unde.	3.10	34.34	7	4	2020-09-27 16:28:45	2014-09-27 22:04:56
17	4631085	Puerro.	Quasi eligendi consequatur non illo assumenda voluptatem animi corporis.	3.92	62.34	2	5	1978-05-26 05:38:19	1974-08-15 12:58:37
18	9715034	Rábano.	Itaque itaque reiciendis dolore tempora voluptates asperiores.	78.20	65.72	3	4	1998-07-29 14:34:05	1979-02-05 02:13:25
19	1811790	Pizza	Neque quisquam vero sint.	63.48	62.83	9	3	1975-07-10 05:31:18	2011-03-23 08:41:46
20	5951241	Quitamanchas	Minima repellat qui rerum iusto.	51.82	83.56	4	1	2017-05-24 09:24:57	1977-07-20 05:20:09
21	1300532	Pizza con cebolla	Necessitatibus quis atque et dolor dolorem necessitatibus nobis ab.	27.81	59.87	5	3	1984-03-14 08:41:06	1983-07-26 08:37:14
22	5166395	Setas.	Est est adipisci magnam facilis similique.	79.98	48.18	4	4	2017-07-29 16:10:34	1975-03-30 06:09:53
23	1321863	Limpiador de pisos	Quidem voluptate laboriosam omnis ut voluptatum aut repellendus.	45.84	15.98	7	1	1976-11-21 23:24:40	2014-09-08 10:07:02
24	8848321	Té	Dolorem qui modi sit.	59.31	15.98	11	2	2017-02-02 15:46:22	1974-12-20 18:38:28
25	7995870	ron	Explicabo tempora assumenda velit earum.	2.75	43.24	3	2	2015-03-28 17:22:13	2010-08-21 00:09:39
26	4965963	whisky	Quibusdam nam eligendi impedit sit voluptatem inventore dolore.	74.13	14.97	8	3	1976-08-11 07:29:39	2008-05-05 18:30:25
27	6935102	Pepino.	Asperiores dolor saepe nostrum.	82.74	38.60	7	4	1976-05-20 08:27:07	2008-08-26 12:07:20
28	2930089	Pizza con cebolla	Beatae hic totam rem in eius eligendi.	78.28	70.18	2	3	1988-07-04 03:01:54	2006-02-11 00:25:52
29	2897184	Remolacha.	Modi quia recusandae totam modi.	21.99	43.89	3	3	1979-06-21 20:32:22	1972-09-13 12:49:17
30	5106128	vodka	Possimus qui vero quia facere aut cumque enim voluptates.	3.12	55.70	3	3	2001-07-26 14:16:41	1992-09-25 21:35:07
31	266063	Vino	Illo quibusdam repudiandae ipsum voluptate ut vitae.	93.08	63.75	1	1	1990-02-17 06:27:46	2015-07-24 17:44:28
32	8702950	coñac	Unde aut fuga exercitationem at in porro.	89.18	39.08	8	1	2000-11-18 02:53:44	1971-09-09 04:51:53
33	2591441	Pizza	Consequatur explicabo nemo dolorem.	41.11	2.51	10	2	1978-01-30 16:43:32	2007-11-02 00:28:40
34	5373123	Limpiador de toilets	Unde laborum occaecati harum.	21.10	30.06	9	1	1981-03-30 11:55:35	2022-06-05 12:32:16
35	8136710	Papa cocida	Qui ipsa sit delectus ullam illum qui et.	96.95	27.95	2	4	2004-01-25 14:03:13	1996-01-29 10:48:59
36	8174541	Whisky	Ut voluptate quos iure iste odio molestiae consectetur.	6.95	59.12	5	4	1977-12-10 16:57:42	2018-06-24 09:55:27
37	3221672	ginebra	Itaque enim fugiat nihil maiores quibusdam laudantium rerum.	33.16	15.10	4	1	1997-10-11 01:48:31	1979-08-26 08:14:04
38	5655582	brandy	Incidunt sint aliquid eius mollitia quidem voluptatum animi.	36.72	66.95	3	5	1981-05-29 18:09:42	1984-01-06 10:16:39
39	1334349	Limpiador de vidrios	Ipsa dicta cum delectus voluptatem.	20.11	22.24	8	5	1980-10-13 14:20:23	2017-07-15 08:39:57
40	4606220	Pepino.	Dolorem maiores nostrum ut sit.	64.14	62.77	3	4	2012-08-13 06:55:32	1995-03-30 18:05:45
41	2600348	Caldo de pollo	Et et illo rerum ea quia odio.	90.21	88.72	8	1	2018-11-10 17:06:03	2015-11-18 03:42:45
42	2919395	Pollo a la braza	Vel aut aut dolorum totam molestiae.	83.13	94.39	7	2	1997-07-13 06:05:01	1997-07-20 20:50:02
43	2127485	Pizza con tomate y queso	Odit et dolor quis repudiandae.	83.52	13.46	5	5	1984-11-30 02:38:12	1976-12-03 03:27:51
44	1500966	Chairo	Aut aut suscipit reiciendis cupiditate et ut et.	36.84	99.91	5	3	1975-08-12 11:28:57	2018-04-08 18:22:37
45	8985676	Papa rellena	Officiis corrupti ut rem numquam officia.	82.19	87.75	8	5	2021-05-20 01:59:55	2009-10-17 05:30:27
46	4319989	Chairo	Temporibus tempore qui cupiditate qui et est fuga.	18.75	51.88	1	2	1986-10-08 19:05:13	1993-11-14 16:09:45
47	1475593	Tomate.	Nulla sint voluptatum laboriosam.	13.02	77.28	11	4	1990-08-02 19:19:20	1983-02-13 19:29:05
48	3902968	Pizza con tomate y cebolla	A amet dolores sunt magni qui.	30.91	79.91	1	3	1982-03-05 22:41:39	1985-02-06 21:26:31
49	8192822	Pizza con tomate y cebolla	Adipisci cupiditate in libero accusantium omnis maiores aut.	1.77	39.99	1	2	2019-05-11 16:28:37	1975-05-19 19:00:51
50	8089704	Pimiento.	Quia itaque facere et officiis sit tempore qui.	82.78	12.50	7	3	1991-11-27 17:08:57	1986-09-09 06:39:41
51	8194399	whisky	Quidem iusto maiores vitae ut eos.	43.86	72.59	2	3	1982-03-04 11:04:45	1995-05-22 15:13:25
52	7095555	Pizza con queso	Ut quos asperiores est nemo odit officia.	7.92	99.95	6	3	1976-03-02 07:25:39	1998-07-05 22:34:41
53	4793705	Limpiador de vidrios	Ipsa corrupti explicabo et ea atque inventore.	51.19	91.31	8	1	1987-12-28 13:33:22	1990-05-28 06:20:11
54	3620640	Limpiador anti-bacteriano	Quaerat autem consequuntur qui ipsam voluptas earum.	98.36	82.74	3	5	1979-08-17 12:09:01	1988-09-22 18:43:51
55	3352526	Vino	Odit ex ab quo magnam nulla eos.	16.54	97.25	7	4	2002-07-22 20:25:45	1978-09-14 11:01:29
56	7871501	Pimiento.	Harum veritatis et velit quisquam quaerat incidunt ut.	4.80	34.34	2	5	1990-01-30 00:39:35	1992-03-22 19:42:02
57	8700511	Limpiador de pisos	Doloribus totam ut autem ipsam excepturi alias aperiam.	66.85	34.22	8	3	2004-11-24 19:08:54	1993-08-13 03:06:38
58	256364	Jabón líquido o sanitizante de manos	Odio dolor dicta delectus iure distinctio.	98.33	74.75	11	1	2006-07-07 20:02:12	1977-02-27 15:24:30
59	3501288	Limpiador de baños	Nostrum facilis enim et et inventore in.	35.61	42.37	5	3	2017-04-23 04:21:31	1979-07-13 13:01:46
60	9053456	Aceite de oliva	Aspernatur quis quia eos voluptatem est et at.	92.49	92.24	12	2	1987-12-14 08:05:01	1992-06-21 11:59:52
61	8076809	Pollo a la parrilla	Deleniti eveniet ut quod molestiae maxime consequatur deleniti.	15.91	26.29	8	1	2014-12-27 10:29:46	1994-06-27 10:11:28
62	1181004	ginebra	Eaque ut tempore voluptas quis voluptates.	2.76	13.87	10	1	2016-11-02 07:38:39	2014-09-09 11:56:35
63	5134795	brandy	Et voluptas sed iusto dolores dolorum aut architecto.	36.02	12.54	7	1	1995-02-27 07:44:54	2015-03-11 13:41:23
64	2008581	Caldo de pollo	Rem nulla est enim ut sit.	33.01	72.35	9	3	1993-04-02 23:25:38	2020-10-14 08:39:37
65	7693652	Papa cocida	Quo at voluptatibus ducimus repudiandae.	46.30	18.50	3	4	2000-01-24 14:13:15	2006-06-24 15:57:21
66	5581737	Rábano.	Eum et accusantium et aut est.	3.54	18.48	3	5	1989-12-26 17:01:56	1993-01-11 02:43:55
67	9225000	Papa liza	Quia repellat atque aliquid veritatis tempore.	13.05	66.93	10	1	1990-06-17 08:23:37	1976-11-12 06:27:23
68	4574938	Papa liza	Laboriosam voluptatem et ut et possimus.	58.13	1.93	10	5	1998-08-25 06:25:13	2002-02-12 11:15:53
69	5809759	Remolacha.	Dolor laudantium tempore quibusdam qui aut rerum.	55.40	42.41	6	2	1978-09-08 16:10:55	1990-06-30 17:04:12
70	8080983	Aji de cordero	Dolorum qui aut nam quia error explicabo.	56.13	19.22	7	3	1977-04-03 08:05:39	2002-01-22 09:48:13
71	9812705	Caldo de pollo	Aut temporibus et enim.	75.02	20.64	9	4	1978-05-13 12:50:57	2005-02-09 20:06:33
72	6947211	Whisky	Exercitationem omnis ducimus quidem fugiat.	24.50	80.49	11	2	2012-06-12 18:35:11	1998-01-14 19:10:28
73	3906620	Papa rellena	Quidem qui nostrum ut numquam.	30.04	24.54	3	1	1976-07-04 10:44:41	2006-10-24 13:33:28
74	1613174	Pollo a la parrilla	Quia minus maxime non veritatis dolorem.	27.66	21.92	2	2	2010-07-20 07:55:51	2013-01-14 02:11:47
75	1314770	Pimiento.	Voluptas nihil dolorem enim voluptas ut corporis aspernatur nobis.	51.72	61.19	4	5	1999-04-16 03:14:10	1995-10-27 20:14:04
76	3819359	ginebra	Enim et odit repellendus ipsum et.	27.81	4.30	1	4	1979-10-20 11:05:52	1994-08-28 06:56:08
77	7905080	Tomate.	Qui tenetur omnis voluptatum quaerat.	25.02	44.72	1	1	1983-03-12 06:50:40	2015-11-05 19:31:12
78	2064438	Papa liza	Voluptatem est aut aspernatur vel.	76.94	15.60	5	3	2007-11-11 09:15:00	1982-12-13 00:10:30
79	8804610	Pizza con cebolla	Error voluptatibus consectetur earum sed similique.	24.25	60.61	10	5	2003-12-19 04:24:11	1982-10-19 23:49:56
80	5225120	vodka	Tempore laudantium neque rerum nam itaque.	43.81	59.35	4	5	1971-03-02 16:16:49	1978-05-26 21:36:35
81	8011421	Pizza con tomate y champiñones	Aspernatur nesciunt asperiores odit ut minima voluptas eveniet.	59.88	27.02	12	3	1987-03-16 04:13:43	1972-03-19 00:57:42
82	1769384	Pizza con tomate y queso	Voluptas voluptas omnis consequatur maxime unde architecto quia.	13.99	70.47	6	3	1973-07-13 17:21:33	2008-10-21 06:58:49
83	2643855	Setas.	Facilis itaque eos in non dolores.	86.16	22.66	12	1	1997-05-02 00:41:26	2009-02-18 11:48:30
84	5346441	Pizza con queso	Deserunt asperiores voluptatem doloribus qui sequi in vero qui.	52.07	55.38	3	1	2020-08-28 11:27:00	1984-05-30 12:12:16
85	120107	Lentejas	Aut iusto commodi consequatur distinctio corrupti eveniet.	24.58	21.04	7	2	2013-08-19 06:45:49	1988-08-26 14:08:57
86	8247499	pisco	Molestias odio at alias ea vitae.	11.56	12.59	7	3	2009-02-07 15:40:42	2016-05-20 04:00:20
87	1015898	Papa cocida	Et commodi qui sunt ut architecto.	81.62	96.84	12	5	1974-12-07 12:45:31	1988-03-21 10:32:02
88	8833493	Salchipapa	Aut velit repellat aliquam porro dolor iure dolorem qui.	48.34	77.61	2	4	2012-10-23 13:25:13	1983-02-24 16:16:45
89	7063120	Pepino.	Quia sapiente totam est qui quibusdam.	5.28	17.12	10	1	2016-03-03 06:17:10	1970-01-27 08:09:59
90	8110336	Pizza con champiñones	Vel minus ut non nihil occaecati temporibus sed eius.	70.06	18.55	3	5	2016-08-16 18:49:14	1973-09-04 07:51:01
91	A312	black leather ottoman	manteca de mani procesada otro	12.50	10.00	4	5	2022-07-20 15:12:12	2022-07-20 15:12:12
\.


--
-- TOC entry 3145 (class 0 OID 56819)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 209
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 12, true);


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 211
-- Name: empresas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresas_id_seq', 5, true);


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 205
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 200
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 207
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 213
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 91, true);


--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3001 (class 2606 OID 56874)
-- Name: categorias categorias_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_nombre_unique UNIQUE (nombre);


--
-- TOC entry 3003 (class 2606 OID 56872)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3005 (class 2606 OID 56888)
-- Name: empresas empresas_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_nombre_unique UNIQUE (nombre);


--
-- TOC entry 3007 (class 2606 OID 56886)
-- Name: empresas empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 2992 (class 2606 OID 56848)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2994 (class 2606 OID 56850)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2985 (class 2606 OID 56816)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2996 (class 2606 OID 56861)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2998 (class 2606 OID 56864)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3009 (class 2606 OID 56899)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 56829)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2989 (class 2606 OID 56827)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2990 (class 1259 OID 56836)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 2999 (class 1259 OID 56862)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3010 (class 2606 OID 56900)
-- Name: productos productos_categoria_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_categoria_id_foreign FOREIGN KEY (categoria_id) REFERENCES public.categorias(id) ON DELETE CASCADE;


--
-- TOC entry 3011 (class 2606 OID 56905)
-- Name: productos productos_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


-- Completed on 2022-07-20 17:38:44 -04

--
-- PostgreSQL database dump complete
--

