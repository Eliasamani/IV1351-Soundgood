--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-22 17:15:53

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
-- TOC entry 887 (class 1247 OID 25089)
-- Name: lesson_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.lesson_type AS ENUM (
    'individual',
    'group',
    'ensemble'
);


ALTER TYPE public.lesson_type OWNER TO postgres;

--
-- TOC entry 890 (class 1247 OID 25096)
-- Name: skill_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.skill_type AS ENUM (
    'beginner',
    'intermediate',
    'advanced'
);


ALTER TYPE public.skill_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 25118)
-- Name: classroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classroom (
    id integer NOT NULL,
    room_size integer,
    street character varying(30),
    city character varying(20),
    zip integer
);


ALTER TABLE public.classroom OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25117)
-- Name: classroom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classroom_id_seq OWNER TO postgres;

--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 219
-- Name: classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classroom_id_seq OWNED BY public.classroom.id;


--
-- TOC entry 251 (class 1259 OID 25266)
-- Name: contact_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_person (
    id integer NOT NULL,
    relation character varying(20),
    person_id integer NOT NULL
);


ALTER TABLE public.contact_person OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 25264)
-- Name: contact_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_person_id_seq OWNER TO postgres;

--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 249
-- Name: contact_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_person_id_seq OWNED BY public.contact_person.id;


--
-- TOC entry 250 (class 1259 OID 25265)
-- Name: contact_person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_person_person_id_seq OWNER TO postgres;

--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 250
-- Name: contact_person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_person_person_id_seq OWNED BY public.contact_person.person_id;


--
-- TOC entry 262 (class 1259 OID 25331)
-- Name: ensemble; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ensemble (
    lesson_id integer NOT NULL,
    min_attendees integer,
    max_attendees integer,
    attendees integer,
    genre character varying(20)
);


ALTER TABLE public.ensemble OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 25330)
-- Name: ensemble_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ensemble_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ensemble_lesson_id_seq OWNER TO postgres;

--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 261
-- Name: ensemble_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ensemble_lesson_id_seq OWNED BY public.ensemble.lesson_id;


--
-- TOC entry 260 (class 1259 OID 25319)
-- Name: group_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_lesson (
    lesson_id integer NOT NULL,
    min_attendees integer,
    max_attendees integer,
    attendees integer
);


ALTER TABLE public.group_lesson OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 25318)
-- Name: group_lesson_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_lesson_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_lesson_lesson_id_seq OWNER TO postgres;

--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 259
-- Name: group_lesson_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_lesson_lesson_id_seq OWNED BY public.group_lesson.lesson_id;


--
-- TOC entry 229 (class 1259 OID 25151)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    id integer NOT NULL,
    teaches_ensembles boolean,
    person_id integer NOT NULL
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25149)
-- Name: instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_id_seq OWNER TO postgres;

--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 227
-- Name: instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_id_seq OWNED BY public.instructor.id;


--
-- TOC entry 248 (class 1259 OID 25246)
-- Name: instructor_instruments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_instruments (
    id integer NOT NULL,
    instruments_id integer NOT NULL,
    instructor_id integer NOT NULL
);


ALTER TABLE public.instructor_instruments OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 25243)
-- Name: instructor_instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_instruments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_instruments_id_seq OWNER TO postgres;

--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 245
-- Name: instructor_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_instruments_id_seq OWNED BY public.instructor_instruments.id;


--
-- TOC entry 247 (class 1259 OID 25245)
-- Name: instructor_instruments_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_instruments_instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_instruments_instructor_id_seq OWNER TO postgres;

--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 247
-- Name: instructor_instruments_instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_instruments_instructor_id_seq OWNED BY public.instructor_instruments.instructor_id;


--
-- TOC entry 246 (class 1259 OID 25244)
-- Name: instructor_instruments_instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_instruments_instruments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_instruments_instruments_id_seq OWNER TO postgres;

--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 246
-- Name: instructor_instruments_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_instruments_instruments_id_seq OWNED BY public.instructor_instruments.instruments_id;


--
-- TOC entry 228 (class 1259 OID 25150)
-- Name: instructor_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_person_id_seq OWNER TO postgres;

--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 228
-- Name: instructor_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_person_id_seq OWNED BY public.instructor.person_id;


--
-- TOC entry 234 (class 1259 OID 25183)
-- Name: instruments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instruments (
    id integer NOT NULL,
    instrument_type character varying(20)
);


ALTER TABLE public.instruments OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25182)
-- Name: instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instruments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instruments_id_seq OWNER TO postgres;

--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 233
-- Name: instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instruments_id_seq OWNED BY public.instruments.id;


--
-- TOC entry 226 (class 1259 OID 25129)
-- Name: lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson (
    id integer NOT NULL,
    date date,
    start_time integer,
    duration integer,
    room_id integer NOT NULL,
    price_scheme_id integer NOT NULL,
    instructor_id integer NOT NULL,
    instrument_id integer NOT NULL
);


ALTER TABLE public.lesson OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 25226)
-- Name: lesson_attendees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_attendees (
    student_id integer NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.lesson_attendees OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 25225)
-- Name: lesson_attendees_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_attendees_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_attendees_lesson_id_seq OWNER TO postgres;

--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 243
-- Name: lesson_attendees_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_attendees_lesson_id_seq OWNED BY public.lesson_attendees.lesson_id;


--
-- TOC entry 242 (class 1259 OID 25224)
-- Name: lesson_attendees_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_attendees_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_attendees_student_id_seq OWNER TO postgres;

--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 242
-- Name: lesson_attendees_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_attendees_student_id_seq OWNED BY public.lesson_attendees.student_id;


--
-- TOC entry 221 (class 1259 OID 25124)
-- Name: lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_id_seq OWNER TO postgres;

--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 221
-- Name: lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_id_seq OWNED BY public.lesson.id;


--
-- TOC entry 224 (class 1259 OID 25127)
-- Name: lesson_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_instructor_id_seq OWNER TO postgres;

--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 224
-- Name: lesson_instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_instructor_id_seq OWNED BY public.lesson.instructor_id;


--
-- TOC entry 225 (class 1259 OID 25128)
-- Name: lesson_instrument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_instrument_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_instrument_id_seq OWNER TO postgres;

--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 225
-- Name: lesson_instrument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_instrument_id_seq OWNED BY public.lesson.instrument_id;


--
-- TOC entry 223 (class 1259 OID 25126)
-- Name: lesson_price_scheme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_price_scheme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_price_scheme_id_seq OWNER TO postgres;

--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 223
-- Name: lesson_price_scheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_price_scheme_id_seq OWNED BY public.lesson.price_scheme_id;


--
-- TOC entry 222 (class 1259 OID 25125)
-- Name: lesson_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_room_id_seq OWNER TO postgres;

--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 222
-- Name: lesson_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_room_id_seq OWNED BY public.lesson.room_id;


--
-- TOC entry 216 (class 1259 OID 25104)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(20),
    personal_number integer,
    phone_number integer,
    email_address character varying(30),
    street character varying(30),
    city character varying(20),
    zip integer
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25103)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 218 (class 1259 OID 25111)
-- Name: price_scheme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_scheme (
    id integer NOT NULL,
    price integer,
    discount integer,
    sibling_discount_eligibility boolean,
    instructor_fee integer,
    lesson_type public.lesson_type,
    skill_type public.skill_type
);


ALTER TABLE public.price_scheme OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25110)
-- Name: price_scheme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_scheme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.price_scheme_id_seq OWNER TO postgres;

--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 217
-- Name: price_scheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_scheme_id_seq OWNED BY public.price_scheme.id;


--
-- TOC entry 237 (class 1259 OID 25191)
-- Name: rental_instruments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_instruments (
    id integer NOT NULL,
    quantity_in_stock integer,
    brand character varying(20),
    instrument_id integer NOT NULL
);


ALTER TABLE public.rental_instruments OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25189)
-- Name: rental_instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_instruments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rental_instruments_id_seq OWNER TO postgres;

--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 235
-- Name: rental_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_instruments_id_seq OWNED BY public.rental_instruments.id;


--
-- TOC entry 236 (class 1259 OID 25190)
-- Name: rental_instruments_instrument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_instruments_instrument_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rental_instruments_instrument_id_seq OWNER TO postgres;

--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 236
-- Name: rental_instruments_instrument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_instruments_instrument_id_seq OWNED BY public.rental_instruments.instrument_id;


--
-- TOC entry 241 (class 1259 OID 25206)
-- Name: rental_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_record (
    id integer NOT NULL,
    rental_period date,
    rental_price integer,
    student_id integer NOT NULL,
    rental_instruments_id integer NOT NULL
);


ALTER TABLE public.rental_record OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25203)
-- Name: rental_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rental_record_id_seq OWNER TO postgres;

--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 238
-- Name: rental_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_record_id_seq OWNED BY public.rental_record.id;


--
-- TOC entry 240 (class 1259 OID 25205)
-- Name: rental_record_rental_instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_record_rental_instruments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rental_record_rental_instruments_id_seq OWNER TO postgres;

--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 240
-- Name: rental_record_rental_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_record_rental_instruments_id_seq OWNED BY public.rental_record.rental_instruments_id;


--
-- TOC entry 239 (class 1259 OID 25204)
-- Name: rental_record_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_record_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rental_record_student_id_seq OWNER TO postgres;

--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 239
-- Name: rental_record_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_record_student_id_seq OWNED BY public.rental_record.student_id;


--
-- TOC entry 258 (class 1259 OID 25300)
-- Name: sibling_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sibling_relations (
    id integer NOT NULL,
    student_id integer NOT NULL,
    sibling_student_id integer NOT NULL
);


ALTER TABLE public.sibling_relations OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 25297)
-- Name: sibling_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sibling_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sibling_relations_id_seq OWNER TO postgres;

--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 255
-- Name: sibling_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sibling_relations_id_seq OWNED BY public.sibling_relations.id;


--
-- TOC entry 257 (class 1259 OID 25299)
-- Name: sibling_relations_sibling_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sibling_relations_sibling_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sibling_relations_sibling_student_id_seq OWNER TO postgres;

--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 257
-- Name: sibling_relations_sibling_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sibling_relations_sibling_student_id_seq OWNED BY public.sibling_relations.sibling_student_id;


--
-- TOC entry 256 (class 1259 OID 25298)
-- Name: sibling_relations_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sibling_relations_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sibling_relations_student_id_seq OWNER TO postgres;

--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 256
-- Name: sibling_relations_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sibling_relations_student_id_seq OWNED BY public.sibling_relations.student_id;


--
-- TOC entry 232 (class 1259 OID 25170)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25168)
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_id_seq OWNER TO postgres;

--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 230
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- TOC entry 231 (class 1259 OID 25169)
-- Name: student_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_person_id_seq OWNER TO postgres;

--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 231
-- Name: student_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_person_id_seq OWNED BY public.student.person_id;


--
-- TOC entry 254 (class 1259 OID 25280)
-- Name: student_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_relations (
    student_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.student_relations OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 25279)
-- Name: student_relations_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_relations_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_relations_contact_id_seq OWNER TO postgres;

--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 253
-- Name: student_relations_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_relations_contact_id_seq OWNED BY public.student_relations.contact_id;


--
-- TOC entry 252 (class 1259 OID 25278)
-- Name: student_relations_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_relations_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_relations_student_id_seq OWNER TO postgres;

--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 252
-- Name: student_relations_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_relations_student_id_seq OWNED BY public.student_relations.student_id;


--
-- TOC entry 4787 (class 2604 OID 25121)
-- Name: classroom id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom ALTER COLUMN id SET DEFAULT nextval('public.classroom_id_seq'::regclass);


--
-- TOC entry 4808 (class 2604 OID 25269)
-- Name: contact_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person ALTER COLUMN id SET DEFAULT nextval('public.contact_person_id_seq'::regclass);


--
-- TOC entry 4809 (class 2604 OID 25270)
-- Name: contact_person person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person ALTER COLUMN person_id SET DEFAULT nextval('public.contact_person_person_id_seq'::regclass);


--
-- TOC entry 4816 (class 2604 OID 25334)
-- Name: ensemble lesson_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble ALTER COLUMN lesson_id SET DEFAULT nextval('public.ensemble_lesson_id_seq'::regclass);


--
-- TOC entry 4815 (class 2604 OID 25322)
-- Name: group_lesson lesson_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson ALTER COLUMN lesson_id SET DEFAULT nextval('public.group_lesson_lesson_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 25154)
-- Name: instructor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor ALTER COLUMN id SET DEFAULT nextval('public.instructor_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 25155)
-- Name: instructor person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor ALTER COLUMN person_id SET DEFAULT nextval('public.instructor_person_id_seq'::regclass);


--
-- TOC entry 4805 (class 2604 OID 25249)
-- Name: instructor_instruments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instruments ALTER COLUMN id SET DEFAULT nextval('public.instructor_instruments_id_seq'::regclass);


--
-- TOC entry 4806 (class 2604 OID 25250)
-- Name: instructor_instruments instruments_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instruments ALTER COLUMN instruments_id SET DEFAULT nextval('public.instructor_instruments_instruments_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 25251)
-- Name: instructor_instruments instructor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instruments ALTER COLUMN instructor_id SET DEFAULT nextval('public.instructor_instruments_instructor_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 25186)
-- Name: instruments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instruments ALTER COLUMN id SET DEFAULT nextval('public.instruments_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 25132)
-- Name: lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson ALTER COLUMN id SET DEFAULT nextval('public.lesson_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 25133)
-- Name: lesson room_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson ALTER COLUMN room_id SET DEFAULT nextval('public.lesson_room_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 25134)
-- Name: lesson price_scheme_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson ALTER COLUMN price_scheme_id SET DEFAULT nextval('public.lesson_price_scheme_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 25135)
-- Name: lesson instructor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson ALTER COLUMN instructor_id SET DEFAULT nextval('public.lesson_instructor_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 25136)
-- Name: lesson instrument_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson ALTER COLUMN instrument_id SET DEFAULT nextval('public.lesson_instrument_id_seq'::regclass);


--
-- TOC entry 4803 (class 2604 OID 25229)
-- Name: lesson_attendees student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_attendees ALTER COLUMN student_id SET DEFAULT nextval('public.lesson_attendees_student_id_seq'::regclass);


--
-- TOC entry 4804 (class 2604 OID 25230)
-- Name: lesson_attendees lesson_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_attendees ALTER COLUMN lesson_id SET DEFAULT nextval('public.lesson_attendees_lesson_id_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 25107)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 4786 (class 2604 OID 25114)
-- Name: price_scheme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_scheme ALTER COLUMN id SET DEFAULT nextval('public.price_scheme_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 25194)
-- Name: rental_instruments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_instruments ALTER COLUMN id SET DEFAULT nextval('public.rental_instruments_id_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 25195)
-- Name: rental_instruments instrument_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_instruments ALTER COLUMN instrument_id SET DEFAULT nextval('public.rental_instruments_instrument_id_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 25209)
-- Name: rental_record id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_record ALTER COLUMN id SET DEFAULT nextval('public.rental_record_id_seq'::regclass);


--
-- TOC entry 4801 (class 2604 OID 25210)
-- Name: rental_record student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_record ALTER COLUMN student_id SET DEFAULT nextval('public.rental_record_student_id_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 25211)
-- Name: rental_record rental_instruments_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_record ALTER COLUMN rental_instruments_id SET DEFAULT nextval('public.rental_record_rental_instruments_id_seq'::regclass);


--
-- TOC entry 4812 (class 2604 OID 25303)
-- Name: sibling_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_relations ALTER COLUMN id SET DEFAULT nextval('public.sibling_relations_id_seq'::regclass);


--
-- TOC entry 4813 (class 2604 OID 25304)
-- Name: sibling_relations student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_relations ALTER COLUMN student_id SET DEFAULT nextval('public.sibling_relations_student_id_seq'::regclass);


--
-- TOC entry 4814 (class 2604 OID 25305)
-- Name: sibling_relations sibling_student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_relations ALTER COLUMN sibling_student_id SET DEFAULT nextval('public.sibling_relations_sibling_student_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 25173)
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 25174)
-- Name: student person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN person_id SET DEFAULT nextval('public.student_person_id_seq'::regclass);


--
-- TOC entry 4810 (class 2604 OID 25283)
-- Name: student_relations student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_relations ALTER COLUMN student_id SET DEFAULT nextval('public.student_relations_student_id_seq'::regclass);


--
-- TOC entry 4811 (class 2604 OID 25284)
-- Name: student_relations contact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_relations ALTER COLUMN contact_id SET DEFAULT nextval('public.student_relations_contact_id_seq'::regclass);


--
-- TOC entry 5016 (class 0 OID 25118)
-- Dependencies: 220
-- Data for Name: classroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classroom (id, room_size, street, city, zip) FROM stdin;
1	25	789 Maple St	Sometown	67890
2	30	321 Oak St	Newtown	98765
\.


--
-- TOC entry 5047 (class 0 OID 25266)
-- Dependencies: 251
-- Data for Name: contact_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_person (id, relation, person_id) FROM stdin;
1	Parent	1
2	Parent	2
3	Parent	3
\.


--
-- TOC entry 5058 (class 0 OID 25331)
-- Dependencies: 262
-- Data for Name: ensemble; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ensemble (lesson_id, min_attendees, max_attendees, attendees, genre) FROM stdin;
1	6	12	8	Jazz
\.


--
-- TOC entry 5056 (class 0 OID 25319)
-- Dependencies: 260
-- Data for Name: group_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_lesson (lesson_id, min_attendees, max_attendees, attendees) FROM stdin;
1	5	10	7
\.


--
-- TOC entry 5025 (class 0 OID 25151)
-- Dependencies: 229
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (id, teaches_ensembles, person_id) FROM stdin;
1	t	1
2	t	2
3	t	3
\.


--
-- TOC entry 5044 (class 0 OID 25246)
-- Dependencies: 248
-- Data for Name: instructor_instruments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor_instruments (id, instruments_id, instructor_id) FROM stdin;
1	1	1
\.


--
-- TOC entry 5030 (class 0 OID 25183)
-- Dependencies: 234
-- Data for Name: instruments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instruments (id, instrument_type) FROM stdin;
1	Guitar
2	Piano
\.


--
-- TOC entry 5022 (class 0 OID 25129)
-- Dependencies: 226
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson (id, date, start_time, duration, room_id, price_scheme_id, instructor_id, instrument_id) FROM stdin;
1	2023-01-10	1400	60	1	1	1	1
\.


--
-- TOC entry 5040 (class 0 OID 25226)
-- Dependencies: 244
-- Data for Name: lesson_attendees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson_attendees (student_id, lesson_id) FROM stdin;
1	1
\.


--
-- TOC entry 5012 (class 0 OID 25104)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, first_name, last_name, personal_number, phone_number, email_address, street, city, zip) FROM stdin;
1	John	Doe	123456789	5551234	john.doe@example.com	123 Main St	Anytown	12345
2	Jane	Smith	987654321	5555678	jane.smith@example.com	456 Elm St	Othertown	54321
3	Alice	Brown	234567890	5556789	alice.brown@example.com	789 Cedar St	Middletown	23456
\.


--
-- TOC entry 5014 (class 0 OID 25111)
-- Dependencies: 218
-- Data for Name: price_scheme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_scheme (id, price, discount, sibling_discount_eligibility, instructor_fee, lesson_type, skill_type) FROM stdin;
1	100	10	t	50	individual	beginner
2	150	15	f	75	group	intermediate
\.


--
-- TOC entry 5033 (class 0 OID 25191)
-- Dependencies: 237
-- Data for Name: rental_instruments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_instruments (id, quantity_in_stock, brand, instrument_id) FROM stdin;
1	10	Yamaha	1
2	10	Yamaha	2
\.


--
-- TOC entry 5037 (class 0 OID 25206)
-- Dependencies: 241
-- Data for Name: rental_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_record (id, rental_period, rental_price, student_id, rental_instruments_id) FROM stdin;
1	2023-01-10	25	1	1
\.


--
-- TOC entry 5054 (class 0 OID 25300)
-- Dependencies: 258
-- Data for Name: sibling_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sibling_relations (id, student_id, sibling_student_id) FROM stdin;
1	1	2
2	1	3
3	2	1
4	2	3
5	3	1
6	3	2
\.


--
-- TOC entry 5028 (class 0 OID 25170)
-- Dependencies: 232
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, person_id) FROM stdin;
1	1
2	2
3	3
\.


--
-- TOC entry 5050 (class 0 OID 25280)
-- Dependencies: 254
-- Data for Name: student_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_relations (student_id, contact_id) FROM stdin;
1	1
\.


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 219
-- Name: classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classroom_id_seq', 2, true);


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 249
-- Name: contact_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_person_id_seq', 3, true);


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 250
-- Name: contact_person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_person_person_id_seq', 1, false);


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 261
-- Name: ensemble_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ensemble_lesson_id_seq', 1, false);


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 259
-- Name: group_lesson_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_lesson_lesson_id_seq', 1, false);


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 227
-- Name: instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_id_seq', 3, true);


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 245
-- Name: instructor_instruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instruments_id_seq', 1, true);


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 247
-- Name: instructor_instruments_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instruments_instructor_id_seq', 1, false);


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 246
-- Name: instructor_instruments_instruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instruments_instruments_id_seq', 1, false);


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 228
-- Name: instructor_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_person_id_seq', 1, false);


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 233
-- Name: instruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instruments_id_seq', 2, true);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 243
-- Name: lesson_attendees_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_attendees_lesson_id_seq', 1, false);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 242
-- Name: lesson_attendees_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_attendees_student_id_seq', 1, false);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 221
-- Name: lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_id_seq', 1, true);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 224
-- Name: lesson_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_instructor_id_seq', 1, false);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 225
-- Name: lesson_instrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_instrument_id_seq', 1, false);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 223
-- Name: lesson_price_scheme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_price_scheme_id_seq', 1, false);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 222
-- Name: lesson_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_room_id_seq', 1, false);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 3, true);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 217
-- Name: price_scheme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_scheme_id_seq', 2, true);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 235
-- Name: rental_instruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_instruments_id_seq', 2, true);


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 236
-- Name: rental_instruments_instrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_instruments_instrument_id_seq', 1, false);


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 238
-- Name: rental_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_record_id_seq', 1, true);


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 240
-- Name: rental_record_rental_instruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_record_rental_instruments_id_seq', 1, false);


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 239
-- Name: rental_record_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_record_student_id_seq', 1, false);


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 255
-- Name: sibling_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sibling_relations_id_seq', 6, true);


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 257
-- Name: sibling_relations_sibling_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sibling_relations_sibling_student_id_seq', 1, false);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 256
-- Name: sibling_relations_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sibling_relations_student_id_seq', 1, false);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 230
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 3, true);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 231
-- Name: student_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_person_id_seq', 1, false);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 253
-- Name: student_relations_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_relations_contact_id_seq', 1, false);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 252
-- Name: student_relations_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_relations_student_id_seq', 1, false);


--
-- TOC entry 4822 (class 2606 OID 25123)
-- Name: classroom classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (id);


--
-- TOC entry 4840 (class 2606 OID 25272)
-- Name: contact_person contact_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_pkey PRIMARY KEY (id);


--
-- TOC entry 4848 (class 2606 OID 25336)
-- Name: ensemble ensemble_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT ensemble_pkey PRIMARY KEY (lesson_id);


--
-- TOC entry 4846 (class 2606 OID 25324)
-- Name: group_lesson group_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_pkey PRIMARY KEY (lesson_id);


--
-- TOC entry 4838 (class 2606 OID 25253)
-- Name: instructor_instruments instructor_instruments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instruments
    ADD CONSTRAINT instructor_instruments_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 25157)
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 25188)
-- Name: instruments instruments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instruments
    ADD CONSTRAINT instruments_pkey PRIMARY KEY (id);


--
-- TOC entry 4836 (class 2606 OID 25232)
-- Name: lesson_attendees lesson_attendees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_attendees
    ADD CONSTRAINT lesson_attendees_pkey PRIMARY KEY (student_id, lesson_id);


--
-- TOC entry 4824 (class 2606 OID 25138)
-- Name: lesson lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_pkey PRIMARY KEY (id);


--
-- TOC entry 4818 (class 2606 OID 25109)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 25116)
-- Name: price_scheme price_scheme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_scheme
    ADD CONSTRAINT price_scheme_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 25197)
-- Name: rental_instruments rental_instruments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_instruments
    ADD CONSTRAINT rental_instruments_pkey PRIMARY KEY (id);


--
-- TOC entry 4834 (class 2606 OID 25213)
-- Name: rental_record rental_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_record
    ADD CONSTRAINT rental_record_pkey PRIMARY KEY (id);


--
-- TOC entry 4844 (class 2606 OID 25307)
-- Name: sibling_relations sibling_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_relations
    ADD CONSTRAINT sibling_relations_pkey PRIMARY KEY (id);


--
-- TOC entry 4828 (class 2606 OID 25176)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 4842 (class 2606 OID 25286)
-- Name: student_relations student_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_relations
    ADD CONSTRAINT student_relations_pkey PRIMARY KEY (student_id, contact_id);


--
-- TOC entry 4861 (class 2606 OID 25273)
-- Name: contact_person contact_person_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON DELETE CASCADE;


--
-- TOC entry 4867 (class 2606 OID 25337)
-- Name: ensemble ensemble_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT ensemble_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lesson(id) ON DELETE CASCADE;


--
-- TOC entry 4866 (class 2606 OID 25325)
-- Name: group_lesson group_lesson_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lesson(id) ON DELETE CASCADE;


--
-- TOC entry 4859 (class 2606 OID 25259)
-- Name: instructor_instruments instructor_instruments_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instruments
    ADD CONSTRAINT instructor_instruments_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructor(id) ON DELETE CASCADE;


--
-- TOC entry 4860 (class 2606 OID 25254)
-- Name: instructor_instruments instructor_instruments_instruments_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instruments
    ADD CONSTRAINT instructor_instruments_instruments_id_fkey FOREIGN KEY (instruments_id) REFERENCES public.instruments(id);


--
-- TOC entry 4852 (class 2606 OID 25158)
-- Name: instructor instructor_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON DELETE CASCADE;


--
-- TOC entry 4857 (class 2606 OID 25238)
-- Name: lesson_attendees lesson_attendees_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_attendees
    ADD CONSTRAINT lesson_attendees_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lesson(id) ON DELETE CASCADE;


--
-- TOC entry 4858 (class 2606 OID 25233)
-- Name: lesson_attendees lesson_attendees_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_attendees
    ADD CONSTRAINT lesson_attendees_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- TOC entry 4849 (class 2606 OID 25163)
-- Name: lesson lesson_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- TOC entry 4850 (class 2606 OID 25144)
-- Name: lesson lesson_price_scheme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_price_scheme_id_fkey FOREIGN KEY (price_scheme_id) REFERENCES public.price_scheme(id) ON DELETE CASCADE;


--
-- TOC entry 4851 (class 2606 OID 25139)
-- Name: lesson lesson_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.classroom(id) ON DELETE SET NULL;


--
-- TOC entry 4854 (class 2606 OID 25198)
-- Name: rental_instruments rental_instruments_instrument_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_instruments
    ADD CONSTRAINT rental_instruments_instrument_id_fkey FOREIGN KEY (instrument_id) REFERENCES public.instruments(id);


--
-- TOC entry 4855 (class 2606 OID 25219)
-- Name: rental_record rental_record_rental_instruments_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_record
    ADD CONSTRAINT rental_record_rental_instruments_id_fkey FOREIGN KEY (rental_instruments_id) REFERENCES public.rental_instruments(id);


--
-- TOC entry 4856 (class 2606 OID 25214)
-- Name: rental_record rental_record_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_record
    ADD CONSTRAINT rental_record_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE SET NULL;


--
-- TOC entry 4864 (class 2606 OID 25313)
-- Name: sibling_relations sibling_relations_sibling_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_relations
    ADD CONSTRAINT sibling_relations_sibling_student_id_fkey FOREIGN KEY (sibling_student_id) REFERENCES public.student(id);


--
-- TOC entry 4865 (class 2606 OID 25308)
-- Name: sibling_relations sibling_relations_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_relations
    ADD CONSTRAINT sibling_relations_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- TOC entry 4853 (class 2606 OID 25177)
-- Name: student student_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON DELETE CASCADE;


--
-- TOC entry 4862 (class 2606 OID 25292)
-- Name: student_relations student_relations_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_relations
    ADD CONSTRAINT student_relations_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contact_person(id);


--
-- TOC entry 4863 (class 2606 OID 25287)
-- Name: student_relations student_relations_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_relations
    ADD CONSTRAINT student_relations_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


-- Completed on 2023-11-22 17:15:53

--
-- PostgreSQL database dump complete
--

