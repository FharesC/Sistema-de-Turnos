--
-- PostgreSQL database dump
--

\restrict 1aTaPy9F5ASKhH1udmtYyVYs6ppVs00e4wG95C8p6XEZcTngabrQtReXD7mLOgY

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-01-05 15:53:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 853 (class 1247 OID 27046)
-- Name: enum_mesa_estado; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_mesa_estado AS ENUM (
    'disponible',
    'ocupada',
    'inactiva'
);


ALTER TYPE public.enum_mesa_estado OWNER TO postgres;

--
-- TOC entry 856 (class 1247 OID 27068)
-- Name: enum_turno_estado; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_turno_estado AS ENUM (
    'en_espera',
    'en_atencion',
    'completado',
    'cancelado'
);


ALTER TYPE public.enum_turno_estado OWNER TO postgres;

--
-- TOC entry 850 (class 1247 OID 27012)
-- Name: enum_user_rol; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_user_rol AS ENUM (
    'admin',
    'operador'
);


ALTER TYPE public.enum_user_rol OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 27498)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 27702)
-- Name: mesa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mesa (
    id uuid NOT NULL,
    numero integer NOT NULL,
    nombre character varying(50) NOT NULL,
    estado public.enum_mesa_estado DEFAULT 'disponible'::public.enum_mesa_estado NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.mesa OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 27686)
-- Name: tipo_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_servicio (
    id uuid NOT NULL,
    nombre character varying(50) NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion text,
    color character varying(20) DEFAULT '#54243C'::character varying NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    tiempo_estimado integer DEFAULT 15 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tipo_servicio OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 27716)
-- Name: turno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turno (
    id uuid NOT NULL,
    codigo character varying(20) NOT NULL,
    tipo_servicio_id uuid NOT NULL,
    mesa_id uuid,
    estado public.enum_turno_estado DEFAULT 'en_espera'::public.enum_turno_estado NOT NULL,
    prioridad boolean DEFAULT false NOT NULL,
    nombre_cliente character varying(100),
    observaciones text,
    atendido_por uuid,
    hora_llamado timestamp with time zone,
    hora_atencion timestamp with time zone,
    hora_finalizacion timestamp with time zone,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.turno OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 27674)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id uuid NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    rol public.enum_user_rol DEFAULT 'operador'::public.enum_user_rol NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 27498)
-- Dependencies: 217
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20241125000001-create-users.js
20241125000002-create-tipo-servicio.js
20241125000003-create-mesa.js
20241125000004-create-turno.js
20251202031156-remove-unique-constraint-turno-codigo.js
\.


--
-- TOC entry 4962 (class 0 OID 27702)
-- Dependencies: 220
-- Data for Name: mesa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mesa (id, numero, nombre, estado, activo, created_at, updated_at) FROM stdin;
134f0940-f454-467d-81b5-0417f70f6727	1	Mesa 1 - Atención General	disponible	t	2026-01-05 15:38:15.785-06	2026-01-05 15:38:15.785-06
103e77a8-3707-4ffb-9e36-9439c1259422	2	Mesa 2 - Atención General	disponible	t	2026-01-05 15:38:15.785-06	2026-01-05 15:38:15.785-06
8e6b0bb1-068a-4254-8ac6-50a183cee21e	3	Mesa 3 - Inscripciones	disponible	t	2026-01-05 15:38:15.785-06	2026-01-05 15:38:15.785-06
54d0e71a-9725-4cca-ab78-af0d94468f86	4	Mesa 4 - Pagos	disponible	t	2026-01-05 15:38:15.785-06	2026-01-05 15:38:15.785-06
b8109d4d-0868-46ec-b7f3-4bfe744c9ea4	5	Mesa 5 - Trámites	disponible	t	2026-01-05 15:38:15.785-06	2026-01-05 15:38:15.785-06
\.


--
-- TOC entry 4961 (class 0 OID 27686)
-- Dependencies: 219
-- Data for Name: tipo_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_servicio (id, nombre, codigo, descripcion, color, activo, tiempo_estimado, created_at, updated_at) FROM stdin;
e85bf127-8abe-44a8-86a9-d3c49bebda62	Inscripción	INS	Servicio de inscripción de nuevos estudiantes	#54243C	t	20	2026-01-05 15:38:15.778-06	2026-01-05 15:38:15.778-06
9544ed87-5227-41e9-a9d6-24b6aecd5086	Información	INF	Solicitud de información general	#1E40AF	t	10	2026-01-05 15:38:15.779-06	2026-01-05 15:38:15.779-06
67215396-8518-48b7-8e4b-0bf753f27a8f	Consulta	CON	Consultas académicas y administrativas	#059669	t	15	2026-01-05 15:38:15.779-06	2026-01-05 15:38:15.779-06
0dd95d55-7e4c-4e90-8555-da91ae11b02e	Trámite	TRA	Gestión de trámites documentales	#DC2626	t	25	2026-01-05 15:38:15.779-06	2026-01-05 15:38:15.779-06
46baf3f3-e0e2-4b05-87e0-7026cf2c0220	Pago	PAG	Procesamiento de pagos y facturación	#7C3AED	t	10	2026-01-05 15:38:15.779-06	2026-01-05 15:38:15.779-06
\.


--
-- TOC entry 4963 (class 0 OID 27716)
-- Dependencies: 221
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.turno (id, codigo, tipo_servicio_id, mesa_id, estado, prioridad, nombre_cliente, observaciones, atendido_por, hora_llamado, hora_atencion, hora_finalizacion, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4960 (class 0 OID 27674)
-- Dependencies: 218
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, nombre, email, password, rol, activo, created_at, updated_at) FROM stdin;
9717e8d3-b155-4e1a-b4aa-2adbfc10af7e	Administrador	admin@sistema.com	$2b$10$18PgBKq3iZZhya5NFS8IGe2aeispLScYYpblubvI5UA7Jg5msNysG	admin	t	2026-01-05 15:38:15.77-06	2026-01-05 15:38:15.77-06
\.


--
-- TOC entry 4784 (class 2606 OID 27502)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 4800 (class 2606 OID 27712)
-- Name: mesa mesa_numero_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesa
    ADD CONSTRAINT mesa_numero_key UNIQUE (numero);


--
-- TOC entry 4802 (class 2606 OID 27710)
-- Name: mesa mesa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesa
    ADD CONSTRAINT mesa_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 27699)
-- Name: tipo_servicio tipo_servicio_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_codigo_key UNIQUE (codigo);


--
-- TOC entry 4795 (class 2606 OID 27697)
-- Name: tipo_servicio tipo_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_pkey PRIMARY KEY (id);


--
-- TOC entry 4808 (class 2606 OID 27726)
-- Name: turno turno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (id);


--
-- TOC entry 4787 (class 2606 OID 27684)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 4789 (class 2606 OID 27682)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 4796 (class 1259 OID 27715)
-- Name: mesa_activo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mesa_activo ON public.mesa USING btree (activo);


--
-- TOC entry 4797 (class 1259 OID 27714)
-- Name: mesa_estado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mesa_estado ON public.mesa USING btree (estado);


--
-- TOC entry 4798 (class 1259 OID 27713)
-- Name: mesa_numero; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mesa_numero ON public.mesa USING btree (numero);


--
-- TOC entry 4790 (class 1259 OID 27701)
-- Name: tipo_servicio_activo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tipo_servicio_activo ON public.tipo_servicio USING btree (activo);


--
-- TOC entry 4791 (class 1259 OID 27700)
-- Name: tipo_servicio_codigo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tipo_servicio_codigo ON public.tipo_servicio USING btree (codigo);


--
-- TOC entry 4803 (class 1259 OID 27744)
-- Name: turno_codigo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX turno_codigo ON public.turno USING btree (codigo);


--
-- TOC entry 4804 (class 1259 OID 27748)
-- Name: turno_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX turno_created_at ON public.turno USING btree (created_at);


--
-- TOC entry 4805 (class 1259 OID 27747)
-- Name: turno_estado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX turno_estado ON public.turno USING btree (estado);


--
-- TOC entry 4806 (class 1259 OID 27746)
-- Name: turno_mesa_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX turno_mesa_id ON public.turno USING btree (mesa_id);


--
-- TOC entry 4809 (class 1259 OID 27749)
-- Name: turno_prioridad_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX turno_prioridad_created_at ON public.turno USING btree (prioridad, created_at);


--
-- TOC entry 4810 (class 1259 OID 27745)
-- Name: turno_tipo_servicio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX turno_tipo_servicio_id ON public.turno USING btree (tipo_servicio_id);


--
-- TOC entry 4785 (class 1259 OID 27685)
-- Name: user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_email ON public."user" USING btree (email);


--
-- TOC entry 4811 (class 2606 OID 27739)
-- Name: turno turno_atendido_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_atendido_por_fkey FOREIGN KEY (atendido_por) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4812 (class 2606 OID 27734)
-- Name: turno turno_mesa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_mesa_id_fkey FOREIGN KEY (mesa_id) REFERENCES public.mesa(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4813 (class 2606 OID 27729)
-- Name: turno turno_tipo_servicio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_tipo_servicio_id_fkey FOREIGN KEY (tipo_servicio_id) REFERENCES public.tipo_servicio(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2026-01-05 15:53:43

--
-- PostgreSQL database dump complete
--

\unrestrict 1aTaPy9F5ASKhH1udmtYyVYs6ppVs00e4wG95C8p6XEZcTngabrQtReXD7mLOgY

