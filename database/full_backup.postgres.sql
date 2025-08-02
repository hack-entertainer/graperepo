--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Homebrew)
-- Dumped by pg_dump version 14.18 (Homebrew)

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
-- Name: rapereportdbkend_ken; Type: SCHEMA; Schema: -; Owner: rapereportdbkend_ken
--

CREATE SCHEMA rapereportdbkend_ken;


ALTER SCHEMA rapereportdbkend_ken OWNER TO rapereportdbkend_ken;

--
-- Name: banners_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.banners_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.banners_status OWNER TO rapereportdbkend_ken;

--
-- Name: brands_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.brands_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.brands_status OWNER TO rapereportdbkend_ken;

--
-- Name: carts_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.carts_status AS ENUM (
    'new',
    'progress',
    'delivered',
    'cancel'
);


ALTER TYPE rapereportdbkend_ken.carts_status OWNER TO rapereportdbkend_ken;

--
-- Name: categories_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.categories_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.categories_status OWNER TO rapereportdbkend_ken;

--
-- Name: coupons_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.coupons_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.coupons_status OWNER TO rapereportdbkend_ken;

--
-- Name: coupons_type; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.coupons_type AS ENUM (
    'fixed',
    'percent'
);


ALTER TYPE rapereportdbkend_ken.coupons_type OWNER TO rapereportdbkend_ken;

--
-- Name: orders_payment_method; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.orders_payment_method AS ENUM (
    'cod',
    'paypal'
);


ALTER TYPE rapereportdbkend_ken.orders_payment_method OWNER TO rapereportdbkend_ken;

--
-- Name: orders_payment_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.orders_payment_status AS ENUM (
    'paid',
    'unpaid'
);


ALTER TYPE rapereportdbkend_ken.orders_payment_status OWNER TO rapereportdbkend_ken;

--
-- Name: orders_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.orders_status AS ENUM (
    'new',
    'process',
    'delivered',
    'cancel'
);


ALTER TYPE rapereportdbkend_ken.orders_status OWNER TO rapereportdbkend_ken;

--
-- Name: post_categories_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.post_categories_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.post_categories_status OWNER TO rapereportdbkend_ken;

--
-- Name: post_comments_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.post_comments_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.post_comments_status OWNER TO rapereportdbkend_ken;

--
-- Name: post_tags_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.post_tags_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.post_tags_status OWNER TO rapereportdbkend_ken;

--
-- Name: posts_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.posts_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.posts_status OWNER TO rapereportdbkend_ken;

--
-- Name: product_reviews_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.product_reviews_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.product_reviews_status OWNER TO rapereportdbkend_ken;

--
-- Name: products_condition; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.products_condition AS ENUM (
    'default',
    'new',
    'hot'
);


ALTER TYPE rapereportdbkend_ken.products_condition OWNER TO rapereportdbkend_ken;

--
-- Name: products_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.products_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.products_status OWNER TO rapereportdbkend_ken;

--
-- Name: report_comments_payment_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.report_comments_payment_status AS ENUM (
    'unpaid',
    'paid',
    'failed'
);


ALTER TYPE rapereportdbkend_ken.report_comments_payment_status OWNER TO rapereportdbkend_ken;

--
-- Name: report_responses_payment_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.report_responses_payment_status AS ENUM (
    'unpaid',
    'paid',
    'failed'
);


ALTER TYPE rapereportdbkend_ken.report_responses_payment_status OWNER TO rapereportdbkend_ken;

--
-- Name: report_responses_type; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.report_responses_type AS ENUM (
    'subject_responses',
    'reporter_reply'
);


ALTER TYPE rapereportdbkend_ken.report_responses_type OWNER TO rapereportdbkend_ken;

--
-- Name: reports_payment_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.reports_payment_status AS ENUM (
    'unpaid',
    'paid',
    'failed'
);


ALTER TYPE rapereportdbkend_ken.reports_payment_status OWNER TO rapereportdbkend_ken;

--
-- Name: shippings_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.shippings_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.shippings_status OWNER TO rapereportdbkend_ken;

--
-- Name: users_role; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.users_role AS ENUM (
    'admin',
    'user'
);


ALTER TYPE rapereportdbkend_ken.users_role OWNER TO rapereportdbkend_ken;

--
-- Name: users_status; Type: TYPE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TYPE rapereportdbkend_ken.users_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE rapereportdbkend_ken.users_status OWNER TO rapereportdbkend_ken;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: rapereportdbkend_ken
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO rapereportdbkend_ken;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: rapereportdbkend_ken
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(191) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(191) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO rapereportdbkend_ken;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: banners; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.banners (
    id bigint NOT NULL,
    title character varying(191) NOT NULL,
    slug character varying(191) NOT NULL,
    photo character varying(191),
    description text,
    status rapereportdbkend_ken.banners_status DEFAULT 'inactive'::rapereportdbkend_ken.banners_status NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.banners OWNER TO rapereportdbkend_ken;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.banners_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.banners_id_seq OWNED BY rapereportdbkend_ken.banners.id;


--
-- Name: brands; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.brands (
    id bigint NOT NULL,
    title character varying(191) NOT NULL,
    slug character varying(191) NOT NULL,
    status rapereportdbkend_ken.brands_status DEFAULT 'active'::rapereportdbkend_ken.brands_status NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.brands OWNER TO rapereportdbkend_ken;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.brands_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.brands_id_seq OWNED BY rapereportdbkend_ken.brands.id;


--
-- Name: carts; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.carts (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    order_id bigint,
    user_id bigint,
    price double precision NOT NULL,
    status rapereportdbkend_ken.carts_status DEFAULT 'new'::rapereportdbkend_ken.carts_status NOT NULL,
    quantity integer NOT NULL,
    amount double precision NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.carts OWNER TO rapereportdbkend_ken;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.carts_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.carts_id_seq OWNED BY rapereportdbkend_ken.carts.id;


--
-- Name: categories; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.categories (
    id bigint NOT NULL,
    title character varying(191) NOT NULL,
    slug character varying(191) NOT NULL,
    summary text,
    photo character varying(191),
    is_parent boolean DEFAULT true NOT NULL,
    parent_id bigint,
    added_by bigint,
    status rapereportdbkend_ken.categories_status DEFAULT 'inactive'::rapereportdbkend_ken.categories_status NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.categories OWNER TO rapereportdbkend_ken;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.categories_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.categories_id_seq OWNED BY rapereportdbkend_ken.categories.id;


--
-- Name: coupons; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.coupons (
    id bigint NOT NULL,
    code character varying(191) NOT NULL,
    type rapereportdbkend_ken.coupons_type DEFAULT 'fixed'::rapereportdbkend_ken.coupons_type NOT NULL,
    value numeric(20,2) NOT NULL,
    status rapereportdbkend_ken.coupons_status DEFAULT 'inactive'::rapereportdbkend_ken.coupons_status NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.coupons OWNER TO rapereportdbkend_ken;

--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.coupons_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.coupons_id_seq OWNED BY rapereportdbkend_ken.coupons.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE rapereportdbkend_ken.failed_jobs OWNER TO rapereportdbkend_ken;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.failed_jobs_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.failed_jobs_id_seq OWNED BY rapereportdbkend_ken.failed_jobs.id;


--
-- Name: jobs; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.jobs (
    id bigint NOT NULL,
    queue character varying(191) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at bigint,
    available_at bigint NOT NULL,
    created_at bigint NOT NULL
);


ALTER TABLE rapereportdbkend_ken.jobs OWNER TO rapereportdbkend_ken;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.jobs_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.jobs_id_seq OWNED BY rapereportdbkend_ken.jobs.id;


--
-- Name: messages; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.messages (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    subject text NOT NULL,
    email character varying(191) NOT NULL,
    photo character varying(191),
    phone character varying(191),
    message text NOT NULL,
    read_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.messages OWNER TO rapereportdbkend_ken;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.messages_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.messages_id_seq OWNED BY rapereportdbkend_ken.messages.id;


--
-- Name: migrations; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.migrations (
    id bigint NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE rapereportdbkend_ken.migrations OWNER TO rapereportdbkend_ken;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.migrations_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.migrations_id_seq OWNED BY rapereportdbkend_ken.migrations.id;


--
-- Name: notifications; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.notifications (
    id character(36) NOT NULL,
    type character varying(191) NOT NULL,
    notifiable_type character varying(191) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.notifications OWNER TO rapereportdbkend_ken;

--
-- Name: orders; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.orders (
    id bigint NOT NULL,
    order_number character varying(191) NOT NULL,
    user_id bigint,
    sub_total double precision NOT NULL,
    shipping_id bigint,
    coupon double precision,
    total_amount double precision NOT NULL,
    quantity integer NOT NULL,
    payment_method rapereportdbkend_ken.orders_payment_method DEFAULT 'cod'::rapereportdbkend_ken.orders_payment_method NOT NULL,
    payment_status rapereportdbkend_ken.orders_payment_status DEFAULT 'unpaid'::rapereportdbkend_ken.orders_payment_status NOT NULL,
    status rapereportdbkend_ken.orders_status DEFAULT 'new'::rapereportdbkend_ken.orders_status NOT NULL,
    first_name character varying(191) NOT NULL,
    last_name character varying(191) NOT NULL,
    email character varying(191) NOT NULL,
    phone character varying(191) NOT NULL,
    country character varying(191) NOT NULL,
    post_code character varying(191),
    address1 text NOT NULL,
    address2 text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.orders OWNER TO rapereportdbkend_ken;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.orders_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.orders_id_seq OWNED BY rapereportdbkend_ken.orders.id;


--
-- Name: password_resets; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.password_resets OWNER TO rapereportdbkend_ken;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(191) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(191) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp with time zone,
    expires_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.personal_access_tokens OWNER TO rapereportdbkend_ken;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.personal_access_tokens_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.personal_access_tokens_id_seq OWNED BY rapereportdbkend_ken.personal_access_tokens.id;


--
-- Name: post_categories; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.post_categories (
    id bigint NOT NULL,
    title character varying(191) NOT NULL,
    slug character varying(191) NOT NULL,
    status rapereportdbkend_ken.post_categories_status DEFAULT 'active'::rapereportdbkend_ken.post_categories_status NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.post_categories OWNER TO rapereportdbkend_ken;

--
-- Name: post_categories_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.post_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.post_categories_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: post_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.post_categories_id_seq OWNED BY rapereportdbkend_ken.post_categories.id;


--
-- Name: post_comments; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.post_comments (
    id bigint NOT NULL,
    user_id bigint,
    post_id bigint,
    comment text NOT NULL,
    status rapereportdbkend_ken.post_comments_status DEFAULT 'active'::rapereportdbkend_ken.post_comments_status NOT NULL,
    replied_comment text,
    parent_id bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.post_comments OWNER TO rapereportdbkend_ken;

--
-- Name: post_comments_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.post_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.post_comments_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: post_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.post_comments_id_seq OWNED BY rapereportdbkend_ken.post_comments.id;


--
-- Name: post_tags; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.post_tags (
    id bigint NOT NULL,
    title character varying(191) NOT NULL,
    slug character varying(191) NOT NULL,
    status rapereportdbkend_ken.post_tags_status DEFAULT 'active'::rapereportdbkend_ken.post_tags_status NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.post_tags OWNER TO rapereportdbkend_ken;

--
-- Name: post_tags_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.post_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.post_tags_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: post_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.post_tags_id_seq OWNED BY rapereportdbkend_ken.post_tags.id;


--
-- Name: posts; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.posts (
    id bigint NOT NULL,
    title character varying(191) NOT NULL,
    slug character varying(191) NOT NULL,
    summary text NOT NULL,
    description text,
    quote text,
    photo character varying(191),
    tags character varying(191),
    post_cat_id bigint,
    post_tag_id bigint,
    added_by bigint,
    status rapereportdbkend_ken.posts_status DEFAULT 'active'::rapereportdbkend_ken.posts_status NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.posts OWNER TO rapereportdbkend_ken;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.posts_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.posts_id_seq OWNED BY rapereportdbkend_ken.posts.id;


--
-- Name: product_reviews; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.product_reviews (
    id bigint NOT NULL,
    user_id bigint,
    product_id bigint,
    rate smallint DEFAULT '0'::smallint NOT NULL,
    review text,
    status rapereportdbkend_ken.product_reviews_status DEFAULT 'active'::rapereportdbkend_ken.product_reviews_status NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.product_reviews OWNER TO rapereportdbkend_ken;

--
-- Name: product_reviews_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.product_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.product_reviews_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: product_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.product_reviews_id_seq OWNED BY rapereportdbkend_ken.product_reviews.id;


--
-- Name: products; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.products (
    id bigint NOT NULL,
    title character varying(191) NOT NULL,
    slug character varying(191) NOT NULL,
    summary text NOT NULL,
    description text,
    photo text NOT NULL,
    stock integer DEFAULT 1 NOT NULL,
    size character varying(191) DEFAULT 'M'::character varying,
    condition rapereportdbkend_ken.products_condition DEFAULT 'default'::rapereportdbkend_ken.products_condition NOT NULL,
    status rapereportdbkend_ken.products_status DEFAULT 'inactive'::rapereportdbkend_ken.products_status NOT NULL,
    price double precision NOT NULL,
    discount double precision NOT NULL,
    is_featured boolean NOT NULL,
    cat_id bigint,
    child_cat_id bigint,
    brand_id bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.products OWNER TO rapereportdbkend_ken;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.products_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.products_id_seq OWNED BY rapereportdbkend_ken.products.id;


--
-- Name: report_comments; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.report_comments (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    report_id bigint NOT NULL,
    user_fullname character varying(191),
    content text NOT NULL,
    is_paid boolean DEFAULT false NOT NULL,
    payment_status rapereportdbkend_ken.report_comments_payment_status DEFAULT 'unpaid'::rapereportdbkend_ken.report_comments_payment_status NOT NULL,
    paid_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.report_comments OWNER TO rapereportdbkend_ken;

--
-- Name: report_comments_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.report_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.report_comments_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: report_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.report_comments_id_seq OWNED BY rapereportdbkend_ken.report_comments.id;


--
-- Name: report_responses; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.report_responses (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    report_id bigint NOT NULL,
    user_fullname character varying(191),
    type rapereportdbkend_ken.report_responses_type NOT NULL,
    content text,
    file_path character varying(191),
    is_paid boolean DEFAULT false NOT NULL,
    payment_status rapereportdbkend_ken.report_responses_payment_status DEFAULT 'unpaid'::rapereportdbkend_ken.report_responses_payment_status NOT NULL,
    paid_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.report_responses OWNER TO rapereportdbkend_ken;

--
-- Name: report_responses_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.report_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.report_responses_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: report_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.report_responses_id_seq OWNED BY rapereportdbkend_ken.report_responses.id;


--
-- Name: reports; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.reports (
    id bigint NOT NULL,
    reporter_id bigint NOT NULL,
    reporter_name character varying(191),
    reporter_email character varying(191),
    type_event character varying(191) NOT NULL,
    description text NOT NULL,
    event_date date NOT NULL,
    event_location character varying(191),
    video_link character varying(191),
    subject_fullname character varying(191),
    subject_location character varying(191),
    alternate_reporter_name character varying(191),
    report_number character varying(191) NOT NULL,
    status character varying(191) DEFAULT 'pending'::character varying NOT NULL,
    is_paid boolean DEFAULT false NOT NULL,
    payment_status rapereportdbkend_ken.reports_payment_status DEFAULT 'unpaid'::rapereportdbkend_ken.reports_payment_status NOT NULL,
    paid_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    subject_address character varying(191),
    subject_city character varying(191),
    subject_state character varying(191),
    subject_zipcode character varying(191),
    subject_country character varying(191),
    event_address character varying(191),
    event_city character varying(191),
    event_state character varying(191),
    event_zipcode character varying(191),
    event_country character varying(191),
    video_path character varying(191),
    letter_path character varying(191),
    total_comment integer DEFAULT 0 NOT NULL,
    subject_email character varying(191),
    subject_phone character varying(191)
);


ALTER TABLE rapereportdbkend_ken.reports OWNER TO rapereportdbkend_ken;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.reports_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.reports_id_seq OWNED BY rapereportdbkend_ken.reports.id;


--
-- Name: settings; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.settings (
    id bigint NOT NULL,
    description text NOT NULL,
    short_des text NOT NULL,
    logo character varying(191) NOT NULL,
    photo character varying(191) NOT NULL,
    address character varying(191) NOT NULL,
    phone character varying(191) NOT NULL,
    email character varying(191) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.settings OWNER TO rapereportdbkend_ken;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.settings_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.settings_id_seq OWNED BY rapereportdbkend_ken.settings.id;


--
-- Name: shippings; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.shippings (
    id bigint NOT NULL,
    type character varying(191) NOT NULL,
    price numeric(8,2) NOT NULL,
    status rapereportdbkend_ken.shippings_status DEFAULT 'active'::rapereportdbkend_ken.shippings_status NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.shippings OWNER TO rapereportdbkend_ken;

--
-- Name: shippings_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.shippings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.shippings_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: shippings_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.shippings_id_seq OWNED BY rapereportdbkend_ken.shippings.id;


--
-- Name: users; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.users (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    email character varying(191),
    email_verified_at timestamp with time zone,
    password character varying(191),
    photo character varying(191),
    role rapereportdbkend_ken.users_role DEFAULT 'user'::rapereportdbkend_ken.users_role NOT NULL,
    provider character varying(191),
    provider_id character varying(191),
    status rapereportdbkend_ken.users_status DEFAULT 'active'::rapereportdbkend_ken.users_status NOT NULL,
    remember_token character varying(100),
    credits_comment integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.users OWNER TO rapereportdbkend_ken;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.users_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.users_id_seq OWNED BY rapereportdbkend_ken.users.id;


--
-- Name: wishlists; Type: TABLE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE TABLE rapereportdbkend_ken.wishlists (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    cart_id bigint,
    user_id bigint,
    price double precision NOT NULL,
    quantity integer NOT NULL,
    amount double precision NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE rapereportdbkend_ken.wishlists OWNER TO rapereportdbkend_ken;

--
-- Name: wishlists_id_seq; Type: SEQUENCE; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE SEQUENCE rapereportdbkend_ken.wishlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapereportdbkend_ken.wishlists_id_seq OWNER TO rapereportdbkend_ken;

--
-- Name: wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER SEQUENCE rapereportdbkend_ken.wishlists_id_seq OWNED BY rapereportdbkend_ken.wishlists.id;


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: banners id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.banners ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.banners_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.brands ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.brands_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.carts ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.categories ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.categories_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.coupons ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.coupons_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.failed_jobs ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.jobs ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.jobs_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.messages ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.messages_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.migrations ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.migrations_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.orders ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.orders_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.personal_access_tokens_id_seq'::regclass);


--
-- Name: post_categories id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.post_categories ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.post_categories_id_seq'::regclass);


--
-- Name: post_comments id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.post_comments ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.post_comments_id_seq'::regclass);


--
-- Name: post_tags id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.post_tags ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.post_tags_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.posts ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.posts_id_seq'::regclass);


--
-- Name: product_reviews id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.product_reviews ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.product_reviews_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.products ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.products_id_seq'::regclass);


--
-- Name: report_comments id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.report_comments ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.report_comments_id_seq'::regclass);


--
-- Name: report_responses id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.report_responses ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.report_responses_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.reports ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.reports_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.settings ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.settings_id_seq'::regclass);


--
-- Name: shippings id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.shippings ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.shippings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.users ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.users_id_seq'::regclass);


--
-- Name: wishlists id; Type: DEFAULT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.wishlists ALTER COLUMN id SET DEFAULT nextval('rapereportdbkend_ken.wishlists_id_seq'::regclass);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: rapereportdbkend_ken
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2019_12_14_000001_create_personal_access_tokens_table	1
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: rapereportdbkend_ken
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.banners (id, title, slug, photo, description, status, created_at, updated_at) FROM stdin;
1	Lorem Ipsum is	lorem-ipsum-is	/storage/photos/1/Banner/banner-01.jpg	<h2><span style="font-weight: bold; color: rgb(99, 99, 99);">Up to 10%</span></h2>	active	2020-08-13 21:47:38-04	2020-08-13 21:48:21-04
2	Lorem Ipsum	lorem-ipsum	/storage/photos/1/Banner/banner-07.jpg	<p>Up to 90%</p>	active	2020-08-13 21:50:23-04	2020-08-13 21:50:23-04
4	Banner	banner	/storage/photos/1/Banner/banner-06.jpg	<h2><span style="color: rgb(156, 0, 255); font-size: 2rem; font-weight: bold;">Up to 40%</span><br></h2><h2><span style="color: rgb(156, 0, 255);"></span></h2>	active	2020-08-17 16:46:59-04	2020-08-17 16:46:59-04
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.brands (id, title, slug, status, created_at, updated_at) FROM stdin;
1	Adidas	adidas	active	2020-08-14 00:23:00-04	2020-08-14 00:23:00-04
2	Nike	nike	active	2020-08-14 00:23:08-04	2020-08-14 00:23:08-04
3	Kappa	kappa	active	2020-08-14 00:23:48-04	2020-08-14 00:23:48-04
4	Prada	prada	active	2020-08-14 00:24:08-04	2020-08-14 00:24:08-04
6	Brand	brand	active	2020-08-17 16:50:31-04	2020-08-17 16:50:31-04
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.carts (id, product_id, order_id, user_id, price, status, quantity, amount, created_at, updated_at) FROM stdin;
4	7	2	2	1939.03	new	1	1939.03	2020-08-14 18:13:51-04	2020-08-14 18:14:59-04
10	10	\N	2	270	new	1	270	2020-08-17 17:07:33-04	2020-08-17 17:17:03-04
11	9	\N	2	190	new	3	580	2020-08-17 17:08:35-04	2025-05-06 06:43:10-04
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.categories (id, title, slug, summary, photo, is_parent, parent_id, added_by, status, created_at, updated_at) FROM stdin;
1	Men's Fashion	mens-fashion	\N	/storage/photos/1/Category/mini-banner1.jpg	t	\N	\N	active	2020-08-14 00:26:15-04	2020-08-14 00:26:15-04
2	Women's Fashion	womens-fashion	\N	/storage/photos/1/Category/mini-banner2.jpg	t	\N	\N	active	2020-08-14 00:26:40-04	2020-08-14 00:26:40-04
3	Kid's	kids	\N	/storage/photos/1/Category/mini-banner3.jpg	t	\N	\N	active	2020-08-14 00:27:10-04	2020-08-14 00:27:42-04
4	T-shirt's	t-shirts	\N	\N	f	1	\N	active	2020-08-14 00:32:14-04	2020-08-14 00:32:14-04
5	Jeans pants	jeans-pants	\N	\N	f	1	\N	active	2020-08-14 00:32:49-04	2020-08-14 00:32:49-04
6	Sweater & Jackets	sweater-jackets	\N	\N	f	1	\N	active	2020-08-14 00:33:37-04	2020-08-14 00:33:37-04
7	Rain Coats & Trenches	rain-coats-trenches	\N	\N	f	1	\N	active	2020-08-14 00:34:04-04	2020-08-14 00:34:04-04
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.coupons (id, code, type, value, status, created_at, updated_at) FROM stdin;
1	abc123	fixed	300.00	active	\N	\N
2	111111	percent	10.00	active	\N	\N
5	abcd	fixed	250.00	active	2020-08-17 16:54:58-04	2020-08-17 16:54:58-04
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.messages (id, name, subject, email, photo, phone, message, read_at, created_at, updated_at) FROM stdin;
1	Prajwal Rai	About price	prajwal.iar@gmail.com	\N	9807009999	Hello sir i am from kathmandu nepal.	2020-08-14 04:25:46-04	2020-08-14 04:00:01-04	2020-08-14 04:25:46-04
2	Prajwal Rai	About Price	prajwal.iar@gmail.com	\N	9800099000	Hello i am Prajwal Rai	2020-08-17 23:04:15-04	2020-08-15 03:52:39-04	2020-08-17 23:04:16-04
3	Prajwal Rai	lorem ipsum	prajwal.iar@gmail.com	\N	1200990009	hello sir sdfdfd dfdjf ;dfjd fd ldkfd	\N	2020-08-17 17:15:12-04	2020-08-17 17:15:12-04
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2020_07_10_021010_create_brands_table	1
5	2020_07_10_025334_create_banners_table	1
6	2020_07_10_112147_create_categories_table	1
7	2020_07_11_063857_create_products_table	1
8	2020_07_12_073132_create_post_categories_table	1
9	2020_07_12_073701_create_post_tags_table	1
10	2020_07_12_083638_create_posts_table	1
11	2020_07_13_151329_create_messages_table	1
12	2020_07_14_023748_create_shippings_table	1
13	2020_07_15_054356_create_orders_table	1
14	2020_07_15_102626_create_carts_table	1
15	2020_07_16_041623_create_notifications_table	1
16	2020_07_16_053240_create_coupons_table	1
17	2020_07_23_143757_create_wishlists_table	1
18	2020_07_24_074930_create_product_reviews_table	1
19	2020_07_24_131727_create_post_comments_table	1
20	2020_08_01_143408_create_settings_table	1
21	2019_12_14_000001_create_personal_access_tokens_table	2
22	2023_06_21_164432_create_jobs_table	2
23	2025_05_28_152152_create_reports_table	2
24	2025_05_28_173316_add_reporter_info_to_reports_table	3
25	2025_05_29_213441_create_report_responses_table	4
26	2025_05_30_050643_add_file_path_to_report_responses	5
27	2025_05_30_111828_create_report_comments_table	6
28	2025_05_30_121009_add_payment_fields_to_report_comments	7
29	2025_06_23_102224_add_subject_and_event_address_fields_to_reports_table	8
30	2025_06_23_111426_add_subject_contact_fields_to_reports_table	8
31	2025_06_23_133348_add_credits_comment_fields_to_users_table	8
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at) FROM stdin;
2145a8e3-687d-444a-8873-b3b2fb77a342	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}	\N	2020-08-15 03:31:21-04	2020-08-15 03:31:21-04
3af39f84-cab4-4152-9202-d448435c67de	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New order created","actionURL":"http:\\/\\/localhost:8000\\/admin\\/order\\/4","fas":"fa-file-alt"}	\N	2020-08-15 03:54:52-04	2020-08-15 03:54:52-04
4a0afdb0-71ad-4ce6-bc70-c92ef491a525	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New Comment created","actionURL":"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s","fas":"fas fa-comment"}	\N	2020-08-17 17:13:51-04	2020-08-17 17:13:51-04
540ca3e9-0ff9-4e2e-9db3-6b5abc823422	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}	2020-08-15 03:30:44-04	2020-08-14 03:12:28-04	2020-08-15 03:30:44-04
5da09dd1-3ffc-43b0-aba2-a4260ba4cc76	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New Comment created","actionURL":"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage","fas":"fas fa-comment"}	\N	2020-08-15 03:51:02-04	2020-08-15 03:51:02-04
5e91e603-024e-45c5-b22f-36931fef0d90	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New Product Rating!","actionURL":"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t","fas":"fa-star"}	\N	2020-08-15 03:44:07-04	2020-08-15 03:44:07-04
73a3b51a-416a-4e7d-8ca2-53b216d9ad8e	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}	\N	2020-08-14 03:11:03-04	2020-08-14 03:11:03-04
8605db5d-1462-496e-8b5f-8b923d88912c	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New order created","actionURL":"http:\\/\\/e-shop.loc\\/admin\\/order\\/1","fas":"fa-file-alt"}	\N	2020-08-14 03:20:44-04	2020-08-14 03:20:44-04
a6ec5643-748c-4128-92e2-9a9f293f53b5	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New order created","actionURL":"http:\\/\\/localhost:8000\\/admin\\/order\\/5","fas":"fa-file-alt"}	\N	2020-08-17 17:17:03-04	2020-08-17 17:17:03-04
b186a883-42f2-4a05-8fc5-f0d3e10309ff	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New order created","actionURL":"http:\\/\\/e-shop.loc\\/admin\\/order\\/2","fas":"fa-file-alt"}	2020-08-15 00:17:24-04	2020-08-14 18:14:55-04	2020-08-15 00:17:24-04
d2fd7c33-b0fe-47d6-8bc6-f377d404080d	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}	\N	2020-08-14 03:08:50-04	2020-08-14 03:08:50-04
dff78b90-85c8-42ee-a5b1-de8ad0b21be4	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New order created","actionURL":"http:\\/\\/e-shop.loc\\/admin\\/order\\/3","fas":"fa-file-alt"}	\N	2020-08-15 02:40:54-04	2020-08-15 02:40:54-04
e28b0a73-4819-4016-b915-0e525d4148f5	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New Product Rating!","actionURL":"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply","fas":"fa-star"}	\N	2020-08-17 17:08:16-04	2020-08-17 17:08:16-04
ffffa177-c54e-4dfe-ba43-27c466ff1f4b	App\\Notifications\\StatusNotification	App\\User	1	{"title":"New Comment created","actionURL":"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s","fas":"fas fa-comment"}	\N	2020-08-17 17:13:29-04	2020-08-17 17:13:29-04
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.orders (id, order_number, user_id, sub_total, shipping_id, coupon, total_amount, quantity, payment_method, payment_status, status, first_name, last_name, email, phone, country, post_code, address1, address2, created_at, updated_at) FROM stdin;
1	ORD-PMIQF5MYPK	\N	14399	1	573.9	13925.1	6	cod	unpaid	delivered	Prajwal	Rai	prajwal.iar@gmail.com	9800887778	NP	44600	Koteshwor	Kathmandu	2020-08-14 03:20:44-04	2020-08-14 05:37:37-04
2	ORD-YFF8BF0YBK	2	1939.03	1	\N	2039.03	1	cod	unpaid	delivered	Sandhya	Rai	user@gmail.com	90000000990	NP	\N	Lalitpur	\N	2020-08-14 18:14:49-04	2020-08-14 18:15:19-04
3	ORD-1CKWRWTTIK	\N	200	1	\N	300	1	paypal	paid	process	Prajwal	Rai	prajwal.iar@gmail.com	9807009999	NP	44600	Kathmandu	Kadaghari	2020-08-15 02:40:49-04	2020-08-17 16:52:40-04
4	ORD-HVO0KX0YHW	\N	23660	3	150	23910	6	paypal	paid	new	Prajwal	Rai	prajwal.iar@gmail.com	9800098878	NP	44600	Pokhara	\N	2020-08-15 03:54:52-04	2020-08-15 03:54:52-04
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_categories; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.post_categories (id, title, slug, status, created_at, updated_at) FROM stdin;
7	Rules on the site	rules-on-the-site	active	2025-05-30 03:23:10-04	2025-05-30 03:23:10-04
\.


--
-- Data for Name: post_comments; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.post_comments (id, user_id, post_id, comment, status, replied_comment, parent_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_tags; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.post_tags (id, title, slug, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.posts (id, title, slug, summary, description, quote, photo, tags, post_cat_id, post_tag_id, added_by, status, created_at, updated_at) FROM stdin;
7	ABSOLUTE AND COMPLETE REQUIREMENT FOR  REPORTING UNDER ONE’S OWN NAME	absolute-and-complete-requirement-for-reporting-under-ones-own-name	<p>Every Report on RapeReportDB.com must be made under the Actual Name of the Person to Whom the Sexual Violence or Misconduct was committed.</p><div><br></div>	<p>Every Report on RapeReportDB.com must be made under the Actual Name of the Person to Whom the Sexual Violence or Misconduct was committed.</p><p><br></p><p><span style="white-space: normal;"><span style="white-space:pre">\t</span>The Reason for this strict, no-Exceptions Policy of requiring all Reports to be made under The Reporter’s own Name is instituted and enforced for the express purpose of reducing, and eventually hopefully eliminating (at some point in the future), the Stigma that is now ascribed -- altogether-unfittingly and -improperly, IMHO -- in our current culture to Persons Subjected to Acts of Sexual Violence or Misconduct.</span></p><div><br></div>	\N	http://localhost/storage/photos/1/09_25_42 PM.png		7	\N	\N	active	2025-05-30 03:30:07-04	2025-05-30 03:30:18-04
8	NOMENCLATURE  -  (Definitions and Usage of Words and Phrases)	nomenclature-definitions-and-usage-of-words-and-phrases	<p>As you may have noticed, pronouns can cause some problems.</p><div><br></div>	<p>As you may have noticed, pronouns can cause some problems.</p><p><br></p><p><span style="white-space: normal;"><span style="white-space:pre">\t</span>I don’t like the word Victim, mostly because I sense some resistance among Victims to the word. --- Thus, I try to avoid the use of the word Victim.</span></p><p><br></p><p><span style="white-space: normal;"><span style="white-space:pre">\t</span>Victims are thus referred to as Reporters, Rapees or Persons Subjected to Acts of Sexual Violence or Misconduct.&nbsp;&nbsp;</span></p><p><br></p><p><span style="white-space: normal;"><span style="white-space:pre">\t</span>I also don’t like the word Rapist. --- The reason why I don’t like the word Rapist is because the word Rapist has the suffix “–ist” at the end of it. --- This suffix -- “-ist” -- is currently a part of the word “Rapist” precisely because Rape used to have a Good Connotation (which the “–ist” suffix otherwise Connotes). --- Around 300 years ago, this was apparently true.</span></p><p><br></p><p><span style="white-space: normal;"><span style="white-space:pre">\t</span>Well, it certainly isn’t true anymore. --- Rapers are not anything good or possessed of even the slightest socially-redeeming value. --- Rapers should be Identified and Shunned from decent society.</span></p><p><br></p><p><span style="white-space: normal;"><span style="white-space:pre">\t</span>Rapers are referred to, in the alternative, as Report Subjects or simply Subjects, or else Sexual Deviates or Deviants.</span></p><div><br></div>	<p><br></p>	\N		7	\N	\N	active	2025-05-30 03:33:02-04	2025-05-30 03:33:02-04
9	PREFERRED STYLE OF REPORTING: -- CLINICAL & PROFESSIONAL	preferred-style-of-reporting-clinical-professional	<p>Although I am not requiring it absolutely, I strongly urge all Reporters to Report in as fact-based and emotion-free a manner as they possibly can</p>	<p>Although I am not requiring it absolutely, I strongly urge all Reporters to Report in as fact-based and emotion-free a manner as they possibly can. --- The reason for this is my Firm Belief that the most Clinical Description is the most persuasive. --- Name-Calling is strongly discouraged at all times, by all Parties and Commenters.</p><p><span style="white-space: pre;">\t</span>Language should be as clinical as possible. --- Our Species’ Primary and Secondary Sex Characteristics are known as: the Vagina, the Penis, the Breasts, the Mouth and the Anus. --- Colloquialisms for these body parts, or any other body parts, for that matter, are disfavored and discouraged at all times.</p><p><span style="white-space: pre;">\t</span>There is an important exception to this Policy of Discouraging Emotional, Name-Calling or Non-Clinical language: -- Anything that the Raper says that is relevant in the slightest way to the Rape or other Sexual Misconduct NOT ONLY CAN BE REPORTED, BUT SHOULD BE REPORTED.&nbsp;&nbsp;</p><p>Statements made by Deviants that are Audible to the Persons they Subject to Acts of Sexual Violence or Misconduct during the Commission of their Rapes or other Misconduct are properly known as CONFESSIONS;&nbsp; and CONFESSIONS Absolutely and Un-Equivocally Should be Reported in all Cases wherein they occur, with the greatest detail that the Reporter can possibly muster.</p><p><span style="white-space: pre;">\t</span>The account of the Rape given by the Rapee, however, should always, to the extent reasonably-practical, maintain the clinical, un-emotional tone that best serves the Adjudication Process.</p>	\N	\N		7	\N	\N	active	2025-05-30 03:35:32-04	2025-05-30 03:36:28-04
10	Culture of Presumptive Belief of Reporters	culture-of-presumptive-belief-of-reporters	<p>The Culture of this Site is that Reporters are presumptively believed.&nbsp; Subjects of Reports may Answer, if they choose to, and are encouraged to do so.</p>	<p>The Culture of this Site is that Reporters are presumptively believed.&nbsp; Subjects of Reports may Answer, if they choose to, and are encouraged to do so.</p><p><br></p><p>At bottom, Verdicts after Trial will be decided by means of popular Vote of Registered non-Parties. --- This is essentially Trial by Jury, where the Jury is the Participating Public.</p><p><br></p><p>Motions will be Decided by Paralegals providing Adjudication Services in return for being Paid by RapeReportDB.com, according to the Federal Rules of Civil Procedure and the Federal Rules of Evidence, taking Full Note of the results of Public Votes on said Motions..</p><p><br></p><p>Reporters, and Subjects who Answer, BOTH bear the burden of proving their Allegations via the submission of Admissible Evidence.</p><div><br></div>	\N	\N		7	\N	\N	active	2025-05-30 03:40:48-04	2025-05-30 03:40:48-04
11	PROCESS FOR PRIVATE, LIMITED, QUASI-JUDICIAL REDRESS OF GRIEVANCES ARISING FROM ACTS OF SEXUAL VIOLENCE AND / OR SEXUAL MISCONDUCT	process-for-private-limited-quasi-judicial-redress-of-grievances-arising-from-acts-of-sexual-violence-and-or-sexual-misconduct	<p>The Private, Limited process that RapeReportDB.com will provide is</p>	<p>The Private, Limited process that RapeReportDB.com will provide is</p><p>deliberately modeled after the legal due process rendered in Civil Courts across our</p><p>Country every weekday of the year.</p><p><br></p><p>10</p><p>The Civil Litigation process begins with the Filing of a Summons and</p><p>Complaint. --- Here, the Complaint is your Written Report posted on the site. ---</p><p>The Complaint must be Written, in the first instance.</p><p><br></p><p>The Reporter must Report all known information about the Identity and</p><p>Location of the Raper or other Sexual Deviant, in order to best achieve the specific</p><p>objective of informing the Raper or other Sexual Deviant of the Report that has</p><p>been made against them.</p>	\N	\N		7	\N	\N	active	2025-06-23 10:48:14-04	2025-06-23 10:48:38-04
12	Participation in Private System of Adjudication is Never Required, but Non- Participation Carries the Possibility of Grant of Motions to Dismiss	participation-in-private-system-of-adjudication-is-never-required-but-non-participation-carries-the-possibility-of-grant-of-motions-to-dismiss	<p>Reporters AND Subjects, BOTH, are UNDER NO OBLIGATION to</p>	<p>Reporters AND Subjects, BOTH, are UNDER NO OBLIGATION to</p><p>Participate at any time beyond the Original Report. --- Participation in the Private</p><p>Adjudication process is something I always hope for – not least because I make</p><p>more money that way – BUT IS NEVER REQUIRED.</p><p><br></p><p>HOWEVER, one of the Motions permitted under the Federal Rules of Civil</p><p>Procedure are Motions to Dismiss (F.R. Civ. P. Rule 12). --- Motions to Dismiss</p><p><br></p><p>11</p><p>by Subjects that are NOT RESPONDED TO will result in a Notation on that</p><p>Report in the RapeReportDB.com Database that a Motion to Dismiss has been</p><p>Granted for Failure to Participate in the Adjudication of said Motion to Dismiss.</p>	\N	\N		7	\N	\N	active	2025-06-23 10:49:15-04	2025-06-23 10:49:29-04
13	Reports, once Posted, are Never Removed, Motions to Dismiss that are Granted are Noted in Report Data	reports-once-posted-are-never-removed-motions-to-dismiss-that-are-granted-are-noted-in-report-data	<p>ALL REPORTS, once Posted on the Site, ARE NEVER REMOVED.---&nbsp;<span style="font-size: 1rem;">Motions to Dismiss that are Granted</span></p>	<p>ALL REPORTS, once Posted on the Site, ARE NEVER REMOVED. ---</p><p>Motions to Dismiss that are Granted are Noted in the Report Data (just like all</p><p>other Motions are), but Reports themselves ARE NEVER REMOVED from the</p><p>Database.</p><p><br></p><p>(Posting in-Perpetuity will require Additional Fees from Reporters in future</p><p>years to maintain their Report on the Database. --- This Fee is currently $12 per</p><p>year, and is subject to increase beginning on January 1 st , 2027, for Reports Posted</p><p>after that date.)</p><p><br></p><p>12</p><p>Once the Report has been Posted, and at least attempted to be delivered, then</p><p>comes the Answer from those Report Subjects who can be identified and Served</p><p>with the Report who Choose to Answer.</p><p><br></p><p>After the Answer is Filed, Replies from the Reporter, and Sur-Replies from</p><p>the Subject of the Report are Permitted.</p><p><br></p><p>Then, the Processes of Motions and Discovery begin, ending, where</p><p>possible, with a Trial. --- Trials, when they happen, will be via Zoom, Teams or</p><p>other, similar Video Service.</p><p><br></p><p>Judgments will be rendered via Jury Verdict, with Registered non-Parties</p><p>Voting on the Verdict. --- Motions will be decided by Paralegals, Fully-</p><p>Independent-of, but taking Equally-Full Note-of the Vote of Registered non-Party</p><p>Users of RapeReportDB.com.</p><p><br></p><p>The Justice that I offer will be Real, and Just.</p><p><br></p><p>13</p><p>The Rules will be those of the Federal Rules of Civil Procedure and the</p><p>Federal Rules of Evidence, modified as necessary and appropriate for the purpose</p><p>of the private Web-based Adjudications that I now Offer.</p><p><br></p><p>(Where there is Conflict between the United States Circuit Courts of Appeal</p><p>on any Issue where there is NO Controlling Precedent from the United States</p><p>Supreme Court, the Precedent from the Second Circuit shall Control on that issue.)</p><p><br></p><p>If the Raper or other Sexual Deviant should choose to Answer, then the</p><p>Reporter will, of course, have the right to Reply to any Answer Filed by the</p><p>Subject of the Report.</p><p><br></p><p>Although Video Reporting is Offered, and is presumptively Evidence</p><p>Admissible at Trial, Written Pleadings will always be required, at least in the first</p><p>instance, specifically in order to best enable the Publication and Research</p><p>Functions designed-into this Site.</p><p><br></p><p>Essentially, there is a Jury, and it is the Entire User Community of the Site,</p><p>which is open to all citizens of our Planet.</p>	\N	\N		7	\N	\N	active	2025-06-23 10:50:17-04	2025-06-23 10:51:09-04
\.


--
-- Data for Name: product_reviews; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.product_reviews (id, user_id, product_id, rate, review, status, created_at, updated_at) FROM stdin;
1	\N	2	5	nice product	active	2020-08-15 03:44:05-04	2020-08-15 03:44:05-04
2	2	9	5	nice	active	2020-08-17 17:08:14-04	2020-08-17 17:18:31-04
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.products (id, title, slug, summary, description, photo, stock, size, condition, status, price, discount, is_featured, cat_id, child_cat_id, brand_id, created_at, updated_at) FROM stdin;
1	Melange Casual Black	melange-casual-black	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span><br></p>	<h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">The standard Lorem Ipsum passage, used since the 1500s</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p>	/storage/photos/1/Products/405b7-pmtk004t.jpg,/storage/photos/1/Products/43f35-2_2.jpg	5	S,M,XL	new	active	600	10	t	1	4	4	2020-08-14 00:38:26-04	2020-08-14 00:42:46-04
2	White Sports Casual T-	white-sports-casual-t	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and</span><br></p>	<h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">The standard Lorem Ipsum passage, used since the 1500s</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p>	/storage/photos/1/Products/1d60f-2.jpg	3	XL	hot	active	400	4	t	1	4	2	2020-08-14 00:40:21-04	2020-08-14 02:26:01-04
3	Summer Round Neck T	summer-round-neck-t	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore</span><br></p>	<h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3>	/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/01bc5-mpd006b.jpg,/storage/photos/1/Products/0122b-wsd000t.jpg	6	S,M	hot	active	3000	5	f	2	\N	2	2020-08-14 01:57:48-04	2020-08-14 01:57:48-04
4	Melange Ethnic Kurthi	melange-ethnic-kurthi	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,</span><br></p>	<h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3>	/storage/photos/1/Products/0a402-image4xxl-3-.jpg,/storage/photos/1/Products/2282b-wsd008t.jpg,/storage/photos/1/Products/21951-image4xxl.jpg	5	XL	default	active	4000	50	f	2	\N	1	2020-08-14 02:04:13-04	2020-08-14 02:04:13-04
5	Cotton High Quality Kurt	cotton-high-quality-kurt	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,</span><br></p>	<h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."</p>	/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/086c2-a1.jpg,/storage/photos/1/Products/09a16-mpd000t_6.jpg,/storage/photos/1/Products/0c2d2-wbk012c-royal-blue.jpg	0	M,XL	new	active	4000	10	f	3	\N	3	2020-08-14 02:10:52-04	2020-08-14 05:37:36-04
6	Ladies Cotton Kurti Sha	ladies-cotton-kurti-sha	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system,</span><br></p>	<h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."</p>	/storage/photos/1/Products/6a8b5-wsd013t.jpg,/storage/photos/1/Products/5ded8-image1xxl-5-.jpg,/storage/photos/1/Products/74840-image4xxl-6-.jpg	6	M,L	hot	active	6000	3	t	3	\N	4	2020-08-14 02:13:20-04	2020-08-14 02:31:42-04
7	GRAY BABY ROMPERS	gray-baby-rompers	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system,</span><br></p>	<h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their du</p>	/storage/photos/1/Products/08ec9-n3.jpg,/storage/photos/1/Products/07e30-mtk006b.jpg,/storage/photos/1/Products/18b18-wbk003b.jpg	0	L	hot	active	1999	3	f	3	\N	1	2020-08-14 02:23:33-04	2020-08-14 18:15:19-04
8	Baby Girls' 2-Piece Yell	baby-girls-2-piece-yell	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,</span><br></p>	<h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."</p><h3 style="margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">1914 translation by H. Rackham</h3><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their du</p>	/storage/photos/1/Products/calvin-klein.jpg,/storage/photos/1/Products/calvin.jpg,/storage/photos/1/Products/d3fdb-image2xxl-4-.jpg	1	S	new	active	200	0	f	3	\N	2	2020-08-14 02:25:42-04	2020-08-14 05:37:36-04
9	Lorem Ipsum is simply	lorem-ipsum-is-simply	<p><strong style="margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>	<p><strong style="margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">orem Ipsum</strong><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p><p><strong style="margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">orem Ipsum</strong><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p><p><strong style="margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">orem Ipsum</strong><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><br></p>	/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04776-pms000a.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg	4	S,M,XL	new	active	200	5	f	2	\N	3	2020-08-15 02:52:44-04	2020-08-15 02:53:14-04
10	Lorem Ipsum is simply	lorem-ipsum-is-simply-2008183507-655	<p><strong style="margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry.&nbsp;</span><br></p>	<p><strong style="margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p><p><strong style="margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p><p><strong style="margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><br></p>	/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg	3	L,XL	hot	active	300	10	f	1	4	3	2020-08-17 16:50:07-04	2020-08-17 16:50:07-04
\.


--
-- Data for Name: report_comments; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.report_comments (id, user_id, report_id, user_fullname, content, is_paid, payment_status, paid_at, created_at, updated_at) FROM stdin;
2	34	3	Emily Brown	This situation seems serious. Is there any HR involvement?	t	paid	2025-05-30 14:45:11-04	2025-05-30 14:45:11-04	2025-05-30 14:45:11-04
3	35	3	Michael Lee	I think we need to hear more from other colleagues before making a judgment.	t	paid	2025-05-30 14:49:00-04	2025-05-30 14:49:00-04	2025-05-30 14:49:00-04
4	2	4	Steve Nguyen	The evidence provided seems compelling. I vote in favor of the Reporter.	t	paid	2025-05-30 15:05:43-04	2025-05-30 15:05:43-04	2025-05-30 15:05:43-04
\.


--
-- Data for Name: report_responses; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.report_responses (id, user_id, report_id, user_fullname, type, content, file_path, is_paid, payment_status, paid_at, created_at, updated_at) FROM stdin;
11	33	3	Smith Jane	subject_responses	I strongly deny ever threatening or humiliating the reporter. All my interactions during meetings have been professional and task-focused. If the reporter perceived them otherwise, I regret the misunderstanding.	reports_responses/dummy_1748630224.pdf	t	paid	2025-05-30 14:37:32-04	2025-05-30 14:37:32-04	2025-05-30 14:37:32-04
12	2	3	Steve Nguyen	reporter_reply	During several team briefings, Smith Jane made sarcastic remarks about my appearance and openly questioned my competence in front of peers.	\N	t	paid	2025-05-30 14:41:28-04	2025-05-30 14:41:28-04	2025-05-30 14:41:28-04
13	37	4	David Parker	subject_responses	I acknowledge we exchanged messages after hours, but they were brief and work-related. I had no intent to cause discomfort and will ensure clearer boundaries moving forward.	reports_responses/471569339-10162487268307698-9200908633938096809-n_1748631483.jpg	t	paid	2025-05-30 14:58:28-04	2025-05-30 14:58:28-04	2025-05-30 14:58:28-04
14	36	4	Karen Thomas	reporter_reply	I have never made comments about anyone’s accent or background. This claim is completely false. I value diversity and have always treated all colleagues with respect	\N	t	paid	2025-05-30 15:03:44-04	2025-05-30 15:03:44-04	2025-05-30 15:03:44-04
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.reports (id, reporter_id, reporter_name, reporter_email, type_event, description, event_date, event_location, video_link, subject_fullname, subject_location, alternate_reporter_name, report_number, status, is_paid, payment_status, paid_at, created_at, updated_at, subject_address, subject_city, subject_state, subject_zipcode, subject_country, event_address, event_city, event_state, event_zipcode, event_country, video_path, letter_path, total_comment, subject_email, subject_phone) FROM stdin;
3	2	Steve Nguyen	user@gmail.com	Rape	Smith Jane repeatedly made threatening remarks and publicly humiliated me during meetings. This has continued over several months, creating an unbearable working environment.	2025-05-28	NY, USA	https://www.youtube.com/watch?v=7oqk_L1b4D4	Smith Jane	NY, USA	\N	2025-RRDB-6839F9BDDE42C	pending	t	paid	2025-05-30 14:32:29-04	2025-05-30 14:32:29-04	2025-05-30 14:32:29-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N
4	36	Karen Thomas	karenthomas@gmail.com	Sexual Harassment	During multiple team interactions,  David Parker made sexually suggestive jokes and comments directed at me. Despite my requests to stop, the behavior continued and made me feel unsafe.	2025-05-27	Albany, NY, USA	https://www.youtube.com/watch?v=Egsp7JM8-Ds	David Parker	Albany, NY, USA	\N	2025-RRDB-6839FEC01B5DE	pending	t	paid	2025-05-30 14:53:52-04	2025-05-30 14:53:52-04	2025-05-30 14:53:52-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N
5	38	Jacksmith	jacksmith@yopmail.com	Rape	test	2025-06-04	\N	\N	John Doe	Somerset NJ usa	\N	2025-RRDB-684B023BA57A3	pending	t	paid	2025-06-12 12:37:15-04	2025-06-12 12:37:15-04	2025-06-12 12:37:15-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N
6	39	Steven William	stevenwilliam@yopmail.com	Rape	this is a  test	2025-06-02	\N	https://www.youtube.com/watch?v=X4my07dsyrw	David Shon	New York city, NY USA	\N	2025-RRDB-684B24A907FA6	pending	t	paid	2025-06-12 15:04:09-04	2025-06-12 15:04:09-04	2025-06-12 15:04:09-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.settings (id, description, short_des, logo, photo, address, phone, email, created_at, updated_at) FROM stdin;
1	<section data-aos="\\&quot;fade-up\\&quot;" class="bg-light py-5">\r\n  <div class="container">\r\n    <div class="card shadow-sm border-0">\r\n      <div class="card-body">\r\n        <h2 class="section-title text-primary mb-4" style="text-transform: uppercase;">Welcome to RapeReportDB.com</h2>\r\n        <ul class="list-unstyled fs-5" style="font-weight: bold;">\r\n          <li class="mb-3"> My name is John Sovak d-b-a Deviate Report DB.com, and I am the Owner and Operator of RapeReportDB.com</li>\r\n          <li class="mb-3"> Contact Information:</li>\r\n          <li class="mb-3"> E-Mail Address:  <a href="mailto:deviateReportdb.com@gmail.com" style="color: #0d6efd;">DeviateReportDB.com@gmail.com</a> </li>\r\n          <li class="mb-3"> Telephone Number:  <a href="tel:+18453571740" style="color: #0d6efd;">(845) 357-1740</a></li>\r\n          <li class="mb-3"> <small>(Please Note that Phone Calls from Numbers Unknown to me are NOT Answered. --- Initial Inquiries MUST BE via E-Mail.)</small> </li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n<section data-aos="\\&quot;fade-up\\&quot;" class="bg-light py-5">\r\n  <div class="container">\r\n    <div class="card shadow-sm border-0">\r\n      <div class="card-body">\r\n        <h2 class="section-title text-primary mb-4"><i class="ti-tag"></i>Purpose of RapeReportDB.com</h2>\r\n        <ul class="list-unstyled fs-5">\r\n          <li class="mb-3"><i class="ti-check"></i> To provide a means for persons to Report any and all experiences that they have experienced involving Sexual Misconduct (e.g., Rape, Sexual Assault, Sexual Abuse and/or Sexual Harassment) committed against them by another person.</li>\r\n          <li class="mb-3"><i class="ti-check"></i> To Provide a means of Private, Limited, Quasi-Judicial Redress for Grievances arising from occurrences of Sexual Violence and/or All Levels and Forms of lesser Sexual Misconduct.</li>\r\n          <li class="mb-3"><i class="ti-check"></i> To Lessen and Ultimately Eliminate the Stigma that Now Attaches to Persons Subject to Acts of Sexual Violence and/or Sexual Misconduct.</li>\r\n          <li class="mb-3"><i class="ti-check"></i> To Create and Maintain the RapeReportDB.com Database as a permanent Data Base, for the Express Purpose of Publicizing, Shunning and Ostracizing All Sexual Predators who Populate our American and Planet Earth Communities.</li>\r\n          <li class="mb-3"><i class="ti-check"></i> To Create, and Continually Enhance, the Social Utility of the RapeReportDB.com Database as a means for the Discernment, Discovery and Identification of Serial, Repeat or other Patterns of Sexual Violence and/or Misconduct, or the Perpetrators thereof.</li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n<!-- Start Shop Services Area -->\r\n<section class="shop-services section home">\r\n    <div class="container">\r\n        <div class="row">\r\n            <div class="col-lg-6 col-md-6 col-12">\r\n                <!-- Start Single Service -->\r\n                <div class="single-service">\r\n                    <i class="ti-rocket"></i>\r\n                    <h4>Reporter</h4>\r\n                    <p>Persons who report acts of sexual misconduct. Also referred to as Rapees.</p>\r\n                </div>\r\n                <!-- End Single Service -->\r\n            </div>\r\n            <div class="col-lg-6 col-md-6 col-12">\r\n                <!-- Start Single Service -->\r\n                <div class="single-service">\r\n                    <i class="ti-reload"></i>\r\n                    <h4>Subject</h4>\r\n                    <p>Persons accused of sexual misconduct. Also referred to as Deviants.</p>\r\n                </div>\r\n                <!-- End Single Service -->\r\n            </div>\r\n            \r\n        </div>\r\n    </div>\r\n</section>\r\n<!-- End Shop Services Area -->\r\n<section data-aos="\\&quot;fade-up\\&quot;" class="aos-init aos-animate">\r\n  <div class="container">\r\n    <h2 class="section-title text-center">Fees</h2>\r\n    <div class="table-responsive">\r\n      <table class="table table-bordered text-center">\r\n        <thead class="table-dark">\r\n          <tr>\r\n            <th>Service</th>\r\n            <th>Fee (USD)</th>\r\n          </tr>\r\n        </thead>\r\n        <tbody>\r\n          <tr><td>Report / Answer / Reply</td><td>$49.00</td></tr>\r\n          <tr><td>Comment / Vote</td><td>$0.49</td></tr>\r\n          <tr><td>Video Statement</td><td>$29.00</td></tr>\r\n          <tr><td>Physical Letter to Subject</td><td>$29.00</td></tr>\r\n        </tbody>\r\n      </table>\r\n      <center>(Payments are made through the Stripe Payment Platform, so the Prices stated above are subject to an additional 3% plus 30 cents per Transaction to cover Stripe’s Fees. --- So: -- $49.00 = $50.77, actual; -- $12.25 = $12.92, actual; -- $29.00 = $30.17, actual; -- and, finally -- $300 = $309.30, actual.)</center>\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n<section data-aos="\\&quot;fade-up\\&quot;" class="bg-light aos-init aos-animate">\r\n  <div class="container">\r\n    <h2 class="section-title text-center">A Process of Private, quasi-Judicial Dispute Resolution is also Offered, but is NOT (= NEVER) Required.</h2>\r\n    <p class="lead text-center">A Process of Private, quasi-Judicial Dispute Resolution is also Offered, but is NOT (= NEVER) Required.</p>\r\n    <p class="lead text-center">The system of Private Dispute Resolution that I Offer allows for All Paid Users to participate in the Adjudication of both Motions and Trials via Voting thereon.</p>\r\n    <p class="lead text-center">Independent Paralegals Adjudicate the Motions after Users Vote thereon, and they will also make Rulings at Trial, ALL according to the Federal Rules of Civil Procedure and the Federal Rules of Evidence.\r\n\r\n</p>\r\n  </div>\r\n</section>	<div><b><u>ABSOLUTE AND COMPLETE REQUIREMENT FOR&nbsp;<span style="font-size: 1rem;">REPORTING UNDER ONE’S OWN NAME</span></u></b></div><div><br></div><div>Every Report on RapeReportDB.com must be made under the Actual Name&nbsp;<span style="font-size: 1rem;">of the Person to Whom the Sexual Violence or Misconduct was committed.</span></div><div><br></div><div>The Reason for this strict, no-Exceptions Policy of requiring all Reports to&nbsp;<span style="font-size: 1rem;">be made under The Reporter’s own Name is instituted and enforced for the express&nbsp;</span><span style="font-size: 1rem;">purpose of reducing, and eventually hopefully eliminating (at some point in the&nbsp;</span><span style="font-size: 1rem;">future), the Stigma that is now ascribed -- altogether-unfittingly and -improperly,&nbsp;</span><span style="font-size: 1rem;">IMHO -- in our current culture to Persons Subjected to Acts of Sexual Violence or&nbsp;</span><span style="font-size: 1rem;">Misconduct.</span></div><div><br></div><div><br></div><div><b><u>NOMENCLATURE - (Definitions and Usage of Words and Phrases)</u></b></div><div><br></div><div>As you may have noticed, pronouns can cause some problems.</div><div><br></div><div>I don’t like the word Victim, mostly because I sense some resistance among&nbsp;<span style="font-size: 1rem;">Victims to the word. --- Thus, I try to avoid the use of the word Victim.</span></div><div><br></div><div>Victims are thus referred to as Reporters, Rapees or Persons Subjected to&nbsp;<span style="font-size: 1rem;">Acts of Sexual Violence or Misconduct.</span></div><div><br></div><div>I also don’t like the word Rapist. --- The reason why I don’t like the word&nbsp;<span style="font-size: 1rem;">Rapist is because the word Rapist has the suffix “–ist” at the end of it. --- This&nbsp;</span><span style="font-size: 1rem;">suffix -- “-ist” -- is currently a part of the word “Rapist” precisely because Rape&nbsp;</span><span style="font-size: 1rem;">used to have a Good Connotation (which the “–ist” suffix otherwise Connotes). ---&nbsp;</span><span style="font-size: 1rem;">Around 300 years ago, this was apparently true.</span></div><div><br></div><div>Well, it certainly isn’t true anymore. --- Rapers are not anything good or&nbsp;<span style="font-size: 1rem;">possessed of even the slightest socially-redeeming value. --- Rapers should be&nbsp;</span><span style="font-size: 1rem;">Identified and Shunned from decent society.</span></div><div><br></div><div>Rapers are referred to, in the alternative, as Report Subjects or simply&nbsp;<span style="font-size: 1rem;">Subjects, or else Sexual Deviates or Deviants.</span></div><div><span style="font-size: 1rem;"><br></span></div><div><br></div><div><b><u>PREFERRED STYLE OF REPORTING: -- CLINICAL &amp;amp; PROFESSIONAL</u></b></div><div><br></div><div>Although I am not requiring it absolutely, I strongly urge all Reporters to&nbsp;&nbsp;<span style="font-size: 1rem;">Report in as fact-based and emotion-free a manner as they possibly can. --- The&nbsp;</span><span style="font-size: 1rem;">reason for this is my Firm Belief that the most Clinical Description is the most&nbsp;</span><span style="font-size: 1rem;">persuasive. --- Name-Calling is strongly discouraged at all times, by all Parties and&nbsp;</span><span style="font-size: 1rem;">Commenters.</span></div><div><br></div><div>Language should be as clinical as possible. --- Our Species’ Primary and&nbsp;<span style="font-size: 1rem;">Secondary Sex Characteristics are known as: the Vagina, the Penis, the Breasts, the&nbsp;</span><span style="font-size: 1rem;">Mouth and the Anus. --- Colloquialisms for these body parts, or any other body&nbsp;</span><span style="font-size: 1rem;">parts, for that matter, are disfavored and discouraged at all times.</span></div><div><br></div><div>There is an important exception to this Policy of Discouraging Emotional,&nbsp;<span style="font-size: 1rem;">Name-Calling or Non-Clinical language: -- Anything that the Raper says that is&nbsp;</span><span style="font-size: 1rem;">relevant in the slightest way to the Rape or other Sexual Misconduct NOT ONLY&nbsp;</span><span style="font-size: 1rem;">CAN BE REPORTED, BUT SHOULD BE REPORTED.</span></div><div><br></div><div>Statements made by Deviants that are Audible to the Persons they Subject to&nbsp;<span style="font-size: 1rem;">Acts of Sexual Violence or Misconduct during the Commission of their Rapes or&nbsp;</span><span style="font-size: 1rem;">other Misconduct are properly known as CONFESSIONS; and CONFESSIONS&nbsp;</span><span style="font-size: 1rem;">Absolutely and Un-Equivocally Should be Reported in all Cases wherein they&nbsp;</span><span style="font-size: 1rem;">occur, with the greatest detail that the Reporter can possibly muster.</span></div><div><br></div><div>The account of the Rape given by the Rapee, however, should always, to the&nbsp;<span style="font-size: 1rem;">extent reasonably-practical, maintain the clinical, un-emotional tone that best&nbsp;</span><span style="font-size: 1rem;">serves the Adjudication Process.&nbsp;</span></div><div><br></div><div><span style="font-size: 1rem;"><br></span><span style="font-size: 1rem;"><b><u>Culture of Presumptive Belief of Reporters</u></b></span></div><div><br></div><div>The Culture of this Site is that Reporters are presumptively believed.&nbsp;<span style="font-size: 1rem;">Subjects of Reports may Answer, if they choose to, and are encouraged to do so.</span></div><div><br></div><div>At bottom, Verdicts after Trial will be decided by means of popular Vote of&nbsp;<span style="font-size: 1rem;">Registered non-Parties. --- This is essentially Trial by Jury, where the Jury is the&nbsp;</span><span style="font-size: 1rem;">Participating Public.</span></div><div><br></div><div>Motions will be Decided by Paralegals providing Adjudication Services in&nbsp;<span style="font-size: 1rem;">return for being Paid by RapeReportDB.com, according to the Federal Rules of&nbsp;</span><span style="font-size: 1rem;">Civil Procedure and the Federal Rules of Evidence, taking Full Note of the results&nbsp;</span><span style="font-size: 1rem;">of Public Votes on said Motions..</span></div><div><br></div><div>Reporters, and Subjects who Answer, BOTH bear the burden of proving&nbsp;<span style="font-size: 1rem;">their Allegations via the submission of Admissible Evidence.</span></div><div><br></div><div><b><u>FEES</u></b></div><div><br></div><div>The Fee for the Posting of a Report to the RapeReportDB.com Database is&nbsp;<span style="font-size: 1rem;">$49. --- The Fee for the Filing of an Answer is also $49. --- The Report and the&nbsp;</span><span style="font-size: 1rem;">Answer are collectively known as the Pleadings part of the litigation process.</span></div><div><br></div><div>Replies (to Answers) by Reporters, and Sur-Replies (to Replies) by Subjects, are&nbsp;<span style="font-size: 1rem;">also permitted during the Pleadings phase, and also cost $49 each.</span></div><div><br></div><div>The Fee to Post a Comment and//or a Vote is $0.49. --- Comments are sold&nbsp;<span style="font-size: 1rem;">in sets of 25, for $12.25, or 100 for $49. --- All Votes and Comments MUST be&nbsp;</span><span style="font-size: 1rem;">Made under the Commenter’s // Voter’s Own Name, just like for Reporters and&nbsp;</span><span style="font-size: 1rem;">Subjects.</span></div><div><br></div><div>Two additional Fees may apply.</div><div><br></div><div>First, the Price to Post a Video Statement is $29. --- Also, in Cases where the&nbsp;<span style="font-size: 1rem;">Reporter has a Physical Address for a Subject, there is also another, separate Fee of&nbsp;</span><span style="font-size: 1rem;">$29 for sending that Subject a Physical Letter to a Physical Address.</span></div><div><br></div><div>(All Fee amounts stated above are the actual amounts collected by&nbsp;<span style="font-size: 1rem;">RapeReportDB.com. --- Persons Filing Reports and Answers and Casting Votes or&nbsp;</span><span style="font-size: 1rem;">Making Comments pay all of the processing fees required to deliver the Net&nbsp;</span><span style="font-size: 1rem;">Amount stated above to the Site. --- All amounts stated are in US Dollars ($).)</span></div><div><br></div><div>(Payments are made through the Stripe Payment Platform, so the Prices&nbsp;<span style="font-size: 1rem;">stated above are subject to an additional 3% plus 30 cents per Transaction to cover&nbsp;</span><span style="font-size: 1rem;">Stripe’s Fees. --- So: -- $49.00 = $50.77, actual; -- $12.25 = $12.92, actual; --&nbsp;</span><span style="font-size: 1rem;">$29.00 = $30.17, actual; -- and, finally -- $300 = $309.30, actual.)</span></div><div><br></div><div><div><b><u>PROCESS FOR PRIVATE, LIMITED, QUASI-JUDICIAL REDRESS OF&nbsp;&nbsp;<span style="font-size: 1rem;">GRIEVANCES ARISING FROM ACTS OF SEXUAL VIOLENCE AND /&nbsp;</span><span style="font-size: 1rem;">OR SEXUAL MISCONDUCT</span></u></b></div><div><br></div><div>The Private, Limited process that RapeReportDB.com will provide is&nbsp;<span style="font-size: 1rem;">deliberately modeled after the legal due process rendered in Civil Courts across our&nbsp;</span><span style="font-size: 1rem;">Country every weekday of the year.</span></div><div><br></div><div>The Civil Litigation process begins with the Filing of a Summons and&nbsp;<span style="font-size: 1rem;">Complaint. --- Here, the Complaint is your Written Report posted on the site. ---&nbsp;</span><span style="font-size: 1rem;">The Complaint must be Written, in the first instance.</span></div><div><br></div><div>The Reporter must Report all known information about the Identity and&nbsp;<span style="font-size: 1rem;">Location of the Raper or other Sexual Deviant, in order to best achieve the specific&nbsp;</span><span style="font-size: 1rem;">objective of informing the Raper or other Sexual Deviant of the Report that has&nbsp;</span><span style="font-size: 1rem;">been made against them.</span></div><div><br></div><div><b><u>Participation in Private System of Adjudication is Never Required, but Non-<span style="font-size: 1rem;">Participation Carries the Possibility of Grant of Motions to Dismiss</span></u></b></div><div><br></div><div>Reporters AND Subjects, BOTH, are UNDER NO OBLIGATION to&nbsp;<span style="font-size: 1rem;">Participate at any time beyond the Original Report. --- Participation in the Private&nbsp;</span><span style="font-size: 1rem;">Adjudication process is something I always hope for – not least because I make&nbsp;</span><span style="font-size: 1rem;">more money that way – BUT IS NEVER REQUIRED.</span></div><div><br></div><div>HOWEVER, one of the Motions permitted under the Federal Rules of Civil&nbsp;<span style="font-size: 1rem;">Procedure are Motions to Dismiss (F.R. Civ. P. Rule 12). --- Motions to Dismiss&nbsp;&nbsp;</span><span style="font-size: 1rem;">by Subjects that are NOT RESPONDED TO will result in a Notation on that&nbsp;</span><span style="font-size: 1rem;">Report in the RapeReportDB.com Database that a Motion to Dismiss has been&nbsp;</span><span style="font-size: 1rem;">Granted for Failure to Participate in the Adjudication of said Motion to Dismiss.</span></div><div><br></div><div>Reports, once Posted, are Never Removed, Motions to Dismiss that are&nbsp;<span style="font-size: 1rem;">Granted are Noted in Report Data</span></div><div><br></div><div>ALL REPORTS, once Posted on the Site, ARE NEVER REMOVED. ---&nbsp;<span style="font-size: 1rem;">Motions to Dismiss that are Granted are Noted in the Report Data (just like all&nbsp;</span><span style="font-size: 1rem;">other Motions are), but Reports themselves ARE NEVER REMOVED from the&nbsp;</span><span style="font-size: 1rem;">Database.</span></div><div><br></div><div>(Posting in-Perpetuity will require Additional Fees from Reporters in future&nbsp;<span style="font-size: 1rem;">years to maintain their Report on the Database. --- This Fee is currently $12 per&nbsp;</span><span style="font-size: 1rem;">year, and is subject to increase beginning on January 1 st , 2027, for Reports Posted&nbsp;</span><span style="font-size: 1rem;">after that date.)</span></div><div><br></div><div>Once the Report has been Posted, and at least attempted to be delivered, then&nbsp;<span style="font-size: 1rem;">comes the Answer from those Report Subjects who can be identified and Served&nbsp;</span><span style="font-size: 1rem;">with the Report who Choose to Answer.</span></div><div><br></div><div>After the Answer is Filed, Replies from the Reporter, and Sur-Replies from&nbsp;<span style="font-size: 1rem;">the Subject of the Report are Permitted.</span></div><div><br></div><div>Then, the Processes of Motions and Discovery begin, ending, where&nbsp;<span style="font-size: 1rem;">possible, with a Trial. --- Trials, when they happen, will be via Zoom, Teams or&nbsp;</span><span style="font-size: 1rem;">other, similar Video Service.</span></div><div><br></div><div>Judgments will be rendered via Jury Verdict, with Registered non-Parties&nbsp;<span style="font-size: 1rem;">Voting on the Verdict. --- Motions will be decided by Paralegals, Fully-</span><span style="font-size: 1rem;">Independent-of, but taking Equally-Full Note-of the Vote of Registered non-arty</span></div><div>Users of RapeReportDB.com.</div><div><br></div><div>The Justice that I offer will be Real, and Just.</div><div><br></div><div>The Rules will be those of the Federal Rules of Civil Procedure and the&nbsp;<span style="font-size: 1rem;">Federal Rules of Evidence, modified as necessary and appropriate for the purpose&nbsp;</span><span style="font-size: 1rem;">of the private Web-based Adjudications that I now Offer.</span></div><div><br></div><div>(Where there is Conflict between the United States Circuit Courts of Appeal&nbsp;<span style="font-size: 1rem;">on any Issue where there is NO Controlling Precedent from the United States&nbsp;</span><span style="font-size: 1rem;">Supreme Court, the Precedent from the Second Circuit shall Control on that issue.)</span></div><div><br></div><div>If the Raper or other Sexual Deviant should choose to Answer, then the&nbsp;<span style="font-size: 1rem;">Reporter will, of course, have the right to Reply to any Answer Filed by the&nbsp;</span><span style="font-size: 1rem;">Subject of the Report.</span></div><div><br></div><div>Although Video Reporting is Offered, and is presumptively Evidence&nbsp;<span style="font-size: 1rem;">Admissible at Trial, Written Pleadings will always be required, at least in the first&nbsp;</span><span style="font-size: 1rem;">instance, specifically in order to best enable the Publication and Research&nbsp;</span><span style="font-size: 1rem;">Functions designed-into this Site.</span></div><div><br></div><div>Essentially, there is a Jury, and it is the Entire User Community of the Site,&nbsp;<span style="font-size: 1rem;">which is open to all citizens of our Planet.</span></div><div><span style="font-size: 1rem;"><br></span></div><div><br></div><div><b><u>Fees for Motions and Trials</u></b></div><div><br></div><div>The Fee for the Filing of Motions will be $300 each, minimum. --- ($300 =&nbsp;<span style="font-size: 1rem;">$309.30 actual.) --- Responses to Motions are encouraged and there will be an&nbsp;</span><span style="font-size: 1rem;">additional Fee for Posting said Responses.</span></div><div><br></div><div>There will also be a Fee for Trials, which will be determined shortly and&nbsp;<span style="font-size: 1rem;">then published here as soon as it is decided.</span></div><div><span style="font-size: 1rem;"><br></span></div></div>	/storage/photos/1/logo.png	https://rapereportdb.kendemo.com/storage/photos/1/ken2.jpg	A platform for reporting and exposing acts of sexual misconduct, with full transparency and public record.	(845) 357-1740	DeviateReportDB.com@gmail.com	\N	2025-07-24 07:49:04-04
\.


--
-- Data for Name: shippings; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.shippings (id, type, price, status, created_at, updated_at) FROM stdin;
1	Kahtmandu	100.00	active	2020-08-14 00:22:17-04	2020-08-14 00:22:17-04
2	Out of valley	300.00	active	2020-08-14 00:22:41-04	2020-08-14 00:22:41-04
3	Pokhara	400.00	active	2020-08-15 02:54:04-04	2020-08-15 02:54:04-04
4	Dharan	400.00	active	2020-08-17 16:50:48-04	2020-08-17 16:50:48-04
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.users (id, name, email, email_verified_at, password, photo, role, provider, provider_id, status, remember_token, credits_comment, created_at, updated_at) FROM stdin;
1	Admin	admin@gmail.com	\N	$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm	/storage/photos/1/users/user1.jpg	admin	\N	\N	active	PSLHIhDu2c8wfL9DwFBg3WHdbnK7GQbbuJshYGuxlXpHZUcZ6MaSjtqY3bmz	1	\N	2025-06-30 12:43:41-04
2	Steve Nguyen	user@gmail.com	\N	$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq	/storage/photos/1/users/user2.jpg	user	\N	\N	active	\N	0	\N	2020-08-15 03:30:07-04
33	Smith Jane	smithjane@gmail.com	\N	$2y$10$RJrA2O9B2230fLwH5QdjueVjof//Cv5byJyXWbOxw.PUAwDQAGu.e	\N	user	\N	\N	active	\N	0	2025-05-30 14:33:50-04	2025-05-30 14:33:50-04
34	Emily Brown	emilybrown@gmail.com	\N	$2y$10$..zuGeg3XNH41Wt7prIMF.2EGCdtP7CjTYlt01sjNqdcIBVt/NNge	\N	user	\N	\N	active	\N	0	2025-05-30 14:44:01-04	2025-05-30 14:44:01-04
35	Michael Lee	michaellee@gmail.com	\N	$2y$10$SOvgFfvwS0IdsAuULHEx1eJ1bZ9wj2S8nhYB9o/DAQ7BBS32e0Yhy	\N	user	\N	\N	active	\N	0	2025-05-30 14:47:42-04	2025-05-30 14:47:42-04
36	Karen Thomas	karenthomas@gmail.com	\N	$2y$10$YB1yDLpDqKw4wes8zcOJOO7a7xHkEsKqRpzSxWPb1g7UVAWOnv7Aa	\N	user	\N	\N	active	\N	0	2025-05-30 14:50:05-04	2025-05-30 14:50:05-04
37	David Parker	davidparker@gmail.com	\N	$2y$10$o.xuBPVSulpbxHbyf3dTjeRRyJe2/tqiu3RtH1q.kVsdnFUu6HILm	\N	user	\N	\N	active	\N	0	2025-05-30 14:56:36-04	2025-05-30 14:56:36-04
38	Jacksmith	jacksmith@yopmail.com	\N	$2y$10$d.sq5kXpvfcUoNdxqnwUDufw5hzRlRK918Nq7ABBkSs1.y253dz9m	\N	user	\N	\N	active	\N	0	2025-06-12 12:32:43-04	2025-06-12 12:32:43-04
39	Steven William	stevenwilliam@yopmail.com	\N	$2y$10$V2yj71Dqmsd2sOIcKpzuzOOrZKN/6bNoyOKB4fU.xHRlnPr9Z3tiq	\N	user	\N	\N	active	\N	0	2025-06-12 14:59:25-04	2025-06-12 14:59:25-04
40	Mango	namor75809@percyfx.com	\N	$2y$10$eTa3TYpC/0xQykKnjdbooOQVdGJYglglbFEBtrhcdmx0MmtCQHW86	\N	user	\N	\N	active	\N	0	2025-08-02 03:01:26-04	2025-08-02 03:01:26-04
\.


--
-- Data for Name: wishlists; Type: TABLE DATA; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

COPY rapereportdbkend_ken.wishlists (id, product_id, cart_id, user_id, price, quantity, amount, created_at, updated_at) FROM stdin;
3	9	\N	2	190	1	190	2025-05-06 06:42:57-04	2025-05-06 06:42:57-04
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.banners_id_seq', 4, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.brands_id_seq', 6, true);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.carts_id_seq', 11, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.categories_id_seq', 7, true);


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.coupons_id_seq', 5, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.failed_jobs_id_seq', 1, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.jobs_id_seq', 1, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.messages_id_seq', 3, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.migrations_id_seq', 31, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.orders_id_seq', 4, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.personal_access_tokens_id_seq', 1, true);


--
-- Name: post_categories_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.post_categories_id_seq', 7, true);


--
-- Name: post_comments_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.post_comments_id_seq', 1, true);


--
-- Name: post_tags_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.post_tags_id_seq', 1, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.posts_id_seq', 13, true);


--
-- Name: product_reviews_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.product_reviews_id_seq', 2, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.products_id_seq', 10, true);


--
-- Name: report_comments_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.report_comments_id_seq', 4, true);


--
-- Name: report_responses_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.report_responses_id_seq', 14, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.reports_id_seq', 6, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.settings_id_seq', 1, true);


--
-- Name: shippings_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.shippings_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.users_id_seq', 40, true);


--
-- Name: wishlists_id_seq; Type: SEQUENCE SET; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

SELECT pg_catalog.setval('rapereportdbkend_ken.wishlists_id_seq', 3, true);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: banners idx_16560_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.banners
    ADD CONSTRAINT idx_16560_primary PRIMARY KEY (id);


--
-- Name: brands idx_16568_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.brands
    ADD CONSTRAINT idx_16568_primary PRIMARY KEY (id);


--
-- Name: carts idx_16574_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.carts
    ADD CONSTRAINT idx_16574_primary PRIMARY KEY (id);


--
-- Name: categories idx_16580_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.categories
    ADD CONSTRAINT idx_16580_primary PRIMARY KEY (id);


--
-- Name: coupons idx_16589_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.coupons
    ADD CONSTRAINT idx_16589_primary PRIMARY KEY (id);


--
-- Name: failed_jobs idx_16596_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.failed_jobs
    ADD CONSTRAINT idx_16596_primary PRIMARY KEY (id);


--
-- Name: jobs idx_16604_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.jobs
    ADD CONSTRAINT idx_16604_primary PRIMARY KEY (id);


--
-- Name: messages idx_16611_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.messages
    ADD CONSTRAINT idx_16611_primary PRIMARY KEY (id);


--
-- Name: migrations idx_16618_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.migrations
    ADD CONSTRAINT idx_16618_primary PRIMARY KEY (id);


--
-- Name: notifications idx_16622_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.notifications
    ADD CONSTRAINT idx_16622_primary PRIMARY KEY (id);


--
-- Name: orders idx_16628_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.orders
    ADD CONSTRAINT idx_16628_primary PRIMARY KEY (id);


--
-- Name: personal_access_tokens idx_16641_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.personal_access_tokens
    ADD CONSTRAINT idx_16641_primary PRIMARY KEY (id);


--
-- Name: post_categories idx_16648_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.post_categories
    ADD CONSTRAINT idx_16648_primary PRIMARY KEY (id);


--
-- Name: post_comments idx_16654_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.post_comments
    ADD CONSTRAINT idx_16654_primary PRIMARY KEY (id);


--
-- Name: post_tags idx_16662_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.post_tags
    ADD CONSTRAINT idx_16662_primary PRIMARY KEY (id);


--
-- Name: posts idx_16668_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.posts
    ADD CONSTRAINT idx_16668_primary PRIMARY KEY (id);


--
-- Name: product_reviews idx_16676_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.product_reviews
    ADD CONSTRAINT idx_16676_primary PRIMARY KEY (id);


--
-- Name: products idx_16685_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.products
    ADD CONSTRAINT idx_16685_primary PRIMARY KEY (id);


--
-- Name: report_comments idx_16696_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.report_comments
    ADD CONSTRAINT idx_16696_primary PRIMARY KEY (id);


--
-- Name: report_responses idx_16705_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.report_responses
    ADD CONSTRAINT idx_16705_primary PRIMARY KEY (id);


--
-- Name: reports idx_16714_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.reports
    ADD CONSTRAINT idx_16714_primary PRIMARY KEY (id);


--
-- Name: settings idx_16725_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.settings
    ADD CONSTRAINT idx_16725_primary PRIMARY KEY (id);


--
-- Name: shippings idx_16732_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.shippings
    ADD CONSTRAINT idx_16732_primary PRIMARY KEY (id);


--
-- Name: users idx_16738_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.users
    ADD CONSTRAINT idx_16738_primary PRIMARY KEY (id);


--
-- Name: wishlists idx_16748_primary; Type: CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.wishlists
    ADD CONSTRAINT idx_16748_primary PRIMARY KEY (id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: rapereportdbkend_ken
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: idx_16560_banners_slug_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16560_banners_slug_unique ON rapereportdbkend_ken.banners USING btree (slug);


--
-- Name: idx_16568_brands_slug_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16568_brands_slug_unique ON rapereportdbkend_ken.brands USING btree (slug);


--
-- Name: idx_16574_carts_order_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16574_carts_order_id_foreign ON rapereportdbkend_ken.carts USING btree (order_id);


--
-- Name: idx_16574_carts_product_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16574_carts_product_id_foreign ON rapereportdbkend_ken.carts USING btree (product_id);


--
-- Name: idx_16574_carts_user_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16574_carts_user_id_foreign ON rapereportdbkend_ken.carts USING btree (user_id);


--
-- Name: idx_16580_categories_added_by_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16580_categories_added_by_foreign ON rapereportdbkend_ken.categories USING btree (added_by);


--
-- Name: idx_16580_categories_parent_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16580_categories_parent_id_foreign ON rapereportdbkend_ken.categories USING btree (parent_id);


--
-- Name: idx_16580_categories_slug_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16580_categories_slug_unique ON rapereportdbkend_ken.categories USING btree (slug);


--
-- Name: idx_16589_coupons_code_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16589_coupons_code_unique ON rapereportdbkend_ken.coupons USING btree (code);


--
-- Name: idx_16604_jobs_queue_index; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16604_jobs_queue_index ON rapereportdbkend_ken.jobs USING btree (queue);


--
-- Name: idx_16622_notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16622_notifications_notifiable_type_notifiable_id_index ON rapereportdbkend_ken.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: idx_16628_orders_order_number_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16628_orders_order_number_unique ON rapereportdbkend_ken.orders USING btree (order_number);


--
-- Name: idx_16628_orders_shipping_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16628_orders_shipping_id_foreign ON rapereportdbkend_ken.orders USING btree (shipping_id);


--
-- Name: idx_16628_orders_user_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16628_orders_user_id_foreign ON rapereportdbkend_ken.orders USING btree (user_id);


--
-- Name: idx_16637_password_resets_email_index; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16637_password_resets_email_index ON rapereportdbkend_ken.password_resets USING btree (email);


--
-- Name: idx_16641_personal_access_tokens_token_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16641_personal_access_tokens_token_unique ON rapereportdbkend_ken.personal_access_tokens USING btree (token);


--
-- Name: idx_16641_personal_access_tokens_tokenable_type_tokenable_id_in; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16641_personal_access_tokens_tokenable_type_tokenable_id_in ON rapereportdbkend_ken.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: idx_16648_post_categories_slug_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16648_post_categories_slug_unique ON rapereportdbkend_ken.post_categories USING btree (slug);


--
-- Name: idx_16654_post_comments_post_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16654_post_comments_post_id_foreign ON rapereportdbkend_ken.post_comments USING btree (post_id);


--
-- Name: idx_16654_post_comments_user_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16654_post_comments_user_id_foreign ON rapereportdbkend_ken.post_comments USING btree (user_id);


--
-- Name: idx_16662_post_tags_slug_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16662_post_tags_slug_unique ON rapereportdbkend_ken.post_tags USING btree (slug);


--
-- Name: idx_16668_posts_added_by_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16668_posts_added_by_foreign ON rapereportdbkend_ken.posts USING btree (added_by);


--
-- Name: idx_16668_posts_post_cat_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16668_posts_post_cat_id_foreign ON rapereportdbkend_ken.posts USING btree (post_cat_id);


--
-- Name: idx_16668_posts_post_tag_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16668_posts_post_tag_id_foreign ON rapereportdbkend_ken.posts USING btree (post_tag_id);


--
-- Name: idx_16668_posts_slug_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16668_posts_slug_unique ON rapereportdbkend_ken.posts USING btree (slug);


--
-- Name: idx_16676_product_reviews_product_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16676_product_reviews_product_id_foreign ON rapereportdbkend_ken.product_reviews USING btree (product_id);


--
-- Name: idx_16676_product_reviews_user_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16676_product_reviews_user_id_foreign ON rapereportdbkend_ken.product_reviews USING btree (user_id);


--
-- Name: idx_16685_products_brand_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16685_products_brand_id_foreign ON rapereportdbkend_ken.products USING btree (brand_id);


--
-- Name: idx_16685_products_cat_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16685_products_cat_id_foreign ON rapereportdbkend_ken.products USING btree (cat_id);


--
-- Name: idx_16685_products_child_cat_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16685_products_child_cat_id_foreign ON rapereportdbkend_ken.products USING btree (child_cat_id);


--
-- Name: idx_16685_products_slug_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16685_products_slug_unique ON rapereportdbkend_ken.products USING btree (slug);


--
-- Name: idx_16696_report_comments_report_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16696_report_comments_report_id_foreign ON rapereportdbkend_ken.report_comments USING btree (report_id);


--
-- Name: idx_16696_report_comments_user_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16696_report_comments_user_id_foreign ON rapereportdbkend_ken.report_comments USING btree (user_id);


--
-- Name: idx_16705_report_responses_report_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16705_report_responses_report_id_foreign ON rapereportdbkend_ken.report_responses USING btree (report_id);


--
-- Name: idx_16705_report_responses_user_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16705_report_responses_user_id_foreign ON rapereportdbkend_ken.report_responses USING btree (user_id);


--
-- Name: idx_16714_reports_report_number_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16714_reports_report_number_unique ON rapereportdbkend_ken.reports USING btree (report_number);


--
-- Name: idx_16714_reports_reporter_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16714_reports_reporter_id_foreign ON rapereportdbkend_ken.reports USING btree (reporter_id);


--
-- Name: idx_16738_users_email_unique; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE UNIQUE INDEX idx_16738_users_email_unique ON rapereportdbkend_ken.users USING btree (email);


--
-- Name: idx_16748_wishlists_cart_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16748_wishlists_cart_id_foreign ON rapereportdbkend_ken.wishlists USING btree (cart_id);


--
-- Name: idx_16748_wishlists_product_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16748_wishlists_product_id_foreign ON rapereportdbkend_ken.wishlists USING btree (product_id);


--
-- Name: idx_16748_wishlists_user_id_foreign; Type: INDEX; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

CREATE INDEX idx_16748_wishlists_user_id_foreign ON rapereportdbkend_ken.wishlists USING btree (user_id);


--
-- Name: carts carts_order_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.carts
    ADD CONSTRAINT carts_order_id_foreign FOREIGN KEY (order_id) REFERENCES rapereportdbkend_ken.orders(id) ON DELETE SET NULL;


--
-- Name: carts carts_product_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.carts
    ADD CONSTRAINT carts_product_id_foreign FOREIGN KEY (product_id) REFERENCES rapereportdbkend_ken.products(id) ON DELETE CASCADE;


--
-- Name: carts carts_user_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.carts
    ADD CONSTRAINT carts_user_id_foreign FOREIGN KEY (user_id) REFERENCES rapereportdbkend_ken.users(id) ON DELETE CASCADE;


--
-- Name: categories categories_added_by_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.categories
    ADD CONSTRAINT categories_added_by_foreign FOREIGN KEY (added_by) REFERENCES rapereportdbkend_ken.users(id) ON DELETE SET NULL;


--
-- Name: categories categories_parent_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.categories
    ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES rapereportdbkend_ken.categories(id) ON DELETE SET NULL;


--
-- Name: orders orders_shipping_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.orders
    ADD CONSTRAINT orders_shipping_id_foreign FOREIGN KEY (shipping_id) REFERENCES rapereportdbkend_ken.shippings(id) ON DELETE SET NULL;


--
-- Name: orders orders_user_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.orders
    ADD CONSTRAINT orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES rapereportdbkend_ken.users(id) ON DELETE SET NULL;


--
-- Name: post_comments post_comments_post_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.post_comments
    ADD CONSTRAINT post_comments_post_id_foreign FOREIGN KEY (post_id) REFERENCES rapereportdbkend_ken.posts(id) ON DELETE SET NULL;


--
-- Name: post_comments post_comments_user_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.post_comments
    ADD CONSTRAINT post_comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES rapereportdbkend_ken.users(id) ON DELETE SET NULL;


--
-- Name: posts posts_added_by_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.posts
    ADD CONSTRAINT posts_added_by_foreign FOREIGN KEY (added_by) REFERENCES rapereportdbkend_ken.users(id) ON DELETE SET NULL;


--
-- Name: posts posts_post_cat_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.posts
    ADD CONSTRAINT posts_post_cat_id_foreign FOREIGN KEY (post_cat_id) REFERENCES rapereportdbkend_ken.post_categories(id) ON DELETE SET NULL;


--
-- Name: posts posts_post_tag_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.posts
    ADD CONSTRAINT posts_post_tag_id_foreign FOREIGN KEY (post_tag_id) REFERENCES rapereportdbkend_ken.post_tags(id) ON DELETE SET NULL;


--
-- Name: product_reviews product_reviews_product_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.product_reviews
    ADD CONSTRAINT product_reviews_product_id_foreign FOREIGN KEY (product_id) REFERENCES rapereportdbkend_ken.products(id) ON DELETE SET NULL;


--
-- Name: product_reviews product_reviews_user_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.product_reviews
    ADD CONSTRAINT product_reviews_user_id_foreign FOREIGN KEY (user_id) REFERENCES rapereportdbkend_ken.users(id) ON DELETE SET NULL;


--
-- Name: products products_brand_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.products
    ADD CONSTRAINT products_brand_id_foreign FOREIGN KEY (brand_id) REFERENCES rapereportdbkend_ken.brands(id) ON DELETE SET NULL;


--
-- Name: products products_cat_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.products
    ADD CONSTRAINT products_cat_id_foreign FOREIGN KEY (cat_id) REFERENCES rapereportdbkend_ken.categories(id) ON DELETE SET NULL;


--
-- Name: products products_child_cat_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.products
    ADD CONSTRAINT products_child_cat_id_foreign FOREIGN KEY (child_cat_id) REFERENCES rapereportdbkend_ken.categories(id) ON DELETE SET NULL;


--
-- Name: report_comments report_comments_report_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.report_comments
    ADD CONSTRAINT report_comments_report_id_foreign FOREIGN KEY (report_id) REFERENCES rapereportdbkend_ken.reports(id) ON DELETE CASCADE;


--
-- Name: report_comments report_comments_user_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.report_comments
    ADD CONSTRAINT report_comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES rapereportdbkend_ken.users(id) ON DELETE CASCADE;


--
-- Name: report_responses report_responses_report_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.report_responses
    ADD CONSTRAINT report_responses_report_id_foreign FOREIGN KEY (report_id) REFERENCES rapereportdbkend_ken.reports(id) ON DELETE CASCADE;


--
-- Name: report_responses report_responses_user_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.report_responses
    ADD CONSTRAINT report_responses_user_id_foreign FOREIGN KEY (user_id) REFERENCES rapereportdbkend_ken.users(id) ON DELETE CASCADE;


--
-- Name: reports reports_reporter_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.reports
    ADD CONSTRAINT reports_reporter_id_foreign FOREIGN KEY (reporter_id) REFERENCES rapereportdbkend_ken.users(id) ON DELETE CASCADE;


--
-- Name: wishlists wishlists_cart_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.wishlists
    ADD CONSTRAINT wishlists_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES rapereportdbkend_ken.carts(id) ON DELETE SET NULL;


--
-- Name: wishlists wishlists_product_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.wishlists
    ADD CONSTRAINT wishlists_product_id_foreign FOREIGN KEY (product_id) REFERENCES rapereportdbkend_ken.products(id) ON DELETE CASCADE;


--
-- Name: wishlists wishlists_user_id_foreign; Type: FK CONSTRAINT; Schema: rapereportdbkend_ken; Owner: rapereportdbkend_ken
--

ALTER TABLE ONLY rapereportdbkend_ken.wishlists
    ADD CONSTRAINT wishlists_user_id_foreign FOREIGN KEY (user_id) REFERENCES rapereportdbkend_ken.users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

