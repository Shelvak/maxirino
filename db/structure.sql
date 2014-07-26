--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: action_zone_person_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE action_zone_person_relations (
    person_id integer,
    action_zone_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
);


--
-- Name: action_zone_person_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE action_zone_person_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_zone_person_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE action_zone_person_relations_id_seq OWNED BY action_zone_person_relations.id;


--
-- Name: action_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE action_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_zones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE action_zones (
    id integer DEFAULT nextval('action_zones_id_seq'::regclass) NOT NULL,
    name character varying(60) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: address_conceptualization_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE address_conceptualization_relations (
    address_id integer,
    conceptualization_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
);


--
-- Name: address_conceptualization_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE address_conceptualization_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_conceptualization_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE address_conceptualization_relations_id_seq OWNED BY address_conceptualization_relations.id;


--
-- Name: address_link_kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE address_link_kinds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_link_kinds; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE address_link_kinds (
    id integer DEFAULT nextval('address_link_kinds_id_seq'::regclass) NOT NULL,
    name character varying(60) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: address_person_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE address_person_relations (
    person_id integer,
    address_id integer,
    address_link_kind_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
);


--
-- Name: address_person_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE address_person_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_person_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE address_person_relations_id_seq OWNED BY address_person_relations.id;


--
-- Name: address_sector_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE address_sector_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_sector_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE address_sector_relations (
    id integer DEFAULT nextval('address_sector_relations_id_seq'::regclass) NOT NULL,
    address_id integer,
    sector_id integer,
    percentage integer,
    detail character varying(100) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: address_zone_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE address_zone_relations (
    address_id integer,
    zone_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
);


--
-- Name: address_zone_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE address_zone_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_zone_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE address_zone_relations_id_seq OWNED BY address_zone_relations.id;


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addresses (
    id integer DEFAULT nextval('addresses_id_seq'::regclass) NOT NULL,
    address_type_id integer,
    number character varying(255) DEFAULT NULL::character varying,
    "between" character varying(255) DEFAULT NULL::character varying,
    street character varying(255) DEFAULT NULL::character varying,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: attach_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE attach_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attach_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE attach_details (
    id integer DEFAULT nextval('attach_details_id_seq'::regclass) NOT NULL,
    "from" character varying(510) DEFAULT NULL::character varying,
    details text,
    attach_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: attach_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE attach_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attach_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE attach_types (
    id integer DEFAULT nextval('attach_types_id_seq'::regclass) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: attaches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE attaches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attaches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE attaches (
    id integer DEFAULT nextval('attaches_id_seq'::regclass) NOT NULL,
    attach_type_id integer,
    file character varying(100) DEFAULT NULL::character varying,
    title character varying(200) DEFAULT NULL::character varying,
    person_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cities (
    id integer DEFAULT nextval('cities_id_seq'::regclass) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    province_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: conceptualization_person_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE conceptualization_person_relations (
    person_id integer,
    conceptualization_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
);


--
-- Name: conceptualization_person_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE conceptualization_person_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conceptualization_person_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE conceptualization_person_relations_id_seq OWNED BY conceptualization_person_relations.id;


--
-- Name: conceptualizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE conceptualizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conceptualizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE conceptualizations (
    id integer DEFAULT nextval('conceptualizations_id_seq'::regclass) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countries (
    id integer DEFAULT nextval('countries_id_seq'::regclass) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: identification_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE identification_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: identification_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE identification_types (
    id integer DEFAULT nextval('identification_types_id_seq'::regclass) NOT NULL,
    name character varying(60) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: identifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE identifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: identifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE identifications (
    id integer DEFAULT nextval('identifications_id_seq'::regclass) NOT NULL,
    person_id integer,
    identification_type_id integer,
    number character varying(100) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: investigation_address_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE investigation_address_relations (
    investigation_id integer,
    address_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
);


--
-- Name: investigation_address_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE investigation_address_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: investigation_address_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE investigation_address_relations_id_seq OWNED BY investigation_address_relations.id;


--
-- Name: investigation_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE investigation_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: investigation_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE investigation_categories (
    id integer DEFAULT nextval('investigation_categories_id_seq'::regclass) NOT NULL,
    name character varying(60) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: investigation_person_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE investigation_person_relations (
    investigation_id integer,
    person_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
);


--
-- Name: investigation_person_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE investigation_person_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: investigation_person_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE investigation_person_relations_id_seq OWNED BY investigation_person_relations.id;


--
-- Name: investigation_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE investigation_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: investigation_statuses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE investigation_statuses (
    id integer DEFAULT nextval('investigation_statuses_id_seq'::regclass) NOT NULL,
    name character varying(30) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: investigations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE investigations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: investigations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE investigations (
    id integer DEFAULT nextval('investigations_id_seq'::regclass) NOT NULL,
    status_id integer NOT NULL,
    category_id integer NOT NULL,
    start_date date,
    end_date date,
    title character varying(240) NOT NULL,
    detail text,
    updated_at timestamp with time zone,
    created_at timestamp with time zone
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE people (
    id integer DEFAULT nextval('people_id_seq'::regclass) NOT NULL,
    first_name character varying(100) DEFAULT NULL::character varying,
    last_name character varying(60) DEFAULT NULL::character varying,
    birthday date,
    father character varying(60) DEFAULT NULL::character varying,
    mother character varying(60) DEFAULT NULL::character varying,
    notes text,
    sex boolean DEFAULT false,
    alias character varying(100) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: people_relation_kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_relation_kinds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_relation_kinds; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE people_relation_kinds (
    id integer DEFAULT nextval('people_relation_kinds_id_seq'::regclass) NOT NULL,
    name character varying(60) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: person_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE person_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: person_addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE person_addresses (
    id integer DEFAULT nextval('person_addresses_id_seq'::regclass) NOT NULL,
    person_id integer,
    address_id integer,
    country_id integer,
    province_id integer,
    city_id integer,
    zone_id integer,
    street_name character varying(510) DEFAULT NULL::character varying,
    street_number character varying(510) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: person_person_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE person_person_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: person_person_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE person_person_relations (
    id integer DEFAULT nextval('person_person_relations_id_seq'::regclass) NOT NULL,
    person_1_id integer,
    person_2_id integer,
    link_kind_id integer,
    since_date date,
    until_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: person_physical_features_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE person_physical_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: person_physical_features; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE person_physical_features (
    id integer DEFAULT nextval('person_physical_features_id_seq'::regclass) NOT NULL,
    person_id integer,
    physical_feature_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: person_quadrant_link_kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE person_quadrant_link_kinds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: person_quadrant_link_kinds; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE person_quadrant_link_kinds (
    id integer DEFAULT nextval('person_quadrant_link_kinds_id_seq'::regclass) NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: phones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE phones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE phones (
    id integer DEFAULT nextval('phones_id_seq'::regclass) NOT NULL,
    person_id integer,
    number character varying(36) DEFAULT NULL::character varying,
    details character varying(100) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: physical_features_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE physical_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: physical_features; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE physical_features (
    id integer DEFAULT nextval('physical_features_id_seq'::regclass) NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE provinces (
    id integer DEFAULT nextval('provinces_id_seq'::regclass) NOT NULL,
    name character varying(60) DEFAULT NULL::character varying,
    country_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: quadrants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quadrants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quadrants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE quadrants (
    id integer DEFAULT nextval('quadrants_id_seq'::regclass) NOT NULL,
    name character varying(40) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(510) NOT NULL,
    id integer NOT NULL
);


--
-- Name: schema_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE schema_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schema_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE schema_migrations_id_seq OWNED BY schema_migrations.id;


--
-- Name: sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sectors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sectors (
    id integer DEFAULT nextval('sectors_id_seq'::regclass) NOT NULL,
    name character varying(40) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: towns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE towns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: towns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE towns (
    id integer DEFAULT nextval('towns_id_seq'::regclass) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    city_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    name character varying(510) NOT NULL,
    lastname character varying(510) DEFAULT NULL::character varying,
    email character varying(510) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(510) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(510) DEFAULT NULL::character varying,
    reset_password_sent_at timestamp with time zone,
    remember_created_at timestamp with time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    current_sign_in_ip character varying(510) DEFAULT NULL::character varying,
    last_sign_in_ip character varying(510) DEFAULT NULL::character varying,
    roles_mask integer DEFAULT 0 NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE versions (
    id integer DEFAULT nextval('versions_id_seq'::regclass) NOT NULL,
    item_type character varying(510) NOT NULL,
    item_id integer NOT NULL,
    event character varying(510) NOT NULL,
    whodunnit integer,
    object text,
    created_at timestamp with time zone
);


--
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zones (
    id integer DEFAULT nextval('zones_id_seq'::regclass) NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY action_zone_person_relations ALTER COLUMN id SET DEFAULT nextval('action_zone_person_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY address_conceptualization_relations ALTER COLUMN id SET DEFAULT nextval('address_conceptualization_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY address_person_relations ALTER COLUMN id SET DEFAULT nextval('address_person_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY address_zone_relations ALTER COLUMN id SET DEFAULT nextval('address_zone_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY conceptualization_person_relations ALTER COLUMN id SET DEFAULT nextval('conceptualization_person_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY investigation_address_relations ALTER COLUMN id SET DEFAULT nextval('investigation_address_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY investigation_person_relations ALTER COLUMN id SET DEFAULT nextval('investigation_person_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations ALTER COLUMN id SET DEFAULT nextval('schema_migrations_id_seq'::regclass);


--
-- Name: action_zone_person_relations_action_zone_id_person_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY action_zone_person_relations
    ADD CONSTRAINT action_zone_person_relations_action_zone_id_person_id_key UNIQUE (action_zone_id, person_id);


--
-- Name: action_zone_person_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY action_zone_person_relations
    ADD CONSTRAINT action_zone_person_relations_pkey PRIMARY KEY (id);


--
-- Name: action_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY action_zones
    ADD CONSTRAINT action_zones_pkey PRIMARY KEY (id);


--
-- Name: address_conceptualization_rel_address_id_conceptualization__key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address_conceptualization_relations
    ADD CONSTRAINT address_conceptualization_rel_address_id_conceptualization__key UNIQUE (address_id, conceptualization_id);


--
-- Name: address_conceptualization_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address_conceptualization_relations
    ADD CONSTRAINT address_conceptualization_relations_pkey PRIMARY KEY (id);


--
-- Name: address_link_kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address_link_kinds
    ADD CONSTRAINT address_link_kinds_pkey PRIMARY KEY (id);


--
-- Name: address_person_relations_person_id_address_id_address_link__key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address_person_relations
    ADD CONSTRAINT address_person_relations_person_id_address_id_address_link__key UNIQUE (person_id, address_id, address_link_kind_id);


--
-- Name: address_person_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address_person_relations
    ADD CONSTRAINT address_person_relations_pkey PRIMARY KEY (id);


--
-- Name: address_sector_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address_sector_relations
    ADD CONSTRAINT address_sector_relations_pkey PRIMARY KEY (id);


--
-- Name: address_zone_relations_address_id_zone_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address_zone_relations
    ADD CONSTRAINT address_zone_relations_address_id_zone_id_key UNIQUE (address_id, zone_id);


--
-- Name: address_zone_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address_zone_relations
    ADD CONSTRAINT address_zone_relations_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: attach_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attach_details
    ADD CONSTRAINT attach_details_pkey PRIMARY KEY (id);


--
-- Name: attach_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attach_types
    ADD CONSTRAINT attach_types_pkey PRIMARY KEY (id);


--
-- Name: attaches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attaches
    ADD CONSTRAINT attaches_pkey PRIMARY KEY (id);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: conceptualization_person_rela_person_id_conceptualization_i_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY conceptualization_person_relations
    ADD CONSTRAINT conceptualization_person_rela_person_id_conceptualization_i_key UNIQUE (person_id, conceptualization_id);


--
-- Name: conceptualization_person_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY conceptualization_person_relations
    ADD CONSTRAINT conceptualization_person_relations_pkey PRIMARY KEY (id);


--
-- Name: conceptualizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY conceptualizations
    ADD CONSTRAINT conceptualizations_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: identification_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY identification_types
    ADD CONSTRAINT identification_types_pkey PRIMARY KEY (id);


--
-- Name: identifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY identifications
    ADD CONSTRAINT identifications_pkey PRIMARY KEY (id);


--
-- Name: investigation_address_relations_investigation_id_address_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY investigation_address_relations
    ADD CONSTRAINT investigation_address_relations_investigation_id_address_id_key UNIQUE (investigation_id, address_id);


--
-- Name: investigation_address_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY investigation_address_relations
    ADD CONSTRAINT investigation_address_relations_pkey PRIMARY KEY (id);


--
-- Name: investigation_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY investigation_categories
    ADD CONSTRAINT investigation_categories_pkey PRIMARY KEY (id);


--
-- Name: investigation_person_relations_investigation_id_person_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY investigation_person_relations
    ADD CONSTRAINT investigation_person_relations_investigation_id_person_id_key UNIQUE (investigation_id, person_id);


--
-- Name: investigation_person_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY investigation_person_relations
    ADD CONSTRAINT investigation_person_relations_pkey PRIMARY KEY (id);


--
-- Name: investigation_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY investigation_statuses
    ADD CONSTRAINT investigation_statuses_pkey PRIMARY KEY (id);


--
-- Name: investigations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY investigations
    ADD CONSTRAINT investigations_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: people_relation_kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY people_relation_kinds
    ADD CONSTRAINT people_relation_kinds_pkey PRIMARY KEY (id);


--
-- Name: person_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person_addresses
    ADD CONSTRAINT person_addresses_pkey PRIMARY KEY (id);


--
-- Name: person_person_relations_person_1_id_person_2_id_link_type_i_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person_person_relations
    ADD CONSTRAINT person_person_relations_person_1_id_person_2_id_link_type_i_key UNIQUE (person_1_id, person_2_id, link_kind_id);


--
-- Name: person_person_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person_person_relations
    ADD CONSTRAINT person_person_relations_pkey PRIMARY KEY (id);


--
-- Name: person_physical_features_person_id_physical_feature_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person_physical_features
    ADD CONSTRAINT person_physical_features_person_id_physical_feature_id_key UNIQUE (person_id, physical_feature_id);


--
-- Name: person_physical_features_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person_physical_features
    ADD CONSTRAINT person_physical_features_pkey PRIMARY KEY (id);


--
-- Name: person_quadrant_link_kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person_quadrant_link_kinds
    ADD CONSTRAINT person_quadrant_link_kinds_pkey PRIMARY KEY (id);


--
-- Name: phones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- Name: physical_features_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY physical_features
    ADD CONSTRAINT physical_features_pkey PRIMARY KEY (id);


--
-- Name: provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: quadrants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY quadrants
    ADD CONSTRAINT quadrants_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_version_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_version_key UNIQUE (version);


--
-- Name: sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- Name: towns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY towns
    ADD CONSTRAINT towns_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_reset_password_token_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_reset_password_token_key UNIQUE (reset_password_token);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20120109032633');

INSERT INTO schema_migrations (version) VALUES ('20120214173944');

INSERT INTO schema_migrations (version) VALUES ('20120306131941');

INSERT INTO schema_migrations (version) VALUES ('20140721213013');

INSERT INTO schema_migrations (version) VALUES ('20140725161620');

INSERT INTO schema_migrations (version) VALUES ('20140725161801');

INSERT INTO schema_migrations (version) VALUES ('20140725161837');

INSERT INTO schema_migrations (version) VALUES ('20140725163427');

INSERT INTO schema_migrations (version) VALUES ('20140725163520');

INSERT INTO schema_migrations (version) VALUES ('20140725163617');

INSERT INTO schema_migrations (version) VALUES ('20140725164441');

INSERT INTO schema_migrations (version) VALUES ('20140725164833');

INSERT INTO schema_migrations (version) VALUES ('20140725164910');

INSERT INTO schema_migrations (version) VALUES ('20140725165051');

INSERT INTO schema_migrations (version) VALUES ('20140725165705');

INSERT INTO schema_migrations (version) VALUES ('20140725165813');

INSERT INTO schema_migrations (version) VALUES ('20140725165824');

INSERT INTO schema_migrations (version) VALUES ('20140725165833');

INSERT INTO schema_migrations (version) VALUES ('20140725165852');

INSERT INTO schema_migrations (version) VALUES ('20140725165918');

INSERT INTO schema_migrations (version) VALUES ('20140725165931');

INSERT INTO schema_migrations (version) VALUES ('20140725170105');

INSERT INTO schema_migrations (version) VALUES ('20140725170131');

INSERT INTO schema_migrations (version) VALUES ('20140725170309');

INSERT INTO schema_migrations (version) VALUES ('20140725170350');

INSERT INTO schema_migrations (version) VALUES ('20140725170522');

INSERT INTO schema_migrations (version) VALUES ('20140725170535');

INSERT INTO schema_migrations (version) VALUES ('20140725170638');

INSERT INTO schema_migrations (version) VALUES ('20140725170711');

INSERT INTO schema_migrations (version) VALUES ('20140725170946');

INSERT INTO schema_migrations (version) VALUES ('20140725170955');

INSERT INTO schema_migrations (version) VALUES ('20140725171007');

INSERT INTO schema_migrations (version) VALUES ('20140725171030');

INSERT INTO schema_migrations (version) VALUES ('20140725171049');

INSERT INTO schema_migrations (version) VALUES ('20140725171057');

INSERT INTO schema_migrations (version) VALUES ('20140725171106');

INSERT INTO schema_migrations (version) VALUES ('20140725171115');

INSERT INTO schema_migrations (version) VALUES ('20140725171128');

INSERT INTO schema_migrations (version) VALUES ('20140725202345');

