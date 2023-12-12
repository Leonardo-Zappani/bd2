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

--
-- Name: fn_before_insert_vendas(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_before_insert_vendas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Adiciona validação para o campo ven_valor_total
    IF NEW.total <= 0 THEN
        RAISE EXCEPTION 'O valor total da venda não pode ser menor ou igual a 0';
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_before_insert_vendas() OWNER TO postgres;

--
-- Name: fn_produto_rollback(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_produto_rollback() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.valor <= 0 THEN
        RAISE EXCEPTION 'O valor do produto não pode ser menor ou igual 0';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_produto_rollback() OWNER TO postgres;

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
    remember_created_at timestamp(6) without time zone,
    funcao_cd character varying
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
    updated_at timestamp(6) without time zone NOT NULL,
    produto_id integer[] DEFAULT '{}'::integer[]
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
    updated_at timestamp(6) without time zone NOT NULL,
    produto_id integer[] DEFAULT '{}'::integer[]
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
6	Teste fornecedor	2023-12-12 18:41:44.094534	2023-12-12 18:41:44.094534
\.


--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcionarios (id, nome, cpf, senha, funcao, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, funcao_cd) FROM stdin;
4	Leonardo Zappani	1234567890	\N	\N	2023-12-12 18:36:38.760868	2023-12-12 18:40:16.95768	leo@gmail.com	$2a$12$9INPSAIaD4W.HzE3zM754u3R5wL4H2K49BSwGUAyxf6trC8RiQyAe	\N	\N	\N	0
6	Cleyton	1234567890	\N	\N	2023-12-12 18:41:22.127222	2023-12-12 18:41:22.127222	cleyton@gmail.com	$2a$12$NGMOKSwW0Mn49lY2adbJL.ihd3c0/7YLpy44R9MgyJVmBDBKJpIB2	\N	\N	\N	1
\.


--
-- Data for Name: itens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itens (id, quantidade, valor_parcial, produtos_id, vendas_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, descricao, valor, quantidade, fornecedores_id, created_at, updated_at, produto_id) FROM stdin;
10	Tapete	10.00	1	6	2023-12-12 18:42:02.602604	2023-12-12 18:42:02.602604	{}
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
20231212011036
20231212175550
\.


--
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendas (id, horario_venda, total, funcionarios_id, integer_id, created_at, updated_at, produto_id) FROM stdin;
14	2023-12-12 18:42:10.992412	900.00	6	\N	2023-12-12 18:42:10.99263	2023-12-12 18:42:10.99263	{10}
\.


--
-- Name: fornecedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fornecedores_id_seq', 6, true);


--
-- Name: funcionarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funcionarios_id_seq', 6, true);


--
-- Name: itens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itens_id_seq', 1, false);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 11, true);


--
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_id_seq', 14, true);


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
-- Name: produtos tr_produto_rollback; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tr_produto_rollback BEFORE INSERT ON public.produtos FOR EACH ROW EXECUTE FUNCTION public.fn_produto_rollback();


--
-- Name: vendas trg_before_insert_vendas; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_before_insert_vendas BEFORE INSERT ON public.vendas FOR EACH ROW EXECUTE FUNCTION public.fn_before_insert_vendas();


--
-- PostgreSQL database dump complete
--

