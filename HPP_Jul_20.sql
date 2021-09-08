--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contrato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrato (
    contrato_id character varying NOT NULL,
    process_id bigint NOT NULL,
    process_date bigint,
    process_start_date bigint,
    tipocontrato character varying,
    contratante character varying,
    cnpj_contratante character varying,
    contratada character varying,
    cnpj_contratada character varying,
    objetivo character varying,
    obcontratada character varying,
    obcontratante character varying,
    responsavel character varying,
    setor character varying,
    data_base bigint,
    vigencia character varying,
    fuentepag character varying,
    indice character varying,
    rescisao character varying,
    multa bigint,
    juros character varying,
    mensal bigint,
    vencimento character varying,
    total bigint,
    prestador_actual character varying,
    valor_actual character varying,
    cotacoes_1 character varying,
    cotacoes_2 character varying,
    cotacoes_3 character varying,
    economia_media character varying,
    justificativa character varying,
    username character varying,
    userid character varying,
    data_aprovado bigint,
    contrato_id_mestre character varying,
    process_id_mestre smallint,
    process_date_mestre bigint
);


ALTER TABLE public.contrato OWNER TO postgres;

--
-- Name: contrato_analisis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrato_analisis (
    contrato_id character varying NOT NULL,
    process_id bigint NOT NULL,
    process_date bigint NOT NULL,
    clausula character varying NOT NULL,
    descricao character varying,
    indicacoes character varying,
    retorno character varying
);


ALTER TABLE public.contrato_analisis OWNER TO postgres;

--
-- Name: process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.process (
    contrato_id character varying NOT NULL,
    process_id bigint NOT NULL,
    process_date bigint NOT NULL,
    process_date_end bigint,
    process_start_date bigint,
    source_area character varying,
    target_area character varying,
    step_duration numeric(10,1),
    process_duration numeric(10,1),
    total_duration numeric(10,1),
    status character varying,
    username character varying,
    userid character varying
);


ALTER TABLE public.process OWNER TO postgres;

--
-- Name: contrato_analisis_hist_v; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.contrato_analisis_hist_v AS
 SELECT contrato_analisis.contrato_id,
    contrato_analisis.process_id,
    contrato_analisis.process_date,
    to_char(to_timestamp(((contrato_analisis.process_date / 1000))::double precision), 'YYYY-MM-DD HH24:MI:SS'::text) AS view_date,
    contrato_analisis.clausula,
    contrato_analisis.descricao,
    contrato_analisis.indicacoes,
    contrato_analisis.retorno,
    process.source_area,
    process.username
   FROM public.contrato_analisis,
    public.process
  WHERE (((contrato_analisis.contrato_id)::text = (process.contrato_id)::text) AND (contrato_analisis.process_id = process.process_id) AND (contrato_analisis.process_date = process.process_date))
  ORDER BY process.process_date DESC;


ALTER TABLE public.contrato_analisis_hist_v OWNER TO postgres;

--
-- Name: contrato_checklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrato_checklist (
    contrato_id character varying NOT NULL,
    process_id bigint NOT NULL,
    process_date bigint NOT NULL,
    indice smallint NOT NULL,
    descricao character varying,
    cumpre character varying,
    critica character varying
);


ALTER TABLE public.contrato_checklist OWNER TO postgres;

--
-- Name: contrato_v; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.contrato_v AS
 SELECT contrato.contrato_id,
    contrato.process_id,
    to_char(to_timestamp(((contrato.process_date / 1000))::double precision), 'YYYY-MM-DD HH24:MI:SS'::text) AS process_date,
    to_char(to_timestamp(((contrato.process_start_date / 1000))::double precision), 'YYYY-MM-DD HH24:MI:SS'::text) AS process_start_date,
    contrato.contratante,
    contrato.contratada,
    contrato.objetivo,
    contrato.username,
    contrato.userid
   FROM public.contrato;


ALTER TABLE public.contrato_v OWNER TO postgres;

--
-- Name: inbox_v; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.inbox_v AS
 SELECT contrato.contrato_id,
    contrato.process_id,
    process.process_date,
    process.process_date_end,
    process.process_start_date,
    to_char(to_timestamp(((contrato.process_date / 1000))::double precision), 'YYYY-MM-DD HH24:MI:SS'::text) AS view_date,
    contrato.contratante,
    contrato.contratada,
    contrato.objetivo,
    contrato.total,
    to_char(to_timestamp(((contrato.data_base / 1000))::double precision), 'YYYY-MM-DD HH24:MI:SS'::text) AS data_base,
    process.step_duration,
    process.process_duration,
    process.total_duration,
    process.target_area,
    process.source_area,
    process.status
   FROM public.contrato,
    public.process
  WHERE (((contrato.contrato_id)::text = (process.contrato_id)::text) AND (contrato.process_id = process.process_id) AND (contrato.process_date = process.process_date) AND ((process.status)::text <> ALL ((ARRAY['rejeitado-fechado'::character varying, 'IDLE'::character varying])::text[])))
  ORDER BY process.process_date;


ALTER TABLE public.inbox_v OWNER TO postgres;

--
-- Name: process_counter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.process_counter (
    process_id bigint NOT NULL,
    descripcion character varying(1)
);


ALTER TABLE public.process_counter OWNER TO postgres;

--
-- Name: process_counter_process_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.process_counter_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.process_counter_process_id_seq OWNER TO postgres;

--
-- Name: process_counter_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.process_counter_process_id_seq OWNED BY public.process_counter.process_id;


--
-- Name: process_v; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.process_v AS
 SELECT process.contrato_id,
    process.process_id,
    to_char(to_timestamp(((process.process_date / 1000))::double precision), 'YYYY-MM-DD HH24:MI:SS'::text) AS process_date,
    to_char(to_timestamp(((process.process_start_date / 1000))::double precision), 'YYYY-MM-DD HH24:MI:SS'::text) AS process_start_date,
    to_char(to_timestamp(((process.process_date_end / 1000))::double precision), 'YYYY-MM-DD HH24:MI:SS'::text) AS process_date_end,
    process.source_area,
    process.target_area,
    process.step_duration,
    round(process.process_duration, 1) AS process_duration,
    round(process.total_duration, 1) AS total_duration,
    process.status,
    process.username,
    process.userid
   FROM public.process;


ALTER TABLE public.process_v OWNER TO postgres;

--
-- Name: revision_v; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.revision_v AS
 SELECT process.contrato_id,
    process.process_id,
    process.username,
    to_char(to_timestamp(((process.process_date / 1000))::double precision), 'YYYY-MM-DD HH24:MI:SS'::text) AS process_date,
    process.source_area,
    process.status
   FROM public.process
  WHERE ((process.status)::text <> 'IDLE'::text)
  ORDER BY process.process_date DESC;


ALTER TABLE public.revision_v OWNER TO postgres;

--
-- Name: process_counter process_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.process_counter ALTER COLUMN process_id SET DEFAULT nextval('public.process_counter_process_id_seq'::regclass);


--
-- Data for Name: contrato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contrato (contrato_id, process_id, process_date, process_start_date, tipocontrato, contratante, cnpj_contratante, contratada, cnpj_contratada, objetivo, obcontratada, obcontratante, responsavel, setor, data_base, vigencia, fuentepag, indice, rescisao, multa, juros, mensal, vencimento, total, prestador_actual, valor_actual, cotacoes_1, cotacoes_2, cotacoes_3, economia_media, justificativa, username, userid, data_aprovado, contrato_id_mestre, process_id_mestre, process_date_mestre) FROM stdin;
2021-07-07-114618	43	1625669178615	1625669178615	Novo	HPP		ASG Technologies		Contratar licencias de ASG-Zenith	Cumplir con Soporte por SLA	Hacer pagos anuales	Laércio Araújo	TECNOLOGIA	1625669178615	12 meses	HPP	IPV	Por no cumplir con soporte por SLA	20	3%	100	Diciembre 2021	1200	prestador actual	valor actual	cot 1	cot 2	cot 3	economia media	justificativa	Bruno Maia	bruno.maia@hpp.org.br	\N	\N	\N	\N
2021-07-07-130450	44	1625676592972	1625673890730	Novo	HPP		ASG Technologies		Contratar licencias de ASG-Zenith	Cumplir con Soporte por SLA	Hacer pagos anuales	Laércio Araújo	TECNOLOGIA	1625673890730	12 meses	HPP	IPV	Por no cumplir con soporte por SLA	20	3%	100	Diciembre 2021	1200	prestador actual	valor actual	cot 1	cot 2	cot 3	economia media	justificativa	Leandro Manoel	leandro.manoel@hpp.org.br	\N	\N	\N	\N
2021-07-19-154542	45	1626720342845	1626720342845	Novo	HPP		ASG Technologies		Contratar licencias de ASG-Zenith	Cumplir con Soporte por SLA	Hacer pagos anuales	Laércio Araújo	TECNOLOGIA	1626720342845	12 meses	HPP	IPV	Por no cumplir con soporte por SLA	20	3%	100	Diciembre 2021	1200	prestador actual	valor actual	cot 1	cot 2	cot 3	economia media	justificativa	Bruno Maia	bruno.maia@hpp.org.br	\N	\N	\N	\N
\.


--
-- Data for Name: contrato_analisis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contrato_analisis (contrato_id, process_id, process_date, clausula, descricao, indicacoes, retorno) FROM stdin;
2021-07-07-130450	44	1625676592972	c1	c1	c1	\N
\.


--
-- Data for Name: contrato_checklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contrato_checklist (contrato_id, process_id, process_date, indice, descricao, cumpre, critica) FROM stdin;
2021-07-07-130450	44	1625676592972	1	Dados Cadastrais HPP	#2ebb0e	
2021-07-07-130450	44	1625676592972	2	Objeto do Contrato	#2ebb0e	
2021-07-07-130450	44	1625676592972	3	Principais Obrigações da Contratante	#2ebb0e	
2021-07-07-130450	44	1625676592972	4	Principais Obrigações da Contratada	#2ebb0e	
2021-07-07-130450	44	1625676592972	5	Valor	#2ebb0e	
2021-07-07-130450	44	1625676592972	6	Vencimento	#2ebb0e	
2021-07-07-130450	44	1625676592972	7	Forma de Pagamento	#2ebb0e	
2021-07-07-130450	44	1625676592972	8	Multa e Juros por Atraso de Pagamento	#2ebb0e	
2021-07-07-130450	44	1625676592972	9	Indice de Reajuste	#2ebb0e	
2021-07-07-130450	44	1625676592972	10	Penalidades	#2ebb0e	
2021-07-07-130450	44	1625676592972	11	Condições para Rescisão	#2ebb0e	
2021-07-07-130450	44	1625676592972	12	Cláusula de Vínculo empregatício	#2ebb0e	
2021-07-07-130450	44	1625676592972	13	Cláusula de Confidencialidade	#2ebb0e	
2021-07-07-130450	44	1625676592972	14	Cláusula de Uso da Marca	#2ebb0e	
2021-07-07-130450	44	1625676592972	15	Responsável Legal p/ Assinatura Contratante	#2ebb0e	
2021-07-07-130450	44	1625676592972	16	Responsável Legal p/ Assinatura Contratada	#2ebb0e	
2021-07-07-130450	44	1625676592972	17	Foro Curitiba	#2ebb0e	
2021-07-07-130450	44	1625676592972	18	Cotações/Justificativa	#2ebb0e	
2021-07-07-130450	44	1625676592972	19	Assinatura Área solicitante	#2ebb0e	
\.


--
-- Data for Name: process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.process (contrato_id, process_id, process_date, process_date_end, process_start_date, source_area, target_area, step_duration, process_duration, total_duration, status, username, userid) FROM stdin;
2021-07-07-114618	43	1625669178615	1625669184230	1625669178615	SOLICITANTE	CONTRATOS	0.1	0.1	0.1	revisão	Bruno Maia	bruno.maia@hpp.org.br
2021-07-07-130450	44	1625673890730	1625673906092	1625673890730	SOLICITANTE	CONTRATOS	0.3	0.3	0.3	revisão	Bruno Maia	bruno.maia@hpp.org.br
2021-07-07-130450	44	1625676592972	1625676609251	1625673890730	CONTRATOS	SOLICITANTE	0.3	44.8	45.3	rejeitado-contratos	Leandro Manoel	leandro.manoel@hpp.org.br
2021-07-07-130450	44	1625673907092	1625676591972	1625673890730	CONTRATOS	CONTRATOS	0.0	44.8	0.0	IDLE	Leandro Manoel	leandro.manoel@hpp.org.br
2021-07-19-154542	45	1626720342845	1626720368622	1626720342845	SOLICITANTE	CONTRATOS	0.4	0.4	0.4	revisão	Bruno Maia	bruno.maia@hpp.org.br
\.


--
-- Data for Name: process_counter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.process_counter (process_id, descripcion) FROM stdin;
1	1
2	1
3	1
4	1
\.


--
-- Name: process_counter_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.process_counter_process_id_seq', 45, true);


--
-- Name: contrato_analisis contrato_analisis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_analisis
    ADD CONSTRAINT contrato_analisis_pkey PRIMARY KEY (contrato_id, process_id, process_date, clausula);


--
-- Name: contrato_checklist contrato_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_checklist
    ADD CONSTRAINT contrato_checklist_pkey PRIMARY KEY (contrato_id, process_id, process_date, indice);


--
-- Name: contrato contrato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT contrato_pkey PRIMARY KEY (contrato_id, process_id);


--
-- Name: process_counter process_counter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.process_counter
    ADD CONSTRAINT process_counter_pkey PRIMARY KEY (process_id);


--
-- Name: process process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.process
    ADD CONSTRAINT process_pkey PRIMARY KEY (contrato_id, process_id, process_date);


--
-- Name: idx_contract_data_aprovado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contract_data_aprovado ON public.contrato USING btree (data_aprovado);


--
-- Name: idx_contract_process_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contract_process_date ON public.contrato USING btree (process_date);


--
-- Name: idx_process_process_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_process_process_date ON public.process USING btree (process_date);


--
-- PostgreSQL database dump complete
--

