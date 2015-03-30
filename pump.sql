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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ccnmtl;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ccnmtl;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ccnmtl;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ccnmtl;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ccnmtl;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ccnmtl;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ccnmtl;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ccnmtl;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ccnmtl;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ccnmtl;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ccnmtl;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ccnmtl;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ccnmtl;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ccnmtl;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ccnmtl;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ccnmtl;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO ccnmtl;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_flatpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO ccnmtl;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_flatpage_id_seq OWNED BY django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO ccnmtl;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_flatpage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO ccnmtl;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_flatpage_sites_id_seq OWNED BY django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ccnmtl;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ccnmtl;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ccnmtl;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO ccnmtl;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO ccnmtl;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: flatblocks_flatblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE flatblocks_flatblock (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    header character varying(255) NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.flatblocks_flatblock OWNER TO ccnmtl;

--
-- Name: flatblocks_flatblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE flatblocks_flatblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flatblocks_flatblock_id_seq OWNER TO ccnmtl;

--
-- Name: flatblocks_flatblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE flatblocks_flatblock_id_seq OWNED BY flatblocks_flatblock.id;


--
-- Name: main_response; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE main_response (
    id integer NOT NULL,
    added timestamp with time zone NOT NULL,
    q1 text NOT NULL,
    q2 text NOT NULL,
    q3 text NOT NULL,
    q4 text NOT NULL,
    q5 text NOT NULL,
    q6 text NOT NULL,
    q7 text NOT NULL,
    q8 text NOT NULL,
    q9 text NOT NULL,
    q10 text NOT NULL,
    q11 text NOT NULL,
    q12 text NOT NULL,
    q13 text NOT NULL,
    q14 text NOT NULL,
    q15 text NOT NULL,
    q16 text NOT NULL,
    q17 text NOT NULL,
    q18 text NOT NULL,
    q19 text NOT NULL,
    q20 text NOT NULL,
    q21 text NOT NULL,
    q22 text NOT NULL,
    q23 text NOT NULL,
    q24 text NOT NULL
);


ALTER TABLE public.main_response OWNER TO ccnmtl;

--
-- Name: main_response_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE main_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_response_id_seq OWNER TO ccnmtl;

--
-- Name: main_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE main_response_id_seq OWNED BY main_response.id;


--
-- Name: pageblocks_htmlblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_htmlblock (
    id integer NOT NULL,
    html text NOT NULL
);


ALTER TABLE public.pageblocks_htmlblock OWNER TO ccnmtl;

--
-- Name: pageblocks_htmlblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_htmlblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_htmlblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_htmlblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_htmlblock_id_seq OWNED BY pageblocks_htmlblock.id;


--
-- Name: pageblocks_htmlblockwysiwyg; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_htmlblockwysiwyg (
    id integer NOT NULL,
    wysiwyg_html text NOT NULL
);


ALTER TABLE public.pageblocks_htmlblockwysiwyg OWNER TO ccnmtl;

--
-- Name: pageblocks_htmlblockwysiwyg_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_htmlblockwysiwyg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_htmlblockwysiwyg_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_htmlblockwysiwyg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_htmlblockwysiwyg_id_seq OWNED BY pageblocks_htmlblockwysiwyg.id;


--
-- Name: pageblocks_imageblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_imageblock (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    caption text NOT NULL,
    alt character varying(100),
    lightbox boolean NOT NULL
);


ALTER TABLE public.pageblocks_imageblock OWNER TO ccnmtl;

--
-- Name: pageblocks_imageblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_imageblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_imageblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_imageblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_imageblock_id_seq OWNED BY pageblocks_imageblock.id;


--
-- Name: pageblocks_imagepullquoteblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_imagepullquoteblock (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    caption text NOT NULL,
    alt character varying(100)
);


ALTER TABLE public.pageblocks_imagepullquoteblock OWNER TO ccnmtl;

--
-- Name: pageblocks_imagepullquoteblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_imagepullquoteblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_imagepullquoteblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_imagepullquoteblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_imagepullquoteblock_id_seq OWNED BY pageblocks_imagepullquoteblock.id;


--
-- Name: pageblocks_pullquoteblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_pullquoteblock (
    id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.pageblocks_pullquoteblock OWNER TO ccnmtl;

--
-- Name: pageblocks_pullquoteblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_pullquoteblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_pullquoteblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_pullquoteblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_pullquoteblock_id_seq OWNED BY pageblocks_pullquoteblock.id;


--
-- Name: pageblocks_textblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_textblock (
    id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.pageblocks_textblock OWNER TO ccnmtl;

--
-- Name: pageblocks_textblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_textblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_textblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_textblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_textblock_id_seq OWNED BY pageblocks_textblock.id;


--
-- Name: pagetree_hierarchy; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_hierarchy (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    base_url character varying(256) NOT NULL
);


ALTER TABLE public.pagetree_hierarchy OWNER TO ccnmtl;

--
-- Name: pagetree_hierarchy_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_hierarchy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_hierarchy_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_hierarchy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_hierarchy_id_seq OWNED BY pagetree_hierarchy.id;


--
-- Name: pagetree_pageblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_pageblock (
    id integer NOT NULL,
    ordinality integer NOT NULL,
    label character varying(256),
    css_extra character varying(256),
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    section_id integer NOT NULL,
    CONSTRAINT pagetree_pageblock_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT pagetree_pageblock_ordinality_check CHECK ((ordinality >= 0))
);


ALTER TABLE public.pagetree_pageblock OWNER TO ccnmtl;

--
-- Name: pagetree_pageblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_pageblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_pageblock_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_pageblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_pageblock_id_seq OWNED BY pagetree_pageblock.id;


--
-- Name: pagetree_section; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_section (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    label character varying(256) NOT NULL,
    slug character varying(50) NOT NULL,
    show_toc boolean NOT NULL,
    deep_toc boolean NOT NULL,
    hierarchy_id integer NOT NULL,
    CONSTRAINT pagetree_section_depth_check CHECK ((depth >= 0)),
    CONSTRAINT pagetree_section_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.pagetree_section OWNER TO ccnmtl;

--
-- Name: pagetree_section_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_section_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_section_id_seq OWNED BY pagetree_section.id;


--
-- Name: pagetree_testblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_testblock (
    id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.pagetree_testblock OWNER TO ccnmtl;

--
-- Name: pagetree_testblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_testblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_testblock_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_testblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_testblock_id_seq OWNED BY pagetree_testblock.id;


--
-- Name: pagetree_userlocation; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_userlocation (
    id integer NOT NULL,
    path character varying(256) NOT NULL,
    hierarchy_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.pagetree_userlocation OWNER TO ccnmtl;

--
-- Name: pagetree_userlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_userlocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_userlocation_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_userlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_userlocation_id_seq OWNED BY pagetree_userlocation.id;


--
-- Name: pagetree_userpagevisit; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_userpagevisit (
    id integer NOT NULL,
    status character varying(256) NOT NULL,
    first_visit timestamp with time zone NOT NULL,
    last_visit timestamp with time zone NOT NULL,
    section_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.pagetree_userpagevisit OWNER TO ccnmtl;

--
-- Name: pagetree_userpagevisit_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_userpagevisit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_userpagevisit_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_userpagevisit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_userpagevisit_id_seq OWNED BY pagetree_userpagevisit.id;


--
-- Name: pagetree_version; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_version (
    id integer NOT NULL,
    saved_at timestamp with time zone NOT NULL,
    activity text,
    data text,
    comment text,
    section_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.pagetree_version OWNER TO ccnmtl;

--
-- Name: pagetree_version_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_version_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_version_id_seq OWNED BY pagetree_version.id;


--
-- Name: quizblock_answer; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_answer (
    id integer NOT NULL,
    value character varying(256) NOT NULL,
    label text NOT NULL,
    correct boolean NOT NULL,
    explanation text NOT NULL,
    question_id integer NOT NULL,
    _order integer NOT NULL
);


ALTER TABLE public.quizblock_answer OWNER TO ccnmtl;

--
-- Name: quizblock_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_answer_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_answer_id_seq OWNED BY quizblock_answer.id;


--
-- Name: quizblock_question; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_question (
    id integer NOT NULL,
    text text NOT NULL,
    question_type character varying(256) NOT NULL,
    explanation text NOT NULL,
    intro_text text NOT NULL,
    quiz_id integer NOT NULL,
    _order integer NOT NULL
);


ALTER TABLE public.quizblock_question OWNER TO ccnmtl;

--
-- Name: quizblock_question_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_question_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_question_id_seq OWNED BY quizblock_question.id;


--
-- Name: quizblock_quiz; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_quiz (
    id integer NOT NULL,
    description text NOT NULL,
    rhetorical boolean NOT NULL,
    allow_redo boolean NOT NULL,
    show_submit_state boolean NOT NULL
);


ALTER TABLE public.quizblock_quiz OWNER TO ccnmtl;

--
-- Name: quizblock_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_quiz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_quiz_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_quiz_id_seq OWNED BY quizblock_quiz.id;


--
-- Name: quizblock_response; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_response (
    id integer NOT NULL,
    value text NOT NULL,
    question_id integer NOT NULL,
    submission_id integer NOT NULL
);


ALTER TABLE public.quizblock_response OWNER TO ccnmtl;

--
-- Name: quizblock_response_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_response_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_response_id_seq OWNED BY quizblock_response.id;


--
-- Name: quizblock_submission; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_submission (
    id integer NOT NULL,
    submitted timestamp with time zone NOT NULL,
    quiz_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.quizblock_submission OWNER TO ccnmtl;

--
-- Name: quizblock_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_submission_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_submission_id_seq OWNED BY quizblock_submission.id;


--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    activation_key character varying(40) NOT NULL
);


ALTER TABLE public.registration_registrationprofile OWNER TO ccnmtl;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_registrationprofile_id_seq OWNER TO ccnmtl;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


--
-- Name: tagging_tag; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE tagging_tag (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tagging_tag OWNER TO ccnmtl;

--
-- Name: tagging_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE tagging_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagging_tag_id_seq OWNER TO ccnmtl;

--
-- Name: tagging_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE tagging_tag_id_seq OWNED BY tagging_tag.id;


--
-- Name: tagging_taggeditem; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE tagging_taggeditem (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    CONSTRAINT tagging_taggeditem_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.tagging_taggeditem OWNER TO ccnmtl;

--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE tagging_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagging_taggeditem_id_seq OWNER TO ccnmtl;

--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE tagging_taggeditem_id_seq OWNED BY tagging_taggeditem.id;


--
-- Name: waffle_flag; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE waffle_flag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    everyone boolean,
    percent numeric(3,1),
    testing boolean NOT NULL,
    superusers boolean NOT NULL,
    staff boolean NOT NULL,
    authenticated boolean NOT NULL,
    languages text NOT NULL,
    rollout boolean NOT NULL,
    note text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.waffle_flag OWNER TO ccnmtl;

--
-- Name: waffle_flag_groups; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE waffle_flag_groups (
    id integer NOT NULL,
    flag_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.waffle_flag_groups OWNER TO ccnmtl;

--
-- Name: waffle_flag_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE waffle_flag_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.waffle_flag_groups_id_seq OWNER TO ccnmtl;

--
-- Name: waffle_flag_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE waffle_flag_groups_id_seq OWNED BY waffle_flag_groups.id;


--
-- Name: waffle_flag_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE waffle_flag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.waffle_flag_id_seq OWNER TO ccnmtl;

--
-- Name: waffle_flag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE waffle_flag_id_seq OWNED BY waffle_flag.id;


--
-- Name: waffle_flag_users; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE waffle_flag_users (
    id integer NOT NULL,
    flag_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.waffle_flag_users OWNER TO ccnmtl;

--
-- Name: waffle_flag_users_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE waffle_flag_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.waffle_flag_users_id_seq OWNER TO ccnmtl;

--
-- Name: waffle_flag_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE waffle_flag_users_id_seq OWNED BY waffle_flag_users.id;


--
-- Name: waffle_sample; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE waffle_sample (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    percent numeric(4,1) NOT NULL,
    note text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.waffle_sample OWNER TO ccnmtl;

--
-- Name: waffle_sample_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE waffle_sample_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.waffle_sample_id_seq OWNER TO ccnmtl;

--
-- Name: waffle_sample_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE waffle_sample_id_seq OWNED BY waffle_sample.id;


--
-- Name: waffle_switch; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE waffle_switch (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    active boolean NOT NULL,
    note text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.waffle_switch OWNER TO ccnmtl;

--
-- Name: waffle_switch_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE waffle_switch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.waffle_switch_id_seq OWNER TO ccnmtl;

--
-- Name: waffle_switch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE waffle_switch_id_seq OWNED BY waffle_switch.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_flatpage ALTER COLUMN id SET DEFAULT nextval('django_flatpage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('django_flatpage_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY flatblocks_flatblock ALTER COLUMN id SET DEFAULT nextval('flatblocks_flatblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY main_response ALTER COLUMN id SET DEFAULT nextval('main_response_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pageblocks_htmlblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_htmlblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pageblocks_htmlblockwysiwyg ALTER COLUMN id SET DEFAULT nextval('pageblocks_htmlblockwysiwyg_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pageblocks_imageblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_imageblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pageblocks_imagepullquoteblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_imagepullquoteblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pageblocks_pullquoteblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_pullquoteblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pageblocks_textblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_textblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_hierarchy ALTER COLUMN id SET DEFAULT nextval('pagetree_hierarchy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_pageblock ALTER COLUMN id SET DEFAULT nextval('pagetree_pageblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_section ALTER COLUMN id SET DEFAULT nextval('pagetree_section_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_testblock ALTER COLUMN id SET DEFAULT nextval('pagetree_testblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_userlocation ALTER COLUMN id SET DEFAULT nextval('pagetree_userlocation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_userpagevisit ALTER COLUMN id SET DEFAULT nextval('pagetree_userpagevisit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_version ALTER COLUMN id SET DEFAULT nextval('pagetree_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_answer ALTER COLUMN id SET DEFAULT nextval('quizblock_answer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_question ALTER COLUMN id SET DEFAULT nextval('quizblock_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_quiz ALTER COLUMN id SET DEFAULT nextval('quizblock_quiz_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_response ALTER COLUMN id SET DEFAULT nextval('quizblock_response_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_submission ALTER COLUMN id SET DEFAULT nextval('quizblock_submission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY tagging_tag ALTER COLUMN id SET DEFAULT nextval('tagging_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY tagging_taggeditem ALTER COLUMN id SET DEFAULT nextval('tagging_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY waffle_flag ALTER COLUMN id SET DEFAULT nextval('waffle_flag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY waffle_flag_groups ALTER COLUMN id SET DEFAULT nextval('waffle_flag_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY waffle_flag_users ALTER COLUMN id SET DEFAULT nextval('waffle_flag_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY waffle_sample ALTER COLUMN id SET DEFAULT nextval('waffle_sample_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY waffle_switch ALTER COLUMN id SET DEFAULT nextval('waffle_switch_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_group (id, name) FROM stdin;
1	cul.cunix.local:columbia.edu
2	tlc.cunix.local:columbia.edu
3	ALL_CU
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_group_id_seq', 3, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add flat page	7	add_flatpage
20	Can change flat page	7	change_flatpage
21	Can delete flat page	7	delete_flatpage
22	Can add log entry	8	add_logentry
23	Can change log entry	8	change_logentry
24	Can delete log entry	8	delete_logentry
25	Can add tag	9	add_tag
26	Can change tag	9	change_tag
27	Can delete tag	9	delete_tag
28	Can add tagged item	10	add_taggeditem
29	Can change tagged item	10	change_taggeditem
30	Can delete tagged item	10	delete_taggeditem
31	Can add flag	11	add_flag
32	Can change flag	11	change_flag
33	Can delete flag	11	delete_flag
34	Can add switch	12	add_switch
35	Can change switch	12	change_switch
36	Can delete switch	12	delete_switch
37	Can add sample	13	add_sample
38	Can change sample	13	change_sample
39	Can delete sample	13	delete_sample
40	Can add Flat block	14	add_flatblock
41	Can change Flat block	14	change_flatblock
42	Can delete Flat block	14	delete_flatblock
43	Can add registration profile	15	add_registrationprofile
44	Can change registration profile	15	change_registrationprofile
45	Can delete registration profile	15	delete_registrationprofile
46	Can add hierarchy	16	add_hierarchy
47	Can change hierarchy	16	change_hierarchy
48	Can delete hierarchy	16	delete_hierarchy
49	Can add section	17	add_section
50	Can change section	17	change_section
51	Can delete section	17	delete_section
52	Can add page block	18	add_pageblock
53	Can change page block	18	change_pageblock
54	Can delete page block	18	delete_pageblock
55	Can add user location	19	add_userlocation
56	Can change user location	19	change_userlocation
57	Can delete user location	19	delete_userlocation
58	Can add user page visit	20	add_userpagevisit
59	Can change user page visit	20	change_userpagevisit
60	Can delete user page visit	20	delete_userpagevisit
61	Can add version	21	add_version
62	Can change version	21	change_version
63	Can delete version	21	delete_version
64	Can add test block	22	add_testblock
65	Can change test block	22	change_testblock
66	Can delete test block	22	delete_testblock
67	Can add text block	23	add_textblock
68	Can change text block	23	change_textblock
69	Can delete text block	23	delete_textblock
70	Can add html block	24	add_htmlblock
71	Can change html block	24	change_htmlblock
72	Can delete html block	24	delete_htmlblock
73	Can add pull quote block	25	add_pullquoteblock
74	Can change pull quote block	25	change_pullquoteblock
75	Can delete pull quote block	25	delete_pullquoteblock
76	Can add image block	26	add_imageblock
77	Can change image block	26	change_imageblock
78	Can delete image block	26	delete_imageblock
79	Can add image pull quote block	27	add_imagepullquoteblock
80	Can change image pull quote block	27	change_imagepullquoteblock
81	Can delete image pull quote block	27	delete_imagepullquoteblock
82	Can add html block wysiwyg	28	add_htmlblockwysiwyg
83	Can change html block wysiwyg	28	change_htmlblockwysiwyg
84	Can delete html block wysiwyg	28	delete_htmlblockwysiwyg
85	Can add quiz	29	add_quiz
86	Can change quiz	29	change_quiz
87	Can delete quiz	29	delete_quiz
88	Can add question	30	add_question
89	Can change question	30	change_question
90	Can delete question	30	delete_question
91	Can add answer	31	add_answer
92	Can change answer	31	change_answer
93	Can delete answer	31	delete_answer
94	Can add submission	32	add_submission
95	Can change submission	32	change_submission
96	Can delete submission	32	delete_submission
97	Can add response	33	add_response
98	Can change response	33	change_response
99	Can delete response	33	delete_response
100	Can add response	34	add_response
101	Can change response	34	change_response
102	Can delete response	34	delete_response
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_permission_id_seq', 102, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	!Cai31XnK8mSfDXqyfTGXKRqZ0nk6yfQikceYxgzx	2015-02-17 19:24:14.909582+00	f	ak3082	Ashley	Kingon	ak3082@columbia.edu	t	t	2015-02-17 19:24:13.954489+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
2	1	2
3	1	3
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 3, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	flat page	flatpages	flatpage
8	log entry	admin	logentry
9	tag	tagging	tag
10	tagged item	tagging	taggeditem
11	flag	waffle	flag
12	switch	waffle	switch
13	sample	waffle	sample
14	Flat block	flatblocks	flatblock
15	registration profile	registration	registrationprofile
16	hierarchy	pagetree	hierarchy
17	section	pagetree	section
18	page block	pagetree	pageblock
19	user location	pagetree	userlocation
20	user page visit	pagetree	userpagevisit
21	version	pagetree	version
22	test block	pagetree	testblock
23	text block	pageblocks	textblock
24	html block	pageblocks	htmlblock
25	pull quote block	pageblocks	pullquoteblock
26	image block	pageblocks	imageblock
27	image pull quote block	pageblocks	imagepullquoteblock
28	html block wysiwyg	pageblocks	htmlblockwysiwyg
29	quiz	quizblock	quiz
30	question	quizblock	question
31	answer	quizblock	answer
32	submission	quizblock	submission
33	response	quizblock	response
34	response	main	response
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_content_type_id_seq', 34, true);


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
\.


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_flatpage_id_seq', 1, false);


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
\.


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_flatpage_sites_id_seq', 1, false);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2014-12-09 23:10:22.407383+00
2	auth	0001_initial	2014-12-09 23:10:22.548779+00
3	admin	0001_initial	2014-12-09 23:10:22.613864+00
4	sites	0001_initial	2014-12-09 23:10:22.643883+00
5	flatpages	0001_initial	2014-12-09 23:10:22.693801+00
6	pageblocks	0001_initial	2014-12-09 23:10:22.846624+00
7	pagetree	0001_initial	2014-12-09 23:10:23.255885+00
8	quizblock	0001_initial	2014-12-09 23:10:23.654167+00
9	sessions	0001_initial	2014-12-09 23:10:23.691694+00
10	main	0001_initial	2015-02-17 11:06:06.168698+00
11	waffle	0001_initial	2015-03-12 14:26:57.109264+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_migrations_id_seq', 11, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: flatblocks_flatblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY flatblocks_flatblock (id, slug, header, content) FROM stdin;
\.


--
-- Name: flatblocks_flatblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('flatblocks_flatblock_id_seq', 1, false);


--
-- Data for Name: main_response; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY main_response (id, added, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24) FROM stdin;
1	2015-02-17 15:49:41.089835+00	1	2	1	1	1	1	3	5	7	6	9	10	0	3	5	7	5	6	6	6	4	8	1	1
2	2015-02-17 17:55:57.973017+00	1	2	3	1	1	2	2	4	8	1	9	6	3	5	4	10	3	4	4	5	5	7	1	2
3	2015-02-17 17:58:02.066238+00	2	1	4	1	2	1	3	2	5	4	0	0	0	0	0	0	0	0	0	0	0	0		
4	2015-02-20 03:05:01.789752+00	3	3	3	2	1	1	9	9	8	8	7	0	7	5	5	5	3	3	2	0	0	0	2	1
5	2015-02-20 16:03:59.621745+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0		
6	2015-02-23 18:02:53.126075+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0		
7	2015-03-02 16:33:39.822569+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0		
8	2015-03-02 17:52:40.652559+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0		
9	2015-03-11 13:30:20.619476+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0		
10	2015-03-16 13:10:14.968364+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0		
11	2015-03-25 12:30:51.514497+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0		
12	2015-03-25 13:39:34.956581+00	1	2	4	1	1	2	5	4	7	3	7	2	7	5	4	8	8	8	8	8	8	5	1	2
13	2015-03-25 17:53:45.456383+00	4	4	4	2	2	2	9	9	8	8	8	9	8	9	9	8	9	8	9	8	9	9	1	1
14	2015-03-25 17:54:42.013964+00	4	4	4	2	2	2	9	9	9	9	9	9	9	0	0	9	10	10	10	10	10	10	1	1
15	2015-03-25 17:55:58.212278+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	1
16	2015-03-25 20:55:54.867883+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1
17	2015-03-25 20:58:36.988372+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2
18	2015-03-25 20:59:00.103111+00							0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0		
\.


--
-- Name: main_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('main_response_id_seq', 18, true);


--
-- Data for Name: pageblocks_htmlblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_htmlblock (id, html) FROM stdin;
\.


--
-- Name: pageblocks_htmlblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_htmlblock_id_seq', 1, false);


--
-- Data for Name: pageblocks_htmlblockwysiwyg; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_htmlblockwysiwyg (id, wysiwyg_html) FROM stdin;
\.


--
-- Name: pageblocks_htmlblockwysiwyg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_htmlblockwysiwyg_id_seq', 1, false);


--
-- Data for Name: pageblocks_imageblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_imageblock (id, image, caption, alt, lightbox) FROM stdin;
\.


--
-- Name: pageblocks_imageblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_imageblock_id_seq', 1, false);


--
-- Data for Name: pageblocks_imagepullquoteblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_imagepullquoteblock (id, image, caption, alt) FROM stdin;
\.


--
-- Name: pageblocks_imagepullquoteblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_imagepullquoteblock_id_seq', 1, false);


--
-- Data for Name: pageblocks_pullquoteblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_pullquoteblock (id, body) FROM stdin;
\.


--
-- Name: pageblocks_pullquoteblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_pullquoteblock_id_seq', 1, false);


--
-- Data for Name: pageblocks_textblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_textblock (id, body) FROM stdin;
\.


--
-- Name: pageblocks_textblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_textblock_id_seq', 1, false);


--
-- Data for Name: pagetree_hierarchy; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_hierarchy (id, name, base_url) FROM stdin;
\.


--
-- Name: pagetree_hierarchy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_hierarchy_id_seq', 1, false);


--
-- Data for Name: pagetree_pageblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_pageblock (id, ordinality, label, css_extra, object_id, content_type_id, section_id) FROM stdin;
\.


--
-- Name: pagetree_pageblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_pageblock_id_seq', 1, false);


--
-- Data for Name: pagetree_section; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_section (id, path, depth, numchild, label, slug, show_toc, deep_toc, hierarchy_id) FROM stdin;
\.


--
-- Name: pagetree_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_section_id_seq', 1, false);


--
-- Data for Name: pagetree_testblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_testblock (id, body) FROM stdin;
\.


--
-- Name: pagetree_testblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_testblock_id_seq', 1, false);


--
-- Data for Name: pagetree_userlocation; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_userlocation (id, path, hierarchy_id, user_id) FROM stdin;
\.


--
-- Name: pagetree_userlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_userlocation_id_seq', 1, false);


--
-- Data for Name: pagetree_userpagevisit; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_userpagevisit (id, status, first_visit, last_visit, section_id, user_id) FROM stdin;
\.


--
-- Name: pagetree_userpagevisit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_userpagevisit_id_seq', 1, false);


--
-- Data for Name: pagetree_version; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_version (id, saved_at, activity, data, comment, section_id, user_id) FROM stdin;
\.


--
-- Name: pagetree_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_version_id_seq', 1, false);


--
-- Data for Name: quizblock_answer; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_answer (id, value, label, correct, explanation, question_id, _order) FROM stdin;
\.


--
-- Name: quizblock_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_answer_id_seq', 1, false);


--
-- Data for Name: quizblock_question; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_question (id, text, question_type, explanation, intro_text, quiz_id, _order) FROM stdin;
\.


--
-- Name: quizblock_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_question_id_seq', 1, false);


--
-- Data for Name: quizblock_quiz; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_quiz (id, description, rhetorical, allow_redo, show_submit_state) FROM stdin;
\.


--
-- Name: quizblock_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_quiz_id_seq', 1, false);


--
-- Data for Name: quizblock_response; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_response (id, value, question_id, submission_id) FROM stdin;
\.


--
-- Name: quizblock_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_response_id_seq', 1, false);


--
-- Data for Name: quizblock_submission; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_submission (id, submitted, quiz_id, user_id) FROM stdin;
\.


--
-- Name: quizblock_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_submission_id_seq', 1, false);


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY registration_registrationprofile (id, user_id, activation_key) FROM stdin;
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 1, false);


--
-- Data for Name: tagging_tag; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY tagging_tag (id, name) FROM stdin;
\.


--
-- Name: tagging_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('tagging_tag_id_seq', 1, false);


--
-- Data for Name: tagging_taggeditem; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY tagging_taggeditem (id, tag_id, content_type_id, object_id) FROM stdin;
\.


--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('tagging_taggeditem_id_seq', 1, false);


--
-- Data for Name: waffle_flag; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY waffle_flag (id, name, everyone, percent, testing, superusers, staff, authenticated, languages, rollout, note, created, modified) FROM stdin;
\.


--
-- Data for Name: waffle_flag_groups; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY waffle_flag_groups (id, flag_id, group_id) FROM stdin;
\.


--
-- Name: waffle_flag_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('waffle_flag_groups_id_seq', 1, false);


--
-- Name: waffle_flag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('waffle_flag_id_seq', 1, false);


--
-- Data for Name: waffle_flag_users; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY waffle_flag_users (id, flag_id, user_id) FROM stdin;
\.


--
-- Name: waffle_flag_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('waffle_flag_users_id_seq', 1, false);


--
-- Data for Name: waffle_sample; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY waffle_sample (id, name, percent, note, created, modified) FROM stdin;
\.


--
-- Name: waffle_sample_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('waffle_sample_id_seq', 1, false);


--
-- Data for Name: waffle_switch; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY waffle_switch (id, name, active, note, created, modified) FROM stdin;
\.


--
-- Name: waffle_switch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('waffle_switch_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites_flatpage_id_site_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_key UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: flatblocks_flatblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY flatblocks_flatblock
    ADD CONSTRAINT flatblocks_flatblock_pkey PRIMARY KEY (id);


--
-- Name: flatblocks_flatblock_slug_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY flatblocks_flatblock
    ADD CONSTRAINT flatblocks_flatblock_slug_key UNIQUE (slug);


--
-- Name: main_response_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY main_response
    ADD CONSTRAINT main_response_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_htmlblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_htmlblock
    ADD CONSTRAINT pageblocks_htmlblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_htmlblockwysiwyg_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_htmlblockwysiwyg
    ADD CONSTRAINT pageblocks_htmlblockwysiwyg_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_imageblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_imageblock
    ADD CONSTRAINT pageblocks_imageblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_imagepullquoteblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_imagepullquoteblock
    ADD CONSTRAINT pageblocks_imagepullquoteblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_pullquoteblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_pullquoteblock
    ADD CONSTRAINT pageblocks_pullquoteblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_textblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_textblock
    ADD CONSTRAINT pageblocks_textblock_pkey PRIMARY KEY (id);


--
-- Name: pagetree_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_hierarchy
    ADD CONSTRAINT pagetree_hierarchy_pkey PRIMARY KEY (id);


--
-- Name: pagetree_pageblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_pageblock
    ADD CONSTRAINT pagetree_pageblock_pkey PRIMARY KEY (id);


--
-- Name: pagetree_section_path_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_section
    ADD CONSTRAINT pagetree_section_path_key UNIQUE (path);


--
-- Name: pagetree_section_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_section
    ADD CONSTRAINT pagetree_section_pkey PRIMARY KEY (id);


--
-- Name: pagetree_testblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_testblock
    ADD CONSTRAINT pagetree_testblock_pkey PRIMARY KEY (id);


--
-- Name: pagetree_userlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_userlocation
    ADD CONSTRAINT pagetree_userlocation_pkey PRIMARY KEY (id);


--
-- Name: pagetree_userlocation_user_id_2c1e621b58c00c58_uniq; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_userlocation
    ADD CONSTRAINT pagetree_userlocation_user_id_2c1e621b58c00c58_uniq UNIQUE (user_id, hierarchy_id);


--
-- Name: pagetree_userpagevisit_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_userpagevisit
    ADD CONSTRAINT pagetree_userpagevisit_pkey PRIMARY KEY (id);


--
-- Name: pagetree_userpagevisit_user_id_592d4a1c53731a18_uniq; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_userpagevisit
    ADD CONSTRAINT pagetree_userpagevisit_user_id_592d4a1c53731a18_uniq UNIQUE (user_id, section_id);


--
-- Name: pagetree_version_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_version
    ADD CONSTRAINT pagetree_version_pkey PRIMARY KEY (id);


--
-- Name: quizblock_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_answer
    ADD CONSTRAINT quizblock_answer_pkey PRIMARY KEY (id);


--
-- Name: quizblock_question_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_question
    ADD CONSTRAINT quizblock_question_pkey PRIMARY KEY (id);


--
-- Name: quizblock_quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_quiz
    ADD CONSTRAINT quizblock_quiz_pkey PRIMARY KEY (id);


--
-- Name: quizblock_response_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_response
    ADD CONSTRAINT quizblock_response_pkey PRIMARY KEY (id);


--
-- Name: quizblock_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_submission
    ADD CONSTRAINT quizblock_submission_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: tagging_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_name_key UNIQUE (name);


--
-- Name: tagging_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_tag_id_content_type_id_object_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_content_type_id_object_id_key UNIQUE (tag_id, content_type_id, object_id);


--
-- Name: waffle_flag_groups_flag_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_flag_groups
    ADD CONSTRAINT waffle_flag_groups_flag_id_group_id_key UNIQUE (flag_id, group_id);


--
-- Name: waffle_flag_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_flag_groups
    ADD CONSTRAINT waffle_flag_groups_pkey PRIMARY KEY (id);


--
-- Name: waffle_flag_name_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_flag
    ADD CONSTRAINT waffle_flag_name_key UNIQUE (name);


--
-- Name: waffle_flag_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_flag
    ADD CONSTRAINT waffle_flag_pkey PRIMARY KEY (id);


--
-- Name: waffle_flag_users_flag_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_flag_users
    ADD CONSTRAINT waffle_flag_users_flag_id_user_id_key UNIQUE (flag_id, user_id);


--
-- Name: waffle_flag_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_flag_users
    ADD CONSTRAINT waffle_flag_users_pkey PRIMARY KEY (id);


--
-- Name: waffle_sample_name_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_sample
    ADD CONSTRAINT waffle_sample_name_key UNIQUE (name);


--
-- Name: waffle_sample_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_sample
    ADD CONSTRAINT waffle_sample_pkey PRIMARY KEY (id);


--
-- Name: waffle_switch_name_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_switch
    ADD CONSTRAINT waffle_switch_name_key UNIQUE (name);


--
-- Name: waffle_switch_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY waffle_switch
    ADD CONSTRAINT waffle_switch_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_flatpage_572d4e42; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_flatpage_572d4e42 ON django_flatpage USING btree (url);


--
-- Name: django_flatpage_sites_9365d6e7; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_flatpage_sites_9365d6e7 ON django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_sites_c3368d3a; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_flatpage_sites_c3368d3a ON django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: flatblocks_flatblock_slug_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX flatblocks_flatblock_slug_like ON flatblocks_flatblock USING btree (slug varchar_pattern_ops);


--
-- Name: pagetree_pageblock_417f1b1c; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_pageblock_417f1b1c ON pagetree_pageblock USING btree (content_type_id);


--
-- Name: pagetree_pageblock_730f6511; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_pageblock_730f6511 ON pagetree_pageblock USING btree (section_id);


--
-- Name: pagetree_section_2dbcba41; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_section_2dbcba41 ON pagetree_section USING btree (slug);


--
-- Name: pagetree_section_ee12029a; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_section_ee12029a ON pagetree_section USING btree (hierarchy_id);


--
-- Name: pagetree_userlocation_e8701ad4; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_userlocation_e8701ad4 ON pagetree_userlocation USING btree (user_id);


--
-- Name: pagetree_userlocation_ee12029a; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_userlocation_ee12029a ON pagetree_userlocation USING btree (hierarchy_id);


--
-- Name: pagetree_userpagevisit_730f6511; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_userpagevisit_730f6511 ON pagetree_userpagevisit USING btree (section_id);


--
-- Name: pagetree_userpagevisit_e8701ad4; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_userpagevisit_e8701ad4 ON pagetree_userpagevisit USING btree (user_id);


--
-- Name: pagetree_version_730f6511; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_version_730f6511 ON pagetree_version USING btree (section_id);


--
-- Name: pagetree_version_e8701ad4; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_version_e8701ad4 ON pagetree_version USING btree (user_id);


--
-- Name: quizblock_answer_7aa0f6ee; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_answer_7aa0f6ee ON quizblock_answer USING btree (question_id);


--
-- Name: quizblock_question_baedd54c; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_question_baedd54c ON quizblock_question USING btree (quiz_id);


--
-- Name: quizblock_response_1dd9cfcc; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_response_1dd9cfcc ON quizblock_response USING btree (submission_id);


--
-- Name: quizblock_response_7aa0f6ee; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_response_7aa0f6ee ON quizblock_response USING btree (question_id);


--
-- Name: quizblock_submission_baedd54c; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_submission_baedd54c ON quizblock_submission USING btree (quiz_id);


--
-- Name: quizblock_submission_e8701ad4; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_submission_e8701ad4 ON quizblock_submission USING btree (user_id);


--
-- Name: tagging_tag_name_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX tagging_tag_name_like ON tagging_tag USING btree (name varchar_pattern_ops);


--
-- Name: tagging_taggeditem_content_type_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX tagging_taggeditem_content_type_id ON tagging_taggeditem USING btree (content_type_id);


--
-- Name: tagging_taggeditem_object_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX tagging_taggeditem_object_id ON tagging_taggeditem USING btree (object_id);


--
-- Name: tagging_taggeditem_tag_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX tagging_taggeditem_tag_id ON tagging_taggeditem USING btree (tag_id);


--
-- Name: waffle_flag_created; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_flag_created ON waffle_flag USING btree (created);


--
-- Name: waffle_flag_groups_flag_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_flag_groups_flag_id ON waffle_flag_groups USING btree (flag_id);


--
-- Name: waffle_flag_groups_group_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_flag_groups_group_id ON waffle_flag_groups USING btree (group_id);


--
-- Name: waffle_flag_name_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_flag_name_like ON waffle_flag USING btree (name varchar_pattern_ops);


--
-- Name: waffle_flag_users_flag_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_flag_users_flag_id ON waffle_flag_users USING btree (flag_id);


--
-- Name: waffle_flag_users_user_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_flag_users_user_id ON waffle_flag_users USING btree (user_id);


--
-- Name: waffle_sample_created; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_sample_created ON waffle_sample USING btree (created);


--
-- Name: waffle_sample_name_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_sample_name_like ON waffle_sample USING btree (name varchar_pattern_ops);


--
-- Name: waffle_switch_created; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_switch_created ON waffle_switch USING btree (created);


--
-- Name: waffle_switch_name_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX waffle_switch_name_like ON waffle_switch USING btree (name varchar_pattern_ops);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatp_flatpage_id_7b4e76c0a3a9d13a_fk_django_flatpage_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatp_flatpage_id_7b4e76c0a3a9d13a_fk_django_flatpage_id FOREIGN KEY (flatpage_id) REFERENCES django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_site_site_id_481dafa7c6e850d9_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_site_id_481dafa7c6e850d9_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flag_id_refs_id_91967039; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY waffle_flag_groups
    ADD CONSTRAINT flag_id_refs_id_91967039 FOREIGN KEY (flag_id) REFERENCES waffle_flag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flag_id_refs_id_930dddc8; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY waffle_flag_users
    ADD CONSTRAINT flag_id_refs_id_930dddc8 FOREIGN KEY (flag_id) REFERENCES waffle_flag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_content_type_id_67eb16ac7b8b446e_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_pageblock
    ADD CONSTRAINT page_content_type_id_67eb16ac7b8b446e_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_hierarchy_id_107fc9d0e031fe9d_fk_pagetree_hierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_section
    ADD CONSTRAINT pagetree_hierarchy_id_107fc9d0e031fe9d_fk_pagetree_hierarchy_id FOREIGN KEY (hierarchy_id) REFERENCES pagetree_hierarchy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_hierarchy_id_2e3b8cd820bbaf7f_fk_pagetree_hierarchy_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_userlocation
    ADD CONSTRAINT pagetree_hierarchy_id_2e3b8cd820bbaf7f_fk_pagetree_hierarchy_id FOREIGN KEY (hierarchy_id) REFERENCES pagetree_hierarchy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_pag_section_id_5c4e519d7432f05a_fk_pagetree_section_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_pageblock
    ADD CONSTRAINT pagetree_pag_section_id_5c4e519d7432f05a_fk_pagetree_section_id FOREIGN KEY (section_id) REFERENCES pagetree_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_use_section_id_632455984e72fe6d_fk_pagetree_section_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_userpagevisit
    ADD CONSTRAINT pagetree_use_section_id_632455984e72fe6d_fk_pagetree_section_id FOREIGN KEY (section_id) REFERENCES pagetree_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_userlocation_user_id_6a8f992e8ac6e472_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_userlocation
    ADD CONSTRAINT pagetree_userlocation_user_id_6a8f992e8ac6e472_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_userpagevisit_user_id_7b03ef3699b84ee8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_userpagevisit
    ADD CONSTRAINT pagetree_userpagevisit_user_id_7b03ef3699b84ee8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_ver_section_id_62cde01560f76e18_fk_pagetree_section_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_version
    ADD CONSTRAINT pagetree_ver_section_id_62cde01560f76e18_fk_pagetree_section_id FOREIGN KEY (section_id) REFERENCES pagetree_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_version_user_id_10d401f563f38493_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_version
    ADD CONSTRAINT pagetree_version_user_id_10d401f563f38493_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizb_submission_id_50b404e53d8a24e6_fk_quizblock_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_response
    ADD CONSTRAINT quizb_submission_id_50b404e53d8a24e6_fk_quizblock_submission_id FOREIGN KEY (submission_id) REFERENCES quizblock_submission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_questio_quiz_id_15aeeb0085d9c266_fk_quizblock_quiz_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_question
    ADD CONSTRAINT quizblock_questio_quiz_id_15aeeb0085d9c266_fk_quizblock_quiz_id FOREIGN KEY (quiz_id) REFERENCES quizblock_quiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_question_id_10c1f4d5f1638ee3_fk_quizblock_question_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_answer
    ADD CONSTRAINT quizblock_question_id_10c1f4d5f1638ee3_fk_quizblock_question_id FOREIGN KEY (question_id) REFERENCES quizblock_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_question_id_7813b2d6724e62f0_fk_quizblock_question_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_response
    ADD CONSTRAINT quizblock_question_id_7813b2d6724e62f0_fk_quizblock_question_id FOREIGN KEY (question_id) REFERENCES quizblock_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_submiss_quiz_id_117f70e2f9675a18_fk_quizblock_quiz_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_submission
    ADD CONSTRAINT quizblock_submiss_quiz_id_117f70e2f9675a18_fk_quizblock_quiz_id FOREIGN KEY (quiz_id) REFERENCES quizblock_quiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_submission_user_id_4bce9cc16d518e2e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_submission
    ADD CONSTRAINT quizblock_submission_user_id_4bce9cc16d518e2e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagging_taggeditem_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tagging_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

