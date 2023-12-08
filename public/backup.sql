--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5 (Homebrew)
-- Dumped by pg_dump version 15.5 (Homebrew)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedores (
    id bigint NOT NULL,
    descricao character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.fornecedores OWNER TO postgres;

--
-- Name: fornecedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fornecedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fornecedores_id_seq OWNER TO postgres;

--
-- Name: fornecedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fornecedores_id_seq OWNED BY public.fornecedores.id;


--
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionarios (
    id bigint NOT NULL,
    nome character varying,
    cpf character varying,
    senha character varying,
    funcao character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone
);


ALTER TABLE public.funcionarios OWNER TO postgres;

--
-- Name: funcionarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.funcionarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funcionarios_id_seq OWNER TO postgres;

--
-- Name: funcionarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.funcionarios_id_seq OWNED BY public.funcionarios.id;


--
-- Name: itens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itens (
    id bigint NOT NULL,
    quantidade integer,
    valor_parcial numeric(7,2),
    produtos_id bigint,
    vendas_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.itens OWNER TO postgres;

--
-- Name: itens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.itens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itens_id_seq OWNER TO postgres;

--
-- Name: itens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.itens_id_seq OWNED BY public.itens.id;


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id bigint NOT NULL,
    descricao character varying,
    valor numeric(7,2),
    quantidade integer,
    fornecedores_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: vendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendas (
    id bigint NOT NULL,
    horario_venda timestamp without time zone,
    total numeric(7,2),
    funcionarios_id bigint,
    integer_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.vendas OWNER TO postgres;

--
-- Name: vendas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendas_id_seq OWNER TO postgres;

--
-- Name: vendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;


--
-- Name: fornecedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores ALTER COLUMN id SET DEFAULT nextval('public.fornecedores_id_seq'::regclass);


--
-- Name: funcionarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios ALTER COLUMN id SET DEFAULT nextval('public.funcionarios_id_seq'::regclass);


--
-- Name: itens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens ALTER COLUMN id SET DEFAULT nextval('public.itens_id_seq'::regclass);


--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- Name: vendas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-12-08 00:51:38.465986	2023-12-08 00:51:38.465986
\.


--
-- Data for Name: fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fornecedores (id, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcionarios (id, nome, cpf, senha, funcao, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at) FROM stdin;
1	\N	\N	\N	\N	2023-12-08 00:52:10.063355	2023-12-08 00:52:10.063355	test@test.com	$2a$12$XXPKjSn4uGG5pzjvpQIiJOHDn/Gj.Q4k6i8113B2ZrJ1yYxSyEPSy	\N	\N	\N
2	jorge	\N	\N	dono	2023-12-08 01:09:40.77058	2023-12-08 01:09:40.77058	test@test.jcom	$2a$12$QKUOfl1B.XIffkrexOlFi.1gLR6bA/8aKJhNUELff9Dks.xJF9ZHy	\N	\N	\N
3	\N	\N	\N	\N	2023-12-08 01:12:46.586154	2023-12-08 01:12:46.586154	123123123@123123.com	$2a$12$Nw1wxEss2ToJJl/z1rZ4PupxlLPwjqJctj7n0ztpgZ1D27aVVrRV2	\N	\N	\N
\.


--
-- Data for Name: itens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itens (id, quantidade, valor_parcial, produtos_id, vendas_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, descricao, valor, quantidade, fornecedores_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20231128211119
20231128211308
20231128211329
20231128211349
20231128211405
20231208005122
\.


--
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendas (id, horario_venda, total, funcionarios_id, integer_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: fornecedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fornecedores_id_seq', 1, false);


--
-- Name: funcionarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funcionarios_id_seq', 3, true);


--
-- Name: itens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itens_id_seq', 1, false);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 1, false);


--
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: fornecedores fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (id);


--
-- Name: funcionarios funcionarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id);


--
-- Name: itens itens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens
    ADD CONSTRAINT itens_pkey PRIMARY KEY (id);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);


--
-- Name: index_funcionarios_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_funcionarios_on_email ON public.funcionarios USING btree (email);


--
-- Name: index_funcionarios_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_funcionarios_on_reset_password_token ON public.funcionarios USING btree (reset_password_token);


--
-- Name: index_itens_on_produtos_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_itens_on_produtos_id ON public.itens USING btree (produtos_id);


--
-- Name: index_itens_on_vendas_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_itens_on_vendas_id ON public.itens USING btree (vendas_id);


--
-- Name: index_produtos_on_fornecedores_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_produtos_on_fornecedores_id ON public.produtos USING btree (fornecedores_id);


--
-- Name: index_vendas_on_funcionarios_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_vendas_on_funcionarios_id ON public.vendas USING btree (funcionarios_id);


--
-- Name: index_vendas_on_integer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_vendas_on_integer_id ON public.vendas USING btree (integer_id);


--
-- PostgreSQL database dump complete
--

