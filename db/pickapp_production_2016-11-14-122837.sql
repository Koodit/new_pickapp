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
-- Name: administrated_rooms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE administrated_rooms (
    id integer NOT NULL,
    room_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: administrated_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE administrated_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: administrated_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE administrated_rooms_id_seq OWNED BY administrated_rooms.id;


--
-- Name: applied_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE applied_users (
    id integer NOT NULL,
    user_id integer,
    travel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    notification_id integer
);


--
-- Name: applied_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE applied_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: applied_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE applied_users_id_seq OWNED BY applied_users.id;


--
-- Name: approved_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE approved_users (
    id integer NOT NULL,
    user_id integer,
    travel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: approved_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE approved_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: approved_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE approved_users_id_seq OWNED BY approved_users.id;


--
-- Name: badge_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE badge_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: badge_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE badge_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badge_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE badge_categories_id_seq OWNED BY badge_categories.id;


--
-- Name: badges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE badges (
    id integer NOT NULL,
    name character varying,
    description text,
    value integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    badge_category_id integer
);


--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE badges_id_seq OWNED BY badges.id;


--
-- Name: car_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE car_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: car_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE car_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: car_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE car_categories_id_seq OWNED BY car_categories.id;


--
-- Name: cars; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cars (
    id integer NOT NULL,
    plate character varying,
    sits integer,
    can_smoke boolean,
    animals_allowed boolean,
    cc integer,
    notes text,
    model character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    car_category_id integer,
    user_id integer
);


--
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cars_id_seq OWNED BY cars.id;


--
-- Name: citizen_badges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE citizen_badges (
    id integer NOT NULL,
    user_id integer,
    travel_count integer DEFAULT 0,
    completion_percentage double precision,
    completed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: citizen_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE citizen_badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: citizen_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE citizen_badges_id_seq OWNED BY citizen_badges.id;


--
-- Name: driver_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE driver_details (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    patente_file_name character varying,
    patente_content_type character varying,
    patente_file_size integer,
    patente_updated_at timestamp without time zone,
    assicurazione_file_name character varying,
    assicurazione_content_type character varying,
    assicurazione_file_size integer,
    assicurazione_updated_at timestamp without time zone,
    license_type character varying,
    license_number character varying,
    license_release_date date,
    license_expire_date date,
    license_release_city character varying,
    license_release_city_common character varying
);


--
-- Name: driver_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE driver_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: driver_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE driver_details_id_seq OWNED BY driver_details.id;


--
-- Name: macro_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE macro_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: macro_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE macro_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: macro_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE macro_categories_id_seq OWNED BY macro_categories.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE notifications (
    id integer NOT NULL,
    title character varying,
    body character varying,
    from_user boolean,
    icon character varying,
    favourite boolean,
    event character varying,
    clicked boolean DEFAULT false,
    importance integer,
    emitter_id integer,
    receiver_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    params text,
    link character varying,
    is_message boolean DEFAULT false
);


--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: parents_controls; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parents_controls (
    id integer NOT NULL,
    parent_mail character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer
);


--
-- Name: parents_controls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parents_controls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parents_controls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE parents_controls_id_seq OWNED BY parents_controls.id;


--
-- Name: passenger_travels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE passenger_travels (
    id integer NOT NULL,
    user_id integer,
    travel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: passenger_travels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE passenger_travels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: passenger_travels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE passenger_travels_id_seq OWNED BY passenger_travels.id;


--
-- Name: preferred_rooms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE preferred_rooms (
    id integer NOT NULL,
    room_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: preferred_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE preferred_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preferred_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE preferred_rooms_id_seq OWNED BY preferred_rooms.id;


--
-- Name: private_chats; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE private_chats (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    travel_id integer,
    driver_id integer,
    passenger_id integer
);


--
-- Name: private_chats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE private_chats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: private_chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE private_chats_id_seq OWNED BY private_chats.id;


--
-- Name: private_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE private_messages (
    id integer NOT NULL,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    private_chat_id integer,
    author_id integer,
    read boolean DEFAULT false
);


--
-- Name: private_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE private_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: private_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE private_messages_id_seq OWNED BY private_messages.id;


--
-- Name: private_room_settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE private_room_settings (
    id integer NOT NULL,
    referral_domain character varying,
    admin_permission boolean,
    why_restrict text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    room_id integer
);


--
-- Name: private_room_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE private_room_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: private_room_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE private_room_settings_id_seq OWNED BY private_room_settings.id;


--
-- Name: public_chat_partecipants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public_chat_partecipants (
    id integer NOT NULL,
    user_id integer,
    travel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: public_chat_partecipants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public_chat_partecipants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public_chat_partecipants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public_chat_partecipants_id_seq OWNED BY public_chat_partecipants.id;


--
-- Name: public_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public_messages (
    id integer NOT NULL,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    author_id integer,
    travel_id integer,
    is_travel_owner boolean DEFAULT false
);


--
-- Name: public_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public_messages_id_seq OWNED BY public_messages.id;


--
-- Name: room_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE room_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


--
-- Name: room_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE room_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: room_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE room_categories_id_seq OWNED BY room_categories.id;


--
-- Name: room_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE room_images (
    id integer NOT NULL,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


--
-- Name: room_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE room_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: room_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE room_images_id_seq OWNED BY room_images.id;


--
-- Name: room_reviews; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE room_reviews (
    id integer NOT NULL,
    content text,
    rating integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    room_id integer,
    author_id integer
);


--
-- Name: room_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE room_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: room_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE room_reviews_id_seq OWNED BY room_reviews.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rooms (
    id integer NOT NULL,
    admin_editable boolean,
    name character varying,
    rating double precision,
    total_rating double precision,
    number_of_ratings integer,
    price double precision,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    is_private boolean,
    website character varying,
    facebook character varying,
    twitter character varying,
    instagram character varying,
    trip_advisor character varying,
    phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    address character varying,
    lat double precision,
    long double precision,
    room_category_id integer,
    background_image_file_name character varying,
    background_image_content_type character varying,
    background_image_file_size integer,
    background_image_updated_at timestamp without time zone,
    description text,
    is_school boolean DEFAULT false
);


--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: school_room_partecipants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE school_room_partecipants (
    id integer NOT NULL,
    user_id integer,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: school_room_partecipants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE school_room_partecipants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: school_room_partecipants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE school_room_partecipants_id_seq OWNED BY school_room_partecipants.id;


--
-- Name: school_room_settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE school_room_settings (
    id integer NOT NULL,
    school_representative character varying,
    non_partecipant_message text,
    referral_link character varying,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    share_link character varying,
    code character varying,
    email_domain character varying
);


--
-- Name: school_room_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE school_room_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: school_room_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE school_room_settings_id_seq OWNED BY school_room_settings.id;


--
-- Name: selected_macro_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE selected_macro_categories (
    id integer NOT NULL,
    room_category_id integer,
    macro_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: selected_macro_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE selected_macro_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: selected_macro_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE selected_macro_categories_id_seq OWNED BY selected_macro_categories.id;


--
-- Name: selected_room_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE selected_room_categories (
    id integer NOT NULL,
    room_id integer,
    room_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: selected_room_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE selected_room_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: selected_room_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE selected_room_categories_id_seq OWNED BY selected_room_categories.id;


--
-- Name: social_master_badge_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE social_master_badge_relations (
    id integer NOT NULL,
    user_id integer,
    social_master_badge_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: social_master_badge_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE social_master_badge_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: social_master_badge_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE social_master_badge_relations_id_seq OWNED BY social_master_badge_relations.id;


--
-- Name: social_master_badges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE social_master_badges (
    id integer NOT NULL,
    user_id integer,
    relations_count integer DEFAULT 0,
    completed boolean DEFAULT false,
    completion_percentage double precision DEFAULT 0.0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: social_master_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE social_master_badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: social_master_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE social_master_badges_id_seq OWNED BY social_master_badges.id;


--
-- Name: travel_request_chat_partecipants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE travel_request_chat_partecipants (
    id integer NOT NULL,
    user_id integer,
    travel_request_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: travel_request_chat_partecipants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE travel_request_chat_partecipants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: travel_request_chat_partecipants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE travel_request_chat_partecipants_id_seq OWNED BY travel_request_chat_partecipants.id;


--
-- Name: travel_request_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE travel_request_messages (
    id integer NOT NULL,
    content text,
    author_id integer,
    "integer" integer,
    travel_request_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_request_owner boolean DEFAULT false
);


--
-- Name: travel_request_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE travel_request_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: travel_request_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE travel_request_messages_id_seq OWNED BY travel_request_messages.id;


--
-- Name: travel_requests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE travel_requests (
    id integer NOT NULL,
    passenger_id integer,
    room_id integer,
    starting_address character varying,
    lat double precision,
    lng double precision,
    is_one_way boolean,
    one_way_datetime timestamp without time zone,
    back_datetime timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    towards_room boolean DEFAULT true,
    can_repay boolean DEFAULT false,
    destination_address character varying,
    note text,
    flexible_departure boolean,
    only_with_feedback boolean
);


--
-- Name: travel_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE travel_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: travel_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE travel_requests_id_seq OWNED BY travel_requests.id;


--
-- Name: travel_reviews; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE travel_reviews (
    id integer NOT NULL,
    content text,
    rating integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    travel_id integer,
    made_by_driver boolean,
    target_id integer,
    to_be_written boolean DEFAULT false,
    room_id integer
);


--
-- Name: travel_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE travel_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: travel_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE travel_reviews_id_seq OWNED BY travel_reviews.id;


--
-- Name: travel_stops; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE travel_stops (
    id integer NOT NULL,
    address character varying,
    lat double precision,
    lng double precision,
    travel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: travel_stops_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE travel_stops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: travel_stops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE travel_stops_id_seq OWNED BY travel_stops.id;


--
-- Name: travels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE travels (
    id integer NOT NULL,
    starting_address character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    car_id integer,
    driver_id integer,
    room_id integer,
    completion_token character varying,
    completed boolean DEFAULT false,
    waiting_for_confirm boolean DEFAULT false,
    departure_datetime timestamp without time zone,
    towards_room boolean,
    starting_lat double precision,
    starting_lng double precision,
    destination_address character varying,
    destination_lat double precision,
    destination_lng double precision,
    is_recursive boolean,
    flexible_departure boolean DEFAULT false,
    only_with_feedback boolean DEFAULT false,
    can_repay boolean
);


--
-- Name: travels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE travels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: travels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE travels_id_seq OWNED BY travels.id;


--
-- Name: user_badges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_badges (
    id integer NOT NULL,
    user_id integer,
    badge_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_badges_id_seq OWNED BY user_badges.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    birth_date date,
    name character varying,
    surname character varying,
    genre character varying,
    address character varying,
    comune character varying,
    prov character varying,
    is_driver boolean,
    is_verified boolean,
    description text,
    provider character varying NOT NULL,
    uid character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    nickname character varying,
    image character varying,
    email character varying,
    tokens text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    role character varying,
    pending_driver_verification boolean,
    profile_image_file_name character varying,
    profile_image_content_type character varying,
    profile_image_file_size integer,
    profile_image_updated_at timestamp without time zone,
    car_count integer DEFAULT 0,
    device_tokens text,
    zip_code character varying
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
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY administrated_rooms ALTER COLUMN id SET DEFAULT nextval('administrated_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY applied_users ALTER COLUMN id SET DEFAULT nextval('applied_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY approved_users ALTER COLUMN id SET DEFAULT nextval('approved_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY badge_categories ALTER COLUMN id SET DEFAULT nextval('badge_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY badges ALTER COLUMN id SET DEFAULT nextval('badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY car_categories ALTER COLUMN id SET DEFAULT nextval('car_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cars ALTER COLUMN id SET DEFAULT nextval('cars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY citizen_badges ALTER COLUMN id SET DEFAULT nextval('citizen_badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY driver_details ALTER COLUMN id SET DEFAULT nextval('driver_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY macro_categories ALTER COLUMN id SET DEFAULT nextval('macro_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY parents_controls ALTER COLUMN id SET DEFAULT nextval('parents_controls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY passenger_travels ALTER COLUMN id SET DEFAULT nextval('passenger_travels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY preferred_rooms ALTER COLUMN id SET DEFAULT nextval('preferred_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY private_chats ALTER COLUMN id SET DEFAULT nextval('private_chats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY private_messages ALTER COLUMN id SET DEFAULT nextval('private_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY private_room_settings ALTER COLUMN id SET DEFAULT nextval('private_room_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public_chat_partecipants ALTER COLUMN id SET DEFAULT nextval('public_chat_partecipants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public_messages ALTER COLUMN id SET DEFAULT nextval('public_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY room_categories ALTER COLUMN id SET DEFAULT nextval('room_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY room_images ALTER COLUMN id SET DEFAULT nextval('room_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY room_reviews ALTER COLUMN id SET DEFAULT nextval('room_reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY school_room_partecipants ALTER COLUMN id SET DEFAULT nextval('school_room_partecipants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY school_room_settings ALTER COLUMN id SET DEFAULT nextval('school_room_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY selected_macro_categories ALTER COLUMN id SET DEFAULT nextval('selected_macro_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY selected_room_categories ALTER COLUMN id SET DEFAULT nextval('selected_room_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY social_master_badge_relations ALTER COLUMN id SET DEFAULT nextval('social_master_badge_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY social_master_badges ALTER COLUMN id SET DEFAULT nextval('social_master_badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY travel_request_chat_partecipants ALTER COLUMN id SET DEFAULT nextval('travel_request_chat_partecipants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY travel_request_messages ALTER COLUMN id SET DEFAULT nextval('travel_request_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY travel_requests ALTER COLUMN id SET DEFAULT nextval('travel_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY travel_reviews ALTER COLUMN id SET DEFAULT nextval('travel_reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY travel_stops ALTER COLUMN id SET DEFAULT nextval('travel_stops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY travels ALTER COLUMN id SET DEFAULT nextval('travels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_badges ALTER COLUMN id SET DEFAULT nextval('user_badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: administrated_rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY administrated_rooms (id, room_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: administrated_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('administrated_rooms_id_seq', 1, false);


--
-- Data for Name: applied_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY applied_users (id, user_id, travel_id, created_at, updated_at, notification_id) FROM stdin;
135	12	392	2016-09-14 13:30:12.965541	2016-09-14 13:36:06.637378	644
\.


--
-- Name: applied_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('applied_users_id_seq', 143, true);


--
-- Data for Name: approved_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY approved_users (id, user_id, travel_id, created_at, updated_at) FROM stdin;
71	126	368	2016-06-09 16:26:10.288003	2016-06-09 16:26:10.288003
73	15	389	2016-09-09 09:26:18.063436	2016-09-09 09:26:18.063436
74	73	390	2016-09-14 10:57:23.485482	2016-09-14 10:57:23.485482
75	12	393	2016-09-16 13:05:20.42272	2016-09-16 13:05:20.42272
76	12	393	2016-09-16 13:05:21.619734	2016-09-16 13:05:21.619734
77	12	394	2016-09-16 14:28:30.054299	2016-09-16 14:28:30.054299
\.


--
-- Name: approved_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('approved_users_id_seq', 78, true);


--
-- Data for Name: badge_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY badge_categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: badge_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('badge_categories_id_seq', 1, false);


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY badges (id, name, description, value, created_at, updated_at, badge_category_id) FROM stdin;
\.


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('badges_id_seq', 1, false);


--
-- Data for Name: car_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY car_categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: car_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('car_categories_id_seq', 1, false);


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cars (id, plate, sits, can_smoke, animals_allowed, cc, notes, model, created_at, updated_at, car_category_id, user_id) FROM stdin;
1	CJ456NC	4	f	\N	\N	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.	Fiat Idea	2015-06-08 15:34:33.983412	2015-06-08 15:34:33.983412	\N	3
2	K00DIT	1	\N	\N	\N	Porsche 911 Targa 4S confortevole e sicuro.	Porsche 911 Targa 4S	2015-06-11 12:31:54.520373	2015-06-11 12:31:54.520373	\N	9
3	DT423HX	5	t	t	\N	\N	fiat multipla	2015-06-30 10:30:48.446264	2015-06-30 10:30:48.446264	\N	11
5	BY628DG	4	t	\N	\N	\N	Ford Focus	2015-07-11 16:21:22.775022	2015-07-11 16:21:22.775022	\N	12
6	DY423HX	5	t	t	\N	Portate buona musica!!	Fiat Multipla	2015-07-11 18:38:40.806023	2015-07-11 18:38:40.806023	\N	15
7	EL 302 RJ	4	t	\N	\N	Sono simpatico!	Polo	2015-07-15 07:56:18.52729	2015-07-26 15:52:32.210879	\N	14
10	DY 000 FA	1	\N	\N	\N	So' Ricco!	Ferrari California	2015-07-26 15:53:19.658819	2015-07-26 15:53:19.658819	\N	14
8	BC857YC	4	t	t	\N	\N	fiat bravo	2015-07-15 07:56:27.109024	2015-08-06 14:39:03.300475	\N	15
11	55667	3	\N	\N	\N	Non resco a cliccare sulle spunte	Passat	2015-08-07 08:56:13.301707	2015-08-07 08:56:13.301707	\N	17
14	IF 9342 RN	1	t	t	\N	Posto per i bagagli ridotto a 45x58x30	Porches 911 3.0	2015-09-03 14:14:28.348943	2015-09-03 14:14:28.348943	\N	13
20	ET123MK	4	\N	\N	\N	\N	VW Golf 1.6 TDI	2015-11-03 16:57:51.478319	2015-11-03 16:57:51.478319	\N	65
21	EL368ZD	3	\N	t	\N	\N	Fiat Panda	2015-11-05 23:54:25.518141	2015-11-05 23:54:25.518141	\N	28
22	EL302BY	3	t	t	\N	\N	Polo	2015-11-06 00:17:33.899003	2015-11-06 00:17:33.899003	\N	69
23	rj234ed	3	t	t	\N	\N	Polo	2015-11-12 09:59:20.670389	2015-11-12 09:59:20.670389	\N	22
24	AA000BB	3	t	t	\N	\N	Fiat Panda	2015-11-18 13:47:31.312857	2015-11-18 13:47:31.312857	\N	73
25	Db7777	4	\N	\N	\N	\N	Passat	2015-12-03 09:24:02.876493	2015-12-03 09:24:02.876493	\N	16
26	pc444he	4	f	t	\N	\N	multipla	2016-03-08 09:43:35.678149	2016-03-08 09:43:35.678149	\N	16
27	DY423HX	5	t	t	\N	\N	fiat multipla	2016-04-04 09:16:05.136037	2016-04-04 09:16:05.136037	\N	87
28	BY628DG	3	t	\N	\N	\N	Ford Focus	2016-04-06 10:54:26.773323	2016-04-06 10:54:26.773323	\N	95
29	BC398YC	3	t	t	\N	\N	Opel corsa	2016-04-28 12:05:08.394299	2016-04-28 12:05:08.394299	\N	75
30	\N	4	\N	t	\N	\N	Panda young '89	2016-06-08 11:53:11.964454	2016-06-08 11:53:11.964454	\N	120
31	AA000AA	3	t	\N	\N	\N	Fiat panda	2016-06-08 16:08:23.773257	2016-06-08 16:08:23.773257	\N	58
32	DM695XZ	3	\N	t	\N	\N	Fiat 500	2016-06-08 16:26:34.768042	2016-06-08 16:26:34.768042	\N	107
33	Fb146yj	\N	\N	\N	\N	\N	Hiunday Tucson	2016-06-18 14:24:23.332488	2016-06-18 14:24:23.332488	\N	139
34	CF196HK	3	t	\N	\N	\N	Renault Clio	2016-07-12 15:30:53.261189	2016-07-12 15:30:53.261189	\N	154
35	Dx096at	4	\N	t	\N	\N	I10 hunday	2016-07-14 11:59:08.185179	2016-07-14 11:59:08.185179	\N	103
36	EH862JM	3	\N	\N	\N	\N	Fiat Punto Evo	2016-07-18 13:27:57.976316	2016-07-18 13:27:57.976316	\N	149
37	EJ629TS	3	\N	\N	\N	\N	ford c-max	2016-10-03 06:39:00.038318	2016-10-03 06:39:00.038318	\N	164
38	ES 339 TY	1	\N	f	\N	\N	VOLKSWAGEN TDI NERA	2016-10-11 13:19:05.58366	2016-10-11 13:19:05.58366	\N	147
39	DP076SA	4	f	\N	\N	\N	WW Golf	2016-10-17 17:09:15.317141	2016-10-17 17:09:15.317141	\N	189
40	Fb146yj	4	\N	\N	\N	\N	Hyundai Tucson	2016-10-25 18:01:25.843622	2016-10-25 18:01:25.843622	\N	139
\.


--
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cars_id_seq', 40, true);


--
-- Data for Name: citizen_badges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY citizen_badges (id, user_id, travel_count, completion_percentage, completed, created_at, updated_at) FROM stdin;
3	17	1	20	f	2015-07-15 16:16:40.413633	2015-07-15 16:16:40.413633
1	14	5	100	t	2015-07-13 20:58:18.788237	2015-08-19 10:05:12.844375
6	34	1	20	f	2015-09-04 15:01:27.388183	2015-09-04 15:01:27.388183
8	54	1	20	f	2015-10-27 18:42:47.943267	2015-10-27 18:42:47.943267
5	13	4	80	f	2015-08-11 13:57:28.252024	2015-11-05 18:56:10.6661
10	65	1	20	f	2015-11-05 18:56:10.716051	2015-11-05 18:56:10.716051
9	67	2	40	f	2015-11-05 18:56:10.684877	2015-11-06 01:31:11.462101
7	27	2	40	f	2015-10-27 18:42:47.936589	2015-11-16 09:12:03.683238
4	16	2	40	f	2015-08-11 11:19:08.555731	2016-03-14 10:16:28.797232
14	58	1	20	f	2016-04-05 12:12:03.918023	2016-04-05 12:12:03.918023
2	15	4	80	f	2015-07-15 15:15:40.616323	2016-04-05 12:44:22.719302
11	12	5	100	t	2015-12-02 21:04:03.167374	2016-04-06 12:23:29.483019
15	95	1	20	f	2016-04-06 13:17:11.093946	2016-04-06 13:17:11.093946
12	73	3	60	f	2015-12-02 21:12:34.644341	2016-04-12 10:51:29.230888
13	87	3	60	f	2016-04-04 08:48:44.459248	2016-04-14 14:06:31.347181
17	29	1	20	f	2016-05-25 09:04:59.25266	2016-05-25 09:04:59.25266
16	107	2	40	f	2016-05-11 18:38:58.383811	2016-09-12 10:27:27.021837
\.


--
-- Name: citizen_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('citizen_badges_id_seq', 17, true);


--
-- Data for Name: driver_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY driver_details (id, user_id, created_at, updated_at, patente_file_name, patente_content_type, patente_file_size, patente_updated_at, assicurazione_file_name, assicurazione_content_type, assicurazione_file_size, assicurazione_updated_at, license_type, license_number, license_release_date, license_expire_date, license_release_city, license_release_city_common) FROM stdin;
1	3	2015-06-08 14:36:50.082816	2015-06-08 14:36:50.082816	hqdefault.jpg	image/jpeg	14773	2015-06-08 14:36:49.716712	hqdefault.jpg	image/jpeg	14773	2015-06-08 14:36:49.921573	\N	\N	\N	\N	\N	\N
2	5	2015-06-08 14:51:19.623737	2015-06-08 14:51:19.623737	3663.jpeg	image/jpeg	58799	2015-06-08 14:51:19.263462	3663.jpeg	image/jpeg	58799	2015-06-08 14:51:19.444535	\N	\N	\N	\N	\N	\N
3	2	2015-06-08 14:52:57.676584	2015-06-08 14:52:57.676584	Foto_del_60685724-06-2457182_alle_16_51.jpg	image/jpeg	90906	2015-06-08 14:52:57.18038	Foto_del_60685724-06-2457182_alle_16_51.jpg	image/jpeg	90906	2015-06-08 14:52:57.419137	\N	\N	\N	\N	\N	\N
4	9	2015-06-11 12:28:37.786142	2015-06-11 12:28:37.786142	11391188_10206713339021956_5844194139823553044_n.jpg	image/jpeg	55458	2015-06-11 12:28:37.187445	11391188_10206713339021956_5844194139823553044_n.jpg	image/jpeg	55458	2015-06-11 12:28:37.48352	\N	\N	\N	\N	\N	\N
5	11	2015-06-25 13:25:09.854502	2015-06-25 13:25:09.854502	Foto_del_55455873-06-2457199_alle_15_24.jpg	image/jpeg	91779	2015-06-25 13:25:09.348274	Foto_del_55455873-06-2457199_alle_15_24.jpg	image/jpeg	91779	2015-06-25 13:25:09.59963	\N	\N	\N	\N	\N	\N
6	11	2015-06-25 18:45:52.955881	2015-06-25 18:45:52.955881	Foto_del_55455873-06-2457199_alle_15_24.jpg	image/jpeg	91779	2015-06-25 18:45:52.558185	Foto_del_60685724-06-2457182_alle_16_51.jpg	image/jpeg	90906	2015-06-25 18:45:52.753747	\N	\N	\N	\N	\N	\N
7	15	2015-07-09 23:10:08.563	2015-07-09 23:10:08.563	Foto_del_55455873-06-2457199_alle_15_24.jpg	image/jpeg	91779	2015-07-09 23:10:07.963991	Foto_del_60685724-06-2457182_alle_16_51.jpg	image/jpeg	90906	2015-07-09 23:10:08.277955	\N	\N	\N	\N	\N	\N
8	15	2015-07-09 23:11:50.56139	2015-07-09 23:11:50.56139	Foto_del_60685724-06-2457182_alle_16_51.jpg	image/jpeg	90906	2015-07-09 23:11:50.017646	Foto_del_55455873-06-2457199_alle_15_24.jpg	image/jpeg	91779	2015-07-09 23:11:50.285016	\N	\N	\N	\N	\N	\N
9	16	2015-07-10 15:35:23.589767	2015-07-10 15:35:23.589767	eLeBobby.jpg	image/jpeg	174390	2015-07-10 15:35:22.854904	eLeBobby.jpg	image/jpeg	174390	2015-07-10 15:35:23.250716	\N	\N	\N	\N	\N	\N
10	13	2015-07-13 08:55:19.976064	2015-07-13 08:55:19.976064	Koodit_der.png	image/png	399869	2015-07-13 08:55:17.532058	sfondokoodit.png	image/png	100781	2015-07-13 08:55:18.231159	\N	\N	\N	\N	\N	\N
11	14	2015-07-15 07:49:54.553747	2015-07-15 07:49:54.553747	thumb.output.php-4.jpeg	image/jpeg	21459	2015-07-15 07:49:54.092478	Alzheimer-alex-ten-napel-34.jpg	image/jpeg	67267	2015-07-15 07:49:54.318236	\N	\N	\N	\N	\N	\N
12	19	2015-07-15 14:13:23.68045	2015-07-15 14:13:23.68045	eLeBobby.jpg	image/jpeg	174390	2015-07-15 14:13:23.105772	eLeBobby.jpg	image/jpeg	174390	2015-07-15 14:13:23.378591	\N	\N	\N	\N	\N	\N
13	22	2015-07-26 16:00:07.897334	2015-07-26 16:00:07.897334	canto-dualcup.jpg	image/jpeg	770245	2015-07-26 16:00:05.327972	erogatore2.png	image/png	95915	2015-07-26 16:00:07.504418	\N	\N	\N	\N	\N	\N
14	26	2015-08-11 11:12:46.563771	2015-08-11 11:12:46.563771	eLeBobby.jpg	image/jpeg	174390	2015-08-11 11:12:45.843323	eLeBobby.jpg	image/jpeg	174390	2015-08-11 11:12:46.187252	\N	\N	\N	\N	\N	\N
15	54	2015-10-24 15:24:08.499391	2015-10-24 15:24:08.499391	image.jpg	image/jpeg	1407452	2015-10-24 15:24:00.715144	image.jpg	image/jpeg	1536552	2015-10-24 15:24:04.688603	\N	\N	\N	\N	\N	\N
16	54	2015-10-24 15:24:09.221165	2015-10-24 15:24:09.221165	image.jpg	image/jpeg	1407452	2015-10-24 15:24:01.420714	image.jpg	image/jpeg	1536552	2015-10-24 15:24:05.481594	\N	\N	\N	\N	\N	\N
17	53	2015-11-02 17:00:42.575537	2015-11-02 17:00:42.575537	data	image/jpeg	21121	2015-11-02 17:00:42.17008	data	image/jpeg	28403	2015-11-02 17:00:42.364115	\N	\N	\N	\N	\N	\N
18	53	2015-11-02 17:11:51.628283	2015-11-02 17:11:51.628283	data	image/jpeg	26033	2015-11-02 17:11:51.315477	data	image/jpeg	30643	2015-11-02 17:11:51.477674	\N	\N	\N	\N	\N	\N
19	53	2015-11-02 17:20:50.262353	2015-11-02 17:20:50.262353	data	image/jpeg	33779	2015-11-02 17:20:49.903952	data	image/jpeg	70470	2015-11-02 17:20:50.08132	\N	\N	\N	\N	\N	\N
20	64	2015-11-02 18:07:04.819027	2015-11-02 18:07:04.819027	data	image/jpeg	46584	2015-11-02 18:07:04.470994	data	image/jpeg	59651	2015-11-02 18:07:04.644647	\N	\N	\N	\N	\N	\N
21	65	2015-11-02 18:21:35.388374	2015-11-02 18:21:35.388374	data	image/jpeg	48892	2015-11-02 18:21:34.971362	data	image/jpeg	50160	2015-11-02 18:21:35.184829	\N	\N	\N	\N	\N	\N
22	68	2015-11-05 14:49:40.784822	2015-11-05 14:49:40.784822	data	image/jpeg	32830	2015-11-05 14:49:40.411288	data	image/jpeg	10167	2015-11-05 14:49:40.62191	\N	\N	\N	\N	\N	\N
23	28	2015-11-05 23:50:19.731214	2015-11-05 23:50:19.731214	data	image/jpeg	77367	2015-11-05 23:50:19.342978	data	image/jpeg	41075	2015-11-05 23:50:19.549437	\N	\N	\N	\N	\N	\N
24	69	2015-11-06 00:15:21.389142	2015-11-06 00:15:21.389142	data	image/jpeg	55741	2015-11-06 00:15:21.002399	data	image/jpeg	57943	2015-11-06 00:15:21.214047	\N	\N	\N	\N	\N	\N
25	25	2015-11-09 09:08:06.693472	2015-11-09 09:08:06.693472	eLe.JPG	image/jpeg	2296978	2015-11-09 09:08:04.562678	eLeBobby.jpg	image/jpeg	174390	2015-11-09 09:08:06.423371	\N	\N	\N	\N	\N	\N
26	30	2015-12-03 09:06:14.737119	2015-12-03 09:06:14.737119	data	image/jpeg	59094	2015-12-03 09:06:14.358593	data	image/jpeg	59143	2015-12-03 09:06:14.56503	\N	\N	\N	\N	\N	\N
30	86	2016-01-22 15:12:26.872111	2016-01-22 15:12:26.872111	data	image/jpeg	31362	2016-01-22 15:12:26.701089	\N	\N	\N	\N	B	Jsidod	2016-01-21	2016-01-21	BR	\N
31	87	2016-02-02 09:18:11.799234	2016-02-02 09:18:11.799234	data	image/jpeg	15718	2016-02-02 09:18:11.62237	\N	\N	\N	\N	B	VC5026600P	1998-06-08	1998-06-03	VC	\N
32	15	2016-02-19 09:51:50.600421	2016-02-19 09:51:50.600421	data	image/jpeg	48003	2016-02-19 09:51:50.372291	\N	\N	\N	\N	B	VC5026600P	1998-06-08	2018-06-03	BI	\N
33	75	2016-03-14 12:55:40.503093	2016-03-14 12:55:40.503093	data	image/jpeg	45859	2016-03-14 12:55:40.345458	\N	\N	\N	\N	B	VC2007393	1973-08-03	2018-11-25	VC	Vercelli
34	94	2016-04-05 08:15:07.884367	2016-04-05 08:15:07.884367	data	image/jpeg	28326	2016-04-05 08:15:07.66483	\N	\N	\N	\N	B	VC5025714S	1998-04-21	2018-04-11	VC	Vercelli
35	95	2016-04-06 10:44:00.504286	2016-04-06 10:44:00.504286	data	image/jpeg	42337	2016-04-06 10:44:00.336986	\N	\N	\N	\N	\N	Aaa	2016-04-05	2016-04-06	BI	Bbb
36	103	2016-04-22 09:36:37.080463	2016-04-22 09:36:37.080463	13081914_10154211627019225_1812287110_n.jpg	image/jpeg	96702	2016-04-22 09:36:36.6099	\N	\N	\N	\N	B	AF 2237863	2005-02-04	\N	Biella 	BIELLA
37	103	2016-04-22 11:26:17.080663	2016-04-22 11:26:17.080663	data	image/jpeg	22692	2016-04-22 11:26:16.921718	\N	\N	\N	\N	B	Af2237863	2015-05-22	2026-03-14	BI	Biella
38	107	2016-05-09 20:37:29.124894	2016-05-09 20:37:29.124894	data	image/jpeg	57202	2016-05-09 20:37:28.880121	\N	\N	\N	\N	B	VC5022004A	1997-11-30	2017-11-23	VC	Vercelli
39	29	2016-05-11 17:58:54.201625	2016-05-11 17:58:54.201625	data	image/jpeg	98050	2016-05-11 17:58:54.011845	\N	\N	\N	\N	B	24674325	2016-05-10	2018-05-10	BI	Biella
40	29	2016-05-11 17:58:57.680244	2016-05-11 17:58:57.680244	data	image/jpeg	98050	2016-05-11 17:58:57.531168	\N	\N	\N	\N	B	24674325	2016-05-10	2018-05-10	BI	Biella
41	120	2016-06-07 12:22:28.263321	2016-06-07 12:22:28.263321	data	image/jpeg	33951	2016-06-07 12:22:28.064173	\N	\N	\N	\N	B	BI5084519P	2015-09-14	2025-11-22	BI	Biella
42	58	2016-06-08 15:40:28.450479	2016-06-08 15:40:28.450479	_puchi.jpg	image/jpeg	28468	2016-06-08 15:40:28.208681	\N	\N	\N	\N	B	okokok	2016-06-07	2016-06-07	Biella 	okokok
43	126	2016-06-09 16:01:45.298057	2016-06-09 16:01:45.298057	data	image/jpeg	19027	2016-06-09 16:01:45.116403	\N	\N	\N	\N	B	Aaa	2016-06-08	2016-06-08	BI	Biella
44	139	2016-06-17 16:12:53.434985	2016-06-17 16:12:53.434985	Immagine.png	image/png	633571	2016-06-17 16:12:52.839456	\N	\N	\N	\N	B	BI5087534P	2016-03-14	2021-01-09	Biella 	BIELLA
45	147	2016-06-22 10:27:14.212887	2016-06-22 10:27:14.212887	FEY_PATENTE.JPG	image/jpeg	24390	2016-06-22 10:27:14.006818	\N	\N	\N	\N	B	TO5840498M	2017-10-11	2017-10-11	Torino 	MCTC-TO
46	148	2016-06-22 10:33:02.492303	2016-06-22 10:33:02.492303	Patente.JPG	image/jpeg	23638	2016-06-22 10:33:02.34151	\N	\N	\N	\N	B	U1L538607X	1997-01-07	2028-01-31	Biella 	BIELLA
47	149	2016-06-23 07:43:43.276293	2016-06-23 07:43:43.276293	patente.JPG	image/jpeg	20274	2016-06-23 07:43:43.146277	\N	\N	\N	\N	B	U1R138136P	2017-04-03	2027-06-07	Biella 	MIT-UCO
48	55	2016-07-02 12:07:28.002501	2016-07-02 12:07:28.002501	2016-07-02_14.01.39.jpg	image/jpeg	2517169	2016-07-02 12:07:25.690929	\N	\N	\N	\N	B	U1B698658L	\N	2016-08-06	Biella 	MIT-UCO
49	154	2016-07-06 14:25:46.512089	2016-07-06 14:25:46.512089	data	image/jpeg	41775	2016-07-06 14:25:46.326906	\N	\N	\N	\N	B	BI5001819G	2001-05-03	2022-07-18	BI	Biella
50	164	2016-07-19 13:58:26.862446	2016-07-19 13:58:26.862446	ORCHIDEA.jpg	image/jpeg	61252	2016-07-19 13:58:26.678462	\N	\N	\N	\N	B	AF8604903	2016-04-08	2026-11-02	Biella 	Cossato
51	189	2016-10-10 19:23:11.008786	2016-10-10 19:23:11.008786	WP_20161010_001.jpg	image/jpeg	795803	2016-10-10 19:23:09.969204	\N	\N	\N	\N	B	U26088682P	2014-01-10	2024-06-06	Vercelli 	Vercelli
\.


--
-- Name: driver_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('driver_details_id_seq', 51, true);


--
-- Data for Name: macro_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY macro_categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: macro_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('macro_categories_id_seq', 1, false);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notifications (id, title, body, from_user, icon, favourite, event, clicked, importance, emitter_id, receiver_id, created_at, updated_at, params, link, is_message) FROM stdin;
477	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	t	\N	\N	95	2016-04-06 10:44:24.694685	2016-04-06 10:55:28.818677	{}	\N	f
483	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ha scritto un messaggio in una chat pubblica a cui stai partecipando!	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-04-06 11:23:43.211901	2016-04-06 11:23:43.211901	\N	#/rooms/15/travels/292	t
484	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ha scritto un messaggio in una chat pubblica a cui stai partecipando!	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-04-06 11:23:44.061006	2016-04-06 11:23:44.061006	\N	#/rooms/15/travels/292	t
490	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ha scritto un messaggio in una chat pubblica a cui stai partecipando!	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-04-06 11:43:47.057655	2016-04-06 11:43:47.057655	\N	#/rooms/15/travels/296	t
480	Andrea Macchieraldo ti ha scelto come passeggero!	<strong>Andrea Macchieraldo</strong> ti ha scelto come passeggero per il suo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	95	12	2016-04-06 11:23:16.183109	2016-04-06 11:45:23.923389	{"user_approved_by_driver"=>true, "travel_id"=>292}	#/rooms/15/travels/292	f
487	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	12	95	2016-04-06 11:42:54.843025	2016-04-06 11:45:40.0851	{"user_applied_to_travel"=>true, "travel_id"=>296}	#/rooms/15/travels/296	f
479	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	12	95	2016-04-06 11:22:54.659003	2016-04-06 11:45:43.750938	{"user_applied_to_travel"=>true, "travel_id"=>292}	#/rooms/15/travels/292	f
478	Hai ricevuto una risposta a una richiesta!	<strong>Andrea Macchieraldo </strong> ha scritto una risposta a una tua richiesta per <strong>cafeteria luogoComune cittadellarte</strong>!	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	95	95	2016-04-06 11:00:16.47254	2016-04-06 11:45:48.795955	\N	#/rooms/15/travel_requests/65	f
476	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	t	\N	\N	95	2016-04-06 10:44:24.673837	2016-04-06 11:45:51.266021	{}	\N	f
481	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	95	95	2016-04-06 11:23:34.722445	2016-04-06 11:46:05.615093	\N	#/rooms/15/travels/292	t
482	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	95	95	2016-04-06 11:23:34.999599	2016-04-06 11:46:07.412101	\N	#/rooms/15/travels/292	t
485	Hai ricevuto un messaggio!	<strong>Andres Macchies</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	73	95	2016-04-06 11:33:39.531327	2016-04-06 11:46:10.069126	\N	#/rooms/15/travels/292/private_chats/36	t
488	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	12	95	2016-04-06 11:43:23.132811	2016-04-06 11:46:13.723977	\N	#/rooms/15/travels/296/private_chats/37	t
489	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	95	95	2016-04-06 11:43:34.527508	2016-04-06 11:46:15.931157	\N	#/rooms/15/travels/296	t
491	Andrea Macchieraldo ti ha scelto come passeggero!	<strong>Andrea Macchieraldo</strong> ti ha scelto come passeggero per il suo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	95	12	2016-04-06 11:44:01.439977	2016-04-06 12:17:12.021457	{"user_approved_by_driver"=>true, "travel_id"=>296}	#/rooms/15/travels/296	f
492	Come è andato il viaggio?	Hai completato il viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	f	\N	\N	95	2016-04-06 12:20:06.053547	2016-04-06 12:20:06.053547	{"travel_expired_for_driver"=>true, "travel_id"=>296, "completion_token"=>"nvaNzikaEJQwZmiuibkUeQ=="}	#/profile/travels/296	f
494	Andrea Macchieraldo  ti ha scelto come passeggero!	<strong>Andrea Macchieraldo </strong> ti ha scelto come passeggero per il suo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	f	\N	12	95	2016-04-06 12:41:22.021364	2016-04-06 12:41:22.021364	{"user_approved_by_driver"=>true, "travel_id"=>297}	#/rooms/15/travels/297	f
496	Come è andato il viaggio?	Hai completato il viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>? Dì al popolo di Pick App cosa pensi del guidatore!	\N	\N	\N	\N	f	\N	\N	95	2016-04-06 13:17:11.091186	2016-04-06 13:17:11.091186	{"travel_expired_for_driver"=>true, "is_passenger"=>true, "travel_id"=>297}	#/profile/travels/297	f
498	Hai ricevuto un messaggio pubblico!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-04-06 13:30:36.82181	2016-04-06 13:30:36.82181	\N	#/rooms/15/travels/305	t
499	Hai un nuovo candidato	<strong>Openmic Biella</strong> si è candidato per il tuo viaggio da <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	f	\N	87	95	2016-04-06 13:40:16.698376	2016-04-06 13:40:16.698376	{"user_applied_to_travel"=>true, "travel_id"=>293}	#/rooms/15/travels/293	f
495	Come è andato il viaggio?	Hai completato il viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	t	\N	\N	12	2016-04-06 13:15:08.19118	2016-09-04 16:14:28.439289	{"travel_expired_for_driver"=>true, "travel_id"=>297, "completion_token"=>"AtiOitwNzBFeyiaKzFm0Dg=="}	#/profile/travels/297	f
493	Hai un nuovo candidato	<strong>Andrea Macchieraldo</strong> si è candidato per il tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	95	12	2016-04-06 12:40:26.824634	2016-09-04 16:14:29.350109	{"user_applied_to_travel"=>true, "travel_id"=>297}	#/rooms/15/travels/297	f
486	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	95	73	2016-04-06 11:38:28.047209	2016-09-09 09:18:41.223133	\N	#/rooms/15/travels/292/private_chats/36	t
502	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio da <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	f	\N	12	95	2016-04-06 13:41:38.496674	2016-04-06 13:41:38.496674	{"user_applied_to_travel"=>true, "travel_id"=>293}	#/rooms/15/travels/293	f
500	Hai un nuovo candidato	<strong>Andrea Macchieraldo</strong> si è candidato per il tuo viaggio da <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	95	15	2016-04-06 13:40:16.696291	2016-04-06 13:42:23.578485	{"user_applied_to_travel"=>true, "travel_id"=>310}	#/rooms/15/travels/310	f
504	Riccardo Ruggeri ti ha scelto come passeggero!	<strong>Riccardo Ruggeri</strong> ti ha scelto come passeggero per il suo viaggio da <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	15	95	2016-04-06 13:43:07.818472	2016-04-06 14:46:18.405459	{"user_approved_by_driver"=>true, "travel_id"=>310}	#/rooms/15/travels/310	f
501	Andrea Macchieraldo ti ha scelto come passeggero!	<strong>Andrea Macchieraldo</strong> ti ha scelto come passeggero per il suo viaggio da <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	95	87	2016-04-06 13:40:36.101632	2016-04-06 13:44:37.393171	{"user_approved_by_driver"=>true, "travel_id"=>293}	#/rooms/15/travels/293	f
506	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	96	12	2016-04-06 14:12:33.56038	2016-04-06 14:12:33.56038	\N	#/rooms/15/travels/303/private_chats/38	t
505	Come è andato il viaggio?	Hai completato il viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	t	\N	\N	95	2016-04-06 13:45:04.658299	2016-04-06 14:46:05.81807	{"travel_expired_for_driver"=>true, "travel_id"=>292, "completion_token"=>"iNN5xwPJ2odSwy46f13Jug=="}	#/profile/travels/292	f
508	Hai dimenticato una recensione?	Andrea Macchieraldo  non ha ancora ricevuto una tua recensione dopo il viaggio fatto insieme!	\N	\N	\N	\N	f	\N	\N	95	2016-04-06 14:48:49.492192	2016-04-06 14:48:49.492192	{"reminder_for_review"=>true, "travel_review_id"=>69, "user_to_review_id"=>12}	#/profile/reviews/own/69/edit	f
510	Come è andato il viaggio?	Hai completato il viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	f	\N	\N	95	2016-04-06 15:45:07.506683	2016-04-06 15:45:07.506683	{"travel_expired_for_driver"=>true, "travel_id"=>293, "completion_token"=>"F2/GS7i7HUfnEyJIYZmqSw=="}	#/profile/travels/293	f
509	Hai un nuovo candidato	<strong>Openmic Biella</strong> si è candidato per il tuo viaggio da <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	87	15	2016-04-06 14:57:14.251833	2016-04-07 08:35:12.89834	{"user_applied_to_travel"=>true, "travel_id"=>312}	#/rooms/15/travels/312	f
512	Hai un nuovo candidato	<strong>Andres Macchies</strong> si è candidato per il tuo viaggio verso <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	f	\N	73	95	2016-04-12 10:14:00.498208	2016-04-12 10:14:00.498208	{"user_applied_to_travel"=>true, "travel_id"=>316}	#/rooms/17/travels/316	f
513	Hai un nuovo candidato	<strong>Andres Macchies</strong> si è candidato per il tuo viaggio da <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	f	\N	73	95	2016-04-12 10:14:06.165161	2016-04-12 10:14:06.165161	{"user_applied_to_travel"=>true, "travel_id"=>317}	#/rooms/17/travels/317	f
515	Come è andato il viaggio?	Hai completato il viaggio verso <strong>Palazzo Ferrero</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	f	\N	\N	95	2016-04-12 10:50:09.423251	2016-04-12 10:50:09.423251	{"travel_expired_for_driver"=>true, "travel_id"=>316, "completion_token"=>"7gyg4c9mczifLKDa4Alu8g=="}	#/profile/travels/316	f
517	Hai ricevuto una recensione!	Andres Macchies ha scritto una recensione su di te!	\N	\N	\N	\N	f	\N	73	95	2016-04-12 11:27:46.556025	2016-04-12 11:27:46.556025	{"user_was_reviewed"=>true, "travel_review_id"=>72}	#/profile/reviews/received/72	f
519	Hai un nuovo candidato	<strong>Riccardo Ruggeri</strong> si è candidato per il tuo viaggio verso <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	t	\N	15	87	2016-04-14 13:02:29.077297	2016-04-14 13:40:11.279066	{"user_applied_to_travel"=>true, "travel_id"=>319}	#/rooms/17/travels/319	f
511	Riccardo Ruggeri ti ha scelto come passeggero!	<strong>Riccardo Ruggeri</strong> ti ha scelto come passeggero per il suo viaggio da <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	15	87	2016-04-07 08:35:26.440856	2016-04-14 13:40:16.630454	{"user_approved_by_driver"=>true, "travel_id"=>312}	#/rooms/15/travels/312	f
521	Hai un nuovo candidato	<strong>Riccardo Ruggeri</strong> si è candidato per il tuo viaggio da <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	f	\N	15	95	2016-04-14 13:40:31.317182	2016-04-14 13:40:31.317182	{"user_applied_to_travel"=>true, "travel_id"=>328}	#/rooms/17/travels/328	f
520	Openmic Biella ti ha scelto come passeggero!	<strong>Openmic Biella</strong> ti ha scelto come passeggero per il suo viaggio verso <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	t	\N	87	15	2016-04-14 13:10:35.443832	2016-04-14 13:46:20.912247	{"user_approved_by_driver"=>true, "travel_id"=>319}	#/rooms/17/travels/319	f
518	Come è andato il viaggio?	Hai completato il viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	t	\N	\N	15	2016-04-13 21:30:11.744951	2016-04-14 14:06:20.434	{"travel_expired_for_driver"=>true, "travel_id"=>312, "completion_token"=>"f26EgRC5jAzebKMIM6DaYA=="}	#/profile/travels/312	f
522	Hai ricevuto una recensione!	Riccardo Ruggeri ha scritto una recensione su di te!	\N	\N	\N	\N	f	\N	15	87	2016-04-14 14:06:43.883145	2016-04-14 14:06:43.883145	{"user_was_reviewed"=>true, "travel_review_id"=>77}	#/profile/reviews/received/77	f
523	Hai dimenticato una recensione?	Openmic Biella non ha ancora ricevuto una tua recensione dopo il viaggio fatto insieme!	\N	\N	\N	\N	t	\N	\N	15	2016-04-14 14:08:31.816445	2016-04-18 09:29:02.710653	{"reminder_for_review"=>true, "travel_review_id"=>77, "user_to_review_id"=>87}	#/profile/reviews/own/77/edit	f
524	Hai ricevuto una recensione!	Riccardo Ruggeri ha scritto una recensione su di te!	\N	\N	\N	\N	f	\N	15	87	2016-04-18 09:29:19.152861	2016-04-18 09:29:19.152861	{"user_was_reviewed"=>true, "travel_review_id"=>77}	#/profile/reviews/received/77	f
526	Hai ricevuto un messaggio pubblico!	<strong>Emanuele Diodato </strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	95	95	2016-04-23 18:12:24.178035	2016-04-23 18:12:24.178035	\N	#/rooms/15/travels/330	t
527	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ha scritto un messaggio in una chat pubblica a cui stai partecipando!	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	104	104	2016-04-23 18:12:53.646932	2016-04-23 18:12:53.646932	\N	#/rooms/15/travels/330	t
528	Hai ricevuto un messaggio pubblico!	<strong>Emanuele Diodato </strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	95	95	2016-04-23 18:13:08.259625	2016-04-23 18:13:08.259625	\N	#/rooms/15/travels/330	t
516	Hai ricevuto una recensione!	Andrea Macchieraldo ha scritto una recensione su di te!	\N	\N	\N	\N	t	\N	95	73	2016-04-12 11:24:50.468317	2016-06-06 14:07:54.827106	{"user_was_reviewed"=>true, "travel_review_id"=>71}	#/profile/reviews/received/71	f
507	Hai ricevuto una recensione!	Andrea Macchieraldo ha scritto una recensione su di te!	\N	\N	\N	\N	t	\N	95	12	2016-04-06 14:47:24.850056	2016-09-04 16:14:21.922515	{"user_was_reviewed"=>true, "travel_review_id"=>69}	#/profile/reviews/received/69	f
503	Andrea Macchieraldo ti ha scelto come passeggero!	<strong>Andrea Macchieraldo</strong> ti ha scelto come passeggero per il suo viaggio da <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	95	12	2016-04-06 13:41:46.351067	2016-09-04 16:14:26.314322	{"user_approved_by_driver"=>true, "travel_id"=>293}	#/rooms/15/travels/293	f
514	Andrea Macchieraldo ti ha scelto come passeggero!	<strong>Andrea Macchieraldo</strong> ti ha scelto come passeggero per il suo viaggio verso <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	t	\N	95	73	2016-04-12 10:14:14.513891	2016-09-09 09:15:15.528481	{"user_approved_by_driver"=>true, "travel_id"=>316}	#/rooms/17/travels/316	f
530	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	f	\N	\N	103	2016-04-28 11:09:49.772875	2016-04-28 11:09:49.772875	{}	\N	f
529	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	t	\N	\N	103	2016-04-28 11:09:49.751546	2016-05-01 23:15:41.298286	{}	\N	f
534	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:48:37.544413	2016-05-02 00:48:37.544413	\N	#/rooms/17/travels/336	t
535	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:49:14.047091	2016-05-02 00:49:14.047091	\N	#/rooms/17/travels/336	t
536	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:49:20.896285	2016-05-02 00:49:20.896285	\N	#/rooms/17/travels/336	t
537	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:54:14.807764	2016-05-02 00:54:14.807764	\N	#/rooms/17/travels/336	t
538	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:54:29.241373	2016-05-02 00:54:29.241373	\N	#/rooms/17/travels/336	t
539	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:55:17.926926	2016-05-02 00:55:17.926926	\N	#/rooms/17/travels/336	t
540	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:57:08.951779	2016-05-02 00:57:08.951779	\N	#/rooms/17/travels/336	t
541	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:57:31.180461	2016-05-02 00:57:31.180461	\N	#/rooms/17/travels/336	t
542	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:59:15.904786	2016-05-02 00:59:15.904786	\N	#/rooms/17/travels/336	t
543	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-05-02 00:59:21.642759	2016-05-02 00:59:21.642759	\N	#/rooms/17/travels/336	t
525	Hai ricevuto una recensione!	Riccardo Ruggeri ha scritto una recensione su di te!	\N	\N	\N	\N	t	\N	15	12	2016-04-18 09:29:48.784153	2016-05-02 00:59:39.505433	{"user_was_reviewed"=>true, "travel_review_id"=>64}	#/profile/reviews/received/64	f
531	Hai un nuovo candidato	<strong>Stefanella Ferla</strong> si è candidato per il tuo viaggio verso <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	t	\N	75	15	2016-04-28 12:05:59.572548	2016-05-09 11:42:00.832366	{"user_applied_to_travel"=>true, "travel_id"=>334}	#/rooms/17/travels/334	f
532	Hai ricevuto un messaggio!	<strong>Stefanella Ferla</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	75	15	2016-04-28 12:07:51.948719	2016-05-09 11:46:31.035569	\N	#/rooms/17/travels/334/private_chats/42	t
544	Hai un nuovo candidato	<strong>Valentina Ruggeri </strong> si è candidato per il tuo viaggio verso <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	t	\N	107	15	2016-05-09 20:30:12.267127	2016-05-10 14:53:25.503917	{"user_applied_to_travel"=>true, "travel_id"=>337}	#/rooms/17/travels/337	f
548	Hai ricevuto un messaggio!	<strong>Valentina Ruggeri </strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	107	15	2016-05-10 19:04:27.951556	2016-05-11 10:57:04.250089	\N	#/rooms/17/travels/337/private_chats/43	t
552	Hai un nuovo candidato	<strong>Davide Paganotti </strong> si è candidato per il tuo viaggio verso <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	t	\N	29	15	2016-05-11 17:51:15.623404	2016-05-11 18:36:56.298945	{"user_applied_to_travel"=>true, "travel_id"=>339}	#/rooms/17/travels/339	f
557	Hai ricevuto un messaggio pubblico!	<strong>Riccardo Ruggeri</strong> ha scritto un messaggio in una chat pubblica a cui stai partecipando!	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	29	29	2016-05-11 18:37:17.814533	2016-05-11 18:37:17.814533	\N	#/rooms/17/travels/339	t
551	Hai un nuovo candidato	<strong>Davide Paganotti </strong> si è candidato per il tuo viaggio verso <strong>Palazzo Ferrero</strong>!	\N	\N	\N	\N	t	\N	29	15	2016-05-11 17:46:21.746789	2016-05-11 18:39:42.362497	{"user_applied_to_travel"=>true, "travel_id"=>343}	#/rooms/17/travels/343	f
550	Come è andato il viaggio?	Hai completato il viaggio verso <strong>Palazzo Ferrero</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	t	\N	\N	15	2016-05-11 15:30:04.96574	2016-05-11 18:39:55.74269	{"travel_expired_for_driver"=>true, "travel_id"=>337, "completion_token"=>"y30tAl6H4r/lXFHVopC9AA=="}	#/profile/travels/337	f
553	Hai ricevuto un messaggio pubblico!	<strong>Davide Paganotti </strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	15	2016-05-11 17:57:01.031203	2016-05-11 18:40:11.704042	\N	#/rooms/17/travels/339	t
560	Hai dimenticato una recensione?	Valentina Ruggeri  non ha ancora ricevuto una tua recensione dopo il viaggio fatto insieme!	\N	\N	\N	\N	t	\N	\N	15	2016-05-11 18:41:01.817875	2016-05-11 20:10:01.442122	{"reminder_for_review"=>true, "travel_review_id"=>79, "user_to_review_id"=>107}	#/profile/reviews/own/79/edit	f
549	Hai ricevuto un messaggio!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>Palazzo Ferrero</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	107	2016-05-11 10:57:13.130459	2016-05-31 16:31:49.616352	\N	#/rooms/17/travels/337/private_chats/43	t
570	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	f	\N	\N	120	2016-06-07 14:08:14.112233	2016-06-07 14:08:14.112233	{}	\N	f
571	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	f	\N	\N	120	2016-06-07 14:08:14.114052	2016-06-07 14:08:14.114052	{}	\N	f
578	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	f	\N	\N	58	2016-06-08 15:40:54.331976	2016-06-08 15:40:54.331976	{}	\N	f
579	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	f	\N	\N	58	2016-06-08 15:40:54.330397	2016-06-08 15:40:54.330397	{}	\N	f
581	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>GDA 2016 Cittadellarte</strong>!	\N	\N	\N	\N	f	\N	12	58	2016-06-08 16:37:53.868561	2016-06-08 16:37:53.868561	{"user_applied_to_travel"=>true, "travel_id"=>357}	#/rooms/18/travels/357	f
584	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>GDA 2016 Cittadellarte</strong>!	\N	\N	\N	\N	t	\N	12	73	2016-06-09 11:43:41.516953	2016-06-09 12:24:09.61658	{"user_applied_to_travel"=>true, "travel_id"=>364}	#/rooms/18/travels/364	f
586	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	f	\N	\N	126	2016-06-09 16:02:39.475198	2016-06-09 16:02:39.475198	{}	\N	f
587	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	f	\N	\N	126	2016-06-09 16:02:39.585199	2016-06-09 16:02:39.585199	{}	\N	f
589	Andrea Macchieraldo  ti ha scelto come passeggero!	<strong>Andrea Macchieraldo </strong> ti ha scelto come passeggero per il suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>!	\N	\N	\N	\N	f	\N	12	126	2016-06-09 16:12:07.699039	2016-06-09 16:12:07.699039	{"user_approved_by_driver"=>true, "travel_id"=>368}	#/rooms/18/travels/368	f
590	Hai ricevuto un messaggio pubblico!	<strong>Andre Macchie</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-06-09 16:12:57.584507	2016-06-09 16:12:57.584507	\N	#/rooms/18/travels/368	t
591	Hai ricevuto un messaggio!	<strong>Andre Macchie</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	126	12	2016-06-09 16:13:23.811588	2016-06-09 16:13:23.811588	\N	#/rooms/18/travels/368/private_chats/44	t
592	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	126	2016-06-09 16:13:37.449914	2016-06-09 16:13:37.449914	\N	#/rooms/18/travels/368/private_chats/44	t
593	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	126	2016-06-09 16:13:51.583261	2016-06-09 16:13:51.583261	\N	#/rooms/18/travels/368/private_chats/44	t
594	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	126	2016-06-09 16:14:07.79553	2016-06-09 16:14:07.79553	\N	#/rooms/18/travels/368/private_chats/44	t
595	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	126	2016-06-09 16:14:23.401864	2016-06-09 16:14:23.401864	\N	#/rooms/18/travels/368/private_chats/44	t
596	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	126	2016-06-09 16:14:52.454522	2016-06-09 16:14:52.454522	\N	#/rooms/18/travels/368/private_chats/44	t
597	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	126	2016-06-09 16:25:50.248987	2016-06-09 16:25:50.248987	\N	#/rooms/18/travels/368/private_chats/44	t
598	Andrea Macchieraldo  ti ha scelto come passeggero!	<strong>Andrea Macchieraldo </strong> ti ha scelto come passeggero per il suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>!	\N	\N	\N	\N	f	\N	12	126	2016-06-09 16:26:10.31186	2016-06-09 16:26:10.31186	{"user_approved_by_driver"=>true, "travel_id"=>368}	#/rooms/18/travels/368	f
599	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	126	2016-06-09 16:30:03.090655	2016-06-09 16:30:03.090655	\N	#/rooms/18/travels/368/private_chats/44	t
600	Hai ricevuto un messaggio!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	126	2016-06-09 16:30:06.268567	2016-06-09 16:30:06.268567	\N	#/rooms/18/travels/368/private_chats/44	t
588	Hai un nuovo candidato	<strong>Andre Macchie</strong> si è candidato per il tuo viaggio verso <strong>GDA 2016 Cittadellarte</strong>!	\N	\N	\N	\N	t	\N	126	12	2016-06-09 16:09:35.744661	2016-09-04 16:14:20.892665	{"user_applied_to_travel"=>true, "travel_id"=>368}	#/rooms/18/travels/368	f
583	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio da <strong>GDA 2016 Cittadellarte</strong>!	\N	\N	\N	\N	t	\N	12	73	2016-06-08 21:48:26.097764	2016-09-09 09:15:13.025263	{"user_applied_to_travel"=>true, "travel_id"=>363}	#/rooms/18/travels/363	f
582	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>GDA 2016 Cittadellarte</strong>!	\N	\N	\N	\N	t	\N	12	73	2016-06-08 21:48:13.519125	2016-09-09 09:15:14.376368	{"user_applied_to_travel"=>true, "travel_id"=>362}	#/rooms/18/travels/362	f
585	Hai un nuovo candidato	<strong>Valentina Ruggeri </strong> si è candidato per il tuo viaggio da <strong>GDA 2016 Cittadellarte</strong>!	\N	\N	\N	\N	t	\N	107	15	2016-06-09 13:34:50.237754	2016-06-09 16:57:03.388442	{"user_applied_to_travel"=>true, "travel_id"=>367}	#/rooms/18/travels/367	f
603	Come è andato il viaggio?	Hai completato il viaggio verso <strong>GDA 2016 Cittadellarte</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	t	\N	\N	15	2016-06-09 18:30:05.121194	2016-06-09 21:10:12.904551	{"travel_expired_for_driver"=>true, "travel_id"=>367, "completion_token"=>"TLI61lWSZNUXEv30S4aQtA=="}	#/profile/travels/367	f
601	Riccardo Ruggeri ti ha scelto come passeggero!	<strong>Riccardo Ruggeri</strong> ti ha scelto come passeggero per il suo viaggio da <strong>GDA 2016 Cittadellarte</strong>!	\N	\N	\N	\N	t	\N	15	107	2016-06-09 16:57:14.582179	2016-06-09 21:15:38.339588	{"user_approved_by_driver"=>true, "travel_id"=>367}	#/rooms/18/travels/367	f
604	Hai ricevuto un messaggio pubblico!	<strong>Valentina Ruggeri </strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>GDA 2016 Cittadellarte</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	15	2016-06-09 21:16:18.944922	2016-06-10 08:07:41.291933	\N	#/rooms/18/travels/367	t
606	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	t	\N	\N	139	2016-06-17 17:42:00.779194	2016-06-18 14:23:30.145093	{}	\N	f
605	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	t	\N	\N	139	2016-06-17 17:42:00.777016	2016-06-18 14:23:36.636366	{}	\N	f
607	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	f	\N	\N	148	2016-06-22 11:24:55.337116	2016-06-22 11:24:55.337116	{}	\N	f
608	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	f	\N	\N	148	2016-06-22 11:24:55.369152	2016-06-22 11:24:55.369152	{}	\N	f
613	Hai ricevuto una risposta a una richiesta!	<strong>Valentina Ruggeri </strong> ha scritto una risposta a una tua richiesta per <strong>Reload Sound Festival</strong>!	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	109	109	2016-07-02 16:49:15.741168	2016-07-02 16:49:15.741168	\N	#/rooms/23/travel_requests/74	f
614	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	f	\N	\N	55	2016-07-02 17:47:52.825435	2016-07-02 17:47:52.825435	{}	\N	f
615	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	f	\N	\N	55	2016-07-02 17:47:52.830468	2016-07-02 17:47:52.830468	{}	\N	f
617	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	t	\N	\N	154	2016-07-09 15:17:22.487516	2016-07-12 15:32:33.035733	{}	\N	f
616	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	t	\N	\N	154	2016-07-09 15:17:22.484888	2016-07-12 15:32:37.39439	{}	\N	f
612	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	t	\N	\N	149	2016-06-23 17:21:51.065241	2016-07-18 13:26:55.463784	{}	\N	f
611	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	t	\N	\N	149	2016-06-23 17:21:51.067474	2016-07-18 13:29:09.687618	{}	\N	f
602	Come è andato il viaggio?	Hai completato il viaggio verso <strong>GDA 2016 Cittadellarte</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	t	\N	\N	12	2016-06-09 18:30:05.081808	2016-09-04 16:14:19.632579	{"travel_expired_for_driver"=>true, "travel_id"=>368, "completion_token"=>"Enrrn5JsgKrQyoX6MlFY2Q=="}	#/profile/travels/368	f
497	Hai un nuovo candidato	<strong>Riccardo Ruggeri</strong> si è candidato per il tuo viaggio verso <strong>cafeteria luogoComune cittadellarte</strong>!	\N	\N	\N	\N	t	\N	15	12	2016-04-06 13:30:14.370878	2016-09-04 16:14:27.36261	{"user_applied_to_travel"=>true, "travel_id"=>305}	#/rooms/15/travels/305	f
620	Hai ricevuto una recensione!	Riccardo Ruggeri ha scritto una recensione su di te!	\N	\N	\N	\N	f	\N	15	107	2016-09-12 10:27:27.86161	2016-09-12 10:27:27.86161	{"user_was_reviewed"=>true, "travel_review_id"=>85}	#/profile/reviews/received/85	f
624	Andres Macchies ti ha scelto come passeggero!	<strong>Andres Macchies</strong> ti ha scelto come passeggero per il suo viaggio verso <strong>Autobahn</strong>!	\N	\N	\N	\N	t	\N	73	15	2016-09-12 10:27:27.930961	2016-09-14 14:20:29.081713	{"user_approved_by_driver"=>true, "travel_id"=>389}	#/rooms/29/travels/389	f
626	Hai ricevuto un messaggio!	<strong>Andres Macchies</strong> ti ha inviato un messaggio relativo al suo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	73	15	2016-09-12 10:27:27.960401	2016-09-14 14:21:44.197066	\N	#/rooms/29/travels/389/private_chats/45	t
625	Hai un nuovo candidato	<strong>Riccardo Ruggeri</strong> si è candidato per il tuo viaggio verso <strong>Autobahn</strong>!	\N	\N	\N	\N	t	\N	15	73	2016-09-12 10:27:27.948089	2016-09-16 13:15:45.299391	{"user_applied_to_travel"=>true, "travel_id"=>389}	#/rooms/29/travels/389	f
623	Hai ricevuto un messaggio pubblico!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	73	73	2016-09-12 10:27:27.886068	2016-09-16 14:06:17.661795	\N	#/rooms/29/travels/389	t
621	Hai ricevuto un messaggio!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	73	2016-09-12 10:27:27.859727	2016-09-16 14:06:18.582714	\N	#/rooms/29/travels/389/private_chats/45	t
622	Hai ricevuto un messaggio!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	73	2016-09-12 10:27:27.847364	2016-09-16 14:06:19.430576	\N	#/rooms/29/travels/389/private_chats/45	t
619	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	t	\N	\N	164	2016-07-19 17:23:34.181648	2016-10-03 06:38:30.90594	{}	\N	f
618	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	t	\N	\N	164	2016-07-19 17:23:34.15688	2016-10-03 06:40:01.822592	{}	\N	f
609	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	t	\N	\N	147	2016-06-22 11:24:59.031571	2016-10-11 13:16:18.086635	{}	\N	f
610	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	t	\N	\N	147	2016-06-22 11:24:59.052387	2016-10-11 13:16:27.815597	{}	\N	f
642	Come è andato il viaggio?	Hai completato il viaggio verso <strong>Balma /lame del torrente</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	f	\N	\N	12	2016-09-14 12:30:03.97223	2016-09-14 12:30:03.97223	{"travel_expired_for_driver"=>true, "travel_id"=>390, "completion_token"=>"SyFPb3hS75NjNdvioHQAMg=="}	#/profile/travels/390	f
633	Come è andato il viaggio?	Hai completato il viaggio verso <strong>Autobahn</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	t	\N	\N	73	2016-09-12 10:27:38.96634	2016-09-16 13:15:44.348341	{"travel_expired_for_driver"=>true, "travel_id"=>389, "completion_token"=>"D7Spzp1gQPwCoszC/C5C4Q=="}	#/profile/travels/389	f
631	Hai ricevuto un messaggio pubblico!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	73	73	2016-09-12 10:27:28.088021	2016-09-16 14:05:50.373793	\N	#/rooms/29/travels/389	t
630	Hai ricevuto un messaggio!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	73	2016-09-12 10:27:28.067315	2016-09-16 14:05:51.737413	\N	#/rooms/29/travels/389/private_chats/45	t
629	Hai ricevuto un messaggio!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	73	2016-09-12 10:27:28.050946	2016-09-16 14:06:14.65362	\N	#/rooms/29/travels/389/private_chats/45	t
628	Hai ricevuto un messaggio!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	73	2016-09-12 10:27:28.036413	2016-09-16 14:06:15.804804	\N	#/rooms/29/travels/389/private_chats/45	t
627	Hai ricevuto un messaggio!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	73	2016-09-12 10:27:28.017166	2016-09-16 14:06:16.809651	\N	#/rooms/29/travels/389/private_chats/45	t
632	Hai dimenticato una recensione?	Valentina Ruggeri  non ha ancora ricevuto una tua recensione dopo il viaggio fatto insieme!	\N	\N	\N	\N	t	\N	\N	15	2016-09-12 10:27:38.934127	2016-09-14 14:19:44.596897	{"reminder_for_review"=>true, "travel_review_id"=>85, "user_to_review_id"=>107}	#/profile/reviews/own/85/edit	f
637	Andrea Macchieraldo  ti ha scelto come passeggero!	<strong>Andrea Macchieraldo </strong> ti ha scelto come passeggero per il suo viaggio verso <strong>Balma /lame del torrente</strong>!	\N	\N	\N	\N	t	\N	12	73	2016-09-14 10:57:23.50804	2016-09-16 13:15:42.823311	{"user_approved_by_driver"=>true, "travel_id"=>390}	#/rooms/7/travels/390	f
636	Hai un nuovo candidato	<strong>Andres Macchies</strong> si è candidato per il tuo viaggio verso <strong>Balma /lame del torrente</strong>!	\N	\N	\N	\N	t	\N	73	12	2016-09-14 10:56:58.664117	2016-09-14 10:57:17.84161	{"user_applied_to_travel"=>true, "travel_id"=>390}	#/rooms/7/travels/390	f
649	Hai ricevuto una recensione!	Riccardo Ruggeri ha scritto una recensione su di te!	\N	\N	\N	\N	f	\N	15	107	2016-09-14 14:19:56.936082	2016-09-14 14:19:56.936082	{"user_was_reviewed"=>true, "travel_review_id"=>85}	#/profile/reviews/received/85	f
650	Hai ricevuto una recensione!	Riccardo Ruggeri ha scritto una recensione su di te!	\N	\N	\N	\N	f	\N	15	29	2016-09-14 14:20:15.572593	2016-09-14 14:20:15.572593	{"user_was_reviewed"=>true, "travel_review_id"=>81}	#/profile/reviews/received/81	f
653	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>Balma /lame del torrente</strong>!	\N	\N	\N	\N	t	\N	12	73	2016-09-15 10:17:03.984736	2016-09-16 10:49:29.385618	{"user_applied_to_travel"=>true, "travel_id"=>393}	#/rooms/7/travels/393	f
648	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>Balma /lame del torrente</strong>!	\N	\N	\N	\N	t	\N	12	73	2016-09-14 13:39:24.729735	2016-09-16 10:49:30.799676	{"user_applied_to_travel"=>true, "travel_id"=>393}	#/rooms/7/travels/393	f
654	Andres Macchies ti ha scelto come passeggero!	<strong>Andres Macchies</strong> ti ha scelto come passeggero per il suo viaggio verso <strong>Balma /lame del torrente</strong>!	\N	\N	\N	\N	f	\N	73	12	2016-09-16 13:05:20.509836	2016-09-16 13:05:20.509836	{"user_approved_by_driver"=>true, "travel_id"=>393}	#/rooms/7/travels/393	f
655	Andres Macchies ti ha scelto come passeggero!	<strong>Andres Macchies</strong> ti ha scelto come passeggero per il suo viaggio verso <strong>Balma /lame del torrente</strong>!	\N	\N	\N	\N	f	\N	73	12	2016-09-16 13:05:21.898963	2016-09-16 13:05:21.898963	{"user_approved_by_driver"=>true, "travel_id"=>393}	#/rooms/7/travels/393	f
644	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>Balma /lame del torrente</strong>!	\N	\N	\N	\N	t	\N	12	73	2016-09-14 13:36:06.189772	2016-09-16 13:15:38.62835	{"user_applied_to_travel"=>true, "travel_id"=>392}	#/rooms/7/travels/392	f
652	Hai ricevuto un messaggio!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio relativo al tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	73	2016-09-14 14:21:38.422314	2016-09-16 13:15:47.093395	\N	#/rooms/29/travels/389/private_chats/45	t
651	Hai ricevuto un messaggio pubblico!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Autobahn</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	73	73	2016-09-14 14:21:01.831672	2016-09-16 14:05:48.63309	\N	#/rooms/29/travels/389	t
656	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>Balma /lame del torrente</strong>!	\N	\N	\N	\N	f	\N	12	73	2016-09-16 14:28:07.588198	2016-09-16 14:28:07.588198	{"user_applied_to_travel"=>true, "travel_id"=>394}	#/rooms/7/travels/394	f
657	Andres Macchies ti ha scelto come passeggero!	<strong>Andres Macchies</strong> ti ha scelto come passeggero per il suo viaggio verso <strong>Balma /lame del torrente</strong>!	\N	\N	\N	\N	f	\N	73	12	2016-09-16 14:28:30.075881	2016-09-16 14:28:30.075881	{"user_approved_by_driver"=>true, "travel_id"=>394}	#/rooms/7/travels/394	f
658	Hai ricevuto un messaggio pubblico!	<strong>Andrea Macchieraldo </strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Balma /lame del torrente</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	73	73	2016-09-16 14:28:39.07768	2016-09-16 14:28:39.07768	\N	#/rooms/7/travels/394	t
659	Come è andato il viaggio?	Hai completato il viaggio verso <strong>Balma /lame del torrente</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	f	\N	\N	73	2016-09-21 18:30:07.37874	2016-09-21 18:30:07.37874	{"travel_expired_for_driver"=>true, "travel_id"=>393, "completion_token"=>"UhySX0pCTfr1UeUvaXvphA=="}	#/profile/travels/393	f
660	Come è andato il viaggio?	Hai completato il viaggio verso <strong>Balma /lame del torrente</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	f	\N	\N	73	2016-09-28 18:30:09.075237	2016-09-28 18:30:09.075237	{"travel_expired_for_driver"=>true, "travel_id"=>394, "completion_token"=>"rGzvpaW0XvrGmdhRvIg1HA=="}	#/profile/travels/394	f
661	Hai ricevuto una risposta a una richiesta!	<strong>Riccardo Ruggeri</strong> ha scritto una risposta a una tua richiesta per <strong>Città Studi Biella</strong>!	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	f	\N	12	12	2016-10-04 10:02:27.671375	2016-10-04 10:02:27.671375	\N	#/rooms/34/travel_requests/80	f
662	Hai un nuovo candidato	<strong>Andrea Macchieraldo </strong> si è candidato per il tuo viaggio verso <strong>Città Studi Biella</strong>!	\N	\N	\N	\N	t	\N	12	15	2016-10-04 10:29:01.876821	2016-10-04 10:34:28.950238	{"user_applied_to_travel"=>true, "travel_id"=>448}	#/rooms/34/travels/448	f
663	Riccardo Ruggeri ti ha scelto come passeggero!	<strong>Riccardo Ruggeri</strong> ti ha scelto come passeggero per il suo viaggio verso <strong>Città Studi Biella</strong>!	\N	\N	\N	\N	f	\N	15	12	2016-10-04 10:34:43.215246	2016-10-04 10:34:43.215246	{"user_approved_by_driver"=>true, "travel_id"=>448}	#/rooms/34/travels/448	f
664	Come è andato il viaggio?	Hai completato il viaggio verso <strong>Città Studi Biella</strong>? Dì al popolo di Pick App cosa pensi dei passeggeri!	\N	\N	\N	\N	t	\N	\N	15	2016-10-10 07:30:08.938998	2016-10-11 13:06:05.771422	{"travel_expired_for_driver"=>true, "travel_id"=>448, "completion_token"=>"3qpBfyVRUeqGI6X26t8+1Q=="}	#/profile/travels/448	f
665	Hai ricevuto una recensione!	Riccardo Ruggeri ha scritto una recensione su di te!	\N	\N	\N	\N	f	\N	15	12	2016-10-11 13:06:22.568218	2016-10-11 13:06:22.568218	{"user_was_reviewed"=>true, "travel_review_id"=>87}	#/profile/reviews/received/87	f
667	Sei diventato un driver!	Congratulazioni! Da ora sei ufficialmente un driver di Pick APP!	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:became_authorized_driver	f	\N	\N	189	2016-10-11 13:06:32.475138	2016-10-11 13:06:32.475138	{}	\N	f
668	Hai dimenticato una recensione?	Andrea Macchieraldo  non ha ancora ricevuto una tua recensione dopo il viaggio fatto insieme!	\N	\N	\N	\N	t	\N	\N	15	2016-10-11 13:08:23.886588	2016-10-11 23:55:37.708504	{"reminder_for_review"=>true, "travel_review_id"=>87, "user_to_review_id"=>12}	#/profile/reviews/own/87/edit	f
669	Hai ricevuto una recensione!	Riccardo Ruggeri ha scritto una recensione su di te!	\N	\N	\N	\N	f	\N	15	12	2016-10-11 23:55:48.55276	2016-10-11 23:55:48.55276	{"user_was_reviewed"=>true, "travel_review_id"=>87}	#/profile/reviews/received/87	f
670	Hai ricevuto un messaggio pubblico!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Bonprix</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	149	149	2016-10-11 23:56:57.808344	2016-10-12 13:50:45.103178	\N	#/rooms/19/travels/477	t
666	Aggiungi un'auto!	Ti serve un'auto per offrire passaggi! Aggiungine una ora.	f	http://koodit.s3.amazonaws.com/pickapp/common/system_notification.png	\N	notification:add_a_car	t	\N	\N	189	2016-10-11 13:06:32.472832	2016-10-17 17:08:32.734814	{}	\N	f
674	Hai ricevuto una recensione!	Valentina Ruggeri  ha scritto una recensione su di te!	\N	\N	\N	\N	t	\N	107	15	2016-10-22 16:35:09.160169	2016-10-24 08:43:23.686454	{"user_was_reviewed"=>true, "travel_review_id"=>86}	#/profile/reviews/received/86	f
671	Hai ricevuto un messaggio pubblico!	<strong>Lorenzo Galleran</strong> ha scritto un messaggio in una chat pubblica a cui stai partecipando!	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	15	15	2016-10-12 13:53:55.313082	2016-10-12 13:55:49.678721	\N	#/rooms/19/travels/477	t
672	Hai ricevuto un messaggio pubblico!	<strong>Riccardo Ruggeri</strong> ti ha inviato un messaggio nella chat pubblica del tuo viaggio verso <strong>Bonprix</strong>.	t	http://koodit.s3.amazonaws.com/pickapp/common/user_notification.png	\N	\N	t	\N	149	149	2016-10-12 13:55:35.907352	2016-10-12 14:06:05.641609	\N	#/rooms/19/travels/477	t
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('notifications_id_seq', 674, true);


--
-- Data for Name: parents_controls; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parents_controls (id, parent_mail, code, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Name: parents_controls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parents_controls_id_seq', 1, false);


--
-- Data for Name: passenger_travels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY passenger_travels (id, user_id, travel_id, created_at, updated_at) FROM stdin;
43	107	367	2016-09-09 09:23:54.902507	2016-09-09 09:23:54.902507
44	12	448	2016-10-11 13:06:10.767826	2016-10-11 13:06:10.767826
\.


--
-- Name: passenger_travels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('passenger_travels_id_seq', 44, true);


--
-- Data for Name: preferred_rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY preferred_rooms (id, room_id, user_id, created_at, updated_at) FROM stdin;
2	1	2	2015-06-08 15:23:27.861584	2015-06-08 15:23:27.861584
4	1	8	2015-06-11 09:53:41.468588	2015-06-11 09:53:41.468588
5	1	9	2015-06-11 12:28:51.654548	2015-06-11 12:28:51.654548
6	1	11	2015-06-25 18:44:53.297528	2015-06-25 18:44:53.297528
7	1	10	2015-06-26 21:06:08.930349	2015-06-26 21:06:08.930349
8	3	11	2015-07-02 17:31:59.748166	2015-07-02 17:31:59.748166
9	3	9	2015-07-07 09:25:37.180217	2015-07-07 09:25:37.180217
14	4	18	2015-07-13 20:28:16.779636	2015-07-13 20:28:16.779636
21	10	23	2015-07-28 15:58:16.039754	2015-07-28 15:58:16.039754
22	7	23	2015-07-28 15:58:23.783293	2015-07-28 15:58:23.783293
25	9	15	2015-08-06 14:41:39.084336	2015-08-06 14:41:39.084336
26	9	17	2015-08-07 08:57:36.22212	2015-08-07 08:57:36.22212
29	7	14	2015-08-10 17:04:06.755083	2015-08-10 17:04:06.755083
31	9	14	2015-08-11 08:58:02.510348	2015-08-11 08:58:02.510348
32	5	14	2015-08-11 11:38:04.282568	2015-08-11 11:38:04.282568
33	6	14	2015-08-11 11:49:40.783273	2015-08-11 11:49:40.783273
34	11	34	2015-09-04 09:02:48.830983	2015-09-04 09:02:48.830983
35	11	48	2015-10-12 08:46:30.98086	2015-10-12 08:46:30.98086
36	15	15	2015-10-24 12:41:52.927256	2015-10-24 12:41:52.927256
37	15	54	2015-10-24 15:05:03.412546	2015-10-24 15:05:03.412546
38	15	55	2015-10-24 15:42:58.323123	2015-10-24 15:42:58.323123
44	12	52	2015-10-28 09:48:37.304285	2015-10-28 09:48:37.304285
48	6	65	2015-11-02 18:20:56.167492	2015-11-02 18:20:56.167492
49	10	65	2015-11-02 18:22:52.314824	2015-11-02 18:22:52.314824
50	7	65	2015-11-02 18:23:14.322104	2015-11-02 18:23:14.322104
51	10	53	2015-11-02 18:55:21.921438	2015-11-02 18:55:21.921438
52	5	53	2015-11-02 18:56:56.256414	2015-11-02 18:56:56.256414
53	15	27	2015-11-03 14:09:15.172148	2015-11-03 14:09:15.172148
55	10	67	2015-11-04 16:01:19.280784	2015-11-04 16:01:19.280784
56	10	68	2015-11-05 14:52:00.591766	2015-11-05 14:52:00.591766
57	10	28	2015-11-05 23:56:02.254989	2015-11-05 23:56:02.254989
58	10	69	2015-11-06 00:19:18.241157	2015-11-06 00:19:18.241157
59	8	22	2015-11-06 08:38:07.641482	2015-11-06 08:38:07.641482
60	10	22	2015-11-09 09:55:58.630363	2015-11-09 09:55:58.630363
63	6	71	2015-11-14 06:22:18.275162	2015-11-14 06:22:18.275162
64	11	15	2015-11-16 09:03:03.368216	2015-11-16 09:03:03.368216
65	7	22	2015-11-16 09:06:44.406579	2015-11-16 09:06:44.406579
66	12	15	2015-11-16 09:11:34.430393	2015-11-16 09:11:34.430393
67	5	25	2015-11-16 10:19:46.935242	2015-11-16 10:19:46.935242
70	6	74	2015-11-21 06:54:22.336263	2015-11-21 06:54:22.336263
73	13	15	2015-12-01 07:37:06.853478	2015-12-01 07:37:06.853478
74	13	81	2015-12-01 08:21:58.069936	2015-12-01 08:21:58.069936
75	14	15	2015-12-03 09:21:40.567658	2015-12-03 09:21:40.567658
76	15	30	2015-12-11 13:19:54.926169	2015-12-11 13:19:54.926169
77	15	84	2015-12-13 16:49:20.491682	2015-12-13 16:49:20.491682
78	16	15	2015-12-17 08:27:53.682011	2015-12-17 08:27:53.682011
79	17	15	2016-01-11 18:54:29.737672	2016-01-11 18:54:29.737672
81	17	13	2016-01-22 08:25:18.976337	2016-01-22 08:25:18.976337
85	15	87	2016-02-02 09:32:04.522502	2016-02-02 09:32:04.522502
87	15	13	2016-02-10 14:26:26.138649	2016-02-10 14:26:26.138649
88	15	25	2016-02-17 16:01:11.243031	2016-02-17 16:01:11.243031
91	15	12	2016-02-26 12:31:51.062506	2016-02-26 12:31:51.062506
93	4	15	2016-03-08 09:16:31.45065	2016-03-08 09:16:31.45065
94	15	92	2016-03-10 14:37:19.933765	2016-03-10 14:37:19.933765
95	17	92	2016-03-10 14:38:59.698039	2016-03-10 14:38:59.698039
96	15	75	2016-03-14 13:01:05.34019	2016-03-14 13:01:05.34019
97	17	16	2016-03-16 15:37:49.167641	2016-03-16 15:37:49.167641
98	17	25	2016-03-16 16:11:01.599868	2016-03-16 16:11:01.599868
99	17	14	2016-03-22 11:06:01.531864	2016-03-22 11:06:01.531864
100	15	16	2016-03-22 11:21:32.207797	2016-03-22 11:21:32.207797
102	15	93	2016-03-31 14:42:38.795976	2016-03-31 14:42:38.795976
103	17	87	2016-04-04 09:16:31.307782	2016-04-04 09:16:31.307782
105	15	94	2016-04-05 08:41:31.894449	2016-04-05 08:41:31.894449
106	15	95	2016-04-06 10:56:39.237493	2016-04-06 10:56:39.237493
107	15	96	2016-04-06 14:39:17.179332	2016-04-06 14:39:17.179332
108	15	97	2016-04-07 12:49:50.79683	2016-04-07 12:49:50.79683
109	17	95	2016-04-08 15:54:36.063837	2016-04-08 15:54:36.063837
110	17	100	2016-04-12 15:33:34.665684	2016-04-12 15:33:34.665684
111	15	104	2016-04-23 18:11:38.953857	2016-04-23 18:11:38.953857
113	17	111	2016-05-23 21:00:55.379834	2016-05-23 21:00:55.379834
114	15	111	2016-05-23 21:03:44.936393	2016-05-23 21:03:44.936393
115	15	113	2016-06-01 08:46:37.258024	2016-06-01 08:46:37.258024
116	18	15	2016-06-04 17:11:51.258265	2016-06-04 17:11:51.258265
117	18	118	2016-06-06 13:24:52.646054	2016-06-06 13:24:52.646054
118	18	73	2016-06-06 14:07:01.222657	2016-06-06 14:07:01.222657
119	18	12	2016-06-06 15:45:00.301484	2016-06-06 15:45:00.301484
121	18	122	2016-06-08 16:18:30.179881	2016-06-08 16:18:30.179881
123	18	55	2016-06-08 17:45:32.612028	2016-06-08 17:45:32.612028
124	19	15	2016-06-13 07:02:40.747238	2016-06-13 07:02:40.747238
125	20	15	2016-06-13 07:10:06.808297	2016-06-13 07:10:06.808297
126	21	15	2016-06-15 14:21:18.320291	2016-06-15 14:21:18.320291
127	22	15	2016-06-15 14:59:58.412909	2016-06-15 14:59:58.412909
128	22	13	2016-06-17 09:38:38.888858	2016-06-17 09:38:38.888858
129	20	13	2016-06-17 09:42:24.50901	2016-06-17 09:42:24.50901
130	22	12	2016-06-17 10:34:51.842679	2016-06-17 10:34:51.842679
131	15	136	2016-06-17 12:52:15.786565	2016-06-17 12:52:15.786565
132	22	73	2016-06-17 14:16:18.646306	2016-06-17 14:16:18.646306
133	19	12	2016-06-17 14:16:49.957782	2016-06-17 14:16:49.957782
134	19	73	2016-06-17 14:17:02.018394	2016-06-17 14:17:02.018394
135	19	138	2016-06-17 14:31:49.988237	2016-06-17 14:31:49.988237
136	15	107	2016-06-17 15:32:45.086135	2016-06-17 15:32:45.086135
137	20	139	2016-06-17 16:06:58.187173	2016-06-17 16:06:58.187173
138	19	144	2016-06-20 10:54:56.65366	2016-06-20 10:54:56.65366
139	7	146	2016-06-20 12:55:09.927386	2016-06-20 12:55:09.927386
140	19	147	2016-06-22 10:09:28.31535	2016-06-22 10:09:28.31535
141	19	148	2016-06-22 10:33:28.891729	2016-06-22 10:33:28.891729
142	19	149	2016-06-23 07:39:45.753104	2016-06-23 07:39:45.753104
143	20	153	2016-06-29 07:05:34.559062	2016-06-29 07:05:34.559062
144	23	15	2016-07-01 08:29:18.086845	2016-07-01 08:29:18.086845
146	23	131	2016-07-01 16:48:16.555302	2016-07-01 16:48:16.555302
147	23	55	2016-07-02 11:58:30.850325	2016-07-02 11:58:30.850325
148	23	107	2016-07-02 16:45:23.174635	2016-07-02 16:45:23.174635
149	24	15	2016-07-05 11:53:28.34657	2016-07-05 11:53:28.34657
150	15	131	2016-07-08 12:32:53.333915	2016-07-08 12:32:53.333915
151	7	15	2016-07-09 18:04:30.052472	2016-07-09 18:04:30.052472
152	26	15	2016-07-09 18:11:53.568449	2016-07-09 18:11:53.568449
153	24	163	2016-07-13 14:02:17.540945	2016-07-13 14:02:17.540945
155	26	164	2016-07-14 09:46:43.684734	2016-07-14 09:46:43.684734
156	21	164	2016-07-14 09:47:07.571493	2016-07-14 09:47:07.571493
157	17	164	2016-07-14 09:47:45.288634	2016-07-14 09:47:45.288634
158	21	13	2016-07-18 13:00:08.815719	2016-07-18 13:00:08.815719
159	24	13	2016-07-18 13:04:45.877792	2016-07-18 13:04:45.877792
160	21	14	2016-07-18 13:07:00.022811	2016-07-18 13:07:00.022811
161	15	14	2016-07-18 13:07:05.006751	2016-07-18 13:07:05.006751
162	26	14	2016-07-18 13:07:54.569933	2016-07-18 13:07:54.569933
163	24	14	2016-07-18 13:09:01.76059	2016-07-18 13:09:01.76059
164	26	13	2016-07-18 13:28:05.649028	2016-07-18 13:28:05.649028
165	27	15	2016-07-29 10:12:49.376805	2016-07-29 10:12:49.376805
166	28	15	2016-07-31 10:43:26.295854	2016-07-31 10:43:26.295854
167	29	15	2016-08-22 20:58:47.006273	2016-08-22 20:58:47.006273
168	29	170	2016-08-26 17:53:24.854121	2016-08-26 17:53:24.854121
170	29	12	2016-09-04 14:20:13.101489	2016-09-04 14:20:13.101489
174	7	58	2016-09-05 12:20:11.454487	2016-09-05 12:20:11.454487
175	7	12	2016-09-05 12:23:29.573597	2016-09-05 12:23:29.573597
176	29	73	2016-09-09 09:16:40.454265	2016-09-09 09:16:40.454265
177	7	73	2016-09-15 10:17:54.218526	2016-09-15 10:17:54.218526
178	24	73	2016-09-15 10:18:55.230876	2016-09-15 10:18:55.230876
179	21	73	2016-09-15 10:19:15.733246	2016-09-15 10:19:15.733246
180	30	15	2016-09-27 12:13:23.831681	2016-09-27 12:13:23.831681
181	31	15	2016-09-29 09:45:13.714469	2016-09-29 09:45:13.714469
182	32	15	2016-09-29 10:41:42.623841	2016-09-29 10:41:42.623841
183	33	15	2016-09-29 10:46:11.414507	2016-09-29 10:46:11.414507
184	33	12	2016-09-29 11:12:05.310134	2016-09-29 11:12:05.310134
185	32	107	2016-09-29 12:04:20.591288	2016-09-29 12:04:20.591288
186	33	179	2016-09-29 13:14:52.598236	2016-09-29 13:14:52.598236
187	33	164	2016-10-03 06:40:21.875262	2016-10-03 06:40:21.875262
188	32	164	2016-10-03 06:40:35.066558	2016-10-03 06:40:35.066558
189	34	15	2016-10-03 08:08:59.843835	2016-10-03 08:08:59.843835
190	34	12	2016-10-03 09:49:00.96536	2016-10-03 09:49:00.96536
191	35	15	2016-10-05 15:03:01.31162	2016-10-05 15:03:01.31162
192	32	182	2016-10-06 17:44:50.920938	2016-10-06 17:44:50.920938
194	36	15	2016-10-09 10:32:48.232171	2016-10-09 10:32:48.232171
195	37	15	2016-10-09 14:34:42.605489	2016-10-09 14:34:42.605489
196	38	15	2016-10-09 14:36:30.635192	2016-10-09 14:36:30.635192
197	19	164	2016-10-10 11:28:28.882956	2016-10-10 11:28:28.882956
199	36	186	2016-10-11 18:45:53.119709	2016-10-11 18:45:53.119709
200	39	15	2016-10-13 11:30:14.773396	2016-10-13 11:30:14.773396
201	40	15	2016-10-13 11:36:21.696017	2016-10-13 11:36:21.696017
202	41	15	2016-10-13 11:40:35.640413	2016-10-13 11:40:35.640413
203	33	192	2016-10-17 08:23:35.879124	2016-10-17 08:23:35.879124
205	20	189	2016-10-17 17:26:24.621787	2016-10-17 17:26:24.621787
206	22	189	2016-10-18 15:47:07.379353	2016-10-18 15:47:07.379353
207	42	15	2016-10-19 14:02:26.992096	2016-10-19 14:02:26.992096
208	42	203	2016-10-19 14:48:02.112549	2016-10-19 14:48:02.112549
209	42	12	2016-10-20 10:11:50.082477	2016-10-20 10:11:50.082477
210	33	204	2016-10-22 11:38:22.929201	2016-10-22 11:38:22.929201
211	20	206	2016-10-24 11:42:17.653246	2016-10-24 11:42:17.653246
212	43	15	2016-10-25 22:00:11.597101	2016-10-25 22:00:11.597101
213	44	15	2016-10-28 09:12:44.237435	2016-10-28 09:12:44.237435
214	45	15	2016-10-28 09:15:51.295218	2016-10-28 09:15:51.295218
216	44	213	2016-10-28 13:44:37.653791	2016-10-28 13:44:37.653791
217	45	216	2016-10-28 16:09:40.172381	2016-10-28 16:09:40.172381
218	33	111	2016-10-29 17:53:00.117151	2016-10-29 17:53:00.117151
219	22	149	2016-10-31 10:56:54.143069	2016-10-31 10:56:54.143069
220	34	149	2016-10-31 11:13:28.175426	2016-10-31 11:13:28.175426
221	24	149	2016-10-31 11:13:55.787654	2016-10-31 11:13:55.787654
222	30	149	2016-10-31 11:14:11.812118	2016-10-31 11:14:11.812118
223	26	149	2016-10-31 11:14:38.488554	2016-10-31 11:14:38.488554
224	43	149	2016-10-31 11:18:52.562698	2016-10-31 11:18:52.562698
225	22	147	2016-11-04 14:36:28.319972	2016-11-04 14:36:28.319972
226	14	12	2016-11-10 17:29:28.57233	2016-11-10 17:29:28.57233
227	16	12	2016-11-10 17:29:44.298309	2016-11-10 17:29:44.298309
\.


--
-- Name: preferred_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('preferred_rooms_id_seq', 227, true);


--
-- Data for Name: private_chats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY private_chats (id, created_at, updated_at, travel_id, driver_id, passenger_id) FROM stdin;
36	2016-04-06 11:33:33.86688	2016-04-06 11:33:33.86688	292	95	73
37	2016-04-06 11:43:00.484253	2016-04-06 11:43:00.484253	296	95	12
38	2016-04-06 14:12:28.0004	2016-04-06 14:12:28.0004	303	12	96
39	2016-04-06 14:57:01.782745	2016-04-06 14:57:01.782745	312	15	87
40	2016-04-14 12:35:48.804341	2016-04-14 12:35:48.804341	316	95	73
41	2016-04-14 13:07:37.959888	2016-04-14 13:07:37.959888	323	87	15
42	2016-04-28 12:05:55.6046	2016-04-28 12:05:55.6046	334	15	75
43	2016-05-10 19:04:17.015755	2016-05-10 19:04:17.015755	337	15	107
44	2016-06-09 16:13:19.312416	2016-06-09 16:13:19.312416	368	12	126
45	2016-09-09 09:22:32.496244	2016-09-09 09:22:32.496244	389	73	15
46	2016-10-08 15:11:07.097129	2016-10-08 15:11:07.097129	470	15	186
\.


--
-- Name: private_chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('private_chats_id_seq', 46, true);


--
-- Data for Name: private_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY private_messages (id, content, created_at, updated_at, private_chat_id, author_id, read) FROM stdin;
1	Ciao porcellino!	2015-07-11 16:23:07.875693	2015-07-11 16:23:07.875693	1	14	f
2	Ciao!	2015-07-11 16:24:06.709154	2015-07-11 16:24:06.709154	1	12	f
3	mandrillo	2015-07-11 16:24:22.382947	2015-07-11 16:24:22.382947	1	14	f
4	ciao melaz	2015-07-13 20:58:46.552921	2015-07-13 20:58:46.552921	1	12	f
5	Ciao RIchi qui siamo soli!	2015-07-15 08:02:50.241474	2015-07-15 08:02:50.241474	2	14	f
6	YO	2015-07-15 08:03:52.15689	2015-07-15 08:03:52.15689	2	15	f
7	Prova messaggio privato	2015-07-15 10:19:12.567748	2015-07-15 10:19:12.567748	4	16	f
8	dio cane negro	2015-07-15 15:28:11.820491	2015-07-15 15:28:11.820491	5	15	f
9	w la religione	2015-07-15 15:28:51.872545	2015-07-15 15:28:51.872545	5	14	f
10	Facciamo il viaggio insieme	2015-08-11 09:08:11.675532	2015-08-11 09:08:11.675532	6	16	f
11	Yeeees!	2015-08-11 09:08:53.333468	2015-08-11 09:08:53.333468	6	14	f
12	andata!	2015-08-11 09:37:10.624454	2015-08-11 09:37:10.624454	6	16	f
13	yo	2015-08-11 11:39:17.457448	2015-08-11 11:39:17.457448	8	14	f
14	yea	2015-08-11 11:41:41.482771	2015-08-11 11:41:41.482771	8	16	f
15	cani?	2015-09-03 13:15:58.195959	2015-09-03 13:15:58.195959	10	15	f
16	gay friendly?	2015-09-03 13:22:53.851578	2015-09-03 13:22:53.851578	12	15	f
17	Perfetto! Si va	2015-09-03 13:37:27.693784	2015-09-03 13:37:27.693784	13	16	f
18	ciao!	2015-09-03 13:56:05.799208	2015-09-03 13:56:05.799208	14	12	f
19	Yo	2015-09-03 13:57:03.639309	2015-09-03 13:57:03.639309	13	14	f
20	DIO CANE	2015-09-03 13:57:48.454392	2015-09-03 13:57:48.454392	14	12	f
21	PORCA MADONNA	2015-09-03 13:57:54.995158	2015-09-03 13:57:54.995158	14	12	f
22	MERDA NEGRA	2015-09-03 13:58:00.558374	2015-09-03 13:58:00.558374	14	12	f
23	STRONZA PUTTANA	2015-09-03 13:58:04.564805	2015-09-03 13:58:04.564805	14	12	f
24	And You?	2015-09-03 13:58:59.48272	2015-09-03 13:58:59.48272	12	14	f
25	si vabbè stai tranquillo!	2015-09-03 13:59:25.362756	2015-09-03 13:59:25.362756	14	14	f
26	ggggg	2015-09-03 13:59:51.053049	2015-09-03 13:59:51.053049	12	15	f
27	asdasdas	2015-09-03 14:14:03.46303	2015-09-03 14:14:03.46303	14	12	f
28	hjgjgjy	2015-09-03 14:14:42.195727	2015-09-03 14:14:42.195727	12	15	f
29	ciao	2015-09-04 08:50:59.796645	2015-09-04 08:50:59.796645	15	34	f
30	eccoci. ci troviamo là alle 15.50	2015-09-04 08:54:20.437561	2015-09-04 08:54:20.437561	15	15	f
31	porci	2015-09-29 17:25:52.377281	2015-09-29 17:25:52.377281	10	16	f
32	:)	2015-09-29 17:26:44.476385	2015-09-29 17:26:44.476385	13	16	f
33	prova bacjk chat privata	2015-09-29 17:38:23.676009	2015-09-29 17:38:23.676009	13	16	f
34	Sono abituato	2015-10-24 15:37:28.701229	2015-10-24 15:37:28.701229	10	15	f
35	allor?	2015-10-24 18:39:05.158902	2015-10-24 18:39:05.158902	16	15	f
36	Il vino è pessimo	2015-10-24 18:44:32.374982	2015-10-24 18:44:32.374982	17	27	f
37	è il sangue di cristo	2015-10-24 18:48:16.456484	2015-10-24 18:48:16.456484	17	15	f
38	prova chat privata	2015-11-03 14:22:46.589634	2015-11-03 14:22:46.589634	17	27	f
39	\N	2015-11-05 23:04:29.42261	2015-11-05 23:04:29.42261	\N	53	f
40	\N	2015-11-05 23:13:14.565477	2015-11-05 23:13:14.565477	\N	53	f
41	\N	2015-11-05 23:13:19.285758	2015-11-05 23:13:19.285758	\N	53	f
42	asd	2015-11-05 23:13:53.218362	2015-11-05 23:13:53.218362	18	12	f
43	\N	2015-11-05 23:14:20.991251	2015-11-05 23:14:20.991251	\N	53	f
44	\N	2015-11-05 23:16:22.364721	2015-11-05 23:16:22.364721	\N	53	f
45	\N	2015-11-05 23:20:23.331964	2015-11-05 23:20:23.331964	\N	53	f
46	\N	2015-11-05 23:21:52.470121	2015-11-05 23:21:52.470121	\N	53	f
47	opkpokpo	2015-11-05 23:29:53.861286	2015-11-05 23:29:53.861286	21	12	f
48	\N	2015-11-05 23:30:11.586067	2015-11-05 23:30:11.586067	\N	53	f
49	\N	2015-11-05 23:31:09.552779	2015-11-05 23:31:09.552779	\N	53	f
50	\N	2015-11-05 23:32:25.602397	2015-11-05 23:32:25.602397	21	53	f
51	asdasd	2015-11-05 23:33:23.002995	2015-11-05 23:33:23.002995	21	53	f
52	asdsadsa	2015-11-05 23:33:40.976672	2015-11-05 23:33:40.976672	21	12	f
53	dio cane	2015-11-05 23:35:16.530475	2015-11-05 23:35:16.530475	21	53	f
54	oppokpok	2015-11-05 23:38:51.646288	2015-11-05 23:38:51.646288	22	12	f
55	asdasd	2015-11-05 23:41:58.709306	2015-11-05 23:41:58.709306	22	53	f
56	Vikb	2015-11-05 23:42:52.73109	2015-11-05 23:42:52.73109	22	53	f
57	Funziona!	2015-11-05 23:47:23.503837	2015-11-05 23:47:23.503837	21	53	f
58	Bella lì	2015-11-05 23:47:36.027963	2015-11-05 23:47:36.027963	21	53	f
59	Ciao	2015-11-06 00:20:44.669016	2015-11-06 00:20:44.669016	23	69	f
60	🤑🤑🤑	2015-11-06 00:21:40.43572	2015-11-06 00:21:40.43572	23	28	f
61	👍🏻	2015-11-06 00:21:58.907443	2015-11-06 00:21:58.907443	23	69	f
62	🤔🤔	2015-11-06 00:22:12.019235	2015-11-06 00:22:12.019235	23	69	f
63	🙄🤔🙃🙂	2015-11-06 00:22:22.127195	2015-11-06 00:22:22.127195	23	28	f
64	Ciao!	2015-11-06 08:13:37.035023	2015-11-06 08:13:37.035023	24	12	f
65	Che bella la chat!	2015-11-06 08:13:50.948838	2015-11-06 08:13:50.948838	24	53	f
66	mi son candidata	2015-11-09 08:48:28.637703	2015-11-09 08:48:28.637703	25	25	f
67	OK ci vengo	2015-11-14 18:35:48.494111	2015-11-14 18:35:48.494111	26	27	f
68	UE. Ti arriva la notifica?	2015-11-14 18:42:03.581219	2015-11-14 18:42:03.581219	26	15	f
69	Immagino non ti sia arrivata	2015-11-14 22:40:45.921197	2015-11-14 22:40:45.921197	26	15	f
70	asd	2015-12-02 18:50:50.716704	2015-12-02 18:50:50.716704	28	73	f
71	Ciao	2016-02-17 16:36:15.830561	2016-02-17 16:36:15.830561	29	12	f
72	Ue	2016-02-17 16:58:36.377673	2016-02-17 16:58:36.377673	29	15	f
73	sadasd	2016-02-26 12:40:13.786236	2016-02-26 12:40:13.786236	30	58	f
74	Test	2016-03-07 10:31:17.211232	2016-03-07 10:31:17.211232	31	15	f
75	Test?	2016-03-08 09:23:42.164256	2016-03-08 09:23:42.164256	32	16	f
76	testo!	2016-03-08 09:36:32.882344	2016-03-08 09:36:32.882344	32	15	f
77	e tu?	2016-03-08 09:37:47.657395	2016-03-08 09:37:47.657395	32	15	f
78	le vedi le mie notifiche o mi ignori?	2016-03-08 10:18:29.052181	2016-03-08 10:18:29.052181	32	15	f
79	Allora ?	2016-03-10 09:43:55.285742	2016-03-10 09:43:55.285742	32	15	f
80	ti ignoro duro	2016-03-16 16:22:36.401601	2016-03-16 16:22:36.401601	32	16	f
81	Continua pure ad ignorarmi	2016-03-16 16:22:51.76618	2016-03-16 16:22:51.76618	33	15	f
82	sempre	2016-03-16 16:24:16.810293	2016-03-16 16:24:16.810293	33	16	f
83	W la fuga	2016-03-22 12:03:27.70729	2016-03-22 12:03:27.70729	34	15	f
84	Ciao	2016-03-22 12:05:21.022752	2016-03-22 12:05:21.022752	34	12	f
85	alegria	2016-04-04 09:07:29.440262	2016-04-04 09:07:29.440262	34	15	f
86	maledetta	2016-04-04 09:30:15.793498	2016-04-04 09:30:15.793498	33	15	f
87	funziona?	2016-04-04 09:31:17.288566	2016-04-04 09:31:17.288566	32	15	f
88	Ciao!	2016-04-05 12:30:29.304893	2016-04-05 12:30:29.304893	35	73	f
89	Ciao!	2016-04-05 12:30:50.945645	2016-04-05 12:30:50.945645	35	12	f
90	Ciao!	2016-04-06 11:33:39.506661	2016-04-06 11:33:39.506661	36	73	f
91	Ciao!	2016-04-06 11:38:28.024331	2016-04-06 11:38:28.024331	36	95	f
92	Ci sono!	2016-04-06 11:43:23.119572	2016-04-06 11:43:23.119572	37	12	f
93	Ciao	2016-04-06 14:12:33.525449	2016-04-06 14:12:33.525449	38	96	f
94	Test	2016-04-28 12:07:51.904556	2016-04-28 12:07:51.904556	42	75	f
95	Flessibile?	2016-05-10 19:04:27.926414	2016-05-10 19:04:27.926414	43	107	f
96	certo	2016-05-11 10:57:13.115169	2016-05-11 10:57:13.115169	43	15	f
97	Yo	2016-06-09 16:13:23.783551	2016-06-09 16:13:23.783551	44	126	f
98	Ohi	2016-06-09 16:13:37.436642	2016-06-09 16:13:37.436642	44	12	f
99	Ahah	2016-06-09 16:13:51.571304	2016-06-09 16:13:51.571304	44	12	f
100	Shdhdh	2016-06-09 16:14:07.781619	2016-06-09 16:14:07.781619	44	12	f
101	mfjfk	2016-06-09 16:14:23.384629	2016-06-09 16:14:23.384629	44	12	f
102	Dhdhdh	2016-06-09 16:14:52.441192	2016-06-09 16:14:52.441192	44	12	f
103	Bella	2016-06-09 16:25:50.236491	2016-06-09 16:25:50.236491	44	12	f
104	Ddf	2016-06-09 16:30:03.07153	2016-06-09 16:30:03.07153	44	12	f
105	Fff	2016-06-09 16:30:06.247937	2016-06-09 16:30:06.247937	44	12	f
106	Hola	2016-09-09 09:22:49.554273	2016-09-09 09:22:49.554273	45	15	f
107	Ue	2016-09-09 09:24:54.269178	2016-09-09 09:24:54.269178	45	15	f
108	Hola	2016-09-09 09:26:27.653222	2016-09-09 09:26:27.653222	45	73	f
109	Prova	2016-09-09 09:27:24.673366	2016-09-09 09:27:24.673366	45	15	f
110	Ue	2016-09-09 09:28:48.106526	2016-09-09 09:28:48.106526	45	15	f
111	Sfg	2016-09-09 09:30:29.415245	2016-09-09 09:30:29.415245	45	15	f
112	Df	2016-09-09 09:30:37.019563	2016-09-09 09:30:37.019563	45	15	f
113	come andiamo con gli aggiornamenti?	2016-09-14 14:21:38.396601	2016-09-14 14:21:38.396601	45	15	f
\.


--
-- Name: private_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('private_messages_id_seq', 113, true);


--
-- Data for Name: private_room_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY private_room_settings (id, referral_domain, admin_permission, why_restrict, created_at, updated_at, room_id) FROM stdin;
\.


--
-- Name: private_room_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('private_room_settings_id_seq', 1, false);


--
-- Data for Name: public_chat_partecipants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public_chat_partecipants (id, user_id, travel_id, created_at, updated_at) FROM stdin;
254	12	268	2016-04-06 08:38:48.161321	2016-04-06 08:38:48.161321
255	12	269	2016-04-06 08:38:48.280395	2016-04-06 08:38:48.280395
256	73	270	2016-04-06 09:44:04.665054	2016-04-06 09:44:04.665054
257	73	271	2016-04-06 09:44:04.769693	2016-04-06 09:44:04.769693
258	73	272	2016-04-06 09:44:32.552285	2016-04-06 09:44:32.552285
259	73	273	2016-04-06 09:44:32.615092	2016-04-06 09:44:32.615092
260	73	274	2016-04-06 10:01:27.490761	2016-04-06 10:01:27.490761
261	73	275	2016-04-06 10:01:27.563829	2016-04-06 10:01:27.563829
262	73	276	2016-04-06 10:01:27.745063	2016-04-06 10:01:27.745063
263	73	277	2016-04-06 10:01:27.800694	2016-04-06 10:01:27.800694
264	73	278	2016-04-06 10:01:27.901779	2016-04-06 10:01:27.901779
265	73	279	2016-04-06 10:01:27.96103	2016-04-06 10:01:27.96103
266	73	280	2016-04-06 10:20:33.542296	2016-04-06 10:20:33.542296
267	73	281	2016-04-06 10:20:33.665505	2016-04-06 10:20:33.665505
268	73	282	2016-04-06 10:20:33.72566	2016-04-06 10:20:33.72566
269	73	283	2016-04-06 10:20:33.83969	2016-04-06 10:20:33.83969
270	73	284	2016-04-06 10:20:33.952613	2016-04-06 10:20:33.952613
271	73	285	2016-04-06 10:20:34.016657	2016-04-06 10:20:34.016657
272	95	288	2016-04-06 11:13:03.047929	2016-04-06 11:13:03.047929
273	95	289	2016-04-06 11:13:03.193051	2016-04-06 11:13:03.193051
274	95	290	2016-04-06 11:13:03.261219	2016-04-06 11:13:03.261219
275	95	291	2016-04-06 11:13:03.313025	2016-04-06 11:13:03.313025
276	95	292	2016-04-06 11:15:20.482382	2016-04-06 11:15:20.482382
277	95	293	2016-04-06 11:15:20.537301	2016-04-06 11:15:20.537301
278	95	294	2016-04-06 11:15:20.62597	2016-04-06 11:15:20.62597
279	95	295	2016-04-06 11:15:20.682643	2016-04-06 11:15:20.682643
280	12	292	2016-04-06 11:23:34.687395	2016-04-06 11:23:34.687395
281	95	296	2016-04-06 11:41:43.22421	2016-04-06 11:41:43.22421
282	12	296	2016-04-06 11:43:34.511966	2016-04-06 11:43:34.511966
283	12	297	2016-04-06 12:39:44.603452	2016-04-06 12:39:44.603452
284	12	298	2016-04-06 13:14:37.599333	2016-04-06 13:14:37.599333
285	15	299	2016-04-06 13:19:29.831503	2016-04-06 13:19:29.831503
286	12	301	2016-04-06 13:23:01.844083	2016-04-06 13:23:01.844083
287	12	302	2016-04-06 13:23:01.903869	2016-04-06 13:23:01.903869
288	12	303	2016-04-06 13:23:02.047331	2016-04-06 13:23:02.047331
289	12	304	2016-04-06 13:23:02.206501	2016-04-06 13:23:02.206501
290	12	305	2016-04-06 13:26:41.530326	2016-04-06 13:26:41.530326
291	12	306	2016-04-06 13:26:41.704278	2016-04-06 13:26:41.704278
292	12	307	2016-04-06 13:26:41.821272	2016-04-06 13:26:41.821272
293	12	308	2016-04-06 13:26:41.915135	2016-04-06 13:26:41.915135
294	15	309	2016-04-06 13:28:48.664594	2016-04-06 13:28:48.664594
295	15	310	2016-04-06 13:28:48.726612	2016-04-06 13:28:48.726612
296	15	311	2016-04-06 13:28:48.801126	2016-04-06 13:28:48.801126
297	15	312	2016-04-06 13:28:48.857391	2016-04-06 13:28:48.857391
298	15	305	2016-04-06 13:30:36.792771	2016-04-06 13:30:36.792771
299	87	313	2016-04-06 13:54:38.568355	2016-04-06 13:54:38.568355
300	87	314	2016-04-06 13:54:38.623859	2016-04-06 13:54:38.623859
301	87	315	2016-04-06 14:54:47.246706	2016-04-06 14:54:47.246706
302	95	316	2016-04-12 10:13:41.224471	2016-04-12 10:13:41.224471
303	95	317	2016-04-12 10:13:41.419685	2016-04-12 10:13:41.419685
304	73	318	2016-04-12 11:42:27.349103	2016-04-12 11:42:27.349103
305	87	319	2016-04-14 12:27:31.537854	2016-04-14 12:27:31.537854
306	87	320	2016-04-14 12:27:31.635401	2016-04-14 12:27:31.635401
307	87	321	2016-04-14 12:27:31.703798	2016-04-14 12:27:31.703798
308	87	322	2016-04-14 12:27:31.773523	2016-04-14 12:27:31.773523
309	87	323	2016-04-14 13:04:00.319058	2016-04-14 13:04:00.319058
310	12	324	2016-04-14 13:12:31.208668	2016-04-14 13:12:31.208668
311	12	325	2016-04-14 13:13:14.062673	2016-04-14 13:13:14.062673
312	87	326	2016-04-14 13:13:59.625265	2016-04-14 13:13:59.625265
313	95	327	2016-04-14 13:27:58.866782	2016-04-14 13:27:58.866782
314	95	328	2016-04-14 13:27:59.009891	2016-04-14 13:27:59.009891
315	95	329	2016-04-21 16:54:48.398673	2016-04-21 16:54:48.398673
316	95	330	2016-04-21 16:54:48.587726	2016-04-21 16:54:48.587726
317	95	331	2016-04-21 16:54:48.648622	2016-04-21 16:54:48.648622
318	95	332	2016-04-21 16:54:48.719156	2016-04-21 16:54:48.719156
319	95	333	2016-04-21 16:54:48.789584	2016-04-21 16:54:48.789584
320	104	330	2016-04-23 18:12:23.90022	2016-04-23 18:12:23.90022
321	15	334	2016-04-28 09:22:07.036532	2016-04-28 09:22:07.036532
322	15	335	2016-04-28 09:22:07.148314	2016-04-28 09:22:07.148314
323	12	336	2016-05-02 00:47:19.941985	2016-05-02 00:47:19.941985
324	58	336	2016-05-02 00:48:37.500993	2016-05-02 00:48:37.500993
325	15	337	2016-05-09 11:50:40.10534	2016-05-09 11:50:40.10534
326	15	338	2016-05-09 11:50:40.211927	2016-05-09 11:50:40.211927
327	15	339	2016-05-09 11:50:40.342626	2016-05-09 11:50:40.342626
328	15	340	2016-05-09 11:50:40.496508	2016-05-09 11:50:40.496508
329	15	341	2016-05-09 11:50:40.593987	2016-05-09 11:50:40.593987
330	15	342	2016-05-09 11:50:40.654256	2016-05-09 11:50:40.654256
331	15	343	2016-05-09 11:50:40.716809	2016-05-09 11:50:40.716809
332	15	344	2016-05-09 11:50:40.775251	2016-05-09 11:50:40.775251
333	15	345	2016-05-09 11:50:40.840062	2016-05-09 11:50:40.840062
334	15	346	2016-05-09 11:50:40.935396	2016-05-09 11:50:40.935396
335	15	347	2016-05-09 11:50:40.996091	2016-05-09 11:50:40.996091
336	15	348	2016-05-09 11:50:41.111428	2016-05-09 11:50:41.111428
337	15	349	2016-05-09 11:50:41.203368	2016-05-09 11:50:41.203368
338	15	350	2016-05-09 11:50:41.259569	2016-05-09 11:50:41.259569
339	15	351	2016-05-09 11:50:41.317666	2016-05-09 11:50:41.317666
340	15	352	2016-05-09 11:50:41.372353	2016-05-09 11:50:41.372353
341	29	339	2016-05-11 17:57:01.012932	2016-05-11 17:57:01.012932
342	73	353	2016-06-06 14:07:25.011275	2016-06-06 14:07:25.011275
343	15	354	2016-06-07 12:04:05.951756	2016-06-07 12:04:05.951756
344	12	355	2016-06-08 10:59:56.454099	2016-06-08 10:59:56.454099
345	12	356	2016-06-08 13:57:06.383185	2016-06-08 13:57:06.383185
346	58	357	2016-06-08 16:12:02.238452	2016-06-08 16:12:02.238452
347	107	358	2016-06-08 16:39:34.053889	2016-06-08 16:39:34.053889
348	107	359	2016-06-08 16:39:34.192104	2016-06-08 16:39:34.192104
349	107	360	2016-06-08 16:41:03.441033	2016-06-08 16:41:03.441033
350	107	361	2016-06-08 16:41:03.556482	2016-06-08 16:41:03.556482
351	73	362	2016-06-08 21:47:53.939577	2016-06-08 21:47:53.939577
352	73	363	2016-06-08 21:47:54.050798	2016-06-08 21:47:54.050798
353	73	364	2016-06-09 11:43:24.572346	2016-06-09 11:43:24.572346
354	73	365	2016-06-09 11:43:24.635764	2016-06-09 11:43:24.635764
355	15	366	2016-06-09 13:32:41.786571	2016-06-09 13:32:41.786571
356	15	367	2016-06-09 13:32:41.891408	2016-06-09 13:32:41.891408
357	12	368	2016-06-09 16:04:04.372186	2016-06-09 16:04:04.372186
358	12	369	2016-06-09 16:04:04.454101	2016-06-09 16:04:04.454101
359	12	370	2016-06-09 16:04:04.548762	2016-06-09 16:04:04.548762
360	12	371	2016-06-09 16:04:04.6219	2016-06-09 16:04:04.6219
361	126	368	2016-06-09 16:12:57.565379	2016-06-09 16:12:57.565379
362	107	367	2016-06-09 21:16:18.922726	2016-06-09 21:16:18.922726
363	107	372	2016-06-09 21:18:05.967348	2016-06-09 21:18:05.967348
364	107	373	2016-06-17 14:23:04.313815	2016-06-17 14:23:04.313815
365	15	374	2016-07-01 08:32:06.840429	2016-07-01 08:32:06.840429
366	15	375	2016-07-02 10:48:14.512341	2016-07-02 10:48:14.512341
367	15	376	2016-07-02 11:45:20.845708	2016-07-02 11:45:20.845708
368	107	377	2016-07-02 17:05:45.543603	2016-07-02 17:05:45.543603
369	107	378	2016-07-02 17:05:45.615331	2016-07-02 17:05:45.615331
370	15	379	2016-07-03 10:03:05.802579	2016-07-03 10:03:05.802579
371	107	380	2016-07-03 13:08:04.411329	2016-07-03 13:08:04.411329
372	107	381	2016-07-03 13:08:04.574274	2016-07-03 13:08:04.574274
373	15	382	2016-07-18 14:05:50.875719	2016-07-18 14:05:50.875719
374	15	383	2016-07-29 16:49:57.284713	2016-07-29 16:49:57.284713
375	15	384	2016-07-31 10:48:47.427392	2016-07-31 10:48:47.427392
376	15	385	2016-07-31 10:48:47.471842	2016-07-31 10:48:47.471842
377	58	386	2016-09-05 12:52:37.389533	2016-09-05 12:52:37.389533
378	58	387	2016-09-05 12:52:37.515403	2016-09-05 12:52:37.515403
379	15	388	2016-09-07 23:40:38.375318	2016-09-07 23:40:38.375318
380	73	389	2016-09-09 09:17:15.143001	2016-09-09 09:17:15.143001
381	15	389	2016-09-09 09:20:47.967461	2016-09-09 09:20:47.967461
382	12	390	2016-09-14 10:54:56.062167	2016-09-14 10:54:56.062167
383	73	391	2016-09-14 10:55:30.30489	2016-09-14 10:55:30.30489
384	73	392	2016-09-14 11:05:09.840248	2016-09-14 11:05:09.840248
385	73	393	2016-09-14 11:05:09.903515	2016-09-14 11:05:09.903515
386	73	394	2016-09-14 11:05:09.975066	2016-09-14 11:05:09.975066
387	12	394	2016-09-16 14:28:39.000651	2016-09-16 14:28:39.000651
388	15	395	2016-09-27 12:17:12.687405	2016-09-27 12:17:12.687405
389	15	396	2016-09-27 12:17:12.83669	2016-09-27 12:17:12.83669
390	15	397	2016-09-27 12:17:12.961105	2016-09-27 12:17:12.961105
391	15	398	2016-09-27 12:17:13.012802	2016-09-27 12:17:13.012802
392	15	399	2016-09-27 12:17:13.055465	2016-09-27 12:17:13.055465
393	15	400	2016-09-27 12:17:13.098188	2016-09-27 12:17:13.098188
394	15	401	2016-09-27 12:17:13.151569	2016-09-27 12:17:13.151569
395	15	402	2016-09-27 12:17:13.186803	2016-09-27 12:17:13.186803
396	15	403	2016-09-27 12:17:13.225396	2016-09-27 12:17:13.225396
397	15	404	2016-09-27 12:17:13.277726	2016-09-27 12:17:13.277726
398	15	405	2016-09-27 12:17:13.318523	2016-09-27 12:17:13.318523
399	15	406	2016-09-27 12:17:13.356691	2016-09-27 12:17:13.356691
400	15	407	2016-09-27 12:17:13.404125	2016-09-27 12:17:13.404125
401	15	408	2016-09-27 12:17:13.448443	2016-09-27 12:17:13.448443
402	15	409	2016-09-27 12:17:13.481616	2016-09-27 12:17:13.481616
403	15	410	2016-09-27 12:17:13.526868	2016-09-27 12:17:13.526868
404	15	411	2016-09-27 12:17:13.567605	2016-09-27 12:17:13.567605
405	15	412	2016-09-27 12:17:13.608308	2016-09-27 12:17:13.608308
406	15	413	2016-09-27 12:17:13.668261	2016-09-27 12:17:13.668261
407	15	414	2016-09-27 12:17:13.715293	2016-09-27 12:17:13.715293
408	15	415	2016-09-27 12:17:13.759221	2016-09-27 12:17:13.759221
409	15	416	2016-09-27 12:17:13.814624	2016-09-27 12:17:13.814624
410	15	417	2016-09-27 12:17:13.858143	2016-09-27 12:17:13.858143
411	15	418	2016-09-27 12:17:13.905153	2016-09-27 12:17:13.905153
412	15	419	2016-09-27 12:17:13.958707	2016-09-27 12:17:13.958707
413	15	420	2016-09-27 12:17:13.99882	2016-09-27 12:17:13.99882
414	15	421	2016-09-27 12:17:14.037782	2016-09-27 12:17:14.037782
415	15	422	2016-09-27 12:17:14.095481	2016-09-27 12:17:14.095481
416	15	423	2016-09-27 12:17:14.135609	2016-09-27 12:17:14.135609
417	15	424	2016-09-27 12:17:14.176532	2016-09-27 12:17:14.176532
418	15	425	2016-09-27 12:20:35.483001	2016-09-27 12:20:35.483001
419	15	426	2016-09-27 12:20:35.582426	2016-09-27 12:20:35.582426
420	15	427	2016-09-27 12:20:35.648218	2016-09-27 12:20:35.648218
421	15	428	2016-09-27 12:20:35.696585	2016-09-27 12:20:35.696585
422	15	429	2016-09-27 12:20:35.735736	2016-09-27 12:20:35.735736
423	15	430	2016-09-27 12:20:35.782743	2016-09-27 12:20:35.782743
424	15	431	2016-09-27 12:20:35.830662	2016-09-27 12:20:35.830662
425	15	432	2016-09-27 12:20:35.86569	2016-09-27 12:20:35.86569
426	15	433	2016-09-27 12:20:35.9022	2016-09-27 12:20:35.9022
427	15	434	2016-09-27 12:20:35.955227	2016-09-27 12:20:35.955227
428	15	435	2016-09-27 12:20:36.002988	2016-09-27 12:20:36.002988
429	15	436	2016-09-27 12:20:36.040959	2016-09-27 12:20:36.040959
430	15	437	2016-09-27 12:20:36.088807	2016-09-27 12:20:36.088807
431	15	438	2016-09-27 12:20:36.128028	2016-09-27 12:20:36.128028
432	15	439	2016-09-27 12:20:36.16515	2016-09-27 12:20:36.16515
433	15	440	2016-09-27 12:20:36.214416	2016-09-27 12:20:36.214416
434	15	441	2016-09-27 12:20:36.249988	2016-09-27 12:20:36.249988
435	15	442	2016-09-27 12:20:36.285079	2016-09-27 12:20:36.285079
436	15	443	2016-09-27 12:20:36.339568	2016-09-27 12:20:36.339568
437	15	444	2016-09-27 12:20:36.381807	2016-09-27 12:20:36.381807
438	15	445	2016-09-30 16:30:18.731781	2016-09-30 16:30:18.731781
439	15	446	2016-09-30 16:30:18.774424	2016-09-30 16:30:18.774424
440	15	447	2016-10-03 08:11:58.443459	2016-10-03 08:11:58.443459
441	15	448	2016-10-03 09:21:47.039284	2016-10-03 09:21:47.039284
442	15	449	2016-10-03 09:21:47.334693	2016-10-03 09:21:47.334693
443	15	450	2016-10-03 09:21:47.431242	2016-10-03 09:21:47.431242
444	15	451	2016-10-03 09:21:47.467605	2016-10-03 09:21:47.467605
445	15	452	2016-10-03 09:21:47.492164	2016-10-03 09:21:47.492164
446	15	453	2016-10-03 09:21:47.520412	2016-10-03 09:21:47.520412
447	15	454	2016-10-03 09:21:47.552825	2016-10-03 09:21:47.552825
448	15	455	2016-10-03 09:21:47.579231	2016-10-03 09:21:47.579231
449	15	456	2016-10-03 09:21:47.609348	2016-10-03 09:21:47.609348
450	15	457	2016-10-03 09:21:47.636111	2016-10-03 09:21:47.636111
451	15	458	2016-10-03 09:21:47.661584	2016-10-03 09:21:47.661584
452	15	459	2016-10-03 09:21:47.689493	2016-10-03 09:21:47.689493
453	15	460	2016-10-03 09:21:47.717178	2016-10-03 09:21:47.717178
454	15	461	2016-10-03 09:21:47.747229	2016-10-03 09:21:47.747229
455	15	462	2016-10-03 09:21:47.775375	2016-10-03 09:21:47.775375
456	15	463	2016-10-03 09:21:47.804772	2016-10-03 09:21:47.804772
457	15	464	2016-10-03 09:21:47.832103	2016-10-03 09:21:47.832103
458	15	465	2016-10-03 09:21:47.862021	2016-10-03 09:21:47.862021
459	15	466	2016-10-03 09:21:47.893149	2016-10-03 09:21:47.893149
460	15	467	2016-10-03 09:21:47.928664	2016-10-03 09:21:47.928664
461	15	468	2016-10-05 15:04:24.368773	2016-10-05 15:04:24.368773
462	15	469	2016-10-07 10:19:26.020831	2016-10-07 10:19:26.020831
463	15	470	2016-10-07 21:06:29.679319	2016-10-07 21:06:29.679319
464	15	471	2016-10-07 21:06:29.721737	2016-10-07 21:06:29.721737
465	15	472	2016-10-07 21:08:35.985045	2016-10-07 21:08:35.985045
466	15	473	2016-10-07 21:08:36.029346	2016-10-07 21:08:36.029346
467	15	474	2016-10-07 21:09:58.657474	2016-10-07 21:09:58.657474
468	149	475	2016-10-10 15:05:17.544874	2016-10-10 15:05:17.544874
469	149	476	2016-10-10 15:05:17.767261	2016-10-10 15:05:17.767261
470	149	477	2016-10-10 15:05:17.795106	2016-10-10 15:05:17.795106
471	149	478	2016-10-10 15:05:17.827927	2016-10-10 15:05:17.827927
472	15	477	2016-10-11 23:56:57.786193	2016-10-11 23:56:57.786193
473	139	479	2016-10-14 19:32:20.254536	2016-10-14 19:32:20.254536
474	139	480	2016-10-14 19:32:20.299143	2016-10-14 19:32:20.299143
475	139	481	2016-10-14 19:32:20.347243	2016-10-14 19:32:20.347243
476	139	482	2016-10-14 19:32:20.386073	2016-10-14 19:32:20.386073
477	139	483	2016-10-14 19:32:20.43099	2016-10-14 19:32:20.43099
478	139	484	2016-10-14 19:32:20.462054	2016-10-14 19:32:20.462054
479	139	485	2016-10-14 19:32:20.490143	2016-10-14 19:32:20.490143
480	139	486	2016-10-14 19:32:20.517421	2016-10-14 19:32:20.517421
481	139	487	2016-10-14 19:32:20.546883	2016-10-14 19:32:20.546883
482	139	488	2016-10-14 19:32:20.575132	2016-10-14 19:32:20.575132
483	139	489	2016-10-14 19:32:20.602899	2016-10-14 19:32:20.602899
484	139	490	2016-10-14 19:32:20.632178	2016-10-14 19:32:20.632178
485	139	491	2016-10-14 19:32:20.711631	2016-10-14 19:32:20.711631
486	139	492	2016-10-14 19:32:20.741104	2016-10-14 19:32:20.741104
487	139	493	2016-10-14 19:32:20.786501	2016-10-14 19:32:20.786501
488	139	494	2016-10-14 19:32:20.818255	2016-10-14 19:32:20.818255
489	139	495	2016-10-14 19:32:20.851976	2016-10-14 19:32:20.851976
490	139	496	2016-10-14 19:32:20.88102	2016-10-14 19:32:20.88102
491	139	497	2016-10-14 19:32:20.913161	2016-10-14 19:32:20.913161
492	139	498	2016-10-14 19:32:20.941449	2016-10-14 19:32:20.941449
493	139	499	2016-10-14 19:45:42.785455	2016-10-14 19:45:42.785455
494	139	500	2016-10-14 19:45:42.830808	2016-10-14 19:45:42.830808
495	139	501	2016-10-14 19:45:42.871228	2016-10-14 19:45:42.871228
496	139	502	2016-10-14 19:45:42.90155	2016-10-14 19:45:42.90155
497	139	503	2016-10-14 19:45:42.926787	2016-10-14 19:45:42.926787
498	139	504	2016-10-14 19:45:42.953882	2016-10-14 19:45:42.953882
499	139	505	2016-10-14 19:45:42.981744	2016-10-14 19:45:42.981744
500	139	506	2016-10-14 19:45:43.008209	2016-10-14 19:45:43.008209
501	139	507	2016-10-14 19:45:43.033504	2016-10-14 19:45:43.033504
502	139	508	2016-10-14 19:45:43.062477	2016-10-14 19:45:43.062477
503	189	509	2016-10-17 17:18:06.487699	2016-10-17 17:18:06.487699
504	189	510	2016-10-17 17:18:06.643352	2016-10-17 17:18:06.643352
505	189	511	2016-10-17 17:18:06.740451	2016-10-17 17:18:06.740451
506	189	512	2016-10-17 17:18:06.872893	2016-10-17 17:18:06.872893
507	189	513	2016-10-17 17:18:06.997043	2016-10-17 17:18:06.997043
508	189	514	2016-10-17 17:18:07.035079	2016-10-17 17:18:07.035079
509	189	515	2016-10-17 17:18:07.074676	2016-10-17 17:18:07.074676
510	189	516	2016-10-17 17:18:07.111145	2016-10-17 17:18:07.111145
511	189	517	2016-10-17 17:18:07.151645	2016-10-17 17:18:07.151645
512	189	518	2016-10-17 17:18:07.18943	2016-10-17 17:18:07.18943
513	189	519	2016-10-17 17:18:07.21564	2016-10-17 17:18:07.21564
514	189	520	2016-10-17 17:18:07.253399	2016-10-17 17:18:07.253399
515	189	521	2016-10-17 17:18:07.296986	2016-10-17 17:18:07.296986
516	189	522	2016-10-17 17:18:07.324135	2016-10-17 17:18:07.324135
517	189	523	2016-10-17 17:18:07.367329	2016-10-17 17:18:07.367329
518	189	524	2016-10-17 17:18:07.407211	2016-10-17 17:18:07.407211
519	189	525	2016-10-17 17:18:07.44326	2016-10-17 17:18:07.44326
520	189	526	2016-10-17 17:18:07.483491	2016-10-17 17:18:07.483491
521	189	527	2016-10-17 17:18:07.525293	2016-10-17 17:18:07.525293
522	189	528	2016-10-17 17:18:07.557224	2016-10-17 17:18:07.557224
523	189	529	2016-10-17 17:48:05.160132	2016-10-17 17:48:05.160132
524	189	530	2016-10-17 17:48:05.313138	2016-10-17 17:48:05.313138
525	189	531	2016-10-17 17:48:05.497082	2016-10-17 17:48:05.497082
526	189	532	2016-10-17 17:48:05.619816	2016-10-17 17:48:05.619816
527	15	533	2016-10-24 09:52:37.163946	2016-10-24 09:52:37.163946
528	164	534	2016-10-24 10:11:16.318402	2016-10-24 10:11:16.318402
529	164	535	2016-10-24 10:11:16.487486	2016-10-24 10:11:16.487486
530	164	536	2016-10-24 10:11:16.68518	2016-10-24 10:11:16.68518
531	164	537	2016-10-24 10:11:16.723268	2016-10-24 10:11:16.723268
532	164	538	2016-10-24 10:11:16.763321	2016-10-24 10:11:16.763321
533	164	539	2016-10-24 10:11:16.809565	2016-10-24 10:11:16.809565
534	164	540	2016-10-24 10:11:16.841488	2016-10-24 10:11:16.841488
535	164	541	2016-10-24 10:11:16.889287	2016-10-24 10:11:16.889287
536	164	542	2016-10-24 10:11:16.937373	2016-10-24 10:11:16.937373
537	164	543	2016-10-24 10:11:16.964766	2016-10-24 10:11:16.964766
538	12	544	2016-10-24 10:43:46.800186	2016-10-24 10:43:46.800186
539	189	545	2016-10-24 20:00:59.509575	2016-10-24 20:00:59.509575
540	189	546	2016-10-24 20:00:59.61541	2016-10-24 20:00:59.61541
541	189	547	2016-10-24 20:04:06.516361	2016-10-24 20:04:06.516361
542	189	548	2016-10-24 20:05:15.727734	2016-10-24 20:05:15.727734
543	189	549	2016-10-24 20:07:02.070164	2016-10-24 20:07:02.070164
544	189	550	2016-10-24 20:07:02.113387	2016-10-24 20:07:02.113387
545	189	554	2016-10-24 20:14:02.447283	2016-10-24 20:14:02.447283
546	189	555	2016-10-24 20:14:02.473369	2016-10-24 20:14:02.473369
547	139	556	2016-10-25 18:06:49.335733	2016-10-25 18:06:49.335733
548	139	557	2016-10-25 18:06:49.448817	2016-10-25 18:06:49.448817
549	139	558	2016-10-25 18:06:49.492807	2016-10-25 18:06:49.492807
550	139	559	2016-10-25 18:06:49.535112	2016-10-25 18:06:49.535112
551	139	560	2016-10-25 18:06:49.577794	2016-10-25 18:06:49.577794
552	139	561	2016-10-25 18:06:49.612906	2016-10-25 18:06:49.612906
553	139	562	2016-10-25 18:06:49.6482	2016-10-25 18:06:49.6482
554	139	563	2016-10-25 18:06:49.678938	2016-10-25 18:06:49.678938
555	139	564	2016-10-25 18:06:49.710042	2016-10-25 18:06:49.710042
556	139	565	2016-10-25 18:06:49.740068	2016-10-25 18:06:49.740068
557	139	566	2016-10-25 18:06:49.77085	2016-10-25 18:06:49.77085
558	139	567	2016-10-25 18:06:49.798837	2016-10-25 18:06:49.798837
559	139	568	2016-10-25 18:06:49.826887	2016-10-25 18:06:49.826887
560	139	569	2016-10-25 18:06:49.872992	2016-10-25 18:06:49.872992
561	139	570	2016-10-25 18:06:49.906812	2016-10-25 18:06:49.906812
562	139	571	2016-10-25 18:06:49.936905	2016-10-25 18:06:49.936905
563	139	572	2016-10-25 18:06:49.967084	2016-10-25 18:06:49.967084
564	139	573	2016-10-25 18:06:50.003803	2016-10-25 18:06:50.003803
565	139	574	2016-10-25 18:06:50.038931	2016-10-25 18:06:50.038931
566	139	575	2016-10-25 18:06:50.068793	2016-10-25 18:06:50.068793
567	149	576	2016-10-26 08:10:46.61422	2016-10-26 08:10:46.61422
568	149	577	2016-10-26 08:12:11.658361	2016-10-26 08:12:11.658361
569	149	578	2016-10-26 08:15:44.823575	2016-10-26 08:15:44.823575
570	12	579	2016-10-27 16:19:21.682315	2016-10-27 16:19:21.682315
571	12	580	2016-10-27 16:20:03.663549	2016-10-27 16:20:03.663549
572	12	581	2016-10-27 16:20:03.812902	2016-10-27 16:20:03.812902
573	12	582	2016-10-27 16:20:03.974288	2016-10-27 16:20:03.974288
574	12	583	2016-10-27 16:20:04.004571	2016-10-27 16:20:04.004571
575	12	584	2016-10-27 16:20:52.866606	2016-10-27 16:20:52.866606
576	12	585	2016-10-27 16:20:53.01075	2016-10-27 16:20:53.01075
577	12	586	2016-10-27 16:34:56.453914	2016-10-27 16:34:56.453914
578	15	587	2016-10-28 11:25:31.165711	2016-10-28 11:25:31.165711
579	15	588	2016-10-28 11:25:31.287727	2016-10-28 11:25:31.287727
580	149	589	2016-10-31 10:50:17.488913	2016-10-31 10:50:17.488913
581	149	590	2016-10-31 10:50:57.674483	2016-10-31 10:50:57.674483
582	149	591	2016-10-31 10:51:36.76613	2016-10-31 10:51:36.76613
583	149	592	2016-10-31 10:52:23.225001	2016-10-31 10:52:23.225001
584	149	593	2016-10-31 10:52:57.994467	2016-10-31 10:52:57.994467
585	149	594	2016-10-31 10:53:36.599367	2016-10-31 10:53:36.599367
586	149	595	2016-10-31 10:54:12.954012	2016-10-31 10:54:12.954012
587	149	596	2016-10-31 10:55:25.604324	2016-10-31 10:55:25.604324
588	149	597	2016-10-31 10:58:50.365816	2016-10-31 10:58:50.365816
589	149	598	2016-10-31 10:59:20.786699	2016-10-31 10:59:20.786699
590	149	599	2016-10-31 10:59:51.989259	2016-10-31 10:59:51.989259
591	149	600	2016-10-31 11:01:27.556032	2016-10-31 11:01:27.556032
592	149	601	2016-10-31 11:01:55.254432	2016-10-31 11:01:55.254432
593	149	602	2016-10-31 11:02:25.218724	2016-10-31 11:02:25.218724
594	149	603	2016-10-31 11:03:20.858506	2016-10-31 11:03:20.858506
595	149	604	2016-10-31 11:03:55.040138	2016-10-31 11:03:55.040138
596	12	605	2016-10-31 17:46:28.430376	2016-10-31 17:46:28.430376
597	12	606	2016-10-31 17:47:26.064746	2016-10-31 17:47:26.064746
598	12	607	2016-10-31 17:47:26.204312	2016-10-31 17:47:26.204312
599	12	608	2016-10-31 17:47:26.349409	2016-10-31 17:47:26.349409
\.


--
-- Name: public_chat_partecipants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public_chat_partecipants_id_seq', 599, true);


--
-- Data for Name: public_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public_messages (id, content, created_at, updated_at, author_id, travel_id, is_travel_owner) FROM stdin;
87	yo!	2016-04-06 11:23:34.67909	2016-04-06 11:23:34.67909	12	292	f
88	yo!	2016-04-06 11:23:34.975873	2016-04-06 11:23:34.975873	12	292	f
89	Bella	2016-04-06 11:23:43.189473	2016-04-06 11:23:43.189473	95	292	f
90	Bella	2016-04-06 11:23:44.037426	2016-04-06 11:23:44.037426	95	292	f
91	Ci sono!	2016-04-06 11:43:34.506778	2016-04-06 11:43:34.506778	12	296	f
92	Bella!	2016-04-06 11:43:47.034172	2016-04-06 11:43:47.034172	95	296	f
93	nessuna flessibilità?	2016-04-06 13:30:36.785503	2016-04-06 13:30:36.785503	15	305	f
94	Ciao	2016-04-23 18:12:23.892794	2016-04-23 18:12:23.892794	104	330	f
95	Ciao	2016-04-23 18:12:53.62353	2016-04-23 18:12:53.62353	95	330	f
96	Suca	2016-04-23 18:13:08.240655	2016-04-23 18:13:08.240655	104	330	f
97	asdsadsa	2016-05-02 00:48:37.492216	2016-05-02 00:48:37.492216	58	336	f
98	trhhr	2016-05-02 00:49:14.028242	2016-05-02 00:49:14.028242	58	336	f
99	regerger	2016-05-02 00:49:20.878243	2016-05-02 00:49:20.878243	58	336	f
100	kmjoij	2016-05-02 00:54:14.773384	2016-05-02 00:54:14.773384	58	336	f
101	iuh	2016-05-02 00:54:29.222706	2016-05-02 00:54:29.222706	58	336	f
102	sdfsd	2016-05-02 00:55:17.895357	2016-05-02 00:55:17.895357	58	336	f
103	mim	2016-05-02 00:57:08.928201	2016-05-02 00:57:08.928201	58	336	f
104	s	2016-05-02 00:57:31.16151	2016-05-02 00:57:31.16151	58	336	f
105	sd	2016-05-02 00:59:15.884466	2016-05-02 00:59:15.884466	58	336	f
106	d	2016-05-02 00:59:21.598255	2016-05-02 00:59:21.598255	58	336	f
107	Uè	2016-05-11 17:57:00.999489	2016-05-11 17:57:00.999489	29	339	f
108	hola!	2016-05-11 18:37:17.791878	2016-05-11 18:37:17.791878	15	339	t
109	Ciao!	2016-06-09 16:11:49.144567	2016-06-09 16:11:49.144567	12	368	f
110	Ehi!	2016-06-09 16:12:16.810408	2016-06-09 16:12:16.810408	12	368	f
111	Ohio	2016-06-09 16:12:57.559651	2016-06-09 16:12:57.559651	126	368	f
112	Di ritorno da giornata speciale, complimenti GDA! Terminato il test, ora al via con PickApp!	2016-06-09 21:13:47.287711	2016-06-09 21:13:47.287711	15	367	t
113	Grazie per il passaggio, voglio anch'io una Multipla!!	2016-06-09 21:16:18.91566	2016-06-09 21:16:18.91566	107	367	f
114	Ole	2016-09-09 09:20:47.959403	2016-09-09 09:20:47.959403	15	389	f
115	Ggg	2016-09-09 09:35:59.587568	2016-09-09 09:35:59.587568	15	389	f
116	completato?	2016-09-14 14:21:01.698796	2016-09-14 14:21:01.698796	15	389	f
117	okok	2016-09-16 14:28:38.976577	2016-09-16 14:28:38.976577	12	394	f
118	l'orario di partenza può variare di molto?	2016-10-11 23:56:57.776025	2016-10-11 23:56:57.776025	15	477	f
119	ciao Riccardo! sì, l'orario potrebbe variare tra le 08.45 e le 09.15, a seconda che io entri per le 9 o per le 9.30	2016-10-12 13:53:55.280181	2016-10-12 13:53:55.280181	149	477	t
120	Ok grazie!	2016-10-12 13:55:35.880084	2016-10-12 13:55:35.880084	15	477	f
\.


--
-- Name: public_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public_messages_id_seq', 120, true);


--
-- Data for Name: room_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY room_categories (id, name, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
8	Aria aperta	2015-07-27 08:30:27.581399	2015-07-27 08:30:27.581399	AriaAperta.png	image/png	378113	2015-07-27 08:30:27.012842
9	BrunchTime	2015-07-27 08:31:39.165583	2015-07-27 08:31:39.165583	BrunchTime.png	image/png	494703	2015-07-27 08:31:38.503129
10	CenaConVista	2015-07-27 08:32:33.192996	2015-07-27 08:32:33.192996	CenaConVista.png	image/png	515266	2015-07-27 08:32:32.491952
11	HappyHour	2015-07-27 08:34:33.652832	2015-07-27 08:34:33.652832	HappyHour.png	image/png	542550	2015-07-27 08:34:32.885476
13	Mostre	2015-07-27 08:36:25.145205	2015-07-27 08:36:25.145205	Mostre.png	image/png	496514	2015-07-27 08:36:24.406609
14	Scuole Superiori	2015-07-27 08:37:06.521101	2015-07-27 08:37:06.521101	ScuoleSuperiori.png	image/png	258246	2015-07-27 08:37:05.923252
15	Weekend al Lago	2015-07-27 08:37:57.483545	2015-07-27 08:37:57.483545	WeekendAlLago.png	image/png	474242	2015-07-27 08:37:56.909762
16	Cultura e formazione	2016-01-11 18:40:12.819365	2016-01-11 18:40:12.819365	centro_aggregazione.jpg	image/jpeg	127781	2016-01-11 18:40:12.552893
6	Eventi	2015-07-08 18:03:15.690916	2016-06-06 16:45:51.565557	SW_Dylan_Rives.jpg	image/jpeg	736071	2016-06-06 16:45:50.19464
7	Nightlife	2015-07-08 18:14:50.786236	2016-06-06 16:46:43.154717	alcohol-bar-party-cocktail.jpg	image/jpeg	596771	2016-06-06 16:46:41.942278
17	Bonprix	2016-06-13 06:21:49.204733	2016-06-13 06:21:49.204733	bonprix_300dpi.jpg	image/jpeg	1772706	2016-06-13 06:21:46.16823
18	Pendolari Lavoro Scuola	2016-09-29 10:35:39.858728	2016-09-29 10:35:39.858728	treno_pendolari.jpg	image/jpeg	43211	2016-09-29 10:35:39.52361
12	Ora del Tea	2015-07-27 08:35:25.733745	2016-09-30 21:56:49.434359	1418736023183.jpeg	image/jpeg	481835	2016-04-14 12:30:21.066339
19	Avanzi di balera	2016-10-05 15:00:01.116877	2016-10-05 15:00:01.116877	1512610_10152084723669449_834408514_n.jpg	image/jpeg	47125	2016-10-05 15:00:00.737548
\.


--
-- Name: room_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('room_categories_id_seq', 19, true);


--
-- Data for Name: room_images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY room_images (id, room_id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
\.


--
-- Name: room_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('room_images_id_seq', 1, false);


--
-- Data for Name: room_reviews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY room_reviews (id, content, rating, created_at, updated_at, room_id, author_id) FROM stdin;
\.


--
-- Name: room_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('room_reviews_id_seq', 1, false);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rooms (id, admin_editable, name, rating, total_rating, number_of_ratings, price, start_date, end_date, is_private, website, facebook, twitter, instagram, trip_advisor, phone, created_at, updated_at, address, lat, long, room_category_id, background_image_file_name, background_image_content_type, background_image_file_size, background_image_updated_at, description, is_school) FROM stdin;
13	\N	ITIS Q.Sella Biella centrale	\N	\N	\N	0	2015-10-10 23:00:00	2017-01-01 02:50:00	\N	http://www.itis.biella.it/2014/boxed/index.php	\N	\N	\N	\N	015840360	2015-10-10 15:06:48.650587	2016-09-29 09:35:35.346767	Via Rosselli Carlo e nello Fratelli 2 Biella BI	45.5589544999999987	8.04783769999999876	14	logo.png	image/png	74109	2015-10-10 15:06:48.267787	Istituto di Istruzione Superiore Q. Sella - Biella\n\nLiceo Scientifico opzione Scienze Applicate - Istituto Tecnico: Settore Tecnologico - Liceo Scientifico Sportivo - Corsi serali	t
14	\N	Liceo Sella sede centrale	\N	\N	\N	0	2015-10-14 16:30:00	2017-01-01 02:00:00	\N	http://www.liceosella.it/it/	https://www.facebook.com/liceosella?fref=ts	\N	\N	\N	015 84 09 141	2015-10-14 10:29:04.097312	2015-12-17 08:28:41.81922	Via Addis Abeba, 20 13900 Biella	45.5562151999999969	8.05604239999999905	14	411126_382384231791672_1921690457_o.jpg	image/jpeg	127781	2015-10-14 10:29:02.243009	L’I.I.S. “G. e Q. Sella” è un istituto di Istruzione Superiore articolato in tre differenti indirizzi: Liceo Classico, Liceo Linguistico, Liceo Artistico. Nato come Liceo Classico, nel 1873, per iniziativa degli industriali Giuseppe e Quintino Sella, ai quali venne intitolato nel 1937 quando, fondendosi con il “Regio Ginnasio” cittadino, diede origine al “Regio Liceo Ginnasio Giuseppe e Quintino Sella”, nel corso della sua lunga storia il Liceo ha partecipato attivamente alla vita culturale della città: ha promosso la formazione della Biblioteca, del Museo e della prima Università Popolare, e ha accolto nelle sue aule intere generazioni di cittadini biellesi, preparandoli alla vita professionale e agli studi universitari.\n\nL’identità odierna del Liceo Classico è il risultato di un processo continuo di evoluzione nel corso del quale gli obiettivi di fondo dell’insegnamento liceale sono stati integrati ed arricchiti in maniera coerente con le richieste e le trasformazioni della società contemporanea.\n\nIl curricolo tradizionale si è arricchito dal 1991 della sperimentazione PLS (Proseguimento Lingua Straniera) e dal 1993 PNI (Piano Nazionale Informatica), garantendo così agli studenti accanto alle competenze umanistico-linguistiche una valida preparazione matematico-scientifica.\n\nNegli ultimi decenni in concomitanza con la crisi dell’istruzione tecnica, da sempre legata nell’economia del territorio all’area del tessile e per rispondere ad una esigenza di riqualificazione dell’istruzione in termini di più ampia e articolata competenza, il Liceo si è arricchito di nuovi indirizzi, mantenendo fermi i suoi obiettivi di fondo.\n\nNel 1993 raccogliendo l’eredità del Liceo Linguistico Privato Ada Negri è stato attivato un Liceo Linguistico Sperimentazione Brocca, centrato sullo studio delle lingue comunitarie, avente come finalità: la comprensione della cultura Europea e la sprovincializzazione del mercato come richiesto dall’industria del territorio.\n\nDal 1999, grazie alle possibilità offerte dalla legge sull’autonomia scolastica, sono state avviate nuove offerte curriculari: l’introduzione dello spagnolo nell’indirizzo linguistico (Liceo Linguistico “Duemila” – tre lingue per cinque anni – l’introduzione delle Scienze Sociali (Psicologia, Sociologia, Diritto, Economia e Antropologia) nell’indirizzo classico, il rafforzamento della conversazione in Lingua Straniera con certificazioni esterne per tutti gli indirizzi (Progetto Lingua 2000), Liceo Classico “Internazionale” che, prevedendo nel triennio l’insegnamento di una disciplina (storia) in Inglese, con compresenza di un insegnante di madrelingua, si prefiggeva l’obiettivo concreto di fornire al termine degli studi liceali competenze linguistiche spendibili in qualsiasi paese anglofono.\n\nNel 2001 in sintonia con le strategie di valorizzazione del territorio da un punto di vista artistico (comincia in questi anni l’attività della Fondazione Pistoletto) e per sopperire all’assenza di un indirizzo artistico nell’intera provincia di Biella è stato attivato il primo Liceo Artistico Quadriennale con indirizzo Architettonico.\n\nOggi\n\nAl Liceo Classico di ordinamento voluto dalla riforma si affiancano una opzione di Potenziamento Scientifico e una Giuridica.\nIl Liceo Linguistico – Sperimentazione Brocca è confluito nel nuovo Liceo Linguistico caratterizzato dallo studio delle lingue comunitarie e finalizzato alla comprensione della cultura europea.\nIl Liceo Artistico quadriennale – Indirizzo Architettonico è diventato, secondo la Riforma, un corso Quinquennale con un biennio comune propedeutico agli Indirizzi Architettura – Ambiente e Arti Figurative all’interno dei quali sono previste due curvature, rispettivamente Design e Grafica.\nAutorizzato con delibere regionali del 2009 e 2010 il Liceo G. e Q. Sella ha proposto negli ultimi due anni scolastici il Liceo Musicale e Coreutico la cui attivazione, nonostante gli iscritti, purtroppo è stata bloccata dalla mancata ratifica a livello ministeriale.\n La Scuola organizza mostre ed esposizioni in collaborazione con le Istituzioni Locali e conferenze, dibattiti, serate culturali nel Museo Didattico Roccavilla che accoglie, oltre a questi fermenti intellettuali, materiale didattico risalente all’ottocento: dalle carte geografiche d’epoca ai dagherrotipi, dai circa trecento strumenti scientifici dell’antico laboratorio di Fisica e Scienze Naturali alle collezioni di riproduzioni che testimoniano il ruolo culturale storicamente svolto da questo Liceo.\n\nIl Liceo “G. e Q. Sella” si configura, dunque, oggi come ieri, come un vero e proprio “polo” di aggregazione culturale nel Territorio e per il Territorio.	t
7	\N	Balma /lame del torrente	\N	\N	\N	0	2015-07-27 10:30:00	2016-12-31 22:50:00	\N	\N	https://www.facebook.com/pages/Balma-Fiume/242384165804986?fref=ts	\N	\N	\N	\N	2015-07-27 09:12:50.938197	2016-09-03 15:20:10.650379	45.646223, 8.017714	45.6467183999999975	8.01838500000000032	8	10478198_10205764214457844_6903912338881285647_n.jpg.jpg	image/jpeg	133527	2016-09-03 15:20:10.177556	Un classico per un bagno in piscine naturali immerse nel verde	f
4	\N	Reload Sound Festival	\N	\N	\N	0	2015-07-10 17:00:00	2015-07-12 00:00:00	\N	\N	https://it-it.facebook.com/reloadsoundfestival	\N	\N	\N	\N	2015-07-08 18:24:56.606346	2015-07-08 18:24:56.606346	Campo Volo Aquiloni, corso Guido Alberto Rivetti, 13900 Biella	45.5582443999999995	8.06918489999999977	6	11406257_947176191969233_1604269216146281002_o.jpg	image/jpeg	212243	2015-07-08 18:24:55.889977	La musica torna a colorare la città, torna a prendersi i suoi luoghi. Torna a creare aggregazione, socialità e condivisione. RELOAD soundfestival s’illumina nel cuore di Biella, cuore pulsante dal centro alle periferie.\nIngresso gratuito con offerta libera (in modalità up-to-you). \nConcerti, attività ludiche, food and drink di qualità e relax.\nDue giorni in una location davvero unica: il Campo Volo Aquiloni, in corso Guido Alberto Rivetti, è un parco immenso circondato dal verde. Accessibile da tutte le direzioni, ideale per il pubblico dei concerti e accogliente per le famiglie e per i più piccoli.	f
5	\N	Marinella	\N	\N	\N	0	2015-07-27 09:00:00	2015-12-31 22:00:00	\N	http://www.barmarinella.com/	\N	\N	\N	\N	0161987035	2015-07-27 08:44:07.066995	2015-07-27 08:44:07.066995	via lungo lago 6 Viverone	45.4209630000000004	8.04665499999999945	15	14.jpg	image/jpeg	159096	2015-07-27 08:44:06.443419	Marinella\nIl Complesso Turistico la Marinella situato sul Lago di Viverone,è una vera e propria oasi di pace e svago.\nOltre alla possibilità di potersi rilassare sulla spiaggia caraibica, potrete praticare le diverse attività sportive offerte dalla struttura,\ncome sci nautico e wakeboard con istruttore, lezione di vela e motore, gite in canoa e barcha a remi. \nIl bar Marinella è famoso inoltre per la varietà e l'originalità del suo menu; \ndalle esotiche coppe di gelato ai gustosi panini, dalle bruschette dolci e salate ai cocktail variopinti;\ni più piccoli inoltre, potranno intrattenersi nella nostra completa salagiochi, \nmentre i più romantici potranno godersi un aperitivo nel dehor ammirando il fantastico tramonto sul lago,\nmagari terminando la serata con un tour in limousine.\nogni mercoledì sera,nella stagione estiva, \nla Marinella organizza la serata latino americana più "in" della zona, \ncon dj e percussioni dal vivo;\nIl simpatico staff del complesso turistico la marinella, vi invita a trascorrere qui le vostre giornate, all'insegna del relax, allegria e divertimento.	f
6	\N	Road Runner	\N	\N	\N	0	2015-07-27 08:50:00	2015-12-31 22:50:00	\N	\N	https://www.facebook.com/roadrunnerbiella	\N	\N	\N	3492160013	2015-07-27 08:49:47.062377	2015-07-27 08:49:47.062377	Via Tollegno 1, 13900 Biella	45.5777935999999997	8.05114230000000042	7	170123_498038683122_7560496_o.jpg	image/jpeg	254515	2015-07-27 08:49:46.342083	Disco Club	f
8	\N	Bruticella	\N	\N	\N	0	2015-07-27 10:55:00	2015-12-31 19:55:00	\N	\N	https://www.facebook.com/caffebruticella/timeline	\N	\N	\N	01523464	2015-07-27 09:17:33.390377	2015-07-27 09:17:33.390377	via san filippo 23/a biella	45.567697299999999	8.05186439999999948	11	11402672_835931096476434_3332972038816471362_o.png	image/png	145370	2015-07-27 09:17:31.753542	Vineria & Cocktail bar, Tavola fredda & calda, Colazioni, Aperitivi & DJ Set	f
9	\N	Concept	\N	\N	\N	5	2015-07-25 18:30:00	2015-09-30 21:45:00	\N	\N	https://www.facebook.com/ConceptCittadellarte/timeline	\N	\N	\N	333 995 0110	2015-07-27 09:27:08.013913	2015-07-27 09:27:08.013913	via serralunga 37 biella	45.571248599999997	8.05672049999999906	7	11255181_654098368024799_8663391372826481274_n.jpg	image/jpeg	35242	2015-07-27 09:27:07.503202	L'ESTIVO BIELLESE è TORNATO!\nConcept, Discoteca	f
10	\N	La Passione di Sordevolo	\N	\N	\N	0	2015-07-27 13:25:00	2015-12-31 22:45:00	\N	http://www.passionedicristo.org/	https://www.facebook.com/pages/La-Passione-Di-Sordevolo/1587409561508056?sk=info&tab=page_info	\N	\N	\N	015 256 2486	2015-07-27 09:42:21.026734	2015-07-27 09:42:21.026734	Via Eugenio Bona, 35, 13837 Sordevolo	45.5717248000000126	7.97534030000000094	6	14049_1590358254546520_6801670652424206783_n.jpg	image/jpeg	94614	2015-07-27 09:42:20.451177	Da due secoli si rappresenta a Sordevolo la Passione di Gesù che l'intera comunità dei Sordevolesi mette in scena in completa autonomia organizzativa e artistica. Lo spettacolo, che dura circa tre ore, è composto da un prologo e 29 scene nelle quali sono presenti complessivamente 400 persone tra attori e comparse.	f
15	\N	cafeteria luogoComune cittadellarte	\N	\N	\N	0	2015-10-24 13:00:00	2016-12-31 18:55:00	\N	http://www.cittadellarte.it/cafeteria	https://www.facebook.com/cafeteria.lequoristorodicittadellarte?fref=photo	\N	\N	\N	370 320 5471	2015-10-24 12:41:40.991838	2015-10-24 12:41:40.991838	via serralunga 27 biella	45.5723683000000008	8.05341879999999932	6	11659444_860860173969266_1772374939388993048_n.jpg	image/jpeg	18867	2015-10-24 12:41:40.711195	Utilizziamo prodotti del commercio equo e solidale,\ne prediligiamo alimenti d’agricoltura biologica certificata e delle migliori aziende locali.\nPer il pieno rispetto\ndi chi lavora per produrre il cibo,\nper l’ambiente,\nper chi si nutre quotidianamente con ciò che prepariamo.	f
33	\N	Torino/pendolari-studenti	\N	\N	\N	0	2016-09-29 02:00:00	2017-12-31 01:00:00	\N	\N	\N	\N	\N	\N	3398868087	2016-09-29 10:46:10.716481	2016-10-09 10:33:26.620922	corso giulio cesare 10100 torino	45.0983559000000014	7.69780609999999932	18	\N	\N	\N	\N	ecco lo spazio per inserire i vostri viaggi biella torino a/r per condividere posti auto. consigliamo di inserire con cura i viaggi ricorsivi!	f
16	\N	Liceo Sella sez.Città Studi	\N	\N	\N	0	2015-12-17 08:25:00	2017-01-01 00:00:00	\N	http://www.liceosella.it/it/	https://www.facebook.com/liceosella?fref=ts	\N	\N	\N	015 84 09 141	2015-12-17 08:27:52.681921	2015-12-17 08:27:52.681921	corso giuseppe pella 10 Biella	45.5543541999999988	8.03177589999999952	14	\N	\N	\N	\N	L’I.I.S. “G. e Q. Sella” è un istituto di Istruzione Superiore articolato in tre differenti indirizzi: Liceo Classico, Liceo Linguistico, Liceo Artistico. Nato come Liceo Classico, nel 1873, per iniziativa degli industriali Giuseppe e Quintino Sella, ai quali venne intitolato nel 1937 quando, fondendosi con il “Regio Ginnasio” cittadino, diede origine al “Regio Liceo Ginnasio Giuseppe e Quintino Sella”, nel corso della sua lunga storia il Liceo ha partecipato attivamente alla vita culturale della città: ha promosso la formazione della Biblioteca, del Museo e della prima Università Popolare, e ha accolto nelle sue aule intere generazioni di cittadini biellesi, preparandoli alla vita professionale e agli studi universitari.\n\nL’identità odierna del Liceo Classico è il risultato di un processo continuo di evoluzione nel corso del quale gli obiettivi di fondo dell’insegnamento liceale sono stati integrati ed arricchiti in maniera coerente con le richieste e le trasformazioni della società contemporanea.\n\nIl curricolo tradizionale si è arricchito dal 1991 della sperimentazione PLS (Proseguimento Lingua Straniera) e dal 1993 PNI (Piano Nazionale Informatica), garantendo così agli studenti accanto alle competenze umanistico-linguistiche una valida preparazione matematico-scientifica.\n\nNegli ultimi decenni in concomitanza con la crisi dell’istruzione tecnica, da sempre legata nell’economia del territorio all’area del tessile e per rispondere ad una esigenza di riqualificazione dell’istruzione in termini di più ampia e articolata competenza, il Liceo si è arricchito di nuovi indirizzi, mantenendo fermi i suoi obiettivi di fondo.\n\nNel 1993 raccogliendo l’eredità del Liceo Linguistico Privato Ada Negri è stato attivato un Liceo Linguistico Sperimentazione Brocca, centrato sullo studio delle lingue comunitarie, avente come finalità: la comprensione della cultura Europea e la sprovincializzazione del mercato come richiesto dall’industria del territorio.\n\nDal 1999, grazie alle possibilità offerte dalla legge sull’autonomia scolastica, sono state avviate nuove offerte curriculari: l’introduzione dello spagnolo nell’indirizzo linguistico (Liceo Linguistico “Duemila” – tre lingue per cinque anni – l’introduzione delle Scienze Sociali (Psicologia, Sociologia, Diritto, Economia e Antropologia) nell’indirizzo classico, il rafforzamento della conversazione in Lingua Straniera con certificazioni esterne per tutti gli indirizzi (Progetto Lingua 2000), Liceo Classico “Internazionale” che, prevedendo nel triennio l’insegnamento di una disciplina (storia) in Inglese, con compresenza di un insegnante di madrelingua, si prefiggeva l’obiettivo concreto di fornire al termine degli studi liceali competenze linguistiche spendibili in qualsiasi paese anglofono.\n\nNel 2001 in sintonia con le strategie di valorizzazione del territorio da un punto di vista artistico (comincia in questi anni l’attività della Fondazione Pistoletto) e per sopperire all’assenza di un indirizzo artistico nell’intera provincia di Biella è stato attivato il primo Liceo Artistico Quadriennale con indirizzo Architettonico.\n\nOggi\n\nAl Liceo Classico di ordinamento voluto dalla riforma si affiancano una opzione di Potenziamento Scientifico e una Giuridica.\nIl Liceo Linguistico – Sperimentazione Brocca è confluito nel nuovo Liceo Linguistico caratterizzato dallo studio delle lingue comunitarie e finalizzato alla comprensione della cultura europea.\nIl Liceo Artistico quadriennale – Indirizzo Architettonico è diventato, secondo la Riforma, un corso Quinquennale con un biennio comune propedeutico agli Indirizzi Architettura – Ambiente e Arti Figurative all’interno dei quali sono previste due curvature, rispettivamente Design e Grafica.\nAutorizzato con delibere regionali del 2009 e 2010 il Liceo G. e Q. Sella ha proposto negli ultimi due anni scolastici il Liceo Musicale e Coreutico la cui attivazione, nonostante gli iscritti, purtroppo è stata bloccata dalla mancata ratifica a livello ministeriale.\n La Scuola organizza mostre ed esposizioni in collaborazione con le Istituzioni Locali e conferenze, dibattiti, serate culturali nel Museo Didattico Roccavilla che accoglie, oltre a questi fermenti intellettuali, materiale didattico risalente all’ottocento: dalle carte geografiche d’epoca ai dagherrotipi, dai circa trecento strumenti scientifici dell’antico laboratorio di Fisica e Scienze Naturali alle collezioni di riproduzioni che testimoniano il ruolo culturale storicamente svolto da questo Liceo.\n\nIl Liceo “G. e Q. Sella” si configura, dunque, oggi come ieri, come un vero e proprio “polo” di aggregazione culturale nel Territorio e per il Territorio.	t
12	\N	I.I.S. E. Bona - Biella via gramsci	\N	\N	\N	0	2015-10-09 22:25:00	2017-01-01 04:50:00	\N	http://www.itcbona.biella.it/#	\N	\N	\N	\N	01522206	2015-10-09 09:53:30.987941	2016-09-29 09:46:34.520314	Via Gramsci, 22 – 13900 Biella (BI)	45.5640955000000005	8.05212769999999978	14	logo_cent_color_fin_2014_mi.png	image/png	62014	2015-10-09 09:53:30.420281	L’Istituto di Istruzione Superiore Statale "Eugenio Bona" sorge il 4 novembre 1913 grazie a un generoso atto di donazione dell’imprenditore Eugenio Bona, studioso e amministratore biellese.	t
37	\N	Novara/pendolari-studenti	\N	\N	\N	0	2016-10-09 00:00:00	2017-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	2016-10-09 14:32:15.947383	2016-10-09 14:34:59.632323	Largo Pastore, 28100 Novara	45.4466429000000005	8.63015949999999954	18	\N	\N	\N	\N	Studente? Lavoratore? Pendolare?? inserisci qui i tuoi spostamenti verso e da Novara!	f
38	\N	Aosta/ pendolari-studenti	\N	\N	\N	0	2016-10-09 06:00:00	2017-12-31 03:00:00	\N	\N	\N	\N	\N	\N	\N	2016-10-09 14:36:28.839029	2016-10-09 14:42:22.820417	Piazza Innocenzo Manzetti 1  Aosta	43.1339094000000003	11.8520707999999999	18	\N	\N	\N	\N	Studente? Lavoratore? Pendolare?? inserisci qui i tuoi spostamenti verso e da Aosta!	f
17	\N	Palazzo Ferrero	\N	\N	\N	0	2016-01-11 19:00:00	2016-12-31 22:55:00	\N	http://www.stalkerteatro.net/immagini/spalancatom.html	https://www.facebook.com/residenzapalazzoferrero/?fref=ts	\N	\N	\N	0154507212,	2016-01-11 18:54:27.865409	2016-01-11 18:54:27.865409	corso del piazzo 25 biella	45.5640815000000003	8.04584320000000019	16	\N	\N	\N	\N	Nel centro storico di Biella, al Piazzo, sorge Palazzo Ferrero; costruito tra il XV ed il XVI secolo dalla famiglia Ferrero, fu in passato residenza dei Ferrero Fieschi di Masserano. La corte di ingresso, i saloni affrescati, gli spazi all’aperto del giardino di Palazzo Ferrero sono siti ideali per realizzare eventi culturali che dialogano fortemente con questa cornice storica di grande prestigio. Negli ultimi anni è stato completato il piano di riqualificazione del Piazzo creando nuove strutture: un nuovo centro di attività culturale, come Palazzo Ferrero; un albergo per l'accoglienza turistica, come l'ostello ricavato dalle antiche carceri; un comodo parcheggio che permette di visitare agevolmente il borgo antico. Questa importante parte della città oggi si presta, per le sue caratteristiche, ad essere un luogo ideale per una programmazione di attività culturali da svolgersi nei diversi spazi pubblici comprendenti edifici, piazze, giardini, cortili, portici, strade e vicoli che compongono un agglomerato abitativo a dimensione umana.	f
27	\N	BY This RIVER festival	\N	\N	\N	0	2016-07-27 22:00:00	2016-07-30 22:00:00	\N	\N	https://www.facebook.com/events/1788378891433869/	\N	\N	\N	\N	2016-07-29 10:12:48.851692	2016-07-29 10:12:48.851692	balma Biella 13812	45.646698899999997	8.01823979999999992	6	\N	\N	\N	\N	Tre giorni di musica elettronica che attraversano ambient, noise, techno, hip hop, funk, garage, afrobeat	f
18	\N	GDA 2016 Cittadellarte	\N	\N	\N	0	2016-06-04 22:00:00	2016-06-13 22:00:00	\N	\N	https://www.facebook.com/giornatadellarte.biella/?fref=ts	\N	\N	\N	\N	2016-06-04 17:11:50.705207	2016-06-07 14:20:59.399233	via serralunga 27 13900 biella	45.5713657000000012	8.05536640000000048	6	\N	\N	\N	\N	Raggiungi in carpooling la Giornata Dell'Arte 2016. Ritorna l'appuntamento più atteso dagli studenti biellesi! info gdabiella2016@gmail.com	f
19	\N	Bonprix	\N	\N	\N	0	2016-06-12 22:00:00	2016-12-30 23:00:00	\N	https://www.bonprix.it	\N	\N	\N	\N	0158286568	2016-06-13 07:02:39.573131	2016-06-14 09:51:13.202391	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	17	\N	\N	\N	\N	“Niente è impossibile!” Anche condividere un passaggio auto verso il luogo di lavoro! Questa è la vroom per cercare ed inserire annunci verso Bonprix!	t
28	\N	By this river Festival	\N	\N	\N	0	2016-07-28 22:00:00	2016-07-31 22:00:00	\N	\N	https://www.facebook.com/events/1788378891433869/	\N	\N	\N	\N	2016-07-31 10:43:25.63082	2016-07-31 10:43:25.63082	Via Roma, 4, 13812 San Paolo Cervo BI	45.656171999999998	8.00742200000000004	6	\N	\N	\N	\N	Festival di musica elettronica in valle cervo!!!!	f
30	\N	Scuola Sonòria	\N	\N	\N	0	2016-09-27 00:00:00	2018-06-30 00:00:00	\N	www.scuolasonoria.it/	\N	\N	\N	\N	015 921624	2016-09-27 12:13:23.321418	2016-09-27 13:05:26.706745	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	16	logo.jpg	image/jpeg	6660	2016-09-27 13:05:26.507567	SONORIA è una realtà socio-culturale no profit, impegnata a promuovere i valori di: socializzazione, diffusione della musica e multiculturalità.	f
21	\N	PIEDICAVALLO FESTIVAL	\N	\N	\N	0	2016-07-03 00:00:00	2016-11-30 00:00:00	\N	http://www.piedicavallofestival.com/	\N	\N	\N	\N	\N	2016-06-15 14:21:17.610879	2016-09-09 09:02:46.533794	Via IV Novembre, 2 13812 Piedicavallo	45.6896199999999979	7.95593000000000039	6	13227268_1626016627724529_8517858162949361631_o.png	image/png	135688	2016-09-09 09:02:45.995551	Raggiungi il Teatro Regina Margherita per gli eventi del Piedicavallo Festival!!programma: http://www.piedicavallofestival.com/programma/	f
20	\N	Get a line	\N	\N	\N	0	2016-06-11 22:00:00	2016-12-30 23:00:00	\N	https://www.bonprix.it	\N	\N	\N	\N	0158286568	2016-06-13 07:10:06.1757	2016-06-17 13:02:22.013047	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	17	getaline_300dpi.jpg	image/jpeg	844740	2016-06-17 13:02:21.609583	Vroom per i soli dipendenti Get a Line!!	t
31	\N	I.I.S E.Bona biella via Cavour	\N	\N	\N	0	2016-09-28 22:00:00	2017-07-30 22:00:00	\N	\N	https://www.facebook.com/pages/Itc-Bona-Succursale-Via-Cavour/401442826576862	\N	\N	\N	015 23597	2016-09-29 09:45:08.354425	2016-09-29 09:45:08.354425	Via camillo benso cavour 4 biella	45.5691506000000004	8.05032809999999976	14	\N	\N	\N	\N	succursale Bona	t
23	\N	Reload Sound Festival	\N	\N	\N	0	2016-06-30 22:00:00	2016-07-03 22:00:00	\N	http://www.reloadsoundfestival.it/	https://www.facebook.com/reloadsoundfestival/	\N	\N	\N	015 812 3353	2016-07-01 08:29:17.186575	2016-07-01 08:29:17.186575	campo volo aquiloni corso guido alberto rivetti biella	45.5570762999999985	8.0702784999999988	6	\N	\N	\N	\N	\N	f
24	\N	Cittadellarte - Fondazione Pistoletto	\N	\N	\N	0	2016-07-04 22:00:00	2017-12-30 23:00:00	\N	http://www.cittadellarte.it/attivita.php?att=105	https://www.facebook.com/cittadellarte/?fref=ts	\N	\N	\N	01528400	2016-07-05 11:53:27.459636	2016-07-05 11:53:27.459636	via serralunga 27 13900 biella	45.5713657000000012	8.05536640000000048	16	\N	\N	\N	\N	ARTE al CENTRO è una rassegna di mostre, incontri e seminari che raccontano pratiche artistiche di trasformazione dei contesti in cui si sviluppano.	f
25	\N	CONCEPT	\N	\N	\N	0	2016-07-08 22:00:00	2016-12-30 23:00:00	\N	www.cittadellarte.it	https://www.facebook.com/ConceptCittadellarte/	\N	\N	\N	333 995 0110	2016-07-09 17:55:02.188951	2016-07-09 17:55:02.188951	via serralunga 37 13900 biella	45.5712487999999993	8.05672049999999906	\N	\N	\N	\N	\N	Insieme alla discoteca, grande spazio alle attività artistico-culturali che faranno da fil rouge alla filosofia della Fondazione capofila del progetto	f
26	\N	concept	\N	\N	\N	0	2016-07-08 22:00:00	2016-12-30 23:00:00	\N	http://www.cittadellarte.it/	https://www.facebook.com/ConceptCittadellarte/	\N	\N	\N	333 995 0110	2016-07-09 18:11:52.451138	2016-07-09 18:11:52.451138	via serralunga 35 13900 biella	45.5713411999999991	8.05561539999999887	7	\N	\N	\N	\N	arte, cultura, musica e dance club... Per info e tavoli 3398571888	f
29	\N	Autobahn	\N	\N	\N	0	2016-08-22 00:00:00	2017-12-31 00:00:00	\N	https://associazionenn.wordpress.com	https://www.facebook.com/Autobahn-William-Willhelm-Caffee-Dallas-495031470661162/	\N	\N	\N	\N	2016-08-22 20:58:46.399749	2016-09-09 09:03:37.639811	Loc. Fornaca 2, 13815 Rosazza	45.6754095000000007	7.97566559999999924	6	11540887_499393033558339_6794918411897495533_o_(1).jpg	image/jpeg	83197	2016-09-09 09:03:36.145601	This is a space to develop ideas and enjoy life, it's open to everyone.	f
32	\N	Milano/pendolari-studenti	\N	\N	\N	0	2016-09-29 04:00:00	2017-12-31 02:00:00	\N	\N	\N		\N	\N	3398868087	2016-09-29 10:41:41.818299	2016-10-09 10:33:56.864455	Via Appennini molino dorino 20151 milano	45.5054747000000006	9.0935214000000002	18	treno-finestrino.jpg	image/jpeg	61072	2016-09-29 10:43:29.201829	vroom dedicata a chi deve organizzare spostamenti tra biella e milano. utile per i percorsi ricorsivi, che per lavoro o studio vengono ripetuti.	f
22	\N	Bonprix + Getaline + Astro	\N	\N	\N	0	2016-06-12 06:00:00	2016-12-31 03:00:00	\N	\N	\N	\N	\N	\N	3398868087	2016-06-15 14:59:57.911022	2016-10-24 09:50:03.45747	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	17	getaline_astro_bonprix.jpg	image/jpeg	6978169	2016-10-24 09:49:43.950853	Una Vroom in condivisione tra dipendenti Bonprix GetaLine e Astro!	t
34	\N	Città Studi Biella	\N	\N	\N	0	2016-10-03 02:00:00	2018-12-31 01:00:00	\N	http://www.cittastudi.org	https://www.facebook.com/Citt%C3%A0-Studi-Biella-SpA-57351934604/?fref=ts	\N	\N	\N	015 855 1111	2016-10-03 08:08:59.316875	2016-10-03 09:41:54.305986	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	16	13507080_10154284743644605_3501015074106377636_n.jpg	image/jpeg	36645	2016-10-03 08:09:32.63595	Raggiungi università, formazione professionale, ricerca, biblioteca, centro congressi, college, caffetteria e centro sportivo in carpooling!	f
35	\N	avanzi di balera torino	\N	\N	\N	0	2016-10-04 22:00:00	2016-10-08 22:00:00	\N	\N	https://www.facebook.com/events/1793334090950941/	\N	\N	\N	\N	2016-10-05 15:02:58.548112	2016-10-05 15:02:58.548112	corso moncalieri 18 torino	45.0593807999999996	7.69436789999999959	19	\N	\N	\N	\N	Sab 08 OTTOBRE || Cap10100\nIngresso 5 euro	f
36	\N	Vercelli/ pendolari-studenti	\N	\N	\N	0	2016-10-08 22:00:00	2017-12-30 23:00:00	\N	http://www.comune.vercelli.it/cms/	\N	\N	\N	\N	\N	2016-10-09 10:32:47.518586	2016-10-09 10:32:47.518586	Piazza Roma, 26, Vercelli VC	45.3297850000000011	8.4166249999999998	18	\N	\N	\N	\N	Studente? Lavoratore? Pendolare?? inserisci qui i tuoi spostamenti verso e da Vercelli! 	f
39	\N	IIS GAE AULENTI - Biella Corso Pella	\N	\N	\N	0	2016-10-13 00:00:00	2017-12-31 00:00:00	\N	\N	https://www.facebook.com/rubens.iisvaglio?fref=ts	\N	\N	\N	\N	2016-10-13 11:30:14.029732	2016-10-13 11:30:35.668291	Corso Pella 12/A Biella	45.5567615000000004	8.03072429999999926	14	14479722_650367011795123_4578362531673812385_n.jpg	image/jpeg	4826	2016-10-13 11:30:35.473016	Sede iis gae aulenti in corso pella! Inserisci qui i tuoi annunci per aiutare la mobilità di studenti e genitori verso il tuo istituto!	t
11	\N	IIS Gae Aulenti (ex V.Rubens) Biella via Macallè	\N	\N	\N	0	2015-09-04 04:30:00	2017-01-01 05:50:00	\N	http://www.iisvaglio.it/	https://www.facebook.com/rubens.iisvaglio?fref=ts	\N	\N	\N	015402748	2015-09-03 14:34:21.287362	2016-10-13 11:31:52.670665	Viale Macallè 54, 13900 Biella BI	45.5528228000000013	8.05242129999999889	14	testata-iis-gae-aulenti.jpg	image/jpeg	36630	2016-10-13 11:31:52.385352	Sede dell'istituto in via Macallè!	t
40	\N	IIS Gae aulenti Alberghiero Trivero	\N	\N	\N	0	2016-10-13 00:00:00	2018-06-30 00:00:00	\N	\N	\N	\N	\N	\N	\N	2016-10-13 11:36:20.979024	2016-10-13 11:36:40.35722	Via Zegna 59 Trivero BI	45.6679286000000033	8.15881970000000045	14	testata.jpg	image/jpeg	177541	2016-10-13 11:36:40.093334	Scambia passaggi da e verso la sede della tua scuola!	t
45	\N	Liceo Vallestrona	\N	\N	\N	0	2016-10-28 00:00:00	2019-01-31 00:00:00	\N	http://www.liceocossatese.it/index.php/contatti/	\N	\N	\N	\N	015 702342	2016-10-28 09:15:50.607219	2016-10-28 09:18:14.385346	Frazione Molina 35 – 13825 Valle Mosso (BI)	45.6287100999999993	8.1494333000000001	14	logo-scritta_new4.jpg	image/jpeg	564510	2016-10-28 09:18:13.797119	studenti, genitori e docenti, scambiatevi qui passaggi auto!	t
41	\N	IIS Gae Aulenti Alberghiero Cavaglà	\N	\N	\N	0	2016-10-13 00:00:00	2018-07-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	2016-10-13 11:40:34.676699	2016-10-13 11:40:58.552562	Via Giovanni Gersen 16 Cavaglià	45.4061830999999998	8.09179460000000006	14	14479722_650367011795123_4578362531673812385_n.jpg	image/jpeg	4826	2016-10-13 11:40:58.415972	Scambia passaggi auto con i tuoi compagni e genitori da e verso la tua scuola!	t
42	\N	Astro coop	\N	\N	\N	0	2016-10-19 04:00:00	2017-12-31 02:00:00	\N	http://www.coobiz.it/azienda/valdengo-attivita-call-center/sede/6430408	\N	\N	\N	\N	\N	2016-10-19 14:02:26.392243	2016-10-19 14:23:41.948183	Via Adua 33  Valdengo	45.5530600000000021	8.13818000000000019	18	Logo_Call_Center_Astro.jpg	image/jpeg	55125	2016-10-19 14:05:30.510392	Condividi passaggi auto con i tuoi colleghi e risparmia tempo e denaro!!!	t
43	\N	Spazio Teatrando Biella	\N	\N	\N	0	2016-10-25 00:00:00	2018-12-31 00:00:00	\N	http://www.teatrandobiella.it/	https://www.facebook.com/174372479404201/photos/174379919403457/	\N	\N	\N	333 528 3350	2016-10-25 22:00:10.950877	2016-10-25 22:00:44.500773	via Alfonso Ogliaro, 5 13900 Biella	45.5760213000000007	8.05309079999999966	6	teatrando_2.jpg	image/jpeg	10009	2016-10-25 22:00:44.358056	Raggiungi gli eventi di ARS teatrando in carpooling, per risparmiare tempo, denaro e scoprire chi condivide con te gli stessi interessi!	f
44	\N	Liceo Cossato	\N	\N	\N	0	2016-10-28 00:00:00	2018-07-31 00:00:00	\N	http://www.liceocossatese.it/	https://www.facebook.com/la.ragnatela.2012?fref=ts	\N	\N	\N	015 922796	2016-10-28 09:12:43.519393	2016-10-28 09:13:15.352412	Via Martiri della Libertà 389,13836 Cossato (BI)	45.567772699999999	8.19895069999999926	14	logo-scritta_new4.jpg	image/jpeg	564510	2016-10-28 09:13:14.723472	studenti genitori e docenti qui potete scambiarvi passaggi auto!!	t
\.


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('rooms_id_seq', 45, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20150419192206
20150419192830
20150419194451
20150419194504
20150419195305
20150419200321
20150419200428
20150419200611
20150419200730
20150419200812
20150419201110
20150419202133
20150419202203
20150419202302
20150419203611
20150419203833
20150419204318
20150419204510
20150419204630
20150419204752
20150419205430
20150419205606
20150419210119
20150419210807
20150419211142
20150419211830
20150419212041
20150419212456
20150419212559
20150419213025
20150419213331
20150419213514
20150419214134
20150419214252
20150419214507
20150419214705
20150419215110
20150419215421
20150419221249
20150419221348
20150420095914
20150420110014
20150423100610
20150423112929
20150423114958
20150423125203
20150423125744
20150504161629
20150505144559
20150506154809
20150506155427
20150506204029
20150508225117
20150508230925
20150509025904
20150509194412
20150511073631
20150511115312
20150511115337
20150512152342
20150513002037
20150513030400
20150513045754
20150515163012
20150516214613
20150516215828
20150517021154
20150517021933
20150517150848
20150517222258
20150517231015
20150518023821
20150518040117
20150518042434
20150518060149
20150523014016
20150523173717
20150525202455
20150526132803
20150529163710
20150601142354
20150604155015
20150604155327
20150608124937
20150621160232
20150621160458
20150621162706
20150622111449
20150623142505
20150723154400
20150902231037
20150902232910
20150903012701
20150903014002
20151026164859
20160121234858
20160122004136
20160222154054
20160223143158
20160225223238
20160421110624
20160430142355
20160606162053
\.


--
-- Data for Name: school_room_partecipants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY school_room_partecipants (id, user_id, room_id, created_at, updated_at) FROM stdin;
3	34	11	2015-09-04 08:29:21.034642	2015-09-04 08:29:21.034642
4	14	11	2015-10-12 08:00:33.049388	2015-10-12 08:00:33.049388
5	14	11	2015-10-12 08:01:01.443723	2015-10-12 08:01:01.443723
6	22	11	2015-10-12 08:03:32.289091	2015-10-12 08:03:32.289091
7	15	11	2015-10-12 08:03:45.606137	2015-10-12 08:03:45.606137
8	22	11	2015-10-12 08:04:07.70169	2015-10-12 08:04:07.70169
9	22	11	2015-10-12 08:07:38.578882	2015-10-12 08:07:38.578882
10	33	11	2015-10-12 08:30:03.057628	2015-10-12 08:30:03.057628
11	48	11	2015-10-12 08:45:25.015623	2015-10-12 08:45:25.015623
12	49	11	2015-10-12 08:54:33.135532	2015-10-12 08:54:33.135532
13	51	12	2015-10-21 09:09:08.519866	2015-10-21 09:09:08.519866
14	52	12	2015-10-21 09:12:53.120659	2015-10-21 09:12:53.120659
15	76	12	2015-11-25 11:08:11.456947	2015-11-25 11:08:11.456947
16	81	13	2015-12-01 08:13:45.542853	2015-12-01 08:13:45.542853
17	122	12	2016-06-08 13:00:29.761596	2016-06-08 13:00:29.761596
18	124	12	2016-06-08 20:18:20.564598	2016-06-08 20:18:20.564598
19	73	22	2016-06-17 14:16:13.58702	2016-06-17 14:16:13.58702
20	73	19	2016-06-17 14:16:54.883238	2016-06-17 14:16:54.883238
21	138	19	2016-06-17 14:26:21.969895	2016-06-17 14:26:21.969895
22	139	20	2016-06-17 15:55:04.478379	2016-06-17 15:55:04.478379
23	140	19	2016-06-17 16:16:54.482959	2016-06-17 16:16:54.482959
24	144	19	2016-06-20 09:17:00.590896	2016-06-20 09:17:00.590896
25	145	19	2016-06-20 11:27:52.90225	2016-06-20 11:27:52.90225
26	147	19	2016-06-22 10:02:27.341324	2016-06-22 10:02:27.341324
27	148	19	2016-06-22 10:14:41.542668	2016-06-22 10:14:41.542668
28	149	19	2016-06-22 10:42:57.907208	2016-06-22 10:42:57.907208
29	150	19	2016-06-22 10:55:02.740781	2016-06-22 10:55:02.740781
30	152	20	2016-06-28 10:25:38.344998	2016-06-28 10:25:38.344998
31	153	20	2016-06-29 06:57:35.088781	2016-06-29 06:57:35.088781
32	164	19	2016-07-14 09:23:26.496991	2016-07-14 09:23:26.496991
33	189	20	2016-10-10 15:59:59.422573	2016-10-10 15:59:59.422573
34	147	22	2016-10-14 11:33:02.931579	2016-10-14 11:33:02.931579
35	149	22	2016-10-14 14:17:21.039284	2016-10-14 14:17:21.039284
36	191	20	2016-10-15 15:46:15.615632	2016-10-15 15:46:15.615632
37	189	22	2016-10-18 15:46:37.366722	2016-10-18 15:46:37.366722
38	194	19	2016-10-18 16:19:09.117095	2016-10-18 16:19:09.117095
39	203	42	2016-10-19 14:47:57.220677	2016-10-19 14:47:57.220677
40	206	20	2016-10-22 20:27:32.368261	2016-10-22 20:27:32.368261
41	203	42	2016-10-26 18:13:11.590322	2016-10-26 18:13:11.590322
42	208	45	2016-10-28 12:13:22.309049	2016-10-28 12:13:22.309049
43	208	44	2016-10-28 12:13:22.312346	2016-10-28 12:13:22.312346
44	209	45	2016-10-28 12:24:57.273732	2016-10-28 12:24:57.273732
45	209	44	2016-10-28 12:24:57.276896	2016-10-28 12:24:57.276896
46	210	45	2016-10-28 12:52:37.320909	2016-10-28 12:52:37.320909
47	210	44	2016-10-28 12:52:37.32355	2016-10-28 12:52:37.32355
48	212	45	2016-10-28 13:07:07.694808	2016-10-28 13:07:07.694808
49	212	44	2016-10-28 13:07:07.699401	2016-10-28 13:07:07.699401
50	213	45	2016-10-28 13:41:55.29922	2016-10-28 13:41:55.29922
51	213	44	2016-10-28 13:41:55.302725	2016-10-28 13:41:55.302725
52	214	45	2016-10-28 14:15:26.006133	2016-10-28 14:15:26.006133
53	214	44	2016-10-28 14:15:26.010454	2016-10-28 14:15:26.010454
54	216	45	2016-10-28 16:07:45.598739	2016-10-28 16:07:45.598739
55	216	44	2016-10-28 16:07:45.603465	2016-10-28 16:07:45.603465
56	217	45	2016-10-29 15:35:52.163958	2016-10-29 15:35:52.163958
57	217	44	2016-10-29 15:35:52.166477	2016-10-29 15:35:52.166477
58	220	45	2016-10-30 13:18:52.251489	2016-10-30 13:18:52.251489
59	220	44	2016-10-30 13:18:52.254109	2016-10-30 13:18:52.254109
\.


--
-- Name: school_room_partecipants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('school_room_partecipants_id_seq', 59, true);


--
-- Data for Name: school_room_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY school_room_settings (id, school_representative, non_partecipant_message, referral_link, room_id, created_at, updated_at, share_link, code, email_domain) FROM stdin;
15	titin	non sei autorizzato all'accesso. chiedi info alla segreteria della scuola!	\N	45	2016-10-28 09:15:50.615074	2016-10-28 09:15:50.615074	http://www.pick-app.it/#/sign_up/school/k1g4771z5wdgxf4d	k1g4771z5wdgxf4d	liceocossato.eu
3	Giuseppe Aleci	Non risulti autorizzato all'accesso. Contatta la segreteria della scuola e verifica la possibilità di utilizzare pick-app!	\N	13	2015-10-10 15:06:49.140836	2015-12-01 08:10:00.250076	http://www.pick-app.it/#/sign_up/school/p5r99820d7ggsgl7	p5r99820d7ggsgl7	itis.biella.it
5	\N	Spiacenti! non sei autorizzato ad accedere a questa stanza. Contatta la segreteria della scuola per maggiori informazioni o scrivici a info@pick-app.it	\N	16	2015-12-17 08:27:52.68901	2015-12-17 08:27:52.68901	http://www.pick-app.it/#/sign_up/school/10ah815du63aeobo	10ah815du63aeobo	liceosella.eu
4	\N	Spiacenti! non sei autorizzato ad accedere a questa stanza. Contatta la segreteria della scuola per maggiori informazioni o scrivici a info@pick-app.it	\N	14	2015-10-14 10:29:04.720121	2015-12-17 08:28:41.823525	http://www.pick-app.it/#/sign_up/school/pew9kjccp7ifh4zu	pew9kjccp7ifh4zu	liceosella.eu
6	Fabio Quaregna	Spiacenti, ma per accedere devi registrarti con la e-mail fornita dal tuo datore di lavoro! Contatta la tua azienda per maggiori informazioni. 	\N	19	2016-06-13 07:02:39.59493	2016-06-13 07:02:39.59493	http://www.pick-app.it/#/sign_up/school/n6o84k1kk9ghju0i	n6o84k1kk9ghju0i	bonprixitalia.net
7	fabio Quaregna	Spiacenti, ma per accedere devi essere registrato con la email fornita dalla tua azienda! contatta un tuo responsabile per maggiori informazione.	\N	20	2016-06-13 07:10:06.182571	2016-06-13 07:10:06.182571	http://www.pick-app.it/#/sign_up/school/ta0zy19vqdu7ewhq	ta0zy19vqdu7ewhq	getaline.it
8	\N	Spiacenti, non sei autorizzato ad accedere a questa Vroom. Verifica le modalità di accesso contattando la tua azienda!	\N	22	2016-06-15 14:59:57.915449	2016-06-15 14:59:57.915449	http://www.pick-app.it/#/sign_up/school/o8uvuuvhy2jtpok7	o8uvuuvhy2jtpok7	\N
9	segreteria	Spiacenti!non sei autorizzato ad accedere a questa stanza. Contatta la segreteria della scuola per maggiori informazioni o scrivici a info@pick-app.it	\N	31	2016-09-29 09:45:08.360463	2016-09-29 09:45:08.360463	http://www.pick-app.it/#/sign_up/school/lv446mjzbvjufo2f	lv446mjzbvjufo2f	iisbona.gov.it
2	segreteria	Spiacenti!non sei autorizzato ad accedere a questa stanza. Contatta la segreteria della scuola per maggiori informazioni o scrivici a info@pick-app.it	\N	12	2015-10-09 09:53:31.639827	2016-09-29 09:46:34.535543	http://www.pick-app.it/#/sign_up/school/3rrk6o8jz2c7yy61	3rrk6o8jz2c7yy61	iisbona.gov.it
1	Prof. Antonio Gareri	Ciao! Per aver l'autorizzazione ad accedere a questa stanza segui la procedura di autenticazione che ti è stata comunicata dalla segreteria del tuo istituto nel portale di riferimento!	https://www.regel.it/regel/BIIS002009-d001/diario/	11	2015-09-03 14:34:21.841496	2016-10-13 11:22:17.984236	http://www.pick-app.it/#/sign_up/school/lxw1mdh1k5y58cv9	lxw1mdh1k5y58cv9	iisgaeaulenti.it
10	antonio gareri	\N	\N	39	2016-10-13 11:30:14.03846	2016-10-13 11:30:14.03846	http://www.pick-app.it/#/sign_up/school/76f2czgknsfwv3mu	76f2czgknsfwv3mu	iisgaeaulenti.it
11	antonio gareri	non sei autorizzato! contatta la segreteria dell'istituto per info maggiori	\N	40	2016-10-13 11:36:20.983379	2016-10-13 11:36:20.983379	http://www.pick-app.it/#/sign_up/school/vu0nss1h3dgrgzv4	vu0nss1h3dgrgzv4	iisgaeaulenti.it
12	antonio gareri	non sei autorizzato. contatta la segreteria dell'istituto per maggiorni informazioni.	\N	41	2016-10-13 11:40:34.680814	2016-10-13 11:40:34.680814	http://www.pick-app.it/#/sign_up/school/p6tgi5vcvpcoqcs7	p6tgi5vcvpcoqcs7	iisgaeaulenti.it
13	Stefania Cerruti	non sei autorizzato. contatta la coop Astro	\N	42	2016-10-19 14:02:26.398181	2016-10-19 14:23:41.952742	http://www.pick-app.it/#/sign_up/school/wyypv6huz371mv3c	wyypv6huz371mv3c	
14	titin ferraro	non sei autorizzato all'accesso. chiedi alla segreteria maggiori informazioni. grazie!	\N	44	2016-10-28 09:12:43.527319	2016-10-28 09:12:43.527319	http://www.pick-app.it/#/sign_up/school/euj8rjzeyjys16fh	euj8rjzeyjys16fh	liceocossato.eu
\.


--
-- Name: school_room_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('school_room_settings_id_seq', 15, true);


--
-- Data for Name: selected_macro_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY selected_macro_categories (id, room_category_id, macro_category_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: selected_macro_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('selected_macro_categories_id_seq', 1, false);


--
-- Data for Name: selected_room_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY selected_room_categories (id, room_id, room_category_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: selected_room_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('selected_room_categories_id_seq', 1, false);


--
-- Data for Name: social_master_badge_relations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY social_master_badge_relations (id, user_id, social_master_badge_id, created_at, updated_at) FROM stdin;
1	14	1	2015-07-13 20:58:18.833297	2015-07-13 20:58:18.833297
2	12	2	2015-07-13 20:58:18.842595	2015-07-13 20:58:18.842595
3	14	3	2015-07-15 15:15:40.631128	2015-07-15 15:15:40.631128
4	15	4	2015-07-15 16:16:40.428496	2015-07-15 16:16:40.428496
5	14	5	2015-08-11 11:19:08.622563	2015-08-11 11:19:08.622563
6	16	6	2015-08-11 13:57:28.279933	2015-08-11 13:57:28.279933
7	15	7	2015-09-04 15:01:27.406366	2015-09-04 15:01:27.406366
8	15	9	2015-10-27 18:42:47.965775	2015-10-27 18:42:47.965775
9	15	8	2015-10-27 18:42:47.970822	2015-10-27 18:42:47.970822
10	13	10	2015-11-05 18:56:10.730163	2015-11-05 18:56:10.730163
11	67	10	2015-11-05 18:56:10.731231	2015-11-05 18:56:10.731231
12	53	11	2015-11-05 18:56:10.741846	2015-11-05 18:56:10.741846
13	65	10	2015-11-05 18:56:10.757211	2015-11-05 18:56:10.757211
14	53	12	2015-11-05 18:56:10.76583	2015-11-05 18:56:10.76583
15	12	13	2015-12-02 21:04:03.196595	2015-12-02 21:04:03.196595
16	15	14	2016-04-04 08:48:44.553768	2016-04-04 08:48:44.553768
17	73	15	2016-04-05 12:12:03.920681	2016-04-05 12:12:03.920681
18	12	16	2016-04-06 12:23:29.499746	2016-04-06 12:23:29.499746
19	15	17	2016-05-11 18:38:58.416648	2016-05-11 18:38:58.416648
20	15	18	2016-05-25 09:04:59.270751	2016-05-25 09:04:59.270751
\.


--
-- Name: social_master_badge_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('social_master_badge_relations_id_seq', 20, true);


--
-- Data for Name: social_master_badges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY social_master_badges (id, user_id, relations_count, completed, completion_percentage, created_at, updated_at) FROM stdin;
1	12	1	t	100	2015-07-13 20:58:18.80802	2015-07-13 20:58:18.837378
2	14	1	t	100	2015-07-13 20:58:18.815117	2015-07-13 20:58:18.844989
3	15	1	t	100	2015-07-15 15:15:40.622763	2015-07-15 15:15:40.633415
4	17	1	t	100	2015-07-15 16:16:40.421573	2015-07-15 16:16:40.43187
5	16	1	t	100	2015-08-11 11:19:08.601891	2015-08-11 11:19:08.627252
6	13	1	t	100	2015-08-11 13:57:28.262631	2015-08-11 13:57:28.288965
7	34	1	t	100	2015-09-04 15:01:27.398398	2015-09-04 15:01:27.410687
9	27	1	t	100	2015-10-27 18:42:47.948556	2015-10-27 18:42:47.968835
8	54	1	t	100	2015-10-27 18:42:47.9419	2015-10-27 18:42:47.974997
11	67	1	t	100	2015-11-05 18:56:10.68907	2015-11-05 18:56:10.745435
10	53	1	t	100	2015-11-05 18:56:10.662818	2015-11-05 18:56:10.762174
12	65	1	t	100	2015-11-05 18:56:10.729057	2015-11-05 18:56:10.769065
13	73	1	t	100	2015-12-02 21:04:03.177805	2015-12-02 21:04:03.200885
14	87	1	t	100	2016-04-04 08:48:44.534805	2016-04-04 08:48:44.558775
15	58	1	t	100	2016-04-05 12:12:03.90675	2016-04-05 12:12:03.924217
16	95	1	t	100	2016-04-06 12:23:29.481664	2016-04-06 12:23:29.503186
17	107	1	t	100	2016-05-11 18:38:58.387593	2016-05-11 18:38:58.433582
18	29	1	t	100	2016-05-25 09:04:59.255017	2016-05-25 09:04:59.273744
\.


--
-- Name: social_master_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('social_master_badges_id_seq', 18, true);


--
-- Data for Name: travel_request_chat_partecipants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY travel_request_chat_partecipants (id, user_id, travel_request_id, created_at, updated_at) FROM stdin;
1	11	1	2015-06-25 18:47:42.118711	2015-06-25 18:47:42.118711
2	11	2	2015-06-30 10:35:29.965792	2015-06-30 10:35:29.965792
3	7	3	2015-07-02 17:31:06.09089	2015-07-02 17:31:06.09089
4	15	4	2015-07-09 23:14:06.888748	2015-07-09 23:14:06.888748
5	17	5	2015-07-10 05:44:19.975633	2015-07-10 05:44:19.975633
6	17	4	2015-07-10 05:45:13.850065	2015-07-10 05:45:13.850065
7	16	4	2015-07-10 07:26:36.051132	2015-07-10 07:26:36.051132
8	15	6	2015-07-27 09:48:16.189277	2015-07-27 09:48:16.189277
9	15	7	2015-07-27 09:49:09.802733	2015-07-27 09:49:09.802733
10	14	8	2015-07-28 16:01:08.295145	2015-07-28 16:01:08.295145
11	15	9	2015-07-31 07:54:41.989833	2015-07-31 07:54:41.989833
12	15	10	2015-07-31 10:33:05.621242	2015-07-31 10:33:05.621242
13	17	11	2015-08-07 08:59:32.127555	2015-08-07 08:59:32.127555
14	16	12	2015-08-07 10:03:29.982858	2015-08-07 10:03:29.982858
15	14	13	2015-08-07 10:42:04.133385	2015-08-07 10:42:04.133385
16	14	14	2015-08-07 10:42:25.562914	2015-08-07 10:42:25.562914
17	14	15	2015-08-07 10:44:18.002773	2015-08-07 10:44:18.002773
18	14	16	2015-08-10 17:02:44.402229	2015-08-10 17:02:44.402229
19	14	17	2015-08-11 09:14:01.984253	2015-08-11 09:14:01.984253
20	14	18	2015-08-11 11:49:56.165561	2015-08-11 11:49:56.165561
21	16	19	2015-08-19 10:09:50.465506	2015-08-19 10:09:50.465506
22	14	20	2015-09-03 13:06:49.911898	2015-09-03 13:06:49.911898
23	16	20	2015-09-03 13:11:46.46091	2015-09-03 13:11:46.46091
24	14	21	2015-09-03 13:13:04.678058	2015-09-03 13:13:04.678058
25	15	20	2015-09-03 13:19:51.76687	2015-09-03 13:19:51.76687
26	14	22	2015-09-03 13:28:41.204803	2015-09-03 13:28:41.204803
27	15	23	2015-09-03 15:41:36.633932	2015-09-03 15:41:36.633932
28	34	24	2015-09-04 09:07:00.857161	2015-09-04 09:07:00.857161
29	15	24	2015-09-04 09:09:32.447545	2015-09-04 09:09:32.447545
30	54	25	2015-10-24 15:07:16.63936	2015-10-24 15:07:16.63936
31	54	26	2015-10-24 15:09:39.769476	2015-10-24 15:09:39.769476
32	55	27	2015-10-24 15:53:59.201775	2015-10-24 15:53:59.201775
33	52	28	2015-10-28 09:44:14.685195	2015-10-28 09:44:14.685195
34	12	29	2015-10-29 15:43:03.204449	2015-10-29 15:43:03.204449
35	58	30	2015-10-29 16:14:49.758284	2015-10-29 16:14:49.758284
36	58	29	2015-10-29 16:54:12.077731	2015-10-29 16:54:12.077731
37	53	29	2015-10-29 17:08:37.132577	2015-10-29 17:08:37.132577
38	53	30	2015-10-29 17:22:04.038928	2015-10-29 17:22:04.038928
39	67	31	2015-11-03 18:14:12.575113	2015-11-03 18:14:12.575113
40	67	32	2015-11-05 12:13:52.712462	2015-11-05 12:13:52.712462
41	67	33	2015-11-05 12:14:06.539658	2015-11-05 12:14:06.539658
42	53	34	2015-11-05 13:37:59.058216	2015-11-05 13:37:59.058216
43	53	35	2015-11-05 13:39:53.154727	2015-11-05 13:39:53.154727
44	53	36	2015-11-05 13:41:53.939866	2015-11-05 13:41:53.939866
45	53	33	2015-11-05 14:10:41.167719	2015-11-05 14:10:41.167719
46	53	32	2015-11-05 14:34:28.701401	2015-11-05 14:34:28.701401
47	68	32	2015-11-05 14:52:32.304954	2015-11-05 14:52:32.304954
48	53	37	2015-11-05 16:03:06.101442	2015-11-05 16:03:06.101442
49	53	38	2015-11-05 16:03:13.744636	2015-11-05 16:03:13.744636
50	53	39	2015-11-05 16:05:30.23143	2015-11-05 16:05:30.23143
51	53	40	2015-11-05 16:16:15.926177	2015-11-05 16:16:15.926177
52	53	41	2015-11-05 16:29:00.659938	2015-11-05 16:29:00.659938
53	53	42	2015-11-05 22:17:21.14096	2015-11-05 22:17:21.14096
54	28	43	2015-11-05 23:56:53.296793	2015-11-05 23:56:53.296793
55	69	44	2015-11-06 00:19:48.599787	2015-11-06 00:19:48.599787
56	53	43	2015-11-06 06:19:07.562402	2015-11-06 06:19:07.562402
57	27	45	2015-11-09 09:18:24.642952	2015-11-09 09:18:24.642952
58	15	45	2015-11-09 09:29:35.152681	2015-11-09 09:29:35.152681
59	27	46	2015-11-14 17:00:09.451671	2015-11-14 17:00:09.451671
60	27	47	2015-11-14 18:32:52.926747	2015-11-14 18:32:52.926747
61	75	48	2015-11-24 12:45:06.294802	2015-11-24 12:45:06.294802
62	76	49	2015-11-26 13:25:30.990368	2015-11-26 13:25:30.990368
63	81	50	2015-12-01 08:19:18.305335	2015-12-01 08:19:18.305335
64	16	51	2016-02-02 09:32:26.718214	2016-02-02 09:32:26.718214
65	13	52	2016-02-10 14:27:53.253467	2016-02-10 14:27:53.253467
66	16	53	2016-02-12 13:32:47.903058	2016-02-12 13:32:47.903058
67	15	54	2016-02-17 16:53:09.967091	2016-02-17 16:53:09.967091
68	25	55	2016-02-29 17:01:51.163363	2016-02-29 17:01:51.163363
69	15	56	2016-03-08 09:36:00.634374	2016-03-08 09:36:00.634374
70	16	57	2016-03-08 10:03:18.766127	2016-03-08 10:03:18.766127
71	16	58	2016-03-16 15:19:51.66755	2016-03-16 15:19:51.66755
72	16	59	2016-03-16 15:38:43.699386	2016-03-16 15:38:43.699386
73	15	60	2016-03-16 15:50:42.26967	2016-03-16 15:50:42.26967
74	15	61	2016-03-16 15:53:42.564429	2016-03-16 15:53:42.564429
75	15	62	2016-03-16 16:14:50.564458	2016-03-16 16:14:50.564458
76	12	63	2016-03-22 11:19:45.236897	2016-03-22 11:19:45.236897
77	12	64	2016-03-22 11:44:05.228582	2016-03-22 11:44:05.228582
78	95	65	2016-04-06 10:57:31.544006	2016-04-06 10:57:31.544006
79	12	65	2016-04-06 11:00:16.444001	2016-04-06 11:00:16.444001
80	87	66	2016-04-06 13:34:29.956581	2016-04-06 13:34:29.956581
81	95	67	2016-04-12 10:21:18.053367	2016-04-12 10:21:18.053367
82	87	68	2016-04-14 12:29:49.730181	2016-04-14 12:29:49.730181
83	95	69	2016-04-14 13:34:42.350383	2016-04-14 13:34:42.350383
84	87	70	2016-04-14 13:34:47.171911	2016-04-14 13:34:47.171911
85	12	71	2016-04-21 12:55:35.988745	2016-04-21 12:55:35.988745
86	107	72	2016-06-09 13:36:33.395363	2016-06-09 13:36:33.395363
87	131	73	2016-07-01 16:27:25.1234	2016-07-01 16:27:25.1234
88	109	74	2016-07-02 15:28:47.455979	2016-07-02 15:28:47.455979
89	55	75	2016-07-02 16:35:23.428216	2016-07-02 16:35:23.428216
90	107	74	2016-07-02 16:49:15.563381	2016-07-02 16:49:15.563381
91	12	76	2016-09-16 12:58:05.546071	2016-09-16 12:58:05.546071
92	12	77	2016-09-16 12:58:49.620992	2016-09-16 12:58:49.620992
93	15	78	2016-10-03 08:13:25.177876	2016-10-03 08:13:25.177876
94	15	79	2016-10-03 08:15:21.261874	2016-10-03 08:15:21.261874
95	12	80	2016-10-03 09:49:50.091468	2016-10-03 09:49:50.091468
96	15	80	2016-10-04 10:02:27.498917	2016-10-04 10:02:27.498917
97	192	81	2016-10-17 08:24:31.186415	2016-10-17 08:24:31.186415
98	192	82	2016-10-17 08:25:04.447921	2016-10-17 08:25:04.447921
99	209	83	2016-10-28 13:02:30.190533	2016-10-28 13:02:30.190533
100	221	84	2016-11-08 19:52:22.721562	2016-11-08 19:52:22.721562
101	12	85	2016-11-11 18:22:46.244997	2016-11-11 18:22:46.244997
\.


--
-- Name: travel_request_chat_partecipants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('travel_request_chat_partecipants_id_seq', 101, true);


--
-- Data for Name: travel_request_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY travel_request_messages (id, content, author_id, "integer", travel_request_id, created_at, updated_at, is_request_owner) FROM stdin;
1	Prova prova	17	\N	4	2015-07-10 05:45:13.833918	2015-07-10 05:45:13.833918	f
2	riprova riprova	16	\N	4	2015-07-10 07:26:36.036069	2015-07-10 07:26:36.036069	f
3	andiamo	16	\N	20	2015-09-03 13:11:46.448296	2015-09-03 13:11:46.448296	f
4	Ciao!	14	\N	20	2015-09-03 13:14:44.243218	2015-09-03 13:14:44.243218	t
5	anche io	15	\N	20	2015-09-03 13:19:51.758622	2015-09-03 13:19:51.758622	f
6	ciao	15	\N	24	2015-09-04 09:09:32.434969	2015-09-04 09:09:32.434969	f
7	Si va!	16	\N	20	2015-09-29 17:27:34.166847	2015-09-29 17:27:34.166847	f
8	olè	15	\N	20	2015-10-09 09:31:03.593693	2015-10-09 09:31:03.593693	f
9	sadasdsadad	58	\N	29	2015-10-29 16:54:12.066535	2015-10-29 16:54:12.066535	f
10	sadasd	58	\N	29	2015-10-29 16:54:13.870492	2015-10-29 16:54:13.870492	f
11	sadasd	58	\N	29	2015-10-29 16:54:15.347228	2015-10-29 16:54:15.347228	f
12	sadasd	58	\N	29	2015-10-29 16:54:17.105095	2015-10-29 16:54:17.105095	f
13	asdas	53	\N	29	2015-10-29 17:08:37.110488	2015-10-29 17:08:37.110488	f
14	Funziona!	53	\N	29	2015-10-29 17:11:58.84065	2015-10-29 17:11:58.84065	f
15	asdas	58	\N	29	2015-10-29 17:15:18.388732	2015-10-29 17:15:18.388732	f
16	sadsasad	58	\N	29	2015-10-29 17:16:21.315277	2015-10-29 17:16:21.315277	f
17	Ciao	53	\N	29	2015-10-29 17:18:22.521719	2015-10-29 17:18:22.521719	f
18	iuhiuhiuh+	58	\N	29	2015-10-29 17:18:40.255557	2015-10-29 17:18:40.255557	f
19	\N	58	\N	29	2015-10-29 17:18:40.836519	2015-10-29 17:18:40.836519	f
20	\N	58	\N	29	2015-10-29 17:18:43.319592	2015-10-29 17:18:43.319592	f
21	Non	53	\N	29	2015-10-29 17:21:48.842038	2015-10-29 17:21:48.842038	f
22	Chgvb	53	\N	30	2015-10-29 17:22:04.030855	2015-10-29 17:22:04.030855	f
23	Gucci	53	\N	29	2015-10-29 17:30:36.332522	2015-10-29 17:30:36.332522	f
24	\N	53	\N	\N	2015-11-05 14:01:26.509509	2015-11-05 14:01:26.509509	f
25	\N	53	\N	\N	2015-11-05 14:03:01.970472	2015-11-05 14:03:01.970472	f
26	asd	53	\N	\N	2015-11-05 14:07:53.577826	2015-11-05 14:07:53.577826	f
27	asd	53	\N	\N	2015-11-05 14:08:38.531006	2015-11-05 14:08:38.531006	f
28	asd	53	\N	\N	2015-11-05 14:09:52.342221	2015-11-05 14:09:52.342221	f
29	asd	53	\N	\N	2015-11-05 14:10:13.87936	2015-11-05 14:10:13.87936	f
30	asd	53	\N	33	2015-11-05 14:10:41.157883	2015-11-05 14:10:41.157883	f
31	test	53	\N	33	2015-11-05 14:11:52.304998	2015-11-05 14:11:52.304998	f
32	asdasdsa	53	\N	33	2015-11-05 14:12:23.859868	2015-11-05 14:12:23.859868	f
33	Ciao!	53	\N	32	2015-11-05 14:34:28.695524	2015-11-05 14:34:28.695524	f
34	come va?	67	\N	32	2015-11-05 14:34:45.951405	2015-11-05 14:34:45.951405	t
35	puoi portarmi fino a sordevolo?	67	\N	32	2015-11-05 14:35:08.498577	2015-11-05 14:35:08.498577	t
36	Certo! Dove ci troviamo?	53	\N	32	2015-11-05 14:35:30.712716	2015-11-05 14:35:30.712716	f
37	facciamo esselunga?	67	\N	32	2015-11-05 14:37:35.986222	2015-11-05 14:37:35.986222	t
38	Perfetto!	53	\N	32	2015-11-05 14:37:55.598572	2015-11-05 14:37:55.598572	f
39	ok a dopo!	67	\N	32	2015-11-05 14:38:29.696106	2015-11-05 14:38:29.696106	t
40	Hola	68	\N	32	2015-11-05 14:52:32.2976	2015-11-05 14:52:32.2976	f
41	heyla!	53	\N	43	2015-11-06 06:19:07.544599	2015-11-06 06:19:07.544599	f
42	ma ci vai stamattina?	15	\N	45	2015-11-09 09:29:35.144018	2015-11-09 09:29:35.144018	f
43	we!	95	\N	65	2016-04-06 10:58:38.059064	2016-04-06 10:58:38.059064	t
44	ciao!	12	\N	65	2016-04-06 11:00:16.43864	2016-04-06 11:00:16.43864	f
45	Orario flessibile	87	\N	68	2016-04-14 12:31:26.509969	2016-04-14 12:31:26.509969	t
46	Passo proprio di lì verso le 22, va bene? Viene anche Leon?	107	\N	74	2016-07-02 16:49:15.546735	2016-07-02 16:49:15.546735	f
47	Ciao, non trovò il pulsante per candidarmi!	15	\N	80	2016-10-04 10:02:27.479859	2016-10-04 10:02:27.479859	f
48	Please	12	\N	85	2016-11-11 18:24:11.786519	2016-11-11 18:24:11.786519	t
\.


--
-- Name: travel_request_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('travel_request_messages_id_seq', 48, true);


--
-- Data for Name: travel_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY travel_requests (id, passenger_id, room_id, starting_address, lat, lng, is_one_way, one_way_datetime, back_datetime, created_at, updated_at, towards_room, can_repay, destination_address, note, flexible_departure, only_with_feedback) FROM stdin;
66	87	15	Via milano 32 Vigliano 13856	45.5645359999999968	8.09474919999999898	t	2016-04-06 14:30:00	\N	2016-04-06 13:34:29.943169	2016-04-06 13:34:29.943169	t	f	via serralunga 27 biella	\N	\N	\N
67	95	17	via giuseppe mazzini 25 biella 13900	45.5633566999999999	8.05352940000000039	t	2016-04-12 10:35:00	\N	2016-04-12 10:21:18.014043	2016-04-12 10:21:18.014043	t	f	corso del piazzo 25 biella	\N	\N	\N
68	87	17	Via mosca 4 Biella 13900	45.5717738000000026	8.06527709999999942	t	2016-04-14 18:25:00	\N	2016-04-14 12:29:49.709667	2016-04-14 12:29:49.709667	t	f	corso del piazzo 25 biella	\N	\N	\N
69	95	17	Via monte bo 44 Biella 13900	45.582637499999997	8.07154749999999943	t	2016-04-14 15:30:00	\N	2016-04-14 13:34:42.333587	2016-04-14 13:34:42.333587	t	f	corso del piazzo 25 biella	\N	\N	\N
70	87	17	Via Garibaldi 20 Vigkiano 13856	45.5652639999999991	8.11700599999999994	t	2016-04-14 14:30:00	\N	2016-04-14 13:34:47.167215	2016-04-14 13:34:47.167215	t	f	corso del piazzo 25 biella	\N	\N	\N
71	12	17	via monte bo 44 biella 13900	45.582637499999997	8.07154749999999943	t	2016-04-21 13:30:00	\N	2016-04-21 12:55:35.974494	2016-04-21 12:55:35.974494	t	f	corso del piazzo 25 biella	\N	f	\N
72	107	18	via serralunga 27 13900 biella	45.5713657000000012	8.05536640000000048	t	2016-06-09 21:00:00	\N	2016-06-09 13:36:33.376878	2016-06-09 13:36:33.376878	f	t	Via Milano 32 Vigliano Biellese BI 13856	\N	t	\N
73	131	23	Via Gobetti 1 Biella 13900	45.5669261999999975	8.05053689999999911	t	2016-07-01 18:15:00	\N	2016-07-01 16:27:25.10716	2016-07-01 16:27:25.10716	t	f	campo volo aquiloni corso guido alberto rivetti biella	\N	t	f
74	109	23	Via della vittoria Biella 13900	45.5741747000000004	8.07043149999999976	t	2016-07-02 20:30:00	\N	2016-07-02 15:28:47.443049	2016-07-02 15:28:47.443049	t	t	campo volo aquiloni corso guido alberto rivetti biella	\N	t	f
75	55	23	via Galileo Galilei 11 Biella 13900	45.5705303000000086	8.05624839999999942	t	2016-07-02 00:00:00	\N	2016-07-02 16:35:23.414556	2016-07-02 16:35:23.414556	t	t	campo volo aquiloni corso guido alberto rivetti biella	\N	t	\N
76	12	7	via monte bo 44 biella 13900	45.582637499999997	8.07154749999999943	t	2016-09-18 12:30:00	\N	2016-09-16 12:58:05.519508	2016-09-16 12:58:05.519508	t	t	45.646223, 8.017714	\N	t	\N
77	12	15	via monte bo 44 biella 13900	45.582637499999997	8.07154749999999943	t	2016-09-17 07:05:00	\N	2016-09-16 12:58:49.614971	2016-09-16 12:58:49.614971	t	t	via serralunga 27 biella	\N	f	\N
78	15	34	via italia biella 13900	45.5686697000000009	8.05345870000000019	t	2016-10-05 08:00:00	\N	2016-10-03 08:13:25.141601	2016-10-03 08:13:25.141601	t	t	Corso Giuseppe Pella, 10 13900 Biella	da zona giardini zumaglini	t	\N
79	15	34	via italia biella 13900	45.5686697000000009	8.05345870000000019	t	2016-10-05 08:00:00	\N	2016-10-03 08:15:21.256953	2016-10-03 08:15:21.256953	t	t	Corso Giuseppe Pella, 10 13900 Biella	da zona riva	t	\N
80	12	34	Via monte bo 44 biella 13900	45.582637499999997	8.07154749999999943	t	2016-10-04 12:30:00	\N	2016-10-03 09:49:50.077942	2016-10-03 09:49:50.077942	t	t	Corso Giuseppe Pella, 10 13900 Biella	\N	f	\N
81	192	33	Via Paietta 27 Biella 13900	45.5562484000000012	8.05174689999999948	t	2016-10-17 18:30:00	\N	2016-10-17 08:24:31.170606	2016-10-17 08:24:31.170606	t	t	corso giulio cesare 10100 torino	\N	t	\N
82	192	33	Via Moncrivello 6 Torino 10135	45.0890261999999993	7.70856979999999936	t	2016-10-17 23:00:00	\N	2016-10-17 08:25:04.442487	2016-10-17 08:25:04.442487	t	t	corso giulio cesare 10100 torino	\N	f	\N
83	209	44	Via Faglia 27 Gattinara 13045	45.6095268999999988	8.36949399999999955	t	\N	\N	2016-10-28 13:02:30.175665	2016-10-28 13:02:30.175665	t	f	Via Martiri della Libertà 389,13836 Cossato (BI)	\N	f	f
84	221	38	Gaglianico Gaglianico 13894	45.5385617000000025	8.07355240000000052	t	2016-11-11 07:51:00	\N	2016-11-08 19:52:22.681736	2016-11-08 19:52:22.681736	t	f	Piazza Innocenzo Manzetti 1  Aosta	\N	f	t
85	12	7	via monte bo 44 biella 13900	45.582637499999997	8.07154749999999943	t	2016-11-18 09:30:00	\N	2016-11-11 18:22:46.234337	2016-11-11 18:22:46.234337	t	t	45.646223, 8.017714	\N	f	\N
\.


--
-- Name: travel_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('travel_requests_id_seq', 85, true);


--
-- Data for Name: travel_reviews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY travel_reviews (id, content, rating, created_at, updated_at, user_id, travel_id, made_by_driver, target_id, to_be_written, room_id) FROM stdin;
51	\N	\N	2015-12-02 22:09:40.42313	2015-12-02 22:09:40.42313	73	151	t	12	t	\N
52	\N	\N	2015-12-02 22:09:40.426138	2015-12-02 22:09:40.426138	12	151	f	73	t	\N
3	bravo e bello	5	2015-07-15 15:15:40.596471	2015-07-26 16:09:18.642069	14	18	t	15	f	\N
30	Good driver!!!!	8	2015-09-29 17:24:41.935394	2016-02-10 14:29:06.889187	13	75	f	16	f	\N
4	prudente ma sempre in ritardo	7	2015-07-15 15:15:40.599633	2015-07-27 08:23:17.423873	15	18	f	14	f	\N
1	Tutto ok	10	2015-07-13 20:58:18.578546	2015-07-27 17:06:30.166273	12	5	t	14	f	\N
5	elena è una macchina da guerra	\N	2015-07-15 16:16:40.393534	2015-07-31 07:43:11.182192	15	21	t	17	f	\N
6	Riccardo: molto meglio andare in giro da quando ha la multipla rispetto a quando aveva il motorello!	\N	2015-07-15 16:16:40.396634	2015-08-07 08:36:04.812392	17	21	f	15	f	\N
2	Yo	8	2015-07-13 20:58:18.583499	2015-08-07 10:57:59.48204	14	5	f	12	f	\N
7	BBBello	9	2015-08-07 11:10:28.754363	2015-08-10 17:01:18.674025	14	23	t	15	f	\N
54	\N	\N	2016-02-18 10:30:40.283684	2016-02-18 10:30:40.283684	12	177	f	15	t	\N
10	Yeahhh	7	2015-08-11 11:19:08.513293	2015-08-11 11:22:22.634857	16	61	f	14	f	\N
9	Yeppa	8	2015-08-11 11:19:08.507551	2015-08-11 11:23:12.431871	14	61	t	16	f	\N
12	\N	\N	2015-08-11 13:57:14.329225	2015-08-11 13:57:14.329225	14	85	f	16	t	\N
11	yeah	7	2015-08-11 13:57:14.321576	2015-08-11 13:57:20.596626	16	85	t	14	f	\N
14	\N	\N	2015-08-11 13:57:28.236116	2015-08-11 13:57:28.236116	13	82	f	16	t	\N
15	\N	\N	2015-08-11 13:57:28.259193	2015-08-11 13:57:28.259193	16	82	t	14	t	\N
13	good	8	2015-08-11 13:57:28.23131	2015-08-11 13:57:35.739193	16	82	t	13	f	\N
18	\N	\N	2015-08-11 13:57:46.249422	2015-08-11 13:57:46.249422	14	79	f	16	t	\N
17	rock!	10	2015-08-11 13:57:46.245541	2015-08-11 13:57:54.378255	16	79	t	14	f	\N
16	ye	8	2015-08-11 13:57:28.268773	2015-08-11 14:04:36.233538	14	82	f	16	f	\N
8	ottimo!	9	2015-08-07 11:10:28.760042	2015-08-19 09:58:35.082739	15	23	f	14	f	\N
19	\N	\N	2015-08-19 10:05:12.76942	2015-08-19 10:05:12.76942	16	74	t	13	t	\N
20	\N	\N	2015-08-19 10:05:12.774842	2015-08-19 10:05:12.774842	13	74	f	16	t	\N
21	\N	\N	2015-08-19 10:05:12.80542	2015-08-19 10:05:12.80542	16	74	t	14	t	\N
22	Yo	7	2015-08-19 10:05:12.813712	2015-09-03 12:58:55.113188	14	74	f	16	f	\N
53	puntuale e corretto	8	2016-02-18 10:30:40.275661	2016-02-18 10:31:16.162855	15	177	t	12	f	\N
24	precisa e ottima musica	10	2015-09-03 15:39:49.960405	2015-09-03 15:43:39.459075	15	93	f	16	f	\N
26	\N	\N	2015-09-04 15:01:27.366589	2015-09-04 15:01:27.366589	34	103	f	15	t	\N
69	Tutto bene!	10	2016-04-06 14:46:46.286153	2016-04-06 14:47:24.72953	95	292	t	12	f	\N
27	\N	\N	2015-09-29 17:24:41.918164	2015-09-29 17:24:41.918164	16	75	t	14	t	\N
28	\N	\N	2015-09-29 17:24:41.923592	2015-09-29 17:24:41.923592	14	75	f	16	t	\N
29	\N	\N	2015-09-29 17:24:41.932174	2015-09-29 17:24:41.932174	16	75	t	13	t	\N
23	Cool	5	2015-09-03 15:39:49.95394	2015-09-29 17:29:37.533464	16	93	t	15	f	\N
25	persona corretta, prudente e puntuale!	10	2015-09-04 15:01:27.35989	2015-10-24 13:11:31.80796	15	103	t	34	f	\N
34	\N	\N	2015-10-27 18:42:47.916499	2015-10-27 18:42:47.916499	54	112	f	15	t	\N
55	passeggero esemplare!	10	2016-03-14 10:16:28.711592	2016-03-16 00:15:04.097593	15	173	t	16	f	\N
31	passeggero corretto e puntuale!	10	2015-10-27 18:42:47.882051	2015-11-02 13:33:08.139343	15	112	t	27	f	\N
32	Guida prudente e macchina spaziosa	10	2015-10-27 18:42:47.886939	2015-11-03 14:18:53.696897	27	112	f	15	f	\N
35	\N	\N	2015-11-05 18:56:10.615205	2015-11-05 18:56:10.615205	53	119	t	13	t	\N
36	\N	\N	2015-11-05 18:56:10.620506	2015-11-05 18:56:10.620506	13	119	f	53	t	\N
37	\N	\N	2015-11-05 18:56:10.640229	2015-11-05 18:56:10.640229	53	119	t	67	t	\N
38	\N	\N	2015-11-05 18:56:10.646355	2015-11-05 18:56:10.646355	67	119	f	53	t	\N
39	\N	\N	2015-11-05 18:56:10.677997	2015-11-05 18:56:10.677997	53	119	t	65	t	\N
40	\N	\N	2015-11-05 18:56:10.686658	2015-11-05 18:56:10.686658	65	119	f	53	t	\N
41	\N	\N	2015-11-06 01:31:11.447345	2015-11-06 01:31:11.447345	53	121	t	67	t	\N
42	\N	\N	2015-11-06 01:31:11.452494	2015-11-06 01:31:11.452494	67	121	f	53	t	\N
44	\N	\N	2015-11-16 09:12:03.586568	2015-11-16 09:12:03.586568	27	129	f	15	t	\N
45	\N	\N	2015-12-02 21:04:03.083105	2015-12-02 21:04:03.083105	73	148	t	12	t	\N
46	\N	\N	2015-12-02 21:04:03.088459	2015-12-02 21:04:03.088459	12	148	f	73	t	\N
47	\N	\N	2015-12-02 21:12:34.614564	2015-12-02 21:12:34.614564	12	149	t	73	t	\N
48	\N	\N	2015-12-02 21:12:34.617755	2015-12-02 21:12:34.617755	73	149	f	12	t	\N
49	\N	\N	2015-12-02 22:09:24.260905	2015-12-02 22:09:24.260905	12	150	t	73	t	\N
50	\N	\N	2015-12-02 22:09:24.265508	2015-12-02 22:09:24.265508	73	150	f	12	t	\N
56	Rock ON	10	2016-03-14 10:16:28.719086	2016-03-16 15:55:57.773179	16	173	f	15	f	\N
58	\N	\N	2016-04-04 08:48:44.410303	2016-04-04 08:48:44.410303	87	167	f	15	t	\N
57	ottimo passeggero	\N	2016-04-04 08:48:44.406069	2016-04-04 09:06:18.385151	15	167	t	87	f	\N
43	perfetto compagno di viaggio!	9	2015-11-16 09:12:03.580056	2016-04-04 09:06:41.436913	15	129	t	27	f	\N
33	puntuale e corretta!	9	2015-10-27 18:42:47.911157	2016-04-04 09:07:04.191756	15	112	t	54	f	\N
59	\N	\N	2016-04-05 12:12:03.817857	2016-04-05 12:12:03.817857	73	188	t	12	t	\N
60	\N	\N	2016-04-05 12:12:03.822096	2016-04-05 12:12:03.822096	12	188	f	73	t	\N
61	\N	\N	2016-04-05 12:12:03.840385	2016-04-05 12:12:03.840385	73	188	t	58	t	\N
62	\N	\N	2016-04-05 12:12:03.8485	2016-04-05 12:12:03.8485	58	188	f	73	t	\N
63	\N	\N	2016-04-05 12:44:22.697506	2016-04-05 12:44:22.697506	12	224	t	15	t	\N
65	\N	\N	2016-04-06 12:23:29.416181	2016-04-06 12:23:29.416181	95	296	t	12	t	\N
66	\N	\N	2016-04-06 12:23:29.420527	2016-04-06 12:23:29.420527	12	296	f	95	t	\N
67	\N	\N	2016-04-06 13:17:10.968925	2016-04-06 13:17:10.968925	12	297	t	95	t	\N
68	\N	\N	2016-04-06 13:17:10.972683	2016-04-06 13:17:10.972683	95	297	f	12	t	\N
70	\N	\N	2016-04-06 14:46:46.290681	2016-04-06 14:46:46.290681	12	292	f	95	t	\N
71	Tutto OK!	8	2016-04-12 10:51:29.169821	2016-04-12 11:24:50.455813	95	316	t	73	f	\N
72	Ok no problem	8	2016-04-12 10:51:29.174299	2016-04-12 11:27:46.545048	73	316	f	95	f	\N
73	\N	\N	2016-04-14 12:48:10.851237	2016-04-14 12:48:10.851237	95	293	t	12	t	\N
74	\N	\N	2016-04-14 12:48:10.855025	2016-04-14 12:48:10.855025	12	293	f	95	t	\N
75	\N	\N	2016-04-14 12:48:10.878375	2016-04-14 12:48:10.878375	95	293	t	87	t	\N
76	\N	\N	2016-04-14 12:48:10.882727	2016-04-14 12:48:10.882727	87	293	f	95	t	\N
78	\N	\N	2016-04-14 14:06:31.246385	2016-04-14 14:06:31.246385	87	312	f	15	t	\N
77	ottimo!	10	2016-04-14 14:06:31.240482	2016-04-14 14:06:43.648719	15	312	t	87	f	\N
64	puntuale e discreto!	10	2016-04-05 12:44:22.702031	2016-04-18 09:29:48.774488	15	224	f	12	f	\N
79	puntuale e simpatica!	9	2016-05-11 18:38:58.317724	2016-05-11 20:10:20.069631	15	337	t	107	f	\N
82	\N	\N	2016-05-25 09:04:59.201054	2016-05-25 09:04:59.201054	29	339	f	15	t	\N
80	esperto e affidabile!	10	2016-05-11 18:38:58.321981	2016-05-31 17:00:04.602675	107	337	f	15	f	\N
83	\N	\N	2016-06-09 12:21:44.976596	2016-06-09 12:21:44.976596	73	353	t	12	t	\N
84	\N	\N	2016-06-09 12:21:44.980816	2016-06-09 12:21:44.980816	12	353	f	73	t	\N
81	affidabile e simpatico!!	9	2016-05-25 09:04:59.194033	2016-09-14 14:20:15.564415	15	339	t	29	f	\N
86	simpatico e gentile!	10	2016-09-09 09:23:54.916059	2016-10-22 16:35:09.147762	107	367	f	15	f	\N
85	ottimo driver!!!	\N	2016-09-09 09:23:54.910356	2016-09-14 14:19:56.67834	15	367	t	107	f	\N
88	\N	\N	2016-10-11 13:06:10.797306	2016-10-11 13:06:10.797306	12	448	f	15	t	\N
87	top	9	2016-10-11 13:06:10.789081	2016-10-11 23:55:48.544067	15	448	t	12	f	\N
\.


--
-- Name: travel_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('travel_reviews_id_seq', 88, true);


--
-- Data for Name: travel_stops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY travel_stops (id, address, lat, lng, travel_id, created_at, updated_at) FROM stdin;
50	\N	\N	\N	288	2016-04-06 11:13:02.987182	2016-04-06 11:13:02.987182
51	\N	\N	\N	290	2016-04-06 11:13:03.254647	2016-04-06 11:13:03.254647
52	Via gramsci 23	40.6308089999999993	9.71764630000000018	313	2016-04-06 13:54:38.550948	2016-04-06 13:54:38.550948
53	Via Mosca 4 biella	45.5614920000000012	8.00874799999999887	323	2016-04-14 13:04:00.300587	2016-04-14 13:04:00.300587
54	Chiavazza	45.5676083000000034	8.08089539999999928	380	2016-07-03 13:08:04.392922	2016-07-03 13:08:04.392922
55	\N	\N	\N	380	2016-07-03 13:08:04.396383	2016-07-03 13:08:04.396383
\.


--
-- Name: travel_stops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('travel_stops_id_seq', 55, true);


--
-- Data for Name: travels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY travels (id, starting_address, created_at, updated_at, car_id, driver_id, room_id, completion_token, completed, waiting_for_confirm, departure_datetime, towards_room, starting_lat, starting_lng, destination_address, destination_lat, destination_lng, is_recursive, flexible_departure, only_with_feedback, can_repay) FROM stdin;
394	Via lamarmora 13 Biella 13900	2016-09-14 11:05:09.967342	2016-09-28 18:30:09.034292	24	73	7	2sN2S1v09HtbslAkVVah1w==	f	t	2016-09-28 18:00:00	t	45.5620137000000014	8.05544499999999886	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	\N
372	via serralunga 27 13900 biella	2016-06-09 21:18:05.958582	2016-06-09 21:18:05.958582	32	107	18	VLkDcIwukhLXRVFyZa930Q==	f	f	2016-06-09 21:30:00	f	45.5713657000000012	8.05536640000000048	via Milano 32 Vigliano Biellese BI 13856	45.5645359999999968	8.09474919999999898	\N	t	t	f
373	Giardini Zumaglini Biella 13900	2016-06-17 14:23:04.289328	2016-06-17 14:23:04.289328	32	107	15	SuOUVMWZKUaUxyF1Fb4Awg==	f	f	2016-06-18 16:30:00	t	45.5629987000000014	8.05604669999999956	via serralunga 27 biella	45.5713657000000012	8.05536640000000048	\N	t	f	f
379	Via rosazza Biella 13900	2016-07-03 10:03:05.778984	2016-07-03 10:03:05.778984	6	15	23	+rraN7RtyWsOAInYsZK1+w==	f	f	2016-07-03 17:00:00	t	45.571895099999999	8.06450129999999987	campo volo aquiloni corso guido alberto rivetti biella	45.5570762999999985	8.0702784999999988	\N	t	f	f
382	Via milano 32 Vigliano 13856	2016-07-18 14:05:50.858329	2016-07-18 14:05:50.858329	6	15	24	pZcWSg0U/09x2doSGMaxgg==	f	f	2016-07-20 14:05:00	t	45.5645359999999968	8.09474919999999898	via serralunga 27 13900 biella	45.5713657000000012	8.05536640000000048	\N	t	f	f
383	via serralunga 25 biella 13900	2016-07-29 16:49:57.243101	2016-07-29 16:49:57.243101	6	15	27	x93fXXXr0aoUC4+CxRQB5w==	f	f	2016-07-31 12:00:00	t	45.5713758999999996	8.05529789999999934	balma Biella 13812	45.646698899999997	8.01823979999999992	\N	t	f	f
387	45.646223, 8.017714	2016-09-05 12:52:37.507001	2016-09-05 12:52:37.507001	31	58	7	Q0YI8YbINySbLronwBsRhQ==	f	f	2016-09-05 16:50:00	f	45.646975900000001	8.01812819999999959	Via monte bo 44 Biella 13900	45.582637499999997	8.07154749999999943	\N	t	f	t
386	Via monte bo 44 Biella 13900	2016-09-05 12:52:37.363675	2016-09-05 12:56:20.102212	31	58	7	Q7KQaajBbXq6wTGVhO5EVA==	f	f	2016-09-05 12:55:00	t	45.582637499999997	8.07154749999999943	45.646223, 8.017714	45.646975900000001	8.01812819999999959	\N	t	f	t
388	Via Mazzini 2 Biella 13900	2016-09-07 23:40:38.355127	2016-09-07 23:40:38.355127	6	15	29	ZdfMiIzDY5okA7DdLWPGHg==	f	f	2016-09-09 07:30:00	t	45.5641488999999993	8.05707439999999941	Loc. Fornaca 2, 13815 Rosazza	45.6754095000000007	7.97566559999999924	\N	t	f	f
367	via serralunga 27 13900 biella	2016-06-09 13:32:41.882031	2016-09-09 09:23:54.887113	6	15	18	uQanWuVxJxvCMgJSq0MZfg==	t	f	2016-06-09 18:00:00	f	45.5713657000000012	8.05536640000000048	Via Milano 32 Vigliano Biellese BI 13856	45.5645359999999968	8.09474919999999898	\N	f	f	f
391	Via Giuseppe Mazzini 25 Biella 13900	2016-09-14 10:55:30.29704	2016-09-14 11:03:56.30348	24	73	7	AmpGkr1idDBUS6vYi/uteQ==	f	f	2016-09-14 14:55:00	t	45.5633566999999999	8.05352940000000039	45.646223, 8.017714	45.646975900000001	8.01812819999999959	\N	f	f	f
393	Via lamarmora 13 Biella 13900	2016-09-14 11:05:09.895537	2016-09-21 18:30:07.353502	24	73	7	q7gsI46Bw6TLNamrZnQNjA==	f	t	2016-09-21 18:00:00	t	45.5620137000000014	8.05544499999999886	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	\N
390	Via monte bo 44 biella 13900	2016-09-14 10:54:56.037824	2016-09-14 12:30:03.957688	5	12	7	UtMf/3HPbZLwkMVjDddsTw==	f	t	2016-09-14 12:00:00	t	45.582637499999997	8.07154749999999943	45.646223, 8.017714	45.646975900000001	8.01812819999999959	\N	f	f	f
395	via mosca 4 biella 13900	2016-09-27 12:17:12.664057	2016-09-27 12:17:12.664057	6	15	30	nBFXR0arsPX7yuHoExp9LA==	f	f	2016-09-27 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	f
392	Via lamarmora 13 Biella 13900	2016-09-14 11:05:09.830008	2016-09-14 13:30:12.971317	24	73	7	RThbrPfoP25If4J1+BlKQQ==	f	f	2016-09-14 18:00:00	t	45.5620137000000014	8.05544499999999886	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	f
396	via mosca 4 biella 13900	2016-09-27 12:17:12.828886	2016-09-27 12:17:12.828886	6	15	30	30i3sDNw75BH9PrwFtjqOA==	f	f	2016-10-04 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
397	via mosca 4 biella 13900	2016-09-27 12:17:12.954738	2016-09-27 12:17:12.954738	6	15	30	EjR/oZn2IIw9Mj2t0Ra08g==	f	f	2016-10-11 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
398	via mosca 4 biella 13900	2016-09-27 12:17:13.004262	2016-09-27 12:17:13.004262	6	15	30	QtA3p+q65lAbxmYilekZpA==	f	f	2016-10-18 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
399	via mosca 4 biella 13900	2016-09-27 12:17:13.045184	2016-09-27 12:17:13.045184	6	15	30	PDYkZ9/IJG+zRPUnSO7guw==	f	f	2016-10-25 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
400	via mosca 4 biella 13900	2016-09-27 12:17:13.090658	2016-09-27 12:17:13.090658	6	15	30	vbWWnrGjNJBspdBibQeT3w==	f	f	2016-11-01 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
401	via mosca 4 biella 13900	2016-09-27 12:17:13.144877	2016-09-27 12:17:13.144877	6	15	30	KJPoFvp1Z41AnDcgUs72LA==	f	f	2016-11-08 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
402	via mosca 4 biella 13900	2016-09-27 12:17:13.180809	2016-09-27 12:17:13.180809	6	15	30	eecUYHcNtdaozBXvzaOfAA==	f	f	2016-11-15 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
403	via mosca 4 biella 13900	2016-09-27 12:17:13.219039	2016-09-27 12:17:13.219039	6	15	30	BSxpYGpFN9CLrP/DKMT/oA==	f	f	2016-11-22 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
404	via mosca 4 biella 13900	2016-09-27 12:17:13.269631	2016-09-27 12:17:13.269631	6	15	30	ErUQC01GBHEcfcEP98785w==	f	f	2016-11-29 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
405	via mosca 4 biella 13900	2016-09-27 12:17:13.312039	2016-09-27 12:17:13.312039	6	15	30	LBUuwirPCBLiBPy4eohTJA==	f	f	2016-12-06 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
406	via mosca 4 biella 13900	2016-09-27 12:17:13.350153	2016-09-27 12:17:13.350153	6	15	30	UGXpFT90R6jUZAyFEirh5Q==	f	f	2016-12-13 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
407	via mosca 4 biella 13900	2016-09-27 12:17:13.397675	2016-09-27 12:17:13.397675	6	15	30	/U19CF3TGN8CUhxkA1Rb5A==	f	f	2016-12-20 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
369	via serralunga 27 13900 biella	2016-06-09 16:04:04.446518	2016-06-09 16:04:04.446518	5	12	18	LoiQW3/STgN2KLZHgybt3A==	f	f	2016-06-09 21:00:00	f	45.5713657000000012	8.05536640000000048	Via Mazzini 2 Biella 13900	45.5641488999999993	8.05707439999999941	t	t	f	f
370	Via Mazzini 2 Biella 13900	2016-06-09 16:04:04.539584	2016-06-09 16:04:04.539584	5	12	18	zBMf/rX1Tg4IzIW0niBjvA==	f	f	2016-06-16 18:00:00	t	45.5641488999999993	8.05707439999999941	via serralunga 27 13900 biella	45.5713657000000012	8.05536640000000048	t	f	f	\N
371	via serralunga 27 13900 biella	2016-06-09 16:04:04.615502	2016-06-09 16:04:04.615502	5	12	18	IB0LrD6oI84ryhyYrET7zg==	f	f	2016-06-16 21:00:00	f	45.5713657000000012	8.05536640000000048	Via Mazzini 2 Biella 13900	45.5641488999999993	8.05707439999999941	t	f	f	\N
368	Via Mazzini 2 Biella 13900	2016-06-09 16:04:04.35072	2016-06-09 18:30:05.060938	5	12	18	hr3uMcOlNuPGFSq4HDQMsw==	f	t	2016-06-09 18:00:00	t	45.5641488999999993	8.05707439999999941	via serralunga 27 13900 biella	45.5713657000000012	8.05536640000000048	t	t	f	f
377	Via milano 32 Vigliano Biellese 13856	2016-07-02 17:05:45.528517	2016-07-02 17:05:45.528517	32	107	23	nAebRElM0rUOhDZioPL4ig==	f	f	2016-07-02 20:00:00	t	45.5645359999999968	8.09474919999999898	campo volo aquiloni corso guido alberto rivetti biella	45.5570762999999985	8.0702784999999988	\N	f	f	f
378	campo volo aquiloni corso guido alberto rivetti biella	2016-07-02 17:05:45.609297	2016-07-02 17:05:45.609297	32	107	23	lxV+c7Gxb3p/DxHoaQlRAg==	f	f	2016-07-02 23:00:00	f	45.5570762999999985	8.0702784999999988	Via milano 32 Vigliano Biellese 13856	45.5645359999999968	8.09474919999999898	\N	f	f	f
380	Via Milano 33 Vigliano Biellese 13856	2016-07-03 13:08:04.335387	2016-07-03 13:08:04.335387	32	107	23	W7J2BPpYTKwGd5fXuu7PQA==	f	f	2016-07-03 18:45:00	t	45.5617650000000012	8.10573799999999878	campo volo aquiloni corso guido alberto rivetti biella	45.5570762999999985	8.0702784999999988	\N	t	f	f
381	campo volo aquiloni corso guido alberto rivetti biella	2016-07-03 13:08:04.566792	2016-07-03 13:08:04.566792	32	107	23	5PrNVir07hFxtroYkGZKXw==	f	f	2016-07-03 22:15:00	f	45.5570762999999985	8.0702784999999988	Via Milano 33 Vigliano Biellese 13856	45.5617650000000012	8.10573799999999878	\N	t	f	f
384	via italia 1 biella biella 13900	2016-07-31 10:48:47.407359	2016-07-31 10:48:47.407359	6	15	28	SDOeKMl3bAsd28TYecRAYQ==	f	f	2016-07-31 11:30:00	t	45.573668099999999	8.05199140000000035	Via Roma, 4, 13812 San Paolo Cervo BI	45.656171999999998	8.00742200000000004	\N	t	f	f
385	Via Roma, 4, 13812 San Paolo Cervo BI	2016-07-31 10:48:47.464067	2016-07-31 10:48:47.464067	6	15	28	QkMeqgR5DihydBC+A/onfQ==	f	f	2016-07-31 17:00:00	f	45.656171999999998	8.00742200000000004	via italia 1 biella biella 13900	45.573668099999999	8.05199140000000035	\N	t	f	f
389	via monte bo 44 biella 13900	2016-09-09 09:17:15.120968	2016-09-12 10:27:38.959522	24	73	29	gt8RYnf7T0awFzSciUGuBg==	f	t	2016-09-09 10:00:00	t	45.582637499999997	8.07154749999999943	Loc. Fornaca 2, 13815 Rosazza	45.6754095000000007	7.97566559999999924	\N	f	f	f
408	via mosca 4 biella 13900	2016-09-27 12:17:13.440425	2016-09-27 12:17:13.440425	6	15	30	JBEZhQ0pZCpCvA1VFHui8A==	f	f	2016-12-27 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
409	via mosca 4 biella 13900	2016-09-27 12:17:13.475497	2016-09-27 12:17:13.475497	6	15	30	YEifqt+wVjBFYTp3IR7M9A==	f	f	2017-01-03 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
410	via mosca 4 biella 13900	2016-09-27 12:17:13.520136	2016-09-27 12:17:13.520136	6	15	30	jw3qBv63BrS9gv5t6998sw==	f	f	2017-01-10 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
411	via mosca 4 biella 13900	2016-09-27 12:17:13.560538	2016-09-27 12:17:13.560538	6	15	30	ko62tXuklCVwiPLK2ZlPig==	f	f	2017-01-17 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
412	via mosca 4 biella 13900	2016-09-27 12:17:13.601452	2016-09-27 12:17:13.601452	6	15	30	RFlUd+Ixtx9NgwvLkW4oQg==	f	f	2017-01-24 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
413	via mosca 4 biella 13900	2016-09-27 12:17:13.660082	2016-09-27 12:17:13.660082	6	15	30	kEHZJ2liebPIQ+9MkDjPQw==	f	f	2017-01-31 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
414	via mosca 4 biella 13900	2016-09-27 12:17:13.707947	2016-09-27 12:17:13.707947	6	15	30	3yEjzmMMbByp70DFEIY0jQ==	f	f	2017-02-07 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
415	via mosca 4 biella 13900	2016-09-27 12:17:13.749101	2016-09-27 12:17:13.749101	6	15	30	R2yTrVssUq+2OlrA+XKkBw==	f	f	2017-02-14 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
416	via mosca 4 biella 13900	2016-09-27 12:17:13.807174	2016-09-27 12:17:13.807174	6	15	30	HgUIrIA+2RF2SCOzvjeTmA==	f	f	2017-02-21 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
417	via mosca 4 biella 13900	2016-09-27 12:17:13.848775	2016-09-27 12:17:13.848775	6	15	30	/zWR/EEqNnou7g3YX7WYIQ==	f	f	2017-02-28 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
418	via mosca 4 biella 13900	2016-09-27 12:17:13.89498	2016-09-27 12:17:13.89498	6	15	30	u0/SqXlvO2SlZSGHYlUgBg==	f	f	2017-03-07 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
419	via mosca 4 biella 13900	2016-09-27 12:17:13.952434	2016-09-27 12:17:13.952434	6	15	30	nYq6rhXGuVHD2+z66/Dcew==	f	f	2017-03-14 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
420	via mosca 4 biella 13900	2016-09-27 12:17:13.991646	2016-09-27 12:17:13.991646	6	15	30	ocwJ9exxK+63XlWXgc4mLA==	f	f	2017-03-21 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
421	via mosca 4 biella 13900	2016-09-27 12:17:14.031616	2016-09-27 12:17:14.031616	6	15	30	MSKlqZq8Ae+zXsL7jp+J2Q==	f	f	2017-03-28 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
422	via mosca 4 biella 13900	2016-09-27 12:17:14.089194	2016-09-27 12:17:14.089194	6	15	30	Q0UJENYrIdNpHrJk/CzH4Q==	f	f	2017-04-04 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
423	via mosca 4 biella 13900	2016-09-27 12:17:14.129224	2016-09-27 12:17:14.129224	6	15	30	ri7UpX+N0pnEopm7wOcs7A==	f	f	2017-04-11 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
424	via mosca 4 biella 13900	2016-09-27 12:17:14.169688	2016-09-27 12:17:14.169688	6	15	30	qT2Ua/JK06S3fqGvukDSWw==	f	f	2017-04-18 14:30:00	t	45.5717738000000026	8.06527709999999942	borgata berlanghino 1 cossato	45.5745845000000003	8.18807269999999932	t	f	f	\N
425	borgata berlanghino 1 cossato	2016-09-27 12:20:35.476134	2016-09-27 12:20:35.476134	6	15	30	4SJePO4/yEJ4UoGCuHVYPA==	f	f	2016-09-27 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	f
426	borgata berlanghino 1 cossato	2016-09-27 12:20:35.575805	2016-09-27 12:20:35.575805	6	15	30	+cshi9YI1QYSFqNvpjQtIg==	f	f	2016-10-04 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
427	borgata berlanghino 1 cossato	2016-09-27 12:20:35.642175	2016-09-27 12:20:35.642175	6	15	30	KjnF35DKoQFZbAHUNtfTxw==	f	f	2016-10-11 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
428	borgata berlanghino 1 cossato	2016-09-27 12:20:35.690317	2016-09-27 12:20:35.690317	6	15	30	GMohdKf6rSXlhSonpbEs0w==	f	f	2016-10-18 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
429	borgata berlanghino 1 cossato	2016-09-27 12:20:35.726021	2016-09-27 12:20:35.726021	6	15	30	rUYd6jzYz3LIeOEXe6VRkg==	f	f	2016-10-25 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
430	borgata berlanghino 1 cossato	2016-09-27 12:20:35.772361	2016-09-27 12:20:35.772361	6	15	30	IFdgvxZZUyD7WFOKSTB7hw==	f	f	2016-11-01 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
431	borgata berlanghino 1 cossato	2016-09-27 12:20:35.824043	2016-09-27 12:20:35.824043	6	15	30	2IFkSP/P4ogrVKXI7mpLaw==	f	f	2016-11-08 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
432	borgata berlanghino 1 cossato	2016-09-27 12:20:35.859686	2016-09-27 12:20:35.859686	6	15	30	wabufXeNo1bAnITojfYhBw==	f	f	2016-11-15 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
433	borgata berlanghino 1 cossato	2016-09-27 12:20:35.89401	2016-09-27 12:20:35.89401	6	15	30	nQZzruVzuW7/DViw5tog9A==	f	f	2016-11-22 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
434	borgata berlanghino 1 cossato	2016-09-27 12:20:35.943674	2016-09-27 12:20:35.943674	6	15	30	zEvMwbpEYkAHem4+ib5T+w==	f	f	2016-11-29 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
435	borgata berlanghino 1 cossato	2016-09-27 12:20:35.990412	2016-09-27 12:20:35.990412	6	15	30	zQXWB3fr0ym0DAOIl5h8ew==	f	f	2016-12-06 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
436	borgata berlanghino 1 cossato	2016-09-27 12:20:36.034663	2016-09-27 12:20:36.034663	6	15	30	Po/5UYVwH4AG62VmyrHzJQ==	f	f	2016-12-13 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
437	borgata berlanghino 1 cossato	2016-09-27 12:20:36.081293	2016-09-27 12:20:36.081293	6	15	30	JqjDE09b3fuz5PD2kQRtlQ==	f	f	2016-12-20 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
438	borgata berlanghino 1 cossato	2016-09-27 12:20:36.122313	2016-09-27 12:20:36.122313	6	15	30	CkXGyaM0Ch0p/jS6zGkB6w==	f	f	2016-12-27 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
439	borgata berlanghino 1 cossato	2016-09-27 12:20:36.159216	2016-09-27 12:20:36.159216	6	15	30	LAH5YcWuVfAcNbAfscjrcA==	f	f	2017-01-03 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
440	borgata berlanghino 1 cossato	2016-09-27 12:20:36.208491	2016-09-27 12:20:36.208491	6	15	30	Frq7YbyplxO9piZ/CABbwQ==	f	f	2017-01-10 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
441	borgata berlanghino 1 cossato	2016-09-27 12:20:36.24419	2016-09-27 12:20:36.24419	6	15	30	VX7fNyYyELJxYja3joqGvA==	f	f	2017-01-17 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
442	borgata berlanghino 1 cossato	2016-09-27 12:20:36.278891	2016-09-27 12:20:36.278891	6	15	30	sYlTi+U6mf1IxcWg86Rwrg==	f	f	2017-01-24 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
443	borgata berlanghino 1 cossato	2016-09-27 12:20:36.329887	2016-09-27 12:20:36.329887	6	15	30	OE1waQrlMZbQJNAYImwRLg==	f	f	2017-01-31 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
444	borgata berlanghino 1 cossato	2016-09-27 12:20:36.372175	2016-09-27 12:20:36.372175	6	15	30	evQ/V+79oU7BCLperW2/Ig==	f	f	2017-02-07 17:30:00	f	45.5745845000000003	8.18807269999999932	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	t	f	f	\N
445	Via mosca Biella 13900	2016-09-30 16:30:18.701801	2016-09-30 16:30:18.701801	6	15	33	J6IiakbfwvHBA6N0NNi4jQ==	f	f	2016-10-06 12:00:00	t	45.571722400000013	8.06565919999999892	corso giulio cesare 10100 torino	45.0983559000000014	7.69780609999999932	\N	t	f	f
446	corso giulio cesare 10100 torino	2016-09-30 16:30:18.767175	2016-09-30 16:30:18.767175	6	15	33	Oeas7TjN4NQKXbLsIaXFow==	f	f	2016-10-06 17:30:00	f	45.0983559000000014	7.69780609999999932	Via mosca Biella 13900	45.571722400000013	8.06565919999999892	\N	t	f	f
447	Corso Giuseppe Pella, 10 13900 Biella	2016-10-03 08:11:58.398277	2016-10-03 08:11:58.398277	6	15	34	CkXl13tBNxDSmcG00xBqSg==	f	f	2016-10-03 10:00:00	f	45.5543541999999988	8.03177589999999952	via mosca biella 13900	45.571722400000013	8.06565919999999892	\N	t	f	f
449	via milano 32 vigliano 13856	2016-10-03 09:21:47.32682	2016-10-03 09:21:47.32682	6	15	34	nuw2umvu5TBl/RDMlh9DWA==	f	f	2016-10-17 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
450	via milano 32 vigliano 13856	2016-10-03 09:21:47.422728	2016-10-03 09:21:47.422728	6	15	34	zByfu+w1pWfSWlNkyEUjkA==	f	f	2016-10-24 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
451	via milano 32 vigliano 13856	2016-10-03 09:21:47.458043	2016-10-03 09:21:47.458043	6	15	34	O7XQs3wq+l8vHF8cm5wCrQ==	f	f	2016-10-31 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
452	via milano 32 vigliano 13856	2016-10-03 09:21:47.48593	2016-10-03 09:21:47.48593	6	15	34	KdqDk8KraY8R3zpPdogO6Q==	f	f	2016-11-07 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
453	via milano 32 vigliano 13856	2016-10-03 09:21:47.514132	2016-10-03 09:21:47.514132	6	15	34	jn5NERuXBVqiG8rwfn7X+g==	f	f	2016-11-14 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
454	via milano 32 vigliano 13856	2016-10-03 09:21:47.544382	2016-10-03 09:21:47.544382	6	15	34	QZTHpiJy/fKV9Ntc7+NHAg==	f	f	2016-11-21 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
455	via milano 32 vigliano 13856	2016-10-03 09:21:47.573104	2016-10-03 09:21:47.573104	6	15	34	pyLtP4QZnHT5eyT5ox0c+g==	f	f	2016-11-28 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
456	via milano 32 vigliano 13856	2016-10-03 09:21:47.603158	2016-10-03 09:21:47.603158	6	15	34	h7O9Agmg7DUPBYTR1OQOEg==	f	f	2016-12-05 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
457	via milano 32 vigliano 13856	2016-10-03 09:21:47.629883	2016-10-03 09:21:47.629883	6	15	34	wV+ZoswzeeNR5pKVFvy0jg==	f	f	2016-12-12 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
458	via milano 32 vigliano 13856	2016-10-03 09:21:47.655733	2016-10-03 09:21:47.655733	6	15	34	0ebWrA9US1nneHb2Ez3CxA==	f	f	2016-12-19 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
459	via milano 32 vigliano 13856	2016-10-03 09:21:47.681464	2016-10-03 09:21:47.681464	6	15	34	QSWWZhjTh7UuJoHV4EhjPA==	f	f	2016-12-26 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
460	via milano 32 vigliano 13856	2016-10-03 09:21:47.710474	2016-10-03 09:21:47.710474	6	15	34	84n6PNPkak+LzsadD5t0bg==	f	f	2017-01-02 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
461	via milano 32 vigliano 13856	2016-10-03 09:21:47.739586	2016-10-03 09:21:47.739586	6	15	34	6AacceelJV3euPiJwT9Cww==	f	f	2017-01-09 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
462	via milano 32 vigliano 13856	2016-10-03 09:21:47.767671	2016-10-03 09:21:47.767671	6	15	34	vV/H5u+GUFiESTl/unZSTw==	f	f	2017-01-16 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
463	via milano 32 vigliano 13856	2016-10-03 09:21:47.795952	2016-10-03 09:21:47.795952	6	15	34	po2dxSOzmxP69kMmPIZVbA==	f	f	2017-01-23 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
464	via milano 32 vigliano 13856	2016-10-03 09:21:47.825462	2016-10-03 09:21:47.825462	6	15	34	XzfAi2x2wizWLIVzDTHXYw==	f	f	2017-01-30 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
465	via milano 32 vigliano 13856	2016-10-03 09:21:47.854413	2016-10-03 09:21:47.854413	6	15	34	HlbscKhS5PjoHSIFBJpHrA==	f	f	2017-02-06 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
466	via milano 32 vigliano 13856	2016-10-03 09:21:47.88647	2016-10-03 09:21:47.88647	6	15	34	6xjoYdAKmV3RW6tW2x6X4g==	f	f	2017-02-13 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
467	via milano 32 vigliano 13856	2016-10-03 09:21:47.917642	2016-10-03 09:21:47.917642	6	15	34	3nibmVszn+os2KvOklofww==	f	f	2017-02-20 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	\N
468	corso moncalieri 18 torino	2016-10-05 15:04:24.350409	2016-10-05 15:04:24.350409	6	15	35	sWQaF/GRtAEtKxhfO42IkQ==	f	f	2016-10-09 00:00:00	f	45.0593807999999996	7.69436789999999959	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	\N	t	f	f
469	via italia biella 13900	2016-10-07 10:19:26.004606	2016-10-07 10:19:26.004606	6	15	35	JbcFbzB0S0QmyyHgISNs5A==	f	f	2016-10-08 20:00:00	t	45.5686697000000009	8.05345870000000019	corso moncalieri 18 torino	45.0593807999999996	7.69436789999999959	\N	t	f	f
470	Via mosca Biella 13900	2016-10-07 21:06:29.671435	2016-10-07 21:06:29.671435	6	15	33	KFaMcaoWB18i8cNGZGQd0Q==	f	f	2016-10-10 11:00:00	t	45.571722400000013	8.06565919999999892	corso giulio cesare 10100 torino	45.0983559000000014	7.69780609999999932	\N	t	f	t
471	corso giulio cesare 10100 torino	2016-10-07 21:06:29.713211	2016-10-07 21:06:29.713211	6	15	33	xQyN8srPI1RXjvSAT3ppKg==	f	f	2016-10-10 18:00:00	f	45.0983559000000014	7.69780609999999932	Via mosca Biella 13900	45.571722400000013	8.06565919999999892	\N	t	f	t
472	Via mosca Biella 13900	2016-10-07 21:08:35.976603	2016-10-07 21:08:35.976603	6	15	33	vginY4Exsa650AN6qe/tTg==	f	f	2016-10-12 11:05:00	t	45.571722400000013	8.06565919999999892	corso giulio cesare 10100 torino	45.0983559000000014	7.69780609999999932	\N	t	\N	t
473	corso giulio cesare 10100 torino	2016-10-07 21:08:36.022458	2016-10-07 21:08:36.022458	6	15	33	AIgcwWnJ2vYzwikKFNvyNA==	f	f	2016-10-12 18:05:00	f	45.0983559000000014	7.69780609999999932	Via mosca Biella 13900	45.571722400000013	8.06565919999999892	\N	t	\N	t
474	Via Appennini molino dorino 20151 milano	2016-10-07 21:09:58.650638	2016-10-07 21:09:58.650638	6	15	32	PcVD1QuPuCBuzJdya25+ZA==	f	f	2016-10-08 15:05:00	f	45.5054747000000006	9.0935214000000002	Via italia Biella 13900	45.5686697000000009	8.05345870000000019	\N	t	f	t
448	via milano 32 vigliano 13856	2016-10-03 09:21:47.016982	2016-10-11 13:06:10.757264	6	15	34	d0KnelXbkOLE5fRROURZ4Q==	t	f	2016-10-10 07:00:00	t	45.5645359999999968	8.09474919999999898	Corso Giuseppe Pella, 10 13900 Biella	45.5543541999999988	8.03177589999999952	t	f	f	f
533	Via Adua 33 - 13855 Valdengo (BI)	2016-10-24 09:52:37.133674	2016-10-24 09:52:37.133674	6	15	22	5o5nEUogrlTgxECW9V6jxA==	f	f	2016-10-24 10:20:00	f	45.5530600000000021	8.13818000000000019	via mosca biella 13900	45.571722400000013	8.06565919999999892	\N	t	f	f
534	via pajetta cossato 13836	2016-10-24 10:11:16.291554	2016-10-24 10:11:16.291554	37	164	19	JmQqJARewC3bOFm6FpGQKw==	f	f	2016-10-24 06:00:00	t	45.5640761000000083	8.17694279999999907	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	t	f	f	f
536	via pajetta cossato 13836	2016-10-24 10:11:16.674985	2016-10-24 10:11:16.674985	37	164	19	J8DQAw/S5j2UN7z6u6zS0Q==	f	f	2016-11-07 06:00:00	t	45.5640761000000083	8.17694279999999907	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	t	f	f	\N
537	via pajetta cossato 13836	2016-10-24 10:11:16.710969	2016-10-24 10:11:16.710969	37	164	19	3VEqAOL01I2kwFKpw/bYbA==	f	f	2016-11-14 06:00:00	t	45.5640761000000083	8.17694279999999907	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	t	f	f	\N
538	via pajetta cossato 13836	2016-10-24 10:11:16.755506	2016-10-24 10:11:16.755506	37	164	19	CAAl9sefPB4Wasik6c38JA==	f	f	2016-11-21 06:00:00	t	45.5640761000000083	8.17694279999999907	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	t	f	f	\N
539	via pajetta cossato 13836	2016-10-24 10:11:16.800403	2016-10-24 10:11:16.800403	37	164	19	Vi+5mJVx/K2jCuH0BTCp+g==	f	f	2016-11-28 06:00:00	t	45.5640761000000083	8.17694279999999907	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	t	f	f	\N
541	via pajetta cossato 13836	2016-10-24 10:11:16.879264	2016-10-24 10:11:16.879264	37	164	19	vW+3jujxSzHppBMJUTXr9A==	f	f	2016-12-12 06:00:00	t	45.5640761000000083	8.17694279999999907	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	t	f	f	\N
545	Piazza M. Ferraro 14 13040 Carisio	2016-10-24 20:00:59.488724	2016-10-24 20:00:59.488724	39	189	22	hgyXesPiFEDBOlNrYhrO8g==	f	f	2016-10-25 06:15:00	t	45.4087962999999988	8.19933449999999908	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	f	f	f
546	Via Adua 33 - 13855 Valdengo (BI)	2016-10-24 20:00:59.609142	2016-10-24 20:00:59.609142	39	189	22	gh2EHWrftj0FjHvXpKK9mQ==	f	f	2016-10-25 15:30:00	f	45.5530600000000021	8.13818000000000019	Piazza M. Ferraro 14 13040 Carisio	45.4087962999999988	8.19933449999999908	\N	f	f	f
547	Via Adua 33 Valdengo 13855	2016-10-24 20:04:06.507975	2016-10-24 20:04:06.507975	39	189	22	SormEXpfVIabKXS9hgwU4g==	f	f	2016-10-26 15:30:00	t	45.5530600000000021	8.13818000000000019	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	f	f	f
548	Via Adua 33 Valdengo 13855	2016-10-24 20:05:15.720212	2016-10-24 20:05:15.720212	39	189	22	YjA7KgFy4jgKGcN1EmC1qw==	f	f	2016-10-27 15:30:00	t	45.5530600000000021	8.13818000000000019	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	f	f	f
549	Piazza M. Ferraro 14 Csrisio 13040	2016-10-24 20:07:02.063139	2016-10-24 20:07:02.063139	39	189	22	BmyOF28IPtOwsko8QJsqSg==	f	f	2016-10-28 06:15:00	t	45.4087962999999988	8.19933449999999908	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	f	f	f
550	Via Adua 33 - 13855 Valdengo (BI)	2016-10-24 20:07:02.106623	2016-10-24 20:07:02.106623	39	189	22	UoAAQjK4+E++T6fDoERxJQ==	f	f	2016-10-28 15:30:00	f	45.5530600000000021	8.13818000000000019	Piazza M. Ferraro 14 Csrisio 13040	45.4087962999999988	8.19933449999999908	\N	f	f	f
554	Piazza M. Ferraro 14 Carisio 13040	2016-10-24 20:14:02.437153	2016-10-24 20:14:02.437153	39	189	22	1w7eV4voGW8W/7pCp0/uJQ==	f	f	2016-10-31 12:15:00	t	45.4087962999999988	8.19933449999999908	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	f	f	f
555	Via Adua 33 - 13855 Valdengo (BI)	2016-10-24 20:14:02.466882	2016-10-24 20:14:02.466882	39	189	22	/eNQYx6VOSw7uE4pBGrCcQ==	f	f	2016-10-31 21:05:00	f	45.5530600000000021	8.13818000000000019	Piazza M. Ferraro 14 Carisio 13040	45.4087962999999988	8.19933449999999908	\N	f	f	f
556	Via dante 2 Biella 13900	2016-10-25 18:06:49.315316	2016-10-25 18:06:49.315316	40	139	20	HgGSZwYuhtuZcZCTkFySkg==	f	f	2016-11-02 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	t	f	f
557	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:49.441322	2016-10-25 18:06:49.441322	40	139	20	1GHDemidAQQKBDV+qfNnDw==	f	f	2016-11-02 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	t	f	f
558	Via dante 2 Biella 13900	2016-10-25 18:06:49.483512	2016-10-25 18:06:49.483512	40	139	20	8hEdUy/nYHvYC61O5ZE8jg==	f	f	2016-11-09 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	f	f	\N
559	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:49.526312	2016-10-25 18:06:49.526312	40	139	20	2fvcsb1eB38/h7RqhF+9nw==	f	f	2016-11-09 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	f	f	\N
560	Via dante 2 Biella 13900	2016-10-25 18:06:49.571408	2016-10-25 18:06:49.571408	40	139	20	1bTKtzHoB8S13lGAU5VQYQ==	f	f	2016-11-16 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	f	f	\N
561	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:49.598321	2016-10-25 18:06:49.598321	40	139	20	KWXtZ6zi8qMG13Y1pK9xvA==	f	f	2016-11-16 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	f	f	\N
562	Via dante 2 Biella 13900	2016-10-25 18:06:49.639028	2016-10-25 18:06:49.639028	40	139	20	hPf77LCp0nNrXVRTWZTi1g==	f	f	2016-11-23 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	f	f	\N
563	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:49.670008	2016-10-25 18:06:49.670008	40	139	20	VB1fT9o2PaYu3KJ2eKUbjw==	f	f	2016-11-23 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	f	f	\N
564	Via dante 2 Biella 13900	2016-10-25 18:06:49.699514	2016-10-25 18:06:49.699514	40	139	20	QJ633lIRFDb8FyKFDMo0+Q==	f	f	2016-11-30 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	f	f	\N
565	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:49.73021	2016-10-25 18:06:49.73021	40	139	20	ISQ2IfujMgn2ZcRYEM6IWg==	f	f	2016-11-30 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	f	f	\N
566	Via dante 2 Biella 13900	2016-10-25 18:06:49.762949	2016-10-25 18:06:49.762949	40	139	20	JxeBtRPvst17e7NUnqehzQ==	f	f	2016-12-07 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	f	f	\N
567	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:49.791329	2016-10-25 18:06:49.791329	40	139	20	60dh7A3LZPPGDqpPy9UNZw==	f	f	2016-12-07 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	f	f	\N
568	Via dante 2 Biella 13900	2016-10-25 18:06:49.817637	2016-10-25 18:06:49.817637	40	139	20	I6j8SBomHugbmNusNPwwtg==	f	f	2016-12-14 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	f	f	\N
569	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:49.860547	2016-10-25 18:06:49.860547	40	139	20	0V9Vv3/aEW/kW0mQy05M3g==	f	f	2016-12-14 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	f	f	\N
570	Via dante 2 Biella 13900	2016-10-25 18:06:49.897351	2016-10-25 18:06:49.897351	40	139	20	sZjYeSW1XsZloU/8vhOQFA==	f	f	2016-12-21 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	f	f	\N
571	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:49.929292	2016-10-25 18:06:49.929292	40	139	20	cyjp/bNsOIN5Rfdb5Y88+A==	f	f	2016-12-21 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	f	f	\N
572	Via dante 2 Biella 13900	2016-10-25 18:06:49.957959	2016-10-25 18:06:49.957959	40	139	20	XXdHwP3dkm5E1gklzwKmBw==	f	f	2016-12-28 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	f	f	\N
573	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:49.996943	2016-10-25 18:06:49.996943	40	139	20	wXKA/HqiHSmBE91ddSl7vg==	f	f	2016-12-28 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	f	f	\N
574	Via dante 2 Biella 13900	2016-10-25 18:06:50.028555	2016-10-25 18:06:50.028555	40	139	20	5rJ7N8tFBTBJmTsP42wXZQ==	f	f	2017-01-04 13:15:00	t	45.5689046999999974	8.0534801999999992	Via Adua 33 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	t	f	f	\N
575	Via Adua 33 13855 Valdengo (BI)	2016-10-25 18:06:50.059862	2016-10-25 18:06:50.059862	40	139	20	ee4WAAouB0WCtwX1wcb2mg==	f	f	2017-01-04 19:45:00	f	45.5530600000000021	8.13818000000000019	Via dante 2 Biella 13900	45.5689046999999974	8.0534801999999992	t	f	f	\N
580	via monte bo 44 biella 13900	2016-10-27 16:20:03.652941	2016-10-27 16:20:03.652941	5	12	7	yrvdUER0fRD4Z0IRKOJiEw==	f	f	2016-10-27 20:00:00	t	45.582637499999997	8.07154749999999943	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	f
581	via monte bo 44 biella 13900	2016-10-27 16:20:03.805949	2016-10-27 16:20:03.805949	5	12	7	fDlX2ITxcelTgf+HJVT1Iw==	f	f	2016-11-03 20:00:00	t	45.582637499999997	8.07154749999999943	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	\N
582	via monte bo 44 biella 13900	2016-10-27 16:20:03.964722	2016-10-27 16:20:03.964722	5	12	7	nnjVX2X0ebzeIPkjdpNT1Q==	f	f	2016-11-10 20:00:00	t	45.582637499999997	8.07154749999999943	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	\N
583	via monte bo 44 biella 13900	2016-10-27 16:20:03.998508	2016-10-27 16:20:03.998508	5	12	7	dO1dNqvrAHpCMoefuKES6w==	f	f	2016-11-17 20:00:00	t	45.582637499999997	8.07154749999999943	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	\N
584	via mazzini 25 biella 13900	2016-10-27 16:20:52.859367	2016-10-27 16:20:52.859367	5	12	7	lH0sTOh6vDV74k9gWQtcCA==	f	f	2016-11-15 13:30:00	t	45.5633566999999999	8.05352940000000039	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	f
585	via mazzini 25 biella 13900	2016-10-27 16:20:53.002684	2016-10-27 16:20:53.002684	5	12	7	Y59VF7BqKxbWuFDOP464ng==	f	f	2016-11-22 13:30:00	t	45.5633566999999999	8.05352940000000039	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	\N
586	via lamarmora 12 biella 13900	2016-10-27 16:34:56.443847	2016-10-27 16:34:56.443847	5	12	7	xMu5dKE5eubA9WFT8aJARw==	f	f	2016-11-08 08:00:00	t	45.5614824000000027	8.0518932999999997	45.646223, 8.017714	45.646975900000001	8.01812819999999959	\N	f	f	f
587	via mosca 4 biella 13900	2016-10-28 11:25:31.157399	2016-10-28 11:25:31.157399	6	15	38	hHbJ6TLiBCW9S9qP+ESZug==	f	f	2016-10-29 09:15:00	t	45.5717738000000026	8.06527709999999942	Piazza Innocenzo Manzetti 1  Aosta	45.7349551000000005	7.31307619999999936	\N	t	f	t
588	Piazza Innocenzo Manzetti 1  Aosta	2016-10-28 11:25:31.280338	2016-10-28 11:25:31.280338	6	15	38	RdL0OfHrghkSBWCMeM3ETQ==	f	f	2016-10-29 23:30:00	f	45.7349551000000005	7.31307619999999936	via mosca 4 biella 13900	45.5717738000000026	8.06527709999999942	\N	t	f	t
589	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:50:17.469562	2016-10-31 10:50:17.469562	36	149	19	OhPI1RGUpCnrPP9/cxtWlQ==	f	f	2016-11-02 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	\N	t	f	f
590	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:50:57.667503	2016-10-31 10:50:57.667503	36	149	19	CpMdA8CeJpEYnd1IhjNylg==	f	f	2016-11-03 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	\N	t	f	f
591	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:51:36.759913	2016-10-31 10:51:36.759913	36	149	19	BtgpMMmA1pN2asX+/JCgmQ==	f	f	2016-11-04 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	\N	t	f	f
592	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:52:23.218298	2016-10-31 10:52:23.218298	36	149	19	Eqxa2XlyjgarNcIeBT6ArQ==	f	f	2016-11-07 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	\N	t	f	f
593	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:52:57.987355	2016-10-31 10:52:57.987355	36	149	19	TAKTMg5Iw/oiN5gv8kxsqw==	f	f	2016-11-08 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	\N	t	f	f
594	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:53:36.592418	2016-10-31 10:53:36.592418	36	149	19	kjIrXmaXwT9b4LzjeMCU/w==	f	f	2016-11-09 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	\N	t	f	f
595	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:54:12.946868	2016-10-31 10:54:12.946868	36	149	19	2ObAu5xSP8BvP+8qiVzkqA==	f	f	2016-11-10 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	\N	t	f	f
596	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:55:25.597085	2016-10-31 10:55:25.597085	36	149	19	kcEGDOvJ8tpbncleKKsclQ==	f	f	2016-11-11 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 13855 valdengo	45.5530600000000021	8.13818000000000019	\N	t	f	f
597	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:58:50.358308	2016-10-31 10:58:50.358308	36	149	22	cCzh7yw5ZGeOAop76Okc9Q==	f	f	2016-11-02 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	t	f	f
598	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:59:20.776407	2016-10-31 10:59:20.776407	36	149	22	dmrzDVyy+gYWU7u7MhxU4Q==	f	f	2016-11-03 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	t	f	f
599	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 10:59:51.975887	2016-10-31 10:59:51.975887	36	149	22	kFufwJ1xc8e6QvHtrq39oA==	f	f	2016-11-04 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	t	f	f
600	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 11:01:27.545579	2016-10-31 11:01:27.545579	36	149	22	JTZ8HsRRkNP4C25trNqhRg==	f	f	2016-11-07 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	t	f	f
601	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 11:01:55.246195	2016-10-31 11:01:55.246195	36	149	22	f8Lek/OX2JyvyqsCf/3l5w==	f	f	2016-11-08 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	t	f	f
602	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 11:02:25.209963	2016-10-31 11:02:25.209963	36	149	22	Qv/uEsyBSCEL21AtUsr6uQ==	f	f	2016-11-09 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	t	f	f
603	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 11:03:20.851806	2016-10-31 11:03:20.851806	36	149	22	PhM3artPgcDXCm0cGlHBgA==	f	f	2016-11-10 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	t	f	f
604	Mercatone Uno, corso Europa 15 Biella 13900	2016-10-31 11:03:55.033298	2016-10-31 11:03:55.033298	36	149	22	WmwWK2B4ObvF7llM9OONEA==	f	f	2016-11-11 07:45:00	t	45.5510899999999879	8.07098000000000049	Via Adua 33 - 13855 Valdengo (BI)	45.5530600000000021	8.13818000000000019	\N	t	f	f
605	via giuseppe mazzini 25 Biella 13900	2016-10-31 17:46:28.411166	2016-10-31 17:46:28.411166	5	12	7	uAfW1+iWSM7km1ioX0XKmQ==	f	f	2016-10-31 22:00:00	t	45.5633566999999999	8.05352940000000039	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	f
606	Via Giuseppe Mazzini 21 Biella 13900	2016-10-31 17:47:26.053211	2016-10-31 17:47:26.053211	5	12	7	CA9PKRrqaWXZtvv2bfnDVA==	f	f	2016-10-31 20:30:00	t	45.5633114999999975	8.05367560000000005	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	t	f	f
607	Via Giuseppe Mazzini 21 Biella 13900	2016-10-31 17:47:26.197658	2016-10-31 17:47:26.197658	5	12	7	VrXbLxBs0w/nKgwCONqGFg==	f	f	2016-11-07 20:30:00	t	45.5633114999999975	8.05367560000000005	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	\N
608	Via Giuseppe Mazzini 21 Biella 13900	2016-10-31 17:47:26.34093	2016-10-31 17:47:26.34093	5	12	7	aXkvQmJS+xuI8BPMeYuayQ==	f	f	2016-11-14 20:30:00	t	45.5633114999999975	8.05367560000000005	45.646223, 8.017714	45.646975900000001	8.01812819999999959	t	f	f	\N
\.


--
-- Name: travels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('travels_id_seq', 608, true);


--
-- Data for Name: user_badges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_badges (id, user_id, badge_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_badges_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, birth_date, name, surname, genre, address, comune, prov, is_driver, is_verified, description, provider, uid, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, nickname, image, email, tokens, created_at, updated_at, role, pending_driver_verification, profile_image_file_name, profile_image_content_type, profile_image_file_size, profile_image_updated_at, car_count, device_tokens, zip_code) FROM stdin;
21	\N	Francesco Lupo Renzi	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10206139527634860	$2a$10$FC4Qly2dKOUkLdrFAZYCw.VTp8nX1frpa0ZY3asilBlsMUNMAzOxC	\N	\N	\N	8	2015-11-06 08:07:47.019414	2015-11-06 04:18:49.940985	91.252.196.50	93.40.186.195	\N	2015-11-09 16:54:17.321367	\N	\N	\N	http://graph.facebook.com/10206139527634860/picture	frarenzi@hotmail.it	{"BfKv2W96zdtlxqSEqvy1-w":{"token":"$2a$10$Jg9LxrQIm5fON7kpZTDYGOS3DC6hB7rPYP0Sm3NqAQwTY/HD30AfC","expiry":1447992985},"-WQW3jXlgNvV3tYJQmHlMQ":{"token":"$2a$10$LdeFDtzoRUBdKlRirs2UHORu4AJpGzgG.hzGS4hotiSxrfub8bHO6","expiry":1448006979,"last_token":"$2a$10$lPrqx7UJqcZA9NhWIf6aDejKOJmD1DY1n/b5PTQZjPeVv1lOrRLbO","updated_at":"2015-11-06T08:09:39.257+00:00"},"lix4nmwHghSQ3tLzxip06Q":{"token":"$2a$10$tjTlhxaVIxEWTN/5plEx5u/jCl2rKBGUGsrtablGI.is/iVQMH/E6","expiry":1448006866},"7tNhvXdfUZ-KzUDwYKTBcg":{"token":"$2a$10$EFGjGkPVSfgkJ1B9OQJIauwdxg4HelZ6zmr5EHpLDjzO.dgXjxqYS","expiry":1448293271},"MtvGK00cKYMsEo3Z0z5JSw":{"token":"$2a$10$ZPQYxt7Svndf335KzPK2H.PbjpGyVv57A90Dw0Ct/MR.mMq/nIEr2","expiry":1448293324},"pNZf7uTFoKRASuPCFkDs7g":{"token":"$2a$10$jtV4KpeWE5Uuzd55LYyfMeCw92LASqNG9ufK7AJxzQDRKG0OcNRzi","expiry":1448293333},"UAwy4XalTbhShmZ-uHMrFw":{"token":"$2a$10$fRX17Ni8Hr3LoEJizXl/v.9YPytu5n2TSajifth6yswNoUwv5AS1u","expiry":1448297164},"BxGOgOwas4lUMfl5ls-Qrw":{"token":"$2a$10$qfQN/rBPhfO2i6wx4HqeR./c/8zdJj3tg4QaF6pz8gSVmx9geqveS","expiry":1448297341},"yJmSrYhpy-BPwlk_Qm6wnQ":{"token":"$2a$10$ABAJlNZcEMFiMCmFRacuOuKqvHLmOERRq/t0C9OCbu2uSTNUoq2sG","expiry":1448753405,"last_token":"$2a$10$MoMjy7IqAA16dGqOrmikYedr.Ay9iXFpX.Jzkvr3ooj/4UwNmoFfu","updated_at":"2015-11-14T23:30:05.848+00:00"}}	2015-07-24 15:27:46.883903	2015-11-14 23:30:05.851504	administrator	\N	\N	\N	\N	\N	0	\N	\N
30	\N	Riccardo Ruggeri	\N	\N	\N	\N	\N	t	\N	\N	facebook	10153173762967613	$2a$10$HdOE2HsmghD4Pxu2DZAEZOiwbhbmSJ67VaEk.QbYsrqFtYX32BpTu	\N	\N	\N	10	2016-09-30 16:34:28.085904	2016-09-30 16:34:13.573352	5.170.4.160	5.170.4.160	\N	2016-09-30 16:34:28.08539	\N	\N	\N	http://graph.facebook.com/10153173762967613/picture	ruggeririccardo@hotmail.com	{"j4UqPdD66g2UqcykYGIpSg":{"token":"$2a$10$IICIhG7e6nizrzKhRuwfUuauCByA7g.3DDvsnb4MXQd2VE9mw0WSK","expiry":1476462717},"Rg4X7cq9l976xXkWa7Va6w":{"token":"$2a$10$4F0BN5FL.xLy7nsGXAxq6.BPefdXDd2TrLSNEW5cQs.A0hDvpltp6","expiry":1476462853},"yAc_4zNjMjjbKHLGsG71-g":{"token":"$2a$10$M/k7JtHLlfQCUaeThFAzw.x4xjA252FDgMjtvcCz.ZCYsRvCEwXXm","expiry":1476462868}}	2015-09-03 13:33:38.372897	2016-09-30 16:34:28.087849	\N	f	\N	\N	\N	\N	0	\N	\N
43	1980-01-05	marco	giusti	\N	via giulio buratti 15	Roma	RM	\N	\N	\N	email	markolin80@gmail.com	$2a$10$Oj0sIj5B7u61hE8Ki.laZ.HbTb4IROxUTmf2IFyDpFj7D3aJlRBKm	24148b3a3c0d010d3720d7f250b4adbcfd8c7f57641ab487ad6ecca168def02d	2015-10-07 13:13:12.989149	\N	0	\N	\N	\N	\N	f978928976d80c61ba4a33fd274f02bc7a4ab6f74a1b180d9eb9a717fd0a55ef	\N	2015-10-07 13:12:07.425318	\N	markolin80	\N	markolin80@gmail.com	{}	2015-10-07 13:12:07.207488	2015-10-07 13:13:12.990211	\N	\N	\N	\N	\N	\N	0	\N	\N
54	1978-08-10	valentina	ruggeri	\N	Via Milano 32	Vigliano Biellese	BI	t	\N	\N	email	ruggerivalentina@hotmail.com	$2a$10$XJqQTyuimwS8oTJ5Otk0cu6DMcEDj4JL4s73R5O1X57SXrIIhHkA2	\N	\N	\N	2	2015-10-24 15:22:10.273131	2015-10-24 15:03:17.065798	5.169.98.91	5.169.98.91	X1-ppYyCRsQFWGVikHB-	2015-10-24 10:08:23.976693	2015-10-23 18:18:23.304477	\N	Venere	\N	ruggerivalentina@hotmail.com	{"Icb3UmPCcnWhwuUVM2_f2A":{"token":"$2a$10$Gmb52aQVZfTdE13sTr5lTOriYYPVqudmQY5b6DrcnohNbTWQqommO","expiry":1446891016,"last_token":"$2a$10$YPPPiXfPhiHhtB.9qyZJvunuZoxLfsbCWgaPo1xBo5bztt5PQc7SW","updated_at":"2015-10-24T10:10:16.802+00:00"},"TBONTqetlSZ_J6zpN_sTvA":{"token":"$2a$10$7Qvy9MuZb2ewdCaDezIbfe9/Lyy1iZxXzT5JFxnTgsZcEPMh8rqwC","expiry":1446908996,"last_token":"$2a$10$o0tmzDVuUZxSOif34Sb4eel7AStHpfv3DP3GwDP.3hWUzdkoKV12a","updated_at":"2015-10-24T15:11:44.820+00:00"}}	2015-10-23 18:18:23.089951	2015-10-24 16:01:49.398608	\N	f	IMG_9486.jpg	image/jpeg	4177455	2015-10-23 18:18:26.668994	0	\N	\N
44	1991-04-12	Francesco	Renzi	\N	Via Montebianco 18/A	Biella	\N	\N	\N	\N	email	frarenzi@hotmail.it	$2a$10$qyGP2zUR1PaiH4Et2TzIQ.bcCCcTb8jCuwCxi8R7BIUxbrHaO7.cm	\N	\N	\N	0	\N	\N	\N	\N	98201e3f6414366ea3b5658da41877dc83c81f84241989671e5330924bf4ad5b	\N	2015-10-07 15:08:34.627085	\N	stograndecazzo	\N	frarenzi@hotmail.it	{}	2015-10-07 15:08:34.625311	2015-10-07 15:08:34.625311	\N	\N	\N	\N	\N	\N	0	\N	\N
49	1980-12-31	Pippo	Pippo	\N	via dante alighieri	Biella	BI	\N	\N	\N	email	pi.agareri@gmail.com	$2a$10$mzy/2MxkDNPTcgC37YFC/uao3AbqqW9N7CZLMQXdlQNmKWMQL2/oe	\N	\N	\N	0	\N	\N	\N	\N	Hxt8_nwsiNUGjYuShscz	2015-10-12 08:55:36.046625	2015-10-12 08:54:30.085771	\N	pippo	\N	pi.agareri@gmail.com	{}	2015-10-12 08:54:30.083847	2015-10-12 08:58:31.7025	\N	\N	\N	\N	\N	\N	0	\N	\N
84	\N	Christian Rossetti	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1086567341353515	$2a$10$x5345U2JC5K6n.JQFQtk7OIWKg3AxG/P6IWR31iDoG6piGYF6fVPS	\N	\N	\N	1	2015-12-13 16:45:44.857629	2015-12-13 16:45:44.857629	77.242.185.135	77.242.185.135	\N	2015-12-13 16:45:44.857197	\N	\N	\N	http://graph.facebook.com/1086567341353515/picture	chrypianoforte@yahoo.it	{"arnUxG8pR-i0UYOZI4o9Og":{"token":"$2a$10$PpXb8Vautdwp.lUSfZC6hugdDWgwPN4dWzzA/wlA.kH7gGKNVCx0u","expiry":1451235051,"last_token":"$2a$10$hRlbGgHdOPtZxeYBuWUoX.F341wP1PlvLqUkdlWtF2Q4UbxvM7kF6","updated_at":"2015-12-13T16:50:51.674+00:00"}}	2015-12-13 16:45:44.858964	2015-12-13 16:50:51.676223	\N	\N	\N	\N	\N	\N	0	\N	\N
93	\N	Cinzia Comuniello Alberica	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1138673116164360	$2a$10$8UUQ1.yD5AC/BLm6YyBsY.jkMmnzdj94T3V5ji0rOjmGJnxC7z.p2	\N	\N	\N	2	2016-09-01 07:25:41.687193	2016-03-31 14:42:09.102396	62.18.151.150	77.242.177.5	\N	2016-09-01 07:25:41.686177	\N	\N	\N	http://graph.facebook.com/1138673116164360/picture	cinzia.comuniello@libero.it	{"Ifbhhm5aKjT9NW0QQlJBgw":{"token":"$2a$10$Beyp6r31MQe0WjII30bfROpYISEhGFIXxSLaHqgnQ7qGqJ3H4O9b.","expiry":1475072569,"last_token":"$2a$10$xx/tEbGhfMJZrn2m0lMHa.vDTrSeKZmHcn8QG6zaxW4LWZW0UozHy","updated_at":"2016-09-14T14:22:49.862+00:00"}}	2016-03-31 14:42:09.103928	2016-09-14 14:22:49.864391	\N	\N	\N	\N	\N	\N	0	\N	\N
98	\N	Stefano Canella	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1172345009451653	$2a$10$IDXAUXC732SkzENWRzm9M.nKcNeuv/lvYhCBTkSv.Kzk8nXZTlyy2	\N	\N	\N	1	2016-04-08 15:54:20.07753	2016-04-08 15:54:20.07753	5.90.36.2	5.90.36.2	\N	2016-04-08 15:54:20.077057	\N	\N	\N	http://graph.facebook.com/1172345009451653/picture	ubitraiz93@yahoo.it	{"ToKpNHsS4CBsEpE2n3xyEA":{"token":"$2a$10$.8PF6PKfzvo5Xob9.JTZuuhzkKdpPnjjy5OBtudKDxG/LD0iOJy4C","expiry":1461340560,"last_token":"$2a$10$JcGrJruKJe3g5ozniPO8sOkRpzKCbdLvvS8B0uVKX7D.72tPM3MQO","updated_at":"2016-04-08T15:56:04.609+00:00"}}	2016-04-08 15:54:20.079099	2016-04-08 15:56:04.610287	\N	\N	\N	\N	\N	\N	0	\N	\N
118	\N	Gloria Magnani	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208455214930358	$2a$10$jdkj3WOJDZJe5s86Jh7LWuLGlUFsVqKCzfN1AAwfRvBYcFw24RxhO	\N	\N	\N	1	2016-06-06 13:24:44.025469	2016-06-06 13:24:44.025469	93.51.22.137	93.51.22.137	\N	2016-06-06 13:24:44.025092	\N	\N	\N	http://graph.facebook.com/10208455214930358/picture	gloriamagnani199071@gmail.com	{"tc6zPzPZrPYsikaNVCzfVQ":{"token":"$2a$10$dulJbMvZkpq6oDYdxNwUu./wY7lGI77EB8aa1gIKjO9t.UWN4XSwu","expiry":1466429092,"last_token":"$2a$10$GwmS0OnutKuTEjfD40zGVuiMzkN.6/PpERq4Uj.oZBhFEN7PWOWgO","updated_at":"2016-06-06T13:24:52.688+00:00"}}	2016-06-06 13:24:44.026859	2016-06-06 13:24:52.689946	\N	\N	\N	\N	\N	\N	0	\N	\N
138	1982-03-24	MARIA	PIAZZOLI	\N	\N	Quaregna	\N	\N	\N	\N	email	piazzoli@bonprixitalia.net	$2a$10$VHAFKFtYQvZ1G132bqnf/..YUiI1g9LtCDntQ5Zlu5X1/qFR2VZUi	\N	\N	\N	1	2016-06-17 14:34:43.253066	2016-06-17 14:34:43.253066	185.59.164.10	185.59.164.10	Yvyp9QES41a1ZGMDC7dU	2016-06-17 14:31:00.73369	2016-06-17 14:26:21.685499	\N	MARIA	\N	piazzoli@bonprixitalia.net	{}	2016-06-17 14:26:21.490076	2016-06-17 14:35:48.386293	\N	\N	\N	\N	\N	\N	0	\N	\N
50	1960-05-14	massimo	COLOMBO	\N	via d'adda 29/d	varallo	VC	\N	\N	\N	email	massimo@mcolombo.it	$2a$10$vFCThdtBc2ywvssRTdQ/X.3pnCo1kBD9JC2sSxqagQf941lfBdoUu	\N	\N	\N	0	\N	\N	\N	\N	tqTuZkD5Nx8XfKJh3sxZ	2015-10-13 15:54:35.567465	2015-10-13 15:49:15.291564	\N	massimocolombo1	\N	massimo@mcolombo.it	{"kPWj1YDh6zMyKnNfBXJM4A":{"token":"$2a$10$diaW3OKWWNQ4uOK/UL6gRegSFilgG8PEXm6VzmZXjpk7DdKqiLkDu","expiry":1445961275}}	2015-10-13 15:49:15.063181	2015-10-13 15:54:35.652053	\N	\N	\N	\N	\N	\N	0	\N	\N
100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10207915376996188	$2a$10$CQvN3gaM/NmxDf3mxCUk0exTR3amuFdzuB1bYcPIlx0IAGMEf9AX.	\N	\N	\N	1	2016-04-12 15:32:01.183256	2016-04-12 15:32:01.183256	83.103.26.39	83.103.26.39	\N	2016-04-12 15:32:01.182871	\N	\N	\N	http://graph.facebook.com/10207915376996188/picture	biblioteca@cittastudi.org	{}	2016-04-12 15:32:01.184666	2016-04-12 15:34:53.296346	\N	\N	\N	\N	\N	\N	0	\N	\N
45	\N	Riccardo Fregonese	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208094141820667	$2a$10$Vup15nyrS.esckQ5T3nDROW.Y.GZjYHfO01hxmymrKrJdvkPDVcvS	\N	\N	\N	1	2015-10-07 21:14:46.156017	2015-10-07 21:14:46.156017	93.38.106.196	93.38.106.196	\N	2015-10-07 21:14:46.155466	\N	\N	\N	http://graph.facebook.com/10208094141820667/picture	riccardo.fregonese@gmail.com	{"LW1dbHlkDQP-ufdkHFAgRQ":{"token":"$2a$10$4yNCaW/fDnHiVgLIUh2g9u8R7BlTFwYlGRI.o1UzNjdrD6vWqgjum","expiry":1445462251,"last_token":"$2a$10$T4hfXQDYCPixy9StLRGs2eSFSjL3oPnsUIrkzRI/TsPo0nICE0nrq","updated_at":"2015-10-07T21:17:31.826+00:00"}}	2015-10-07 21:14:46.157684	2015-10-07 21:17:31.827849	\N	\N	\N	\N	\N	\N	0	\N	\N
190	1996-11-10	Aurora	Bellandi	\N	Frazione ponzone 123/a	Ttivero	BI	\N	\N	\N	email	aurorab96@hotmail.it	$2a$10$LeCddhFy.YSmgotiCaUJMehV5H.lBBjIZdgbcJYP7u4voO3vkr.Zq	\N	\N	\N	1	2016-10-11 11:26:22.56693	2016-10-11 11:26:22.56693	82.90.90.54	82.90.90.54	-T7TFJGB5FkXTwhSVWPa	2016-10-11 11:23:24.128847	2016-10-11 11:20:59.817267	\N	Aurorab96	\N	aurorab96@hotmail.it	{"MHSifG8xnf42Sn96PV2axQ":{"token":"$2a$10$FytvXmDaVwdRaXuSICc3iOIzB6J22Uwrg.VrJXfNvWJMs/xI8oQuu","expiry":1477394607,"last_token":"$2a$10$ebOhoHYk5NINXD2VrTAIXOS8O2.AulUiHQbMoPpQrOFzzNi.DaDia","updated_at":"2016-10-11T11:23:28.447+00:00"},"FAJPYK_6YgW47nvftIWpFA":{"token":"$2a$10$CKQj9cJGApkZh64zB7ozcuybvUkIlx5F8756iQabcZ0MY.BysC4x2","expiry":1477394747,"last_token":"$2a$10$Y2WHjuShpZwbcOGM6UGGu.febIZydCN1.D6tHkJ/OM6F/ueelgeB.","updated_at":"2016-10-11T11:25:47.163+00:00"},"4x01p8mk3fjQhTcTHDQ-TA":{"token":"$2a$10$/FvAW4boAZmWBnkJEdm7QOwNCWL/Bh8h2WWyet02uf6B9Z7eigNCq","expiry":1477394895,"last_token":"$2a$10$qTc9YAHTzMvIlL7X8VSfluxQK/XBk1hcS8r//pAdNjX.vf6IuoJWa","updated_at":"2016-10-11T11:28:17.603+00:00"}}	2016-10-11 11:20:59.816817	2016-10-11 11:28:17.605523	\N	\N	\N	\N	\N	\N	0	---\n- 01965ebf6234e7257d1e0aa7ac9817edc6ce6b839d50e7a816e374869e987a6d\n	13835
41	1980-09-22	elena	bobbola	\N	via rivetti 50	Vigliano	BI	\N	\N	\N	email	elena@stilettoacademy.com	$2a$10$SrsYMAPIqv8.tZ16TT6ZnuL9z0C0yNfhWIH4CPqDgGXsvCy4kpA3m	\N	\N	\N	0	\N	\N	\N	\N	662bf845695bd8ccdff7db8ae0b5ce1de7b4e3859f663c393e0ef60252740ae9	\N	2015-09-29 17:11:48.447827	\N	eLe	\N	elena@stilettoacademy.com	{}	2015-09-29 17:11:48.22315	2015-09-29 17:11:48.22315	\N	\N	\N	\N	\N	\N	0	\N	\N
42	1980-09-22	elena	bobbola	\N	via rivetti 50	Vigliano	BI	\N	\N	\N	email	grooveaps@gmail.com	$2a$10$JL4.HuWArSWLQyf5q8/SveNstV9MmLwxmjTtU163P54INYdOENJ4y	\N	\N	\N	0	\N	\N	\N	\N	301f0f390f099498af1d1df5fcd97c0eec56b8ff824d4b95a8cb6e7f9c2abd82	\N	2015-09-29 17:12:17.148385	\N	eLe	\N	grooveaps@gmail.com	{}	2015-09-29 17:12:17.145858	2015-09-29 17:12:17.145858	\N	\N	\N	\N	\N	\N	0	\N	\N
99	1967-01-23	enrico	pesce	\N	via cesare battisti 4	cossato	BI	\N	\N	\N	email	enricopesce67@gmail.com	$2a$10$TBp3sWau6tQ/l26D/1JQhuoIygfqPK3YXdQBM/sx0SsQCuOk8XOX.	\N	\N	\N	0	\N	\N	\N	\N	NdJFiSMTT1mmN_NPjrBt	2016-04-12 14:19:10.455006	2016-04-12 13:57:55.15641	\N	fish	\N	enricopesce67@gmail.com	{"0TtuWxXtbX-0E53q8gTbTA":{"token":"$2a$10$g4otDIuGV3m/FahwdHMqgeLfOTUpWysHk0V0FGv0HYSZr3qVPFILa","expiry":1461680632,"last_token":"$2a$10$LvYf.dU1gAEVeXTxYZsoSuE2J2p/fSJh0xCeIYlRBwDz1Gt3OpYR6","updated_at":"2016-04-12T14:23:52.705+00:00"}}	2016-04-12 13:57:54.919787	2016-04-12 14:23:52.707375	\N	\N	\N	\N	\N	\N	0	\N	\N
90	\N	Daniele Donis	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208563316750788	$2a$10$qBYSjwEbd5HMWNxAn4r9xupN4dI7I5tl9VJpZSjePIu2rm3umgeqi	\N	\N	\N	2	2016-10-26 21:53:26.861151	2016-02-20 00:43:04.015122	94.162.23.150	151.47.133.214	\N	2016-10-26 21:53:26.860588	\N	\N	\N	http://graph.facebook.com/10208563316750788/picture	daniele@evoluzionepersonale.it	{"eH2VWNA7U49ySZQFG9OS_g":{"token":"$2a$10$0tr1eKAYmyvLG1rCMnd9fOZp7e0WFDMOYmOQENwwfAamDWXnB9vPC","expiry":1478729133,"last_token":"$2a$10$SXOaU09gUi5pl8.iZINcTeF7pMDNGCKw7z4NnSLvbXfGViQBDxAla","updated_at":"2016-10-26T22:05:33.554+00:00"}}	2016-02-20 00:43:04.017039	2016-10-26 22:05:33.556141	\N	\N	\N	\N	\N	\N	0	---\n- fPNuBfQ6DGw:APA91bHkqyMn0WUspRI7lqcyk5mRCXIr5kuchAUxpVVEyTFj31FKdlU6vir3409X_f4HEvsZVuRygxwBmNGoKQSyoeP001Z_UyOAFiyCWUKwzw5AeOYT5O9szzcvr3urB5UxJhiAFvK4\n	\N
89	\N	Agostino Testai	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208509156436905	$2a$10$/YJ3TCK0t0XQDd5AQC71me2vdJLrVTyjTFdvRlMODDKnqSMUjY3rC	\N	\N	\N	1	2016-02-20 00:42:57.997708	2016-02-20 00:42:57.997708	5.90.194.201	5.90.194.201	\N	2016-02-20 00:42:57.997158	\N	\N	\N	http://graph.facebook.com/10208509156436905/picture	agostino_testai@libero.it	{"uyJD-IECKo0BOuHb48nRBQ":{"token":"$2a$10$fGgRA3kXI3YV7.D.L0P0PO6wHS/M08uJPfY6n1eYL2S5XjRrwY0HW","expiry":1457138842,"last_token":"$2a$10$gUMnlGZ.ViROzeQSisIuMeg2dPZXN.g9oHPtTxdG6HZkZkQfuX6p2","updated_at":"2016-02-20T00:47:22.803+00:00"}}	2016-02-20 00:42:57.999524	2016-02-20 00:47:22.805182	\N	\N	\N	\N	\N	\N	0	\N	\N
24	\N	Cesare Alberti	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1879383002287529	$2a$10$l9x/6Mqfn8BtTTb6b0/6kOTUpwcuTGP9HkunI8w4NZLysnSYQiGaO	\N	\N	\N	1	2015-07-29 18:38:39.718481	2015-07-29 18:38:39.718481	93.49.203.151	93.49.203.151	\N	2015-07-29 18:38:39.718214	\N	\N	\N	http://graph.facebook.com/1879383002287529/picture	cesare.alberti@gmail.com	{"oob2bV9DGkvaaqbQfub5vA":{"token":"$2a$10$h2fmZlN2Xgx6dPaI6kdGhuOyMBinWfo14fVOYhuiLUjUpLLGVTb6u","expiry":1439404719}}	2015-07-29 18:38:39.719649	2015-07-29 18:38:39.719649	\N	\N	\N	\N	\N	\N	0	\N	\N
51	2000-10-30	Luca	Ercoli	\N	ciao	ciao	\N	\N	\N	\N	email	ercoli.luca@gmail.com	$2a$10$i8c2jnGrPvLIMFuCmXaJZOtf2ccYITmjOEZbkXLDvrq/9d8kPiRs2	\N	\N	\N	0	\N	\N	\N	\N	bda8e1545d835e7c9eba374a89ab0ab19eecb120350b772d242cdae665f401b3	\N	2015-10-21 09:09:03.994744	\N	ercoli.luca	\N	ercoli.luca@gmail.com	{}	2015-10-21 09:09:03.777441	2015-10-21 09:09:03.777441	\N	\N	\N	\N	\N	\N	0	\N	\N
18	1991-03-07	Andrea	Macchieraldo	\N	Via Monte Bo 44	Biella	BI	\N	\N	\N	email	amacchieraldo@icloud.com	$2a$10$26rnm7oyBIQW93U4H9Jwr.okshF4n5qwsXsaDOMxKxEtoSM9Monj.	Qi_1RECiVvpFgHf1WinB	\N	\N	6	2015-08-11 17:33:47.433776	2015-08-11 16:58:11.30565	93.48.235.51	93.48.235.51	fH4WiGFxZGBfdzfWh8dV	2015-07-13 20:25:37.581222	2015-07-13 20:23:05.747478	\N	macchie7	\N	amacchieraldo@icloud.com	{"af1LqncvN9AMWhk635thDA":{"token":"$2a$10$HQAewP.NytZNjpCZhXpv7ufUhYRwGtJ4Q03MAlzBJHd8mmUW.YbuO","expiry":1440523153,"last_token":"$2a$10$KjWWZLJ7OQmjMj/rXQLhtOUdvwXjdo57PjP6xo0U3btF.R0BvweR6","updated_at":"2015-08-11T17:19:14.116+00:00"},"SC2hXrl9ipfDYeEiPb-G8Q":{"token":"$2a$10$6hrlOJvO32udIBxVnvUEFuu9pW2JyOE7.V21pjGboWy4MJpiesj2.","expiry":1440524051,"last_token":"$2a$10$xuuI9bauzceke.TXk1lwIeBP29BeYupWfX7kB8KFsQC/a5RND4I56","updated_at":"2015-08-11T17:34:18.641+00:00"}}	2015-07-13 20:23:05.513888	2015-08-11 17:34:18.642885	\N	\N	63H.jpg	image/jpeg	302282	2015-08-11 10:41:39.477339	0	\N	\N
88	\N	Salvatore Arcadipane	\N	\N	\N	\N	\N	\N	\N	\N	facebook	503809789790457	$2a$10$0O9SCyNBn/4WIoSznSmC1uNnMt2ln4nhKBSY1G/2HM3yRgJsUaM9e	\N	\N	\N	1	2016-02-14 14:58:33.442849	2016-02-14 14:58:33.442849	2.40.22.235	2.40.22.235	\N	2016-02-14 14:58:33.442325	\N	\N	\N	http://graph.facebook.com/503809789790457/picture	arcatoto@hotmail.it	{"7XSgtnCvhJR-9sspt-qRTA":{"token":"$2a$10$RDCYM4JXbiwMMOyvhF1E9uqV5LBPpyOQewfMIB6chWr8H9HTaWeHq","expiry":1456948410,"last_token":"$2a$10$VXeCWDtLQ.sJGsLUQi15V.gkHoxLrZgHo5z/lSeGWIjVHniNv1vpO","updated_at":"2016-02-17T19:53:30.734+00:00"}}	2016-02-14 14:58:33.444613	2016-02-17 19:53:30.736078	\N	\N	\N	\N	\N	\N	0	\N	\N
27	\N	Gianfilippo	Caligaris	\N	\N	Biella	\N	\N	\N	\N	email	gianfilippo.caligaris@gmail.com	$2a$10$XKU8NWZKtY4hxC45AxvNh.oYt2MT5fBeTDfQHcCa/hVaiSl36zMVy	\N	\N	\N	8	2015-11-14 16:56:28.065094	2015-11-09 09:05:14.559883	93.71.18.184	93.51.141.2	eGRBq_V4jDrMG8Vth1Sc	2015-08-14 13:55:36.823791	2015-08-14 13:55:00.042936	\N	Gianfiz	\N	gianfilippo.caligaris@gmail.com	{"qsSh7CScO4S3pgtm-DJv5Q":{"token":"$2a$10$zgMuZ3USuMwVJnHEsN9.8OQN/pU4fZJCmOtHTln2V8WxF7qEAdapS","expiry":1449754892,"last_token":"$2a$10$05Odh9HOw1s1s2QKtSSDMub7pPRD.4V.kUa3cvG5FAivIU82B0Yrq","updated_at":"2015-11-26T13:41:36.339+00:00"}}	2015-08-14 13:54:59.77695	2015-11-26 13:41:36.340818	\N	\N	\N	\N	\N	\N	0	\N	\N
52	2000-10-30	Luca	Ercoli	\N	ciao	ciao	MI	\N	\N	\N	email	ercoli.luca@iisbona.gov.it	$2a$10$klZQ2s4cNTX5zQkB.DQ70OZsWSxHRxdjU7EG7PPZKkiR8/0/F1PGG	zwaWyhp1qivesy-hVAUS	\N	\N	1	2015-10-28 09:46:47.790313	2015-10-28 09:46:47.790313	151.32.84.206	151.32.84.206	266HdouFsALxVL14bruo	2015-10-21 13:54:10.21957	2015-10-21 09:12:50.192801	\N	ercoli.luca	\N	ercoli.luca@iisbona.gov.it	{"QfOzvBeiQ2dIbrbk6AaLbA":{"token":"$2a$10$OkMSlpt.deZCJ.m5g0rRiOY3fiDMUgmRrNLjFe7Ny5IdFoFjp9She","expiry":1446645286,"last_token":"$2a$10$Ew3hZAhGRQDDhOWf1mGqEeydsOlG0.ZXfGWmmqpH6pEUg6Y8JfSpm","updated_at":"2015-10-21T13:54:50.920+00:00"},"nMfl9et--FZZ4gBJhkuevA":{"token":"$2a$10$4gffTt6IHNanVH2Bjq7/iOTpBVNdLPgQUx9KUwurEvgw4DgtCaSTy","expiry":1447235325,"last_token":"$2a$10$xgGylH5OwLIj7.1oXH3M4ewNrePaO7p.HLCnL7Cltstsc3sLmLILO","updated_at":"2015-10-28T09:48:52.651+00:00"}}	2015-10-21 09:12:50.189947	2015-10-28 09:48:52.652025	\N	\N	\N	\N	\N	\N	0	\N	\N
46	\N	Marco Markolin Giusti	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208478933517304	$2a$10$zxUFF3Em4kCoAIklfwNx5e/m31R.5sU3xLaWfbUpByWCOBAEAkpfa	\N	\N	\N	1	2015-10-08 05:59:56.949164	2015-10-08 05:59:56.949164	195.45.104.203	195.45.104.203	\N	2015-10-08 05:59:56.948813	\N	\N	\N	http://graph.facebook.com/10208478933517304/picture	markolin80@gmail.com	{"yzthEG3Tq6FO-_setRFRPA":{"token":"$2a$10$OZWHJ.09TSSrvxj5.CIG7u4X3XoFZioCuefez/sUmtK8CjtqDE5yK","expiry":1445493627,"last_token":"$2a$10$ZzXwMKQB0W8wJgr6lVVshOBGWg8FrlKpq8RR1K3g.2Hhczl8Bw1wC","updated_at":"2015-10-08T06:00:27.479+00:00"}}	2015-10-08 05:59:56.950393	2015-10-08 06:00:27.480776	\N	\N	\N	\N	\N	\N	0	\N	\N
67	\N	Leo Macchieraldo	\N	\N	\N	\N	\N	\N	\N	\N	facebook	512687208908085	$2a$10$kQENoJq8NK8onYCHSOnyae9sZ.nfUK5C2/OJ5/GfBFRoSU5OQdWHa	\N	\N	\N	3	2015-12-01 22:15:45.943562	2015-11-05 12:13:28.13545	93.48.237.21	93.40.186.195	\N	2015-12-01 22:15:45.940263	\N	\N	\N	http://graph.facebook.com/512687208908085/picture	amacchieraldo@icloud.com	{}	2015-11-03 18:13:42.440095	2015-12-01 22:27:19.679929	\N	\N	\N	\N	\N	\N	0	\N	\N
101	\N	Annalisa Chiarelli	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10207685161300829	$2a$10$igl4Ez6G4t1IeylrRZFd9.LQJQKgz2NrhYzUEJo8rp/3mO/uAsN9K	\N	\N	\N	1	2016-04-13 09:02:04.846029	2016-04-13 09:02:04.846029	77.242.177.151	77.242.177.151	\N	2016-04-13 09:02:04.84562	\N	\N	\N	http://graph.facebook.com/10207685161300829/picture	chiarelliannalisa@gmail.com	{}	2016-04-13 09:02:04.847467	2016-04-13 09:06:54.423365	\N	\N	\N	\N	\N	\N	0	\N	\N
75	1954-11-25	Stefanella	Ferla	\N	Via Milano 32	Vigliano	BI	t	\N	\N	email	ferlastefanella@gmail.com	$2a$10$7X6MP2k4D8fNlg783UUu9uWzNEzF5MhmEzgcQOsROtU9va2W/Cana	\N	\N	\N	6	2016-04-28 11:59:03.15411	2016-03-14 12:40:24.073931	79.62.103.149	5.169.36.235	A87F6zr1zod-nVaiPxL_	2015-11-24 12:31:44.870183	2015-11-24 12:29:48.435298	\N	Stefany	\N	ferlastefanella@gmail.com	{"6M1ScEzjdVjodJlVxe7SmA":{"token":"$2a$10$q6sbs60bZrac4MNVW4QT7eNEWYkcMEx8Z74X9/sD0jA.M.PMlvXzy","expiry":1463054892,"last_token":"$2a$10$ocw3ziORHy/jX8kBfbXSUOHE9/tYwbtFfRzbpqAaEcb99Kh.B4qmS","updated_at":"2016-04-28T12:08:16.849+00:00"}}	2015-11-24 12:29:48.233148	2016-04-28 12:08:16.850609	\N	f	data	image/jpeg	63559	2016-03-14 12:41:21.262679	1	\N	\N
47	1953-07-28	NELLY	TOLOSI	\N	Via Trivero 6	\N	BI	\N	\N	\N	email	nellyttt@gmail.com	$2a$10$jyhcM4fF/wfmfZxdbW6EiulJcAgu9mXz3IU1vKkEeHB5G2JF3HkIu	tgsXqmYUPocVJ7Br7rGd	2016-02-03 14:50:15.782901	\N	3	2016-02-03 14:51:32.911011	2015-10-11 10:51:56.60084	151.34.243.3	151.68.181.188	7jpiysF_4zVxGysQQBEV	2015-10-08 19:59:55.590041	2015-10-08 19:59:10.160716	\N	\N	\N	nellyttt@gmail.com	{"mhTU3Ee934NErByItcNW9w":{"token":"$2a$10$bYyC2v5XFNIUfBpZOMFQIOh9zsfyg0Jpo7PQLlIrx3yPoFHwN/JEG","expiry":1455720646},"JSBSnDzStfbroqYA2kZyKQ":{"token":"$2a$10$adfVfojis.5C51kTQ6/LIO1Ja6xvmHq2XP/ZLoB8W/qimh4RprXbu","expiry":1455720692,"last_token":"$2a$10$WYq64.C405UT.VBJo7QoEOKSMcJQ79OoSvUORWShwaMaWWw9lnOIi","updated_at":"2016-02-03T14:51:33.639+00:00"}}	2015-10-08 19:59:09.869754	2016-02-03 14:51:33.641641	\N	\N	\N	\N	\N	\N	0	\N	\N
125	1985-07-27	Luigi	Manco	\N		Aradek	LE	\N	\N	\N	email	luigi.manco85@gmail.com	$2a$10$JG1Wc2U3jQl5p1KS/Gbns.t94xAPpAMqzHDcRCJDYJbENHOQ.6tcq	\N	\N	\N	0	\N	\N	\N	\N	kd8YKkREx6y7jrWNoS7r	2016-06-09 15:30:25.685703	2016-06-09 14:40:27.529736	\N	Gigi	\N	luigi.manco85@gmail.com	{"CCTJoUZULvWDFrQPonxLAQ":{"token":"$2a$10$KQVXeV16N9QsxKRCML7JIu51NM6jY7zofj8F3PNWBlx//sfrHdSdW","expiry":1466695827,"last_token":"$2a$10$fdsyzwltEDxlxGNOwNW5fO7hHzq1ieRHMZoS3.gfkT8Ydarw71MBi","updated_at":"2016-06-09T15:30:27.622+00:00"}}	2016-06-09 14:40:27.321406	2016-06-09 15:30:27.624007	\N	\N	\N	\N	\N	\N	0	\N	\N
191	1970-10-09	martina	Gariglio	\N	Via Emma e Antonio Cerino Zegna n. 6	Biella	BI	\N	\N	\N	email	m.gariglio@getaline.it	$2a$10$DjkVTsf6Tec.9Oy4D5vBtulKj64WWJxIwgokdU.EKp.JaLKCix4NK	\N	\N	\N	0	\N	\N	\N	\N	qxF6J9WidhcMg8fzy_2L	\N	2016-10-15 15:46:14.956909	\N	Marti	\N	m.gariglio@getaline.it	{}	2016-10-15 15:46:14.956466	2016-10-15 15:46:14.956466	\N	\N	\N	\N	\N	\N	0	\N	13900
163	1976-05-09	Daniele	Garella	\N	\N	\N	\N	\N	\N	\N	email	d.garella@cittadellarte.it	$2a$10$R/xxwyVRSrV3jykbUr9IQu1C3TOQBmRWS5cAJinIIQ0HsKWxZQb9C	\N	\N	\N	0	\N	\N	\N	\N	5x3Nk3yu3LYoXpcaGtAG	2016-07-13 13:59:30.168326	2016-07-13 13:43:28.529636	\N	cittadellarte	\N	d.garella@cittadellarte.it	{"nL3AQMF9nozUtSJe-P4Quw":{"token":"$2a$10$8XzrVncB.tJnQ1JsALIJpearWLqO63bx9SWtF1QWVWtOgg8ZigpIa","expiry":1469628137,"last_token":"$2a$10$w.eSGmK5WmvNfV/zWgKsw.9NwtvdVJBS5LuDkM9T/Kzv2x8BFit8W","updated_at":"2016-07-13T14:02:17.575+00:00"}}	2016-07-13 13:43:28.330127	2016-07-13 14:02:17.576243	\N	\N	\N	\N	\N	\N	0	\N	\N
192	\N	Luca Murta G. Cardoso	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10209713780338048	$2a$10$YbI9/eb.toKxdxFG1//9qeAE7SJVjgqu5MD7eE6nlLvK11lYiRTb2	\N	\N	\N	1	2016-10-17 08:21:08.7834	2016-10-17 08:21:08.7834	2.36.241.179	2.36.241.179	\N	2016-10-17 08:21:08.782785	\N	\N	\N	http://graph.facebook.com/10209713780338048/picture	luca.murta@gmail.com	{"GzL8G-xoC5NpKisrjqHeFw":{"token":"$2a$10$7Mc5T0Wa5GoJndOLwNpSKORHQRLFhsj4KknSs7S7dzbi0kPP4/moe","expiry":1477902304,"last_token":"$2a$10$1kXk/oZaejD1Lu2oXp/geOp4tAfvsFpID5rXR.kP4DdBol492Pxry","updated_at":"2016-10-17T08:25:04.791+00:00"}}	2016-10-17 08:21:08.785211	2016-10-17 08:25:04.792284	\N	\N	\N	\N	\N	\N	0	\N	\N
139	1982-07-10	Stefano	Mancia	\N	Via la Salle 1	Biella	BI	t	\N	\N	email	s.mancia@getaline.it	$2a$10$qzuZJ1rKYs0ELXXO4TluHuMhJzjDSuBsm78GUwOf5S4jv8otEOs2G	\N	\N	\N	3	2016-10-14 19:21:04.519302	2016-08-02 07:55:32.306701	151.68.27.129	151.36.40.16	cGsojc_epFYmggj1eNy_	2016-06-17 16:06:23.654764	2016-06-17 15:55:04.085444	\N	StefanoMancia	\N	s.mancia@getaline.it	{"_JbRFlMqwzPK2gc6pRYEhg":{"token":"$2a$10$b/9vd01Jz7DoWIFnOfplSO.J/GmDQsPjMRnc65WyFz/KsOBnV1AJy","expiry":1478628668,"last_token":"$2a$10$JSp1TyUBpQYnUn.0RVXiieX0o8lFN5shfH5QqEYxpLDoF4vfBbLM2","updated_at":"2016-10-25T18:11:08.775+00:00"}}	2016-06-17 15:55:04.083524	2016-10-25 18:11:08.777107	\N	f	\N	\N	\N	\N	2	---\n- eRaYiWVRw9k:APA91bG0HkWQdU_XzcTATwCuUo9XjCNlee49WoNjQRzZdyGlI0LMHeBYJoHpa0VAkkI2gZgnyBimxPB0ZKj5eqvO6MhY0vaB-3dn0vCi8hGtHUjm9ueHsOCkI8QPpNATtm50CtNCFqzT\n	Biella
48	1980-02-08	riccardo	ruggeri	\N	via milano 32	vigliano	bi	\N	\N	\N	email	riccardo.ruggeri@iisvaglio.it	$2a$10$axY4xF76XiSnASzTrO.GluNOUEFZ7DC5eU3pd.2H.MYzaNNe/8vF2	c32e4ed1a3161a6ced27fe1a57641124898f5330b666b5af1437fb26a50be751	2016-02-17 16:06:55.817658	\N	0	\N	\N	\N	\N	uzJehvyax-yzDhhm5awz	2015-10-12 08:45:51.723276	2015-10-12 08:45:21.807874	\N	ricpick	\N	riccardo.ruggeri@iisvaglio.it	{}	2015-10-12 08:45:21.599179	2016-06-06 10:55:05.488687	\N	\N	\N	\N	\N	\N	0	\N	\N
85	\N	Valentina Ruzza	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10207221397765420	$2a$10$Ph3YM8OrqFiMNXVdhwgUo.ZhW2beN8UUs5isN4w0ch5up6xdcx6uC	\N	\N	\N	1	2016-01-13 08:23:02.334598	2016-01-13 08:23:02.334598	5.90.200.87	5.90.200.87	\N	2016-01-13 08:23:02.33408	\N	\N	\N	http://graph.facebook.com/10207221397765420/picture	valentina2488@libero.it	{"9IxBcYKx3871JJHf12IV3w":{"token":"$2a$10$xPQ5hnZM18yITld5XoFwYuHhwFnYoNlTzPtG4xCPnNvAtvu.Z9J9q","expiry":1453882982}}	2016-01-13 08:23:02.336346	2016-01-13 08:23:02.336346	\N	\N	\N	\N	\N	\N	0	\N	\N
140	1960-08-22	Gianni	Dolci	\N	Via dante 26	Cossato	BI	\N	\N	\N	email	dolci@bonprixitalia.net	$2a$10$GmHaSWjJ4xu6l9NfQGiWh.Yj1/lVy7ufbHfzpNnXPuPnfSHWm.Kw2	\N	\N	\N	0	\N	\N	\N	\N	gezXgCGw_y9rYnSfFoUx	\N	2016-06-17 16:16:54.181073	\N	\N	\N	dolci@bonprixitalia.net	{}	2016-06-17 16:16:54.177423	2016-06-17 16:16:54.177423	\N	\N	\N	\N	\N	\N	0	\N	13836
72	\N	Fly Flyerson	\N	\N	\N	\N	\N	\N	\N	\N	facebook	596110450527476	$2a$10$q6c16pvLoYnd6aF9HWKSJ.4iklcPMMemJc480hQWyeGjIVLZqLl2K	\N	\N	\N	2	2016-02-16 21:20:07.060708	2015-11-16 23:01:11.176497	17.223.107.177	17.207.227.54	\N	2016-02-16 21:20:07.05966	\N	\N	\N	http://graph.facebook.com/596110450527476/picture	flyflyerson@gmail.com	{"Kix-T3YqVH9k7jJSFGDK7w":{"token":"$2a$10$66ftqZjG6y6sVadtAA/jtuWDOo8eOBhM/xajXeaB7L2lWiWYAhKsq","expiry":1456867207,"last_token":"$2a$10$SeP7MMF9h1n1ULpzZ.Y.A.V2MGbgvjAmXqb2PbDm5QjApsA3jSZRi","updated_at":"2016-02-16T21:20:08.286+00:00"}}	2015-11-16 23:01:11.177932	2016-02-16 21:20:08.287459	\N	\N	\N	\N	\N	\N	0	\N	\N
62	1979-06-01	Vanessa	Andreotti	\N	Via Perissinotto 2	Casapinta	BI	\N	\N	\N	email	svanessola@gmail.com	$2a$10$yzmGNqdq3IBdHs./zDX.ZeoZepgLLgKrVdgBlX62FO9ZMYponfZTe	\N	\N	\N	0	\N	\N	\N	\N	Go_YXvrjbyx6oiWoD9kD	2015-10-29 12:24:02.73912	2015-10-29 12:17:49.919668	\N	Svanessola	\N	svanessola@gmail.com	{"G4JyEkzB2K128q-USMS0ug":{"token":"$2a$10$uipJ.Bq.VgsgBep4HIT3B.Brd8JgoFJmiUPVvf79HZp0VPiEOfcBS","expiry":1447331063,"last_token":"$2a$10$Xj91lgQGq0r.51oP4ywRleJ3urvqIo0UbgRYoutraj4er7tqq4ZaS","updated_at":"2015-10-29T12:24:25.002+00:00"}}	2015-10-29 12:17:49.917502	2015-10-29 12:24:25.004061	\N	\N	\N	\N	\N	\N	0	\N	\N
87	1980-02-08	Openmic	Biella	\N	Via mosca 4	Biella	BI	t	\N	\N	email	openmicbiella@gmail.com	$2a$10$7YkG7CBIyt0X7TFm3CKjx.u0CZJW9mDDOpGdE6LUk/GGnQzWvmmki	\N	\N	\N	5	2016-04-14 12:23:30.17555	2016-04-06 13:52:46.196211	93.51.27.24	93.51.27.24	nriUdsTQajJ6CNv23pjW	2016-02-02 09:10:05.148641	2016-02-02 09:07:12.282553	\N	RicOpenmic	\N	openmicbiella@gmail.com	{"xXnQyofXl9hIFVKUGFWAjQ":{"token":"$2a$10$cfWBW9MgvHlLiJhLyvwXl.hsutFOrVkH3TbwvHHv/erM.0qw5vJhi","expiry":1460970698,"last_token":"$2a$10$sEH4idC67WaPQRFcJ/T3oOt6T7zXDuqO.DSlFJN9uERC/ulIGdDcm","updated_at":"2016-04-04T09:17:54.789+00:00"},"zdzXs2GnSck1POiz4kpTnw":{"token":"$2a$10$yTZSzTd6v7idloMzGmNB3uNmiIR3UABZK.Yf/JHSSlbugQtob8GYG","expiry":1461159872,"last_token":"$2a$10$3wOAHHFN5lCux9z1PgLcPutRFbcISzyjufGDnwazLEhY84Qy.FYqi","updated_at":"2016-04-06T13:44:38.019+00:00"},"CxhzqSIhHNqP9iWBBKaopw":{"token":"$2a$10$of2aFyW18ozc2NztBbbnS.zF4eWYsrwyL/e27kMJWFM3l.epY3y5u","expiry":1461164273,"last_token":"$2a$10$q3wWFsIqX57BpgJyjXIeL.J2KRh0yllvqwaCjXtdyvdNuruT6cz3G","updated_at":"2016-04-06T14:57:53.437+00:00"},"d6n83stlbZFYMjFjoPQ_Vg":{"token":"$2a$10$kJMYPEt6KBPhbFflGr7ZGOZ08Dwj/82t7iTS6Jhb9.NmnS/mW6Hym","expiry":1461846185,"last_token":"$2a$10$/ro5Fg09y44Jq1bb5.UECOMMzjiy.6bMl0ct.KHgVlbzNNbSfmymO","updated_at":"2016-04-14T12:23:05.003+00:00"},"UB9Hd3D9WqfgZ5g5pLzrmQ":{"token":"$2a$10$zaEMfviKNkaPaH.ovpcRkekfIkZ3rbpk/RPtbj07adGRD1AA1tqZi","expiry":1461852442,"last_token":"$2a$10$DGpT4m70SStGF8duLd.0nuPP2fQjUB9fpnPmLIxK2v2kF/NWbWrJ2","updated_at":"2016-04-14T14:07:25.793+00:00"}}	2016-02-02 09:07:12.04806	2016-04-14 14:07:25.794864	\N	f	data	image/jpeg	12702	2016-02-02 09:07:20.485507	1	\N	\N
63	\N	Vanessa Andreotti	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1128035487225161	$2a$10$WSZDYV1xswH16tmuwOK8LO2NICnLhwSAKrVy204w8.cYeKmjmQTSy	\N	\N	\N	1	2015-10-29 12:18:13.590185	2015-10-29 12:18:13.590185	213.26.80.210	213.26.80.210	\N	2015-10-29 12:18:13.589869	\N	\N	\N	http://graph.facebook.com/1128035487225161/picture	svanessola@gmail.com	{"qSMB9cdbf6nTfYZEASQADQ":{"token":"$2a$10$wci0fOUy5RvhpG12K9AEdOWrclNt0MM7tKG1b.VLMsfu1b27heM7a","expiry":1447330694,"last_token":"$2a$10$4Wwf0OK1GfBPso.Tg0TXy.8hN.koKA/DTH/ghmw1PBuPi3miundZm","updated_at":"2015-10-29T12:18:15.324+00:00"}}	2015-10-29 12:18:13.591441	2015-10-29 12:18:15.325042	\N	\N	\N	\N	\N	\N	0	\N	\N
106	\N	Alessandro Tomasi	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10154200202374600	$2a$10$LyLN8O3mBuNSzGqDugKgUu6yK7t8ANj1PvfCMACpiXDaUeNg6mDfS	\N	\N	\N	2	2016-06-07 08:23:02.489087	2016-05-09 11:36:54.895754	109.44.1.112	2.206.0.195	\N	2016-06-07 08:23:02.487731	\N	\N	\N	http://graph.facebook.com/10154200202374600/picture	alessandro.tomasi@gmail.com	{"z1VnEfTlFWaMgBIZvTzXug":{"token":"$2a$10$yPXwNCcsbAhIFPFLJCMBfeqEU.MInY15Af03BTBwARsoPsFGSUxIu","expiry":1466497446,"last_token":"$2a$10$RYdcAZXYOi64K0f10aqZY.P5vq8dovKC.YgQklY6jIOWztxVRmBiu","updated_at":"2016-06-07T08:24:14.425+00:00"}}	2016-05-09 11:36:54.897909	2016-06-07 08:24:14.427005	\N	\N	\N	\N	\N	\N	0	---\n- 183684d2ffe76de395c2e46fc34abc54f6149b1d19ca48272620fd4df8686812\n	\N
76	1980-02-08	Riccardo	Ruggeri	\N	Via milano 32	Vigliano	BI	\N	\N	\N	email	ruggeri.riccardo.12@iisbona.gov.it	$2a$10$uV2Llmp806IEzZIGezsUWO1UCmUjmXIXc5.F8m4HAMNLfbzURgP3W	\N	\N	\N	1	2015-11-26 13:24:04.434822	2015-11-26 13:24:04.434822	82.90.99.23	82.90.99.23	gwxKS3LAmLqYu44qh2U_	2015-11-25 11:08:59.831305	2015-11-25 11:08:11.021193	\N	Pickapptester	\N	ruggeri.riccardo.12@iisbona.gov.it	{"GjZPslBdYnpStNU45kEfdg":{"token":"$2a$10$99.cH6VTQXP1Uy4LzE/oseM2sxESBVEbgl77KhbtrGVfz2lo5b.fG","expiry":1455024205,"last_token":"$2a$10$2U29PxClwPnKZWAQBSH0HewWqrkGDu39WWSFpatm.pl18BajulcaG","updated_at":"2016-01-26T13:23:26.050+00:00"}}	2015-11-25 11:08:11.018828	2016-01-26 13:23:26.05193	\N	\N	\N	\N	\N	\N	0	\N	\N
115	\N	Giulio Xhaet	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10209674311353791	$2a$10$cyo2s7j4K7jI1u43868qxe5994EZbAcgrnI7yQXsFeIzEmR7tJ00e	\N	\N	\N	1	2016-06-04 19:24:00.324758	2016-06-04 19:24:00.324758	5.90.79.57	5.90.79.57	\N	2016-06-04 19:24:00.324345	\N	\N	\N	http://graph.facebook.com/10209674311353791/picture	giulio@madeindigital.it	{"A2WqavVUP0yI5Duu_ks9Zw":{"token":"$2a$10$J2sKAzL6ktKK2XzaHrP4nu0m.yFqIlqH4kMAF0o/O3iCv.mjogHLa","expiry":1466277859,"last_token":"$2a$10$vxf9nYSjYybSO1zulU90weaN9tJlDW1szkRgZkMdHkhGfFrOQ3eCW","updated_at":"2016-06-04T19:24:19.628+00:00"}}	2016-06-04 19:24:00.326285	2016-06-04 19:24:19.629685	\N	\N	\N	\N	\N	\N	0	---\n- 7f4351d37df3a7700530bd51d297a8124fc78399dddf384ff46d24a34d5e9b24\n	\N
193	1977-07-21	Marco	Troisi	\N	Via alme 10	Tarzo	TV	\N	\N	\N	email	vesuvio977@hotmail.com	$2a$10$U2l52BtXbVsqcqKDd3mue.xnhOS21epCBUFvMhaeNwAzL3mKpkEsm	\N	\N	\N	1	2016-10-17 12:54:37.786503	2016-10-17 12:54:37.786503	5.90.214.85	5.90.214.85	C5ZcK__jPD96RgBHpQ7Y	2016-10-17 12:53:22.046462	2016-10-17 12:50:08.501765	\N	Vesuvio977	\N	vesuvio977@hotmail.com	{"itZg4zjXdBkcBq23Dbve_g":{"token":"$2a$10$Cqbp3oREbyEllY/vnMRyu.DZJq8DsCNcS1B1.xTTjVEpLRcYP9NYm","expiry":1477918414,"last_token":"$2a$10$Y83GgLDLXVcWPA6Yhin9UukH54lNqdoR4eRiq7Pj7xLxy19zC0x02","updated_at":"2016-10-17T12:53:37.175+00:00"},"aWAsQWriX4Aaiks9aOYT6w":{"token":"$2a$10$wmmzkgGb0QoCvqFORkoy6eI2wSF2IYIgwIjqxSWg.06Y.EBTkY8oe","expiry":1477918651,"last_token":"$2a$10$QL245FuQKFEgcbdIzAjvZexN7CmiVe2fPjR5PQPo2Fbhaijeum1mm","updated_at":"2016-10-17T12:57:32.537+00:00"}}	2016-10-17 12:50:08.501224	2016-10-17 12:57:32.538871	\N	\N	\N	\N	\N	\N	0	---\n- bd1f9e053061295eb5f4893da5dbd6f166c2c458089abc29d0a975e53301225b\n	31020
32	1978-05-26	Dario	Lo Iacono	\N	via toscana, 19	biella	\N	\N	\N	\N	email	darioloiacono@inwind.it	$2a$10$Hkg.i2otT2gJII45c8Js0em85tUeQIesPat2PSShuV4tkh./1F90C	\N	\N	\N	0	\N	\N	\N	\N	97a18a457f3d5d302a7b8799f832aa7239f367f54f8bfb05a374a0437b720aec	\N	2015-09-04 08:16:56.049605	\N	dario.loiacono	\N	darioloiacono@inwind.it	{}	2015-09-04 08:16:56.047585	2015-09-04 08:16:56.047585	\N	\N	\N	\N	\N	\N	0	\N	\N
73	1991-02-07	Andres	Macchies	\N	via piave 16	biella	BI	t	\N	\N	email	a.macchieraldo@koodit.it	$2a$10$HO.E7x.k/.Xw0bgQR1haLuLRMpSNwG1MfhxxEGrbti4lVrcOZxwge	\N	\N	\N	1047	2016-09-16 14:21:23.541654	2016-09-16 14:04:09.281917	93.33.61.39	93.33.61.39	zsziuAkWJ6AQRoYn7pMV	2015-11-17 15:22:22.833182	2015-11-17 15:22:02.445349	\N	macchie	\N	a.macchieraldo@koodit.it	{"6QH2WWZ5Ol5vTT1uUGRGrA":{"token":"$2a$10$kjPoXf9vR2/Lb2fM6zWDe.SSyuqFig85QGpujm2TrMidXK6TKB9.2","expiry":1475241190,"last_token":"$2a$10$6DNV.G995Era4n4koUJ59.55aQoM.xUJlTqZ3POTpgbn.UC2HTyZa","updated_at":"2016-09-16T13:13:10.549+00:00"},"viLB_hP0faaa_Seg4bgb4A":{"token":"$2a$10$BBIb/mmZpSr0AEoT191kd.bFHN7NNC8m8vvibbW24wcreRVVQCgUu","expiry":1475241239,"last_token":"$2a$10$GgkLG6gbx8vIBco8O0jnYeWg.i66UbgT8wOLPx/xQt8pvOj8MfoZq","updated_at":"2016-09-16T13:14:01.087+00:00"},"Wc321IQ3ifjqx5z91hALHQ":{"token":"$2a$10$PMj.ZTkNp4HBk0sKNUOIwubl9Vk/NS9IP4Pdq40QMh4DoT23cpVj2","expiry":1475241967,"last_token":"$2a$10$9valvo8kKY3ITfU/.4oLPuBK1l96VaR2upIt9Xuw2gfxORWJ17L0.","updated_at":"2016-09-16T13:26:07.741+00:00"},"wOgDc536GNizFNnYAQ9sHA":{"token":"$2a$10$JQTXwg83rzgqQspvZ.D.XOtczXoDRzxOU9DFa5pWc4jyOS0TaWXMq","expiry":1475242452,"last_token":"$2a$10$ZpOF5Puu7rwK1GCiG7Ngp.e8boXDLHw1O6nUfqG1mtyG9UJquPWZG","updated_at":"2016-09-16T13:34:12.119+00:00"},"-qp4edRtnfLdjNmMfO-K4Q":{"token":"$2a$10$Ed4R3zLcHHUkm7kh8aL8y.CS9rAverLvvabPe.F75VSif6hcaQAcC","expiry":1475354517,"last_token":"$2a$10$45WDVhV3NzMLjfDtcZ9gA.weN.9Vh6DDLtEbKKTLBn3gIpNdSYlEa","updated_at":"2016-09-17T20:42:02.154+00:00"},"ML_F0N0UPGquJmvNx2Jf0Q":{"token":"$2a$10$Dq2JhLe/c.vw0VJuyoLZLu6jg48XRGrqrPrj4xRCgDgJlNuWyBCGy","expiry":1475243207,"last_token":"$2a$10$Nf5ZMt5A5c8IQlY/wbvnB.t8mxfECTSERc/z09f0olPkBIBeyh/4.","updated_at":"2016-09-16T13:46:47.273+00:00"},"Uy-mOC009hUKQy2PZz4zXA":{"token":"$2a$10$qZ9awAkF8pvzFjaBhI8yw.rsmnZq0K1wOGHb6BFpHUSiZzS163P8y","expiry":1475243222,"last_token":"$2a$10$AyC/0KFS3hZvns3b4niFTufjNWMe.uRZAwngLg2Z1LRF6yZmMqQXm","updated_at":"2016-09-16T13:47:02.340+00:00"},"NdFqM4nsc-pVyz-0MLbWjw":{"token":"$2a$10$4iUSzXrxYKH5b5IKuiepsOGY8wnaiWJdwxad7r/xPQmotZA.KG7AS","expiry":1475243224,"last_token":"$2a$10$J2KQ03nL9LrQOJyJD6oJYO0HKl4NXwSzT7a25I1z3.EHvZeph6qXS","updated_at":"2016-09-16T13:47:16.760+00:00"},"t03jeNThDcuBMdV02X9whA":{"token":"$2a$10$i26WG/H.5t7IY82Kh.Au3.US0Xlxtl61w4MrwGV.92VyuMLRTpQ.q","expiry":1475244374,"last_token":"$2a$10$aH00uZD31x2mpdOffZ8IfegSRa/xaIwXArHGQ4MSSTLwwr/snDhoW","updated_at":"2016-09-16T14:06:19.618+00:00"},"V_iUL0X3gvweb0N5bExaLw":{"token":"$2a$10$qB7lEFgun/qPeUxVCdpYR.SlNXhA6n0UqzWg.Q8LhY7zLGg3RrJ2a","expiry":1475486317,"last_token":"$2a$10$tUHK7SzN1Y1oBj3yDiFURur8HNvq7wPZEp5rSyvI3jeXpDREmiy6e","updated_at":"2016-09-19T09:18:41.381+00:00"}}	2015-11-17 15:22:02.223722	2016-09-19 09:18:41.383663	\N	f	_placeholder.jpg	image/jpeg	39071	2016-09-14 10:45:34.803449	1	---\n- 66cefae16d70ae21f7c711ec332a33420f49b0ec9c59e3db243ac8db1eea895c\n- cKqBq5--jxk:APA91bFj0tSv37pfmkefc-4A77ay5-72HQGgU0IBbKvxGQPX1lOp2OO6fGF5C13gMYjaV82I_UWywVDFlI7sKueHOnH-sGST8H9Rk36v3tTIfX5lxCvLQc7mcxgdlaY9B25qWwNVTA2U\n- fw91YvssKOk:APA91bG6DJnGMwCdPDlOMgg7fQ0X8DHQ8AM3z5ORt7GJdX6Z3gqLcGrsIlYS_c8XG1AnfI4Lq5iClRLWq-P08ubqYeemvfZIXWXkjtq1kMXlTkx4mhXZeTau8979Yi5NuAonQJL6vO2E\n	\N
35	1995-02-07	Gabriele	Rulli	\N	via Carando, 4	Biella	BI	\N	\N	\N	email	rulligabri.95@gmail.com	$2a$10$A5r/4ytQTwKJpQYQiobKfOThX1d2BKhK7ZWP4TmYFFQY2wc42IoIi	\N	\N	\N	0	\N	\N	\N	\N	182f3cc573ac252784e1e5ffde1f18775d057b0db9d81cd51ae15bda47147428	\N	2015-09-04 08:30:48.9978	\N	Gabri	\N	rulligabri.95@gmail.com	{}	2015-09-04 08:30:48.994678	2015-09-04 08:30:48.994678	\N	\N	\N	\N	\N	\N	0	\N	\N
34	\N	Dario Lo Iacono	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10206290954585582	$2a$10$o0McY7gIBnK.i.czOPTUNeAu5tZsbRL4wlNA9eq7Gt5YDIp92OfFS	\N	\N	\N	2	2015-09-07 06:59:06.755885	2015-09-04 08:29:19.571808	79.1.108.117	79.1.108.117	\N	2015-09-07 06:59:06.755171	\N	\N	\N	http://graph.facebook.com/10206290954585582/picture	darioloiacono@inwind.it	{}	2015-09-04 08:29:19.573609	2015-09-07 07:01:00.220081	\N	\N	\N	\N	\N	\N	0	\N	\N
77	\N	Miki La Centra	\N	\N	\N	Lessona	BI	\N	\N	\N	facebook	908429465917939	$2a$10$rscqK3x9refmyJ9kmUVeMuAWPSR0nt1ExnERuXDZUnD.i4.Yp4OXC	\N	\N	\N	4	2016-06-25 08:49:27.55739	2016-05-20 17:42:05.109325	77.242.190.68	77.242.190.68	\N	2016-06-25 08:49:27.556814	\N	\N	\N	http://graph.facebook.com/908429465917939/picture	miki.lacentra@gmail.com	{"GI1ZCbLE6KgBDr9tsu0RBw":{"token":"$2a$10$/lIdrW/dBm7HqAFRisOv5O.58BgtiCDOFteuwB9kwZdisquGerr7i","expiry":1468054239,"last_token":"$2a$10$2rSbZJWv88rihvbmW625d.i7kmvxdgzIxDhSmbvQ80kV9F9o5Sun2","updated_at":"2016-06-25T08:50:46.555+00:00"}}	2015-11-30 11:15:43.802072	2016-06-25 08:50:46.557017	\N	\N	\N	\N	\N	\N	0	\N	\N
141	\N	Alessandra Palmi	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10154298034743493	$2a$10$M7NecNwrqUC2gCGVpgeyxOSXyBvbHjd8kfIe/0JSQRz1v2ADujQp2	\N	\N	\N	1	2016-06-18 06:58:25.479811	2016-06-18 06:58:25.479811	77.242.184.191	77.242.184.191	\N	2016-06-18 06:58:25.479374	\N	\N	\N	http://graph.facebook.com/10154298034743493/picture	lalepalmi@gmail.com	{"e9fKStoDizu9DpfiZGU5bg":{"token":"$2a$10$ejjXBKyBniizZRtC7qcFA.4HIVtVs4sqGQb4K8ozB9FCsGBOwHafm","expiry":1467442861,"last_token":"$2a$10$g5pI/aEZbD/N2TPBhgS0eu8H1pml7dUsKzzn.SAXjzxvQu4B1N1D6","updated_at":"2016-06-18T07:01:02.084+00:00"}}	2016-06-18 06:58:25.481232	2016-06-18 07:01:02.085852	\N	\N	\N	\N	\N	\N	0	---\n- 7e7e39f5816fbcdf2a95312075c1d40e3b7207e1eddf72f4d916a63e4fa51c58\n	\N
36	\N	Gabriele Mmh Eroe Rulli	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1035408259804063	$2a$10$ypNK1pW8bvpRWFZaLzkNx.tdwKXzehHdVUFgwQoT8nRI1SF1aSyMi	\N	\N	\N	2	2015-11-16 23:34:20.672408	2015-09-04 08:31:39.143197	5.90.44.29	93.48.233.67	\N	2015-11-16 23:34:20.671875	\N	\N	\N	http://graph.facebook.com/1035408259804063/picture	rulligabri@tiscali.it	{"f9CgAbFx67xLPbfpSOiK_Q":{"token":"$2a$10$wqjbOaCf1wBxiIGW3MbMnu.UqCNyW9O/oHnQ.jyqgoL/P12EWNElG","expiry":1448926469,"last_token":"$2a$10$F28KtQq.FCQq8NXE9sAgAOrlHsIPNSinoLwAw/H/lwCLhlQjofVWq","updated_at":"2015-11-16T23:34:30.167+00:00"}}	2015-09-04 08:31:39.144303	2015-11-16 23:34:30.16825	\N	\N	\N	\N	\N	\N	0	\N	\N
33	1978-06-30	Antonio	Gareri	\N	Via Tripoli 29	Biella	BI	\N	\N	\N	email	antonio.gareri@iisvaglio.it	$2a$10$CEuaJqCLp/ZtNoSyATnHiejxEIzhX2xKG3I/KbCruRpLYeMo6mwQG	TNQ-Zy6tUxAGFsyTxW2q	\N	\N	3	2015-10-12 08:31:13.448017	2015-10-12 08:30:02.738121	79.1.108.117	79.1.108.117	ed66b9dab6c7e6c9ffe9ab02c56d7499e524e79f6093e2e6a6541de29fada998	2015-10-12 07:45:24.870399	2015-09-04 08:18:37.700266	\N	Tony	\N	antonio.gareri@iisvaglio.it	{}	2015-09-04 08:18:37.697297	2015-10-12 08:33:26.323593	\N	\N	\N	\N	\N	\N	0	\N	\N
37	1995-02-07	Gabriele	Rulli	\N	via Carando, 4	Biella	BI	\N	\N	\N	email	rulligabri@tiscali.it	$2a$10$OO8wjCkgp1bAgv7RGH2g4..66Y5zNrasOCtmax2iEFia2mKgQdNl.	\N	\N	\N	0	\N	\N	\N	\N	fd02b7f479b5911dbe18fc3685e07ea6acb9b53eb013126b997dfc663c5af114	\N	2015-09-04 08:32:59.896282	\N	Rulli	\N	rulligabri@tiscali.it	{}	2015-09-04 08:32:59.892971	2015-09-04 08:32:59.892971	\N	\N	\N	\N	\N	\N	0	\N	\N
38	1978-07-01	Antonio	Gareri	\N	Via Tripoli	Biella	BI	\N	\N	\N	email	clotilde1978@libero.it	$2a$10$Rvy8AwxBlMOmaAgL0FPX8Og8UfMOPQegbvFD2v5Avh4JB3rchjJR.	\N	\N	\N	0	\N	\N	\N	\N	486b530c324a62c50b7fd94fe6a273246f90ebac9390295df38c8a81f17e6588	\N	2015-09-04 08:38:00.888131	\N	Tony	\N	clotilde1978@libero.it	{}	2015-09-04 08:38:00.884925	2015-09-04 08:38:00.884925	\N	\N	\N	\N	\N	\N	0	\N	\N
68	1990-04-05	Ale	Nardi	\N	Via casa Mia	Biella	BI	t	\N	\N	email	rerosku@gmail.com	$2a$10$SskQCJy0aQY9TwkXqRZ.0ur2tPMY5uMagKFmt66Xi30v.4I9WO4BW	\N	\N	\N	1	2015-11-05 14:47:44.405344	2015-11-05 14:47:44.405344	93.40.186.195	93.40.186.195	qQg6EsqvY72k1JyhAqeq	2015-11-05 14:47:08.409817	2015-11-05 14:44:49.594377	\N	Rerosku	\N	rerosku@gmail.com	{"O_gC68XC3JmaxV2ilwa_7w":{"token":"$2a$10$33vG90D1bA.yC4cqxtldbewNO49gyuek/fjuljTYPNprp6MXR4ZKm","expiry":1447944432,"last_token":"$2a$10$kfMRbtW7jcZbowoqxTBD7udhqN1zB4LWL/M7a/uQW5s6L.fOK7nEm","updated_at":"2015-11-05T14:47:14.059+00:00"},"1tz_5fPOARHyZer3ndmnpw":{"token":"$2a$10$SoCnpdtlf1oXP3Qz75Knb.MKq/oWQvbLFOjuoIOta5jL4iAqTME86","expiry":1447944791,"last_token":"$2a$10$3KOW69Cx1qnPtWc1h9VCi.O.3wm8TnvMjWj7I5lBLmXaiqpCZwm96","updated_at":"2015-11-05T14:53:22.174+00:00"}}	2015-11-05 14:44:49.388565	2015-11-05 14:53:22.176096	\N	f	data	image/jpeg	19490	2015-11-05 14:48:13.826864	0	\N	\N
176	\N	Enrico Mello	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10210845810131829	$2a$10$lmDYTdOj3ClVWywk7.mOOO8TWXgUI5vE3LcUF/0dJK22D9RyIxtC2	\N	\N	\N	1	2016-09-19 14:23:20.490843	2016-09-19 14:23:20.490843	104.207.76.36	104.207.76.36	\N	2016-09-19 14:23:20.490278	\N	\N	\N	http://graph.facebook.com/10210845810131829/picture	enricomello1@gmail.com	{"SXc4pJnhMQlIG3f9t60Wyw":{"token":"$2a$10$vkc2ddsRiQCoHWctamT8BeBu/FiHem5f7Fdd53f1hbXewblqy4Rli","expiry":1475504600}}	2016-09-19 14:23:20.49274	2016-09-19 14:23:20.49274	\N	\N	\N	\N	\N	\N	0	\N	\N
189	1975-06-05	Monica	Croce	\N	Piazza M. Ferraro 14	Carisio	VC	t	\N	\N	email	m.croce@getaline.it	$2a$10$lwJzNS3wG17ZK7b0jRLG9ubZzohupfsDYMpBKePbePplIG2JUEzbO	\N	\N	\N	16	2016-10-24 20:19:26.529036	2016-10-24 19:56:52.272309	79.56.57.57	79.56.57.57	ZngYfAweKMMmuzJ_x146	2016-10-10 16:02:21.809878	2016-10-10 15:59:58.843028	\N	Moky75	\N	m.croce@getaline.it	{"bu2O0wsjvWhzt0U3GuWukg":{"token":"$2a$10$DZ7pL.RAgwgTMJKltm3LSeZB9N5lbTfOprUZM23a/QjEbJKVhj9Ay","expiry":1477935836,"last_token":"$2a$10$3Fg74I0O5aL.ptM4.lJYB.tqql9NXxrNN0g0Srhd9MPjX9Gcg4t6S","updated_at":"2016-10-17T17:44:40.989+00:00"},"3-5RGCMXTR0r3RRBhAni0A":{"token":"$2a$10$c6KyRlfyGISFGcypONx46.fXCelnBh6CaboUNWVww1s4BbV8zLalK","expiry":1477934424,"last_token":"$2a$10$JXbfABtceO/hOZ2ZGgu2Ku307rWFkxXeCVb.dQP5CbpaZ8DwkX2PW","updated_at":"2016-10-17T17:27:24.839+00:00"},"IaCB1D7S5VhwtBx-czYBEA":{"token":"$2a$10$D6WKbe/bl5eFXfZEC2sC6.eIk/3d9A3RPIf6c09r/sCVQB4HrWc3y","expiry":1477939063,"last_token":"$2a$10$9WOttNXrVMi6O5nNZFY1Ju7weQqjdkf28ERb.3KJoxOV3hHkmBRMe","updated_at":"2016-10-17T18:45:37.728+00:00"},"7tQv3754qquAF3vxlFKtbA":{"token":"$2a$10$WUKOZ7mETXvHwDYy7G2FVOUbYf5L2Qh6NOjL94chrSez7.t6NhjCS","expiry":1478011219,"last_token":"$2a$10$asutsLQGHO7cc2ujjv0JZeVnozFQbQNjuKmU8Qcl7KMka/zQqz9Bq","updated_at":"2016-10-18T14:42:01.665+00:00"},"8ITfzwTahZONDuoZXObMKw":{"token":"$2a$10$scl68L41ysSRGOjCGt50feVH9NFsWT3t1GVaQUPNHsHOVUyAUawrW","expiry":1478547839,"last_token":"$2a$10$Il3XJ1Cf6tR1Idu.RX4k0udxo8S4wQcde3wQUPIAXM4XtvDrY608C","updated_at":"2016-10-24T19:50:48.824+00:00"},"sIL10fOSnVEfM-OEqOidTg":{"token":"$2a$10$QCIT/nj3yurojsc2ibIkFOu57xCwlhnf6ueKrFFT0AtqXcy9pbh7O","expiry":1478548279,"last_token":"$2a$10$sRgEJqrlWrlrQ70M3DWGUeZTy2fNu7dRuVkzTs9erd/Pp2cms7QT2","updated_at":"2016-10-24T19:56:32.662+00:00"},"Du7n0AU7NonzL2yAdhwBvA":{"token":"$2a$10$fg5vzA7kscqPjJfTxnHNreTPscWtMR4POa2EHISZbTJ6KnSezo88a","expiry":1478549925,"last_token":"$2a$10$MIPcBZ6jdrI.uqqZsG9/rOzb8MBZlC/nE7cynLq5oCE1p0iRpFICa","updated_at":"2016-10-24T20:18:47.427+00:00"}}	2016-10-10 15:59:58.842616	2016-10-24 20:20:38.887145	\N	f	\N	\N	\N	\N	1	\N	13040
81	1970-10-31	GIUSEPPE	Aleci	\N	\N	\N	\N	\N	\N	\N	email	giuseppe.aleci@itis.biella.it	$2a$10$Bv9HN5Ben9FJJ7GkkX/sYu2/1XBnVyqSG9G/3BYbnAdtD/Lq4Z9FG	\N	\N	\N	1	2015-12-01 08:15:18.321517	2015-12-01 08:15:18.321517	151.68.1.225	151.68.1.225	ctuBHkyPCi-y2qECrnsL	2015-12-01 08:14:40.220363	2015-12-01 08:13:45.105123	\N	GiuseppeA	\N	giuseppe.aleci@itis.biella.it	{"SPd_qjUKil4wy2oa9Pg4jQ":{"token":"$2a$10$BawrzqI8CvM5tDdnQ63ZCOOcwAy75t5az0bHF2PKDFLRInfkqMwGm","expiry":1450167285,"last_token":"$2a$10$KKomCzIXVet7h438bCXNN.BAJmXXl7Wd.KQmxRjqvIJvSsvp9NfQi","updated_at":"2015-12-01T08:14:47.172+00:00"},"typpa3jwbHMRIB_kCdzp-w":{"token":"$2a$10$WBrasvjW0T9jHPydU4vRLuqK9JcrTzjweCT7pYejkX1jsmhKdqvMa","expiry":1450168620,"last_token":"$2a$10$VUf7Er9h5BmIdFys/AMSHeHysO.oKtSx7D2RWBjf7BtrpxhVohAYu","updated_at":"2015-12-01T08:37:00.993+00:00"}}	2015-12-01 08:13:44.907593	2015-12-01 08:37:00.995361	\N	\N	\N	\N	\N	\N	0	\N	\N
142	\N	Gianni Dolci	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10206668829024156	$2a$10$vkmxR12QovR7Sn6Kqimxk.Q7qWHW37M4Zcfaa4tSQToEeIvgsnDmW	\N	\N	\N	2	2016-10-18 19:02:01.383553	2016-06-18 13:23:00.51902	2.34.112.252	188.216.81.9	\N	2016-10-18 19:02:01.383017	\N	\N	\N	http://graph.facebook.com/10206668829024156/picture	dolci@bonprixitalia.net	{"ydDEv3K_rPvZHB4qtQNbBw":{"token":"$2a$10$aaFR34/jKjpbpSUygmChZ.WUgIDj.Sq.6xtnZblKP2m3Ur4nKVGYS","expiry":1478027149,"last_token":"$2a$10$OBHHavqOCwOVjPUxuQap5.6wcjRwmeusY4qL/oQJYKGIbqPmsi4P.","updated_at":"2016-10-18T19:05:49.802+00:00"}}	2016-06-18 13:23:00.520424	2016-10-18 19:05:49.803555	\N	\N	\N	\N	\N	\N	0	---\n- fLTsINbIUWc:APA91bHEvF2hL4yS-CDwYpZyJRIP7SkBGuvPPlwyjTNPWwAE6uYMfRAsG7hktoifD8zhCNEfAUMDI0JFo7QCaEkpbJ26SiZQ2iMu4gnF80qrX05pZUwD3OjYuctaNHl02T54Pe1bV6k4\n	\N
71	\N	Michele Iuliano	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1735254270027199	$2a$10$RwS2YFEpmoNy5KNHGIG4SONUcdWrwcJ719aOGNqDHJxNGKHiLHbc.	\N	\N	\N	1	2015-11-14 06:20:31.639171	2015-11-14 06:20:31.639171	5.168.88.27	5.168.88.27	\N	2015-11-14 06:20:31.638378	\N	\N	\N	http://graph.facebook.com/1735254270027199/picture	mic_iul@yahoo.it	{"bfB1b1MbpmNh0PKsNJoL-A":{"token":"$2a$10$Y8t0KAVh9dpyaczgEV6WmeW1ESOFb1H9.Es/CWfyQNLhjOoD1dTtO","expiry":1448691723,"last_token":"$2a$10$ggYEy5NgAqboMYRuU69.Ne5PIaoNyEExffsUpQd1pY3LhjS2cf/wu","updated_at":"2015-11-14T06:22:20.678+00:00"}}	2015-11-14 06:20:31.641408	2015-11-14 06:22:20.679237	\N	\N	\N	\N	\N	\N	0	\N	\N
25	\N	Elena ELe Bobbola	\N	\N	\N	\N	\N	t	\N	\N	facebook	10153588959157494	$2a$10$V/TV5cNW/Wf1Qf4rcix1meJxNaSZOoC3TXIprFJo/SEpdGjbERJQG	\N	\N	\N	14	2016-03-16 16:10:49.214665	2016-02-17 15:30:48.695828	93.51.141.2	151.38.50.106	\N	2016-03-16 16:10:49.210953	\N	\N	\N	http://graph.facebook.com/10153588959157494/picture	ilmondodimya@gmail.com	{"fRTCgV8uelDa02xdnvJWkA":{"token":"$2a$10$d9cLnLm5no3R4C2jr5d8SOnaktErt3RAWYJlp91qLfE9n/rQ18B5C","expiry":1460975469,"last_token":"$2a$10$qbTMdDMWba7Wi/5R3Qctme.lA5mXbdvLTw8EL7lEOPmEiWXTL6aIq","updated_at":"2016-04-04T10:31:09.769+00:00"}}	2015-08-07 09:10:05.425434	2016-04-04 10:31:09.770787	\N	f	data	image/jpeg	58502	2015-11-16 09:29:40.963919	0	\N	\N
96	1991-03-06	Andrea	Macchieraldo	\N	Via giuseppe mazzini 25	Biella	BI	\N	\N	\N	email	caccola@koodit.it	$2a$10$VbXcLShqDa5/b6iRu5IrZOOFeMABynljTwjzpc3vN5N5yhQnnNotS	\N	\N	\N	2	2016-04-06 14:45:37.474051	2016-04-06 14:11:01.11298	93.51.27.24	93.51.27.24	3cwHnn_dirs-XbTrCGMs	2016-04-06 14:09:58.838112	2016-04-06 14:09:36.19489	\N	caccola	\N	caccola@koodit.it	{"TDnIR-qa7HEHmR7el1vJGA":{"token":"$2a$10$d.S6pMa9/Fcm/YQRPi8irek.SWos3LfvrfDlgHzdKL6vmLyZ4wKnq","expiry":1461161569,"last_token":"$2a$10$B9WxNQ/swVF0g9CNKt46/.R2leV.UeR7ceLy8MHYZOFwGYXu8Aqr6","updated_at":"2016-04-06T14:12:49.511+00:00"}}	2016-04-06 14:09:35.986029	2016-04-06 14:45:46.278296	\N	\N	data	image/jpeg	27547	2016-04-06 14:09:44.115298	0	\N	\N
177	1998-10-27	Enrico	Mello	\N	Via G Berra 1	Valle Mosso	BI	\N	\N	\N	email	enricomello1@gmail.com	$2a$10$XHZqh6VzMbQwn7pu0AEiF.A6emcGtfHaE6H5EHbxfyNRcVQQ0MNc.	\N	\N	\N	1	2016-09-19 14:27:29.058571	2016-09-19 14:27:29.058571	104.207.76.36	104.207.76.36	JyHRMR-Y5ymGDVNigsBu	2016-09-19 14:27:01.102871	2016-09-19 14:25:12.493415	\N	Enricomello	\N	enricomello1@gmail.com	{"0oatFdVLMHA7ItwURYBtUA":{"token":"$2a$10$WuMSeneLoH713FJ2i4hYOeW7GHPcs.y.g1cJy9MuWoOozzvs8s.rq","expiry":1475504826,"last_token":"$2a$10$9YCQEL62flTj5B9b0lrBTOUY.N0Io471u60uAOAxIwYEHXCrSkygi","updated_at":"2016-09-19T14:27:12.196+00:00"},"iNzOk7NLyNqQjqN60D_CFQ":{"token":"$2a$10$c7JezuX/PrYTEHcMiGtSQezu6E.rB6IHddm/EMyzvotjVAXQM1BdG","expiry":1475504986,"last_token":"$2a$10$rIwyJ1jqxVcDFQcptqAfTO2n1ne6L1p0AYr5IXE9ylkOAhzEDzsB.","updated_at":"2016-09-19T14:29:46.531+00:00"}}	2016-09-19 14:25:12.492805	2016-09-19 14:29:46.533357	\N	\N	\N	\N	\N	\N	0	---\n- 3bc228a396ce5df9b4708355ea18f68221e56013700273c00ecfdcb851d3aa8e\n	13825
108	1975-02-04	Veronica	Confalonieri	\N	Via Cesare Lombroso 10	Torino	TO	\N	\N	\N	email	v.confalonieri@gmail.com	$2a$10$IBy8xUIDc5pcrtop0hRMTeZxuaubE15j83fDrjghr2jnWW9GUJhRS	\N	\N	\N	0	\N	\N	\N	\N	V3hbjTj_gfjq4J_Xfoye	2016-05-16 06:32:13.942018	2016-05-16 06:20:49.723139	\N	Veronica	\N	v.confalonieri@gmail.com	{"93e861EFZTNn43m95DzaXQ":{"token":"$2a$10$R1urK/uOqw5HqNgExmwbv.dSLc8T2OQ/6apcrIqS5YF2oA5qwjZDa","expiry":1464589981,"last_token":"$2a$10$bYg90.hIpOLbd8tYZd2XpewjcgMroSb/cq.3ciZGsEkJNzeZFv1ju","updated_at":"2016-05-16T06:33:01.547+00:00"}}	2016-05-16 06:20:49.522875	2016-05-16 06:33:01.548671	\N	\N	\N	\N	\N	\N	0	\N	\N
28	1991-04-13	Francesco	Renzi	\N	Via Montebianco 18/A	Biella	BI	t	\N	\N	email	rentziass@gmail.com	$2a$10$ps74GC8zEn.NoDmGyHQBh.pfNAvYFIceAiKEhZTfFl36fV6rxN6iO	\N	\N	\N	8	2015-11-09 15:40:56.158317	2015-11-05 23:53:31.236908	93.51.20.164	93.40.186.195	Cq4xhmSY-gwuyk1L-qfC	2015-08-16 00:41:37.217423	2015-08-16 00:41:18.683639	\N	rentziasssss	\N	rentziass@gmail.com	{"97UMFyaxoGmWpW2LYWzakQ":{"token":"$2a$10$f0CXxEc9fAC6ZftOXzLnT.CsUfG6/vaFltx1mbZb.dxeSrEAgWDbq","expiry":1447157929,"last_token":"$2a$10$WRW7V.8pjuTSMdFPJt458.o5jsiwqN9PFxN.PQpGLCS5AzpCpYXfi","updated_at":"2015-10-27T12:18:50.045+00:00"},"sNfMB4xx8ZBDXZ8kliYtaQ":{"token":"$2a$10$E2Yhrzf5Av6En1QgULCT1OSWj3xO8jPp5.vmv4jxPzsQM0IQc5OAG","expiry":1447977147,"last_token":"$2a$10$46rAdtXkwyg3IuVnnbNRUuTlMcVfcs6UsJ5NZEF0SolAwKujPs1sm","updated_at":"2015-11-05T23:52:27.151+00:00"}}	2015-08-16 00:41:18.385729	2015-11-09 15:41:04.664614	\N	f	data	image/jpeg	29818	2015-11-05 23:49:51.064124	1	\N	\N
143	\N	Jahela Milani	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10153549169017466	$2a$10$NOsSAwfmUISSCV1K960p0OxDGXvjclRg9WABE6b8J/zO6Ttct8vJy	\N	\N	\N	1	2016-06-19 14:31:26.957561	2016-06-19 14:31:26.957561	77.242.184.212	77.242.184.212	\N	2016-06-19 14:31:26.957188	\N	\N	\N	http://graph.facebook.com/10153549169017466/picture	jahela@hotmail.it	{"_8mJuq83O4OnxEsAz0a49g":{"token":"$2a$10$kim.lGZ8Ek35GgGFGC/YWuizukoNCTDx6YDIUgwLRGlBhOIqtn382","expiry":1467556337,"last_token":"$2a$10$xVc1K.K4WNO82hit0TUT9.NlK6PezkIs/PisRVYVC6d5AeIzcli1a","updated_at":"2016-06-19T14:32:17.004+00:00"}}	2016-06-19 14:31:26.959584	2016-06-19 14:32:17.006064	\N	\N	\N	\N	\N	\N	0	---\n- fvSF4_3jamw:APA91bFQT6lC5zwASxB15HQig0VhHNGek6OMSsipL_7ZIt9aXb7tsSfzXlcA474A4lq96JddwurVOtjEXZb9uJHo3LVKJy5rT_4o6G8D9mjjylnp7scsi8z0RT8GZ3olJ2DboNTlcwga\n	\N
39	\N	Ksenia Beatrice Semena	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1239712019377601	$2a$10$JRAriCWqh7C5GeR06NLT.e6OX1T78MFwWrJXuDfZlhIyURDR6w0mK	\N	\N	\N	2	2015-10-01 21:14:26.749755	2015-09-11 10:41:49.17183	79.43.217.226	93.63.223.66	\N	2015-10-01 21:14:26.749274	\N	\N	\N	http://graph.facebook.com/1239712019377601/picture	miraviglia@mail.ru	{"0vK8a7d7-i37GILGo9DMkw":{"token":"$2a$10$XzSzP9IMCUXh0az0B6DTLOtgJvidFIXBpmLEHNPYmQ3GvW7ce0iFe","expiry":1444943799,"last_token":"$2a$10$Kpg50jNS2f6dIXRy9gAHYusSZsos1ns9V9.YKcgC4tZ3tPDf8kUEC","updated_at":"2015-10-01T21:16:39.267+00:00"}}	2015-09-11 10:41:49.183582	2015-10-01 21:16:39.269619	\N	\N	\N	\N	\N	\N	0	\N	\N
94	1964-06-24	Monica	Serra	\N	Via repubblica 21	Ronco biellese	BI	t	\N	\N	email	monicaserragamba@gmail.com	$2a$10$eNz5R83j/Oi3s7bNiAkqkeQR4VJ675teTe8JIt/l5rTlLkidJAWhm	\N	\N	\N	5	2016-04-05 15:21:13.300613	2016-04-05 08:47:43.73231	5.90.38.108	5.90.38.108	DTuejxQEHyyNtRxgHQaq	2016-04-05 07:56:29.651645	2016-04-05 07:52:16.848903	\N	Moki	\N	monicaserragamba@gmail.com	{"ZxN-admVfkNliM1h-uvNdQ":{"token":"$2a$10$iQet6TviUlLGotauxkRkR.pucw5V1kOEGdNX94F3k6Untwvp/.4L.","expiry":1461052589}}	2016-04-05 07:52:16.62452	2016-04-05 15:21:45.61164	\N	f	\N	\N	\N	\N	0	\N	\N
102	1980-06-06	Ele	Bobbi	\N	Via rivetti 50	Vigliano	BI	\N	\N	\N	email	ilmondodimya@gmail.com	$2a$10$Wc9fOTAemQsptnMRJYx1DOSSbwOYgIntrRZ7/WhPPM77SqFoigDrC	\N	\N	\N	1	2016-04-18 10:36:24.454958	2016-04-18 10:36:24.454958	5.90.203.137	5.90.203.137	R3KkW6tm_scVsR11zDBK	2016-04-18 10:34:53.549123	2016-04-18 10:31:34.826046	\N	Ele	\N	ilmondodimya@gmail.com	{"aKx4zL5UC09xdmDgdP7Rkg":{"token":"$2a$10$VR/iaVq.lP3UjZd8N93YIe8Zg8NCgECCDlvXRUSqISjpTRB/IAey2","expiry":1462185822,"last_token":"$2a$10$qzz340N8ZVTqrUhGHJMGQeyKcumPYFGf6CvZSR9ukDmiL5W7fpcbK","updated_at":"2016-04-18T10:43:42.649+00:00"}}	2016-04-18 10:31:34.617263	2016-04-18 10:43:42.651035	\N	\N	\N	\N	\N	\N	0	\N	\N
130	1992-06-08	Sonia	Fabozzi	\N	Via castellengo 34	Candelo	BI	\N	\N	\N	email	sonia_fabozzi@hotmail.it	$2a$10$oYao3mH/EdDmEZMiG86vGO.CvOIjdq17EbzDeogekvdfqy6W400le	\N	\N	\N	0	\N	\N	\N	\N	_CsYk6SxnAzd8wqjpYRu	\N	2016-06-10 17:05:06.666993	\N	Ninni	\N	sonia_fabozzi@hotmail.it	{}	2016-06-10 17:05:06.470581	2016-06-10 17:05:06.470581	\N	\N	\N	\N	\N	\N	0	\N	\N
55	\N	Federica Pizzato	\N	\N	\N	\N	\N	t	\N	\N	facebook	10207055165971663	$2a$10$WAbCvtD7UtJQKtoMVlkWYOr6S9metiu/19fuhq5.wRFZzJkawRQPS	\N	\N	\N	6	2016-06-08 17:45:22.820195	2015-10-24 15:30:23.77948	93.50.209.82	62.18.129.205	\N	2016-06-08 17:45:22.819629	\N	\N	\N	http://graph.facebook.com/10207055165971663/picture	federpizza@libero.it	{"skQP9L1CNz4J3Q1rFMDiQQ":{"token":"$2a$10$YMSusCSBfW8Un.p4dP6KUenOS8YEH07mb4aRhsavI0QcVcypTccAG","expiry":1468686967,"last_token":"$2a$10$qZj1TiKAL6VDfXF9e9BQI.yjDkVE4tWKnj2Yo8lmUi4SdHkMN.7Ca","updated_at":"2016-07-02T16:36:11.656+00:00"}}	2015-10-24 08:11:56.7684	2016-07-02 17:47:52.824832	\N	f	\N	\N	\N	\N	0	\N	\N
152	1979-01-03	Katia	Canova	\N	Via Adua 33	Valdengo	BI	\N	\N	\N	email	canovak@getaline.it	$2a$10$EZyRfZ3rHJPfJgXWvCvHTeuN3AYWaUozQTyynUPJl07bcMn0Ijoou	\N	\N	\N	0	\N	\N	\N	\N	S3aG9xP9z9j4PaQmS-or	\N	2016-06-28 10:25:37.754682	\N	La Key	\N	canovak@getaline.it	{}	2016-06-28 10:25:37.551126	2016-06-28 10:25:37.551126	\N	\N	\N	\N	\N	\N	0	\N	13855
131	1953-01-01	Diana	Cave	\N	via P. Gobetti 1	Biella	BI	\N	\N	\N	email	missdianait@yahoo.it	$2a$10$v92uXXqum6no2u1xNK9hv.kVv0ZWpAna5Es32Bdm4vnMiWxXq0vHK	\N	\N	\N	5	2016-07-01 23:31:02.426188	2016-07-01 11:38:05.109093	93.35.201.127	93.38.113.212	NQREgBkAzkrN_WzDQE-e	2016-06-13 08:12:37.052557	2016-06-13 08:05:18.364159	\N	missdiana	\N	missdianait@yahoo.it	{"F0zw49ofi_d_ROZI-1QW8g":{"token":"$2a$10$/gHJa74W6rmyt7isEwUUjewFsk9g06APyTWbmOdv1x0JyCYV71LIe","expiry":1468356592,"last_token":"$2a$10$oXXmnLN1NckTK/6ww5LwV.hv.I1CweoIwJbZp9Pkn.ikPVxHj1qrm","updated_at":"2016-06-28T20:49:52.932+00:00"},"9wkfnl1lS5O7cVKH9-cCwg":{"token":"$2a$10$zKa0zORfknDQH27uDnVgb.qRvDhLmT99lr9rhafQws9knNkp0bX92","expiry":1468606702,"last_token":"$2a$10$NIe4ZIl8Knb2Bu.3joeRQO8SxuVWNz35GWBoUnnFzrRjJ/MOi11bS","updated_at":"2016-07-01T18:18:22.544+00:00"},"eCrYdd7LKADQKB-FO1zKwg":{"token":"$2a$10$UDUD4bQTePkJEjOghpjsNOj50qP6X1Q/KQoSJ4zyDVBU5rpEaDYw6","expiry":1468600045,"last_token":"$2a$10$sHY1MwQATTKj3BQVJXM3MuviwiIjmdCr1Ijo2pKPIYCSWuETarWWi","updated_at":"2016-07-01T16:27:25.206+00:00"},"UqmzjS2TAy0fUkwIHJE_sw":{"token":"$2a$10$ojN9MpZHBLPF2TL8vz/N6eafrCGRSYIGEIKvNebp8FyPwBc0jdBT6","expiry":1469190805,"last_token":"$2a$10$hNIc8smDePaOt/hsxSXgye5gBvR6PcLXfvCmpDch5v6x4TLMe8tSu","updated_at":"2016-07-08T12:33:25.386+00:00"}}	2016-06-13 08:05:18.151099	2016-07-08 12:33:25.387729	\N	\N	\N	\N	\N	\N	0	---\n- fhhWECRBQgY:APA91bGKutsbOe-BjEDKqTcX8z5QZmkFfnGPlLhbVvY6nzerq4lOpVZhesjhf2xouJ-0_1KMyEmIzGvbaBdsZa9tcGqjfeG96SVGx7lZXIvHR01Hrwc0QD171YkJM90YnB2qyRYiNbBz\n- dzDVFsu8vXE:APA91bEGPLoO2Gc5X83awXaBGBEpk3B_Qz9RtVvygw5MGdd-o0l0R1qESr3Rv7YCeEMW7jaaejhvctp5uuzovs8ELFNGUSv4RqJCMYneZAvQGwRh5W5H5PikgCkednvzTWTD_IhLhnQn\n	13900
56	1994-02-01	Francesco	Renzi	\N	Via Giuseppe Mazzini 25	Biella	BI	\N	\N	\N	email	rentziass@dominio.it	$2a$10$A/drkC/wD5dm1tGg93Hk8ecqQk6mHCxTtdH5FyeJG6fNT4ksbuTNi	\N	\N	\N	0	\N	\N	\N	\N	95a5dfb92f46f13f6537d700aa0c590e1a687972ed8e3efca2f41fd68ae448c4	\N	2015-10-27 13:48:15.446841	\N	kajsndfkjn	\N	rentziass@dominio.it	{}	2015-10-27 13:48:15.239542	2015-10-27 13:48:15.239542	\N	\N	\N	\N	\N	\N	0	\N	\N
107	1978-08-10	Valentina Ruggeri	\N	\N	Via Milano 32	Vigliano Biellese	BI	t	\N	\N	facebook	10209539875277277	$2a$10$d86AnB0qT5RZjM8k4V35P.8tE5kLvEvs0PM7okt4Cstlttj.jmmkO	\N	\N	\N	17	2016-10-22 16:34:10.91949	2016-09-29 11:37:49.506261	79.62.103.149	213.218.53.133	\N	2016-10-22 16:34:10.918311	\N	\N	\N	http://graph.facebook.com/10209539875277277/picture	ruggerivalentina@hotmail.com	{"-zm2hCHRsbitnKyqJYXv_Q":{"token":"$2a$10$SurGYXQmzBXM8Q6zSZeuI.zV.pRROEdwpZKk7nnkvpqBlbPxVV/pq","expiry":1478363784,"last_token":"$2a$10$JhyNiKDdCiUiUqVbQMoyuegRtMaXphrOw/WEIgh1Fq.axW7P7DX7i","updated_at":"2016-10-22T16:36:24.701+00:00"}}	2016-05-09 20:28:01.331216	2016-10-22 16:36:24.702865	\N	f	\N	\N	\N	\N	1	---\n- f7a3f6bab32a7e4e93806995913f9d96edc1a16973003837ae46fc1960133e81\n	\N
153	1979-01-03	Katia	Canova	\N	Via Adua 33	Valdengo	BI	\N	\N	\N	email	k.canova@getaline.it	$2a$10$IdFRy3.cHoA5tbYeNJaGOeL1WQpabeZKiXUewEmVDFj6jVGws6Z8S	\N	\N	\N	0	\N	\N	\N	\N	T9caNQysokuvKSQzYzzS	2016-06-29 07:04:42.379438	2016-06-29 06:57:34.630911	\N	La Key	\N	k.canova@getaline.it	{"16x__0vTYFUZA8XfR3i9-w":{"token":"$2a$10$SkwSSjcAuQNFzeI8VrTK4.tP/akpWv0S7CtumuunvkxPV6DV3l44a","expiry":1468403517,"last_token":"$2a$10$vZoNwhSC4KuZv0g8GHhIjeGUCbZuRGtW6v5gVgZ84X3UrV3QfWW9e","updated_at":"2016-06-29T09:51:58.109+00:00"}}	2016-06-29 06:57:34.383485	2016-06-29 09:51:58.110185	\N	\N	\N	\N	\N	\N	0	\N	13855
116	\N	Martina Masserano	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1116179478442473	$2a$10$Gk.5Mnmk2A5zs8Ld.wpI5e1N6986OXC1XVmLWOJi9lnDM23iaico6	\N	\N	\N	1	2016-06-06 12:23:08.99007	2016-06-06 12:23:08.99007	151.47.166.63	151.47.166.63	\N	2016-06-06 12:23:08.989469	\N	\N	\N	http://graph.facebook.com/1116179478442473/picture	metal.m98@gmail.com	{"6IXR57sF48B8zWUfhGefCg":{"token":"$2a$10$MZ1Nefvo1zrCfj0pyyoAxucREj2yIxWXRvxzW.VUaw5ggO18rpwg2","expiry":1466425438,"last_token":"$2a$10$0YQh9Sfahtdd4YwfPw0wtOjDMqvh3NPujvetgcsQXDmpPLPrGhPdK","updated_at":"2016-06-06T12:24:17.612+00:00"}}	2016-06-06 12:23:08.991987	2016-06-06 12:24:17.613418	\N	\N	\N	\N	\N	\N	0	\N	\N
64	1991-03-06	Andrea	Macchieraldo	\N	Via monte bo 44	Biella	BI	t	\N	\N	email	a.maaa@koodit.it	$2a$10$TFifrmOs83dWyxwYdLdJO.xeDidGrhlMHmtxP7zAdiq48DwabztCG	\N	\N	\N	1	2015-11-02 18:05:44.89005	2015-11-02 18:05:44.89005	93.40.186.195	93.40.186.195	xUAJfMeREfm2Bp74LGgk	2015-11-02 18:05:27.658772	2015-11-02 18:05:13.674527	\N	Makks	\N	a.maaa@koodit.it	{"SCCeEwQIg8WrZuDFzGScjg":{"token":"$2a$10$W2VeMYuJN0xlfa9rhZbjgO4QR32pjHxUjAVN/SBIe3AnVJd1vNd4i","expiry":1447697129,"last_token":"$2a$10$NN0qQU1OXgSThwiZcz2CGOTYKgvqydktmrjsMykVNsw73/hSVUA0.","updated_at":"2015-11-02T18:05:29.871+00:00"}}	2015-11-02 18:05:13.45822	2015-11-02 19:29:47.307526	\N	f	data	image/jpeg	25964	2015-11-02 18:05:58.409208	0	\N	\N
92	\N	Lucio Mina Giambollo	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208744273474071	$2a$10$z4YA6e0mYNyAQB1fmKQdVOVlkaUSSHgH5QtaOmxiCFz8A1wQ0kzH6	\N	\N	\N	1	2016-03-10 14:36:02.958041	2016-03-10 14:36:02.958041	195.232.147.117	195.232.147.117	\N	2016-03-10 14:36:02.957531	\N	\N	\N	http://graph.facebook.com/10208744273474071/picture	lucio.minagiambollo@vodafone.com	{}	2016-03-10 14:36:02.959699	2016-03-10 14:39:17.003531	\N	\N	\N	\N	\N	\N	0	\N	\N
154	\N	Diego Vannini	\N	\N	\N	\N	\N	t	\N	\N	facebook	10210283337430309	$2a$10$X0Qj2RSWpnutYQhmrzOVT.cxRXYqYuJuJ0eiElMjp7yJAcDUL7LhS	\N	\N	\N	2	2016-07-01 12:09:47.359442	2016-07-01 08:56:04.325423	81.174.2.173	93.147.0.201	\N	2016-07-01 12:09:47.358855	\N	\N	\N	http://graph.facebook.com/10210283337430309/picture	diegococker@gmail.com	{"GnwOkGlQVHzd7McS0r8K1Q":{"token":"$2a$10$PRS/xKSllCFyTZyy/ROl0.AD.zMZzEk2CHmxrUe7tIv8lJzx6OHce","expiry":1470668068,"last_token":"$2a$10$cTTdKkcdRwio8llKnNyA3e8hqP3pLnLcrBXA5UaPfxsIq9MhDTiDm","updated_at":"2016-07-25T14:54:31.504+00:00"}}	2016-07-01 08:56:04.327091	2016-07-25 14:54:31.505461	\N	f	\N	\N	\N	\N	1	---\n- eX42f85Wjw0:APA91bEa-hudT9P6JR-TWwRAwH_XbdW67WONezUUWVZsj1UZHroRP87PADpyyG8RY-pd959m2ZySzFeaXNNeWQ3s9QPr3oAuRDgyeLanRKZjASskSTsCQ3CrlEpmQE9pGdaLVMYuNz-y\n	\N
59	1991-03-06	Andrea	Macchieraldo	\N	via monte bo 44	Biella	BI	\N	\N	\N	email	a.maks@koodit.it	$2a$10$63XcEip6lb4I29Mdff43Z.3MCnoPTWpIV0AtVsp1zBDlCfZowYAq2	\N	\N	\N	0	\N	\N	\N	\N	2af973b35ab0243f5205cf1f22bae021f6f4c6d827ac57cffaea7ff833f5ce58	\N	2015-10-27 14:39:15.285219	\N	macchie	\N	a.maks@koodit.it	{}	2015-10-27 14:39:15.283377	2015-10-27 14:39:15.283377	\N	\N	\N	\N	\N	\N	0	\N	\N
61	1991-03-06	Andrea	Macchieraldo	\N	Via monte bo 44	Biella	BI	t	\N	\N	email	ksjd@koodit.it	$2a$10$2LJtiEXAfGrBbzow2PS5le8GmvN2JO0x.5IEJXWrYTv9N1Q5Oy42y	\N	\N	\N	0	\N	\N	\N	\N	xJVe_HmxxYiLpvdA2Wy7	2015-10-27 16:24:12.234176	2015-10-27 16:24:03.033437	\N	Macchie	\N	ksjd@koodit.it	{"fO1Qey8XxKaidTMp7B2F7w":{"token":"$2a$10$gy6rDvPSjCK/Bqh11lVeo.0FTzgYB3/.1a/WoIWtcyysK599T.EeO","expiry":1447172653,"last_token":"$2a$10$HAxHfm37wjRpn4o3Gz00OOl2GPTM2qT.f9DUBK4eiAmy7Pyvhh9wq","updated_at":"2015-10-27T16:24:14.578+00:00"}}	2015-10-27 16:24:03.030247	2015-11-02 15:51:54.858327	\N	\N	data	image/jpeg	36229	2015-10-27 16:24:05.643392	0	\N	\N
60	1991-03-06	Andrea	Macchieraldo	\N	Via monte Bo 44	BI	BI	t	\N	\N	email	a.macchieraldoaa@koodit.it	$2a$10$BzXW6T2uanUPGC37uRtX6.JoOzy9PyjixTjg8uN32hb/WupaCCjT6	\N	\N	\N	0	\N	\N	\N	\N	14e8611728de7d195d140ed17bcf8938d6456631fdf27d9d636b1f6c0e7a4c86	\N	2015-10-27 14:47:54.92834	\N	Macchie	\N	a.macchieraldoaa@koodit.it	{}	2015-10-27 14:47:54.9266	2015-11-02 15:53:40.83197	\N	\N	\N	\N	\N	\N	0	\N	\N
178	1960-05-07	Antonella	Michelone	\N	Via S di Collobiano 4	Vercelli	VC	\N	\N	\N	email	folin.c@libero.it	$2a$10$DJ9atSa1rX7QBOy8DrUM2u9Gzmt1PYhLuaupT8etQXXkWlYKgteZ2	\N	\N	\N	0	\N	\N	\N	\N	WWN42JTMP2T3XEXzL6Zz	\N	2016-09-21 08:56:20.248256	\N	Antonellatotone	\N	folin.c@libero.it	{}	2016-09-21 08:56:20.247732	2016-09-21 08:56:20.247732	\N	\N	\N	\N	\N	\N	0	\N	13100
119	\N	Stefano Ferrari	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10209669729330166	$2a$10$4h21LxXFdq90tKQCK1nxqeA.LlPplX9E9eLhDGyPD6S9rz8qeYsmO	\N	\N	\N	1	2016-06-07 09:53:38.591566	2016-06-07 09:53:38.591566	2.34.110.236	2.34.110.236	\N	2016-06-07 09:53:38.591171	\N	\N	\N	http://graph.facebook.com/10209669729330166/picture	stefanoferrari.1992@gmail.com	{"Pp5r2KMIrzwspCWgJVwawQ":{"token":"$2a$10$OcQ1P82fIqVjS7JGf5TQNOo9LNvqOoc/g7.uG5YAMkVosJLajnOCW","expiry":1466502990,"last_token":"$2a$10$WbtjzsbZfl3tAZb.UMB8E.1xSLeWU8hbgyqQZwzIEKD/86rpQykBu","updated_at":"2016-06-07T09:56:34.581+00:00"}}	2016-06-07 09:53:38.593077	2016-06-07 09:56:34.582686	\N	\N	\N	\N	\N	\N	0	---\n- 05d160bbdeec9abf157f5f6fcf9ac19b0106c95315139d84d1fb8a8f7cac4117\n	\N
65	1992-03-24	Pietro	Perona	\N	Via bozzalla 16	Pollone	BI	t	\N	\N	email	pietroperona@gmail.com	$2a$10$lWiD51HBYRam48jsFRD5B.2qYHAvvcCR.UOpDUtoqh062H3W/tk9C	\N	\N	\N	3	2015-11-03 16:56:19.738333	2015-11-02 18:24:08.493001	93.40.186.195	93.40.186.195	adb25bb8a1e5fd0162eaa1dc0f7c0c491b64adbed69a1ce5a607a89db47880ad	2015-11-02 18:19:18.614083	2015-11-02 18:16:31.232292	\N	pippi	\N	pietroperona@gmail.com	{"1WdFgIueWfJKjZWbw3Bt2Q":{"token":"$2a$10$qSAKQUdl7x5vU7LmVXtsHOIQsc8KYMc2.owkgQhMjqbWWvtD0wa6G","expiry":1448873398,"last_token":"$2a$10$Ci4tEQXUSpa.z1mnNa4YmudMvp7YibKg2TfxmPX25wIem5cfip4LS","updated_at":"2015-11-16T08:50:00.627+00:00"}}	2015-11-02 18:11:21.93343	2015-11-16 08:50:00.628009	\N	f	data	image/jpeg	26240	2015-11-03 16:57:07.948893	1	\N	\N
170	\N	Roberta Mosca	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1043800302402043	$2a$10$EgO1R9qTTg6X7zsXpRMLtuqXnDEml/9QeH36sROtMMm/RcOVaqeBm	\N	\N	\N	1	2016-08-26 17:52:09.27338	2016-08-26 17:52:09.27338	77.242.184.123	77.242.184.123	\N	2016-08-26 17:52:09.27261	\N	\N	\N	http://graph.facebook.com/1043800302402043/picture	bebamosca@gmail.com	{"p3S-nwfHQS6wvQytGhCYDw":{"token":"$2a$10$LLiu3WEabQQTeKtnvAPsteBW8uHtFtR8HZHcXHTTPnbspRRZmgEPW","expiry":1473444240,"last_token":"$2a$10$HdTZixB7SOUHkIknvhotcul5EuTTY0FF0B7z5xUVK58ol3nCeQlQa","updated_at":"2016-08-26T18:04:00.534+00:00"}}	2016-08-26 17:52:09.276041	2016-08-26 18:04:00.536818	\N	\N	\N	\N	\N	\N	0	\N	\N
117	\N	Sara Pella	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10153632231653263	$2a$10$9ySuVzBmiehOG4Q1Zdz3a.jGLZVTGQHlAsPwqHn2pzYV88.L5jk1e	\N	\N	\N	1	2016-06-06 13:16:49.784622	2016-06-06 13:16:49.784622	79.54.66.140	79.54.66.140	\N	2016-06-06 13:16:49.784206	\N	\N	\N	http://graph.facebook.com/10153632231653263/picture	sara.pella28@gmail.com	{"7e8nwUCa_aSUfL85KW-mGw":{"token":"$2a$10$cbUFUrQG6p/1rr9Sk6W5mOfFV72qfFmPegf0lUzZFPseaNimjSW7G","expiry":1466428827,"last_token":"$2a$10$O70jsZzcSvjkxMaE5dcPq.VAZ68kGdDieoSQtH7N.zhu2Diyv.saO","updated_at":"2016-06-06T13:20:27.910+00:00"}}	2016-06-06 13:16:49.786175	2016-06-06 13:20:27.91191	\N	\N	\N	\N	\N	\N	0	\N	\N
126	1991-03-06	Andre	Macchie	\N	Via monte bo 4	Biella	BI	t	\N	\N	email	123@koodit.it	$2a$10$3iusQXhLQvfrQ3sQv688kOHL3DjRGurjs/fF42KakBuz8jU9rcO6e	\N	\N	\N	2	2016-06-09 16:25:01.949122	2016-06-09 16:00:15.08662	5.90.14.103	93.33.53.115	M9H4pBo8kw6kkP84R2um	2016-06-09 15:59:50.29292	2016-06-09 15:59:33.909647	\N	Mkk	\N	123@koodit.it	{}	2016-06-09 15:59:33.707632	2016-06-09 16:29:54.46135	\N	f	\N	\N	\N	\N	0	\N	13980
109	\N	Gianfilippo Caligaris	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10209152262834615	$2a$10$AQiU1yk/mr4Rq67zXc2rguX4bqQe.5QqhDWsNlKOAAaOGsj/GntEa	\N	\N	\N	2	2016-07-02 15:26:41.830618	2016-05-20 10:57:21.480281	91.252.196.236	91.253.48.99	\N	2016-07-02 15:26:41.829591	\N	\N	\N	http://graph.facebook.com/10209152262834615/picture	gianfilippo.caligaris@gmail.com	{"rJIyon-ZWpMM91eXx7ASbA":{"token":"$2a$10$QOP802CBVsiCg1TIg3jwwOLPVjrFdAj5i1/jGFXgZtspp2/kMzs8y","expiry":1468682994,"last_token":"$2a$10$zsxbP854cED9zKVBNNhzReWO0XOzhCH.41jkk8mL7sBk.BmCfciFS","updated_at":"2016-07-02T15:29:54.338+00:00"}}	2016-05-20 10:57:21.481864	2016-07-02 15:29:54.339505	\N	\N	\N	\N	\N	\N	0	---\n- c0fd65fe49b9caadb246aff3dc82b8d85245b23216655fddab7abdf2c4eaf317\n	\N
16	1980-06-06	Elena	Bobbola	\N	via rivetti 50	vigliano biellese	BI	t	\N	\N	email	eleby@icloud.com	$2a$10$e26Q22EnTUnaN8wQQxHG8ub0pWG8sFn6qOCfNk1mqOVL.apTF7Rw2	X9tC9XF4bzov_tzwU-fU	\N	\N	45	2016-05-04 10:14:55.434445	2016-05-04 10:11:13.483146	151.82.110.62	151.82.110.62	\N	2015-07-10 08:10:48.979896	\N	\N	eLe	\N	eleby@icloud.com	{"KERC2W_KeGcqcgo74KTfHw":{"token":"$2a$10$RmugVuldg9y6e7SXTHZ1de5VHOkaJVFK3saYeVRNgPfyQdhgMn4HO","expiry":1463566614,"last_token":"$2a$10$4LLC6GtRGfH2ZliYec1fF.mX8YtHT15llcRJHLAXlvVgJ1Qw0K/US","updated_at":"2016-05-04T10:16:54.441+00:00"}}	2015-07-10 05:15:19.839038	2016-05-04 10:16:54.442796	\N	f	data	image/jpeg	53966	2016-03-08 20:11:48.553817	2	\N	\N
95	1991-03-07	Andrea	Macchieraldo	\N	Via monte bo 43	Biella	BI	t	\N	\N	email	los@koodit.it	$2a$10$qFGMNOB6uMWD929fz.1Xk.oON8MV1xgAgPINDYSdU.8gp9vijCZrC	\N	\N	\N	12	2016-04-14 13:21:01.017263	2016-04-14 12:45:06.945985	93.51.27.24	93.51.27.24	TF8Q-u3U1XFWJXHx3sVU	2016-04-06 10:40:23.049381	2016-04-06 10:39:53.771072	\N	los_macchie🙈	\N	los@koodit.it	{}	2016-04-06 10:39:53.565946	2016-04-30 15:09:41.370252	\N	f	data	image/jpeg	22553	2016-04-06 10:40:01.715886	1	\N	\N
29	\N	Davide Paganotti	\N	\N	\N	\N	\N	t	\N	\N	facebook	10153599446858817	$2a$10$jnXXvwugGwAUkjSTIVNhAOSprpnrmRi6lRAerwrTtylsboeaT8h.u	\N	\N	\N	3	2016-05-11 17:50:12.383576	2016-05-11 17:43:26.811161	79.50.68.141	79.50.68.141	\N	2016-05-11 17:50:12.383063	\N	\N	\N	http://graph.facebook.com/10153599446858817/picture	davidepaganotti@gmail.com	{"T8OCxwSyADtZ4hsCKNIeWg":{"token":"$2a$10$QMUxsflHwM7VX80/vOyrR.JyC5KgCYjxTimtwy5Pct1Ga4CJhrdOC","expiry":1464198381,"last_token":"$2a$10$v5esHhcyyNX4v/5mT/DVB.jejotESDZcDwsSvPVAS/oOK7Eqpp30a","updated_at":"2016-05-11T17:46:21.840+00:00"},"nw5DsXgS_bTSm8gzKcC0TA":{"token":"$2a$10$0PnJrzQD9xI2gf48.N7l7ufsdLDTDtnz6OVhXCDnlcTW4ybP6avSO","expiry":1464199134,"last_token":"$2a$10$U9BIPhC1r5G6KgQkD.90Zuq6RUHpaGaxtg7rdT0hnQAv36cBErotW","updated_at":"2016-05-11T17:58:58.620+00:00"}}	2015-08-28 15:54:46.843843	2016-05-11 18:36:50.243867	\N	f	\N	\N	\N	\N	0	---\n- 6e42b67a792d409bc8f3e3421a7cffc5bf0a00477d15027a259b74cf071a273b\n	\N
145	1982-03-10	Federico	Barazzotto	\N	Salita di riva 14	Biella	BI	\N	\N	\N	email	barazzotto@bonprixitalia.net	$2a$10$DweRrnOpE62Mi8NHJuTw8uSvkVthFPkb2Ffsa8gUWKrOX1qONSmmG	\N	\N	\N	1	2016-06-21 13:52:42.192666	2016-06-21 13:52:42.192666	5.90.207.125	5.90.207.125	ksV7s921KDJRvNXBvNVS	2016-06-20 11:46:32.132787	2016-06-20 11:27:52.560583	\N	Fedebarazzotto	\N	barazzotto@bonprixitalia.net	{"KMaEXxlzc-QFNfcAtZ3FcQ":{"token":"$2a$10$N65YyKZWv61T6DjtQmGVXeZfp0x6h6GbrPJ40xUbFQ5LFAhkTqpXC","expiry":1467632811,"last_token":"$2a$10$1w/WFNRF7BIkpbe.nI8gpOyXAnMJCRtycFABOLmX8z/2GRpMsXRAi","updated_at":"2016-06-20T11:46:51.129+00:00"},"ZJKL26WdslFnDQf-s6-GDQ":{"token":"$2a$10$qciXytvLNc4q4wAMiWcx8ecv.XBqPOhlJ2EONd/dmKyoGb49Jse..","expiry":1467726802,"last_token":"$2a$10$8oz.DFdOWRw655II0ZYUa.BauYMTodmly539rQlHgIMTC5uG.lRTK","updated_at":"2016-06-21T13:53:22.817+00:00"}}	2016-06-20 11:27:52.359211	2016-06-21 13:53:22.818566	\N	\N	\N	\N	\N	\N	0	---\n- cZSB_kM0Bp8:APA91bF83eQhgTbZ2caBrl2ZT1dJAuErWZaB6FEZiUYLlGpvbzVVdfFvYjn1ZL3zzjPIlH0ycEzu5roPziphoerz5yuSPnTbCKUe4St_6mzewA7WPJM33-bmGYgN_CSuqmn5XuWU3r4B\n	13900
120	1987-11-23	Niccoló Perazza	\N	\N	Vicolo Borello 10	Vigliano Biellese	BI	t	\N	\N	facebook	10209538517277809	$2a$10$sqS021fc0wXQ9sw1igOrAOGaoOFl139L1ek53eBXQINCZ3mx6Wo5O	\N	\N	\N	1	2016-06-07 11:33:08.003529	2016-06-07 11:33:08.003529	93.38.155.233	93.38.155.233	\N	2016-06-07 11:33:08.003014	\N	\N	\N	http://graph.facebook.com/10209538517277809/picture	perazza87@gmail.com	{"b6DZTadDBrN6yjuBpmcIkw":{"token":"$2a$10$In/8PDSSPl17SkAp7nyYK.QmfdhUONQakfhWfmARIXJrwJcyZ0rjS","expiry":1466596617,"last_token":"$2a$10$NHIWAJg3cOVjmKavfea9ieaLeMebs1s8UARWq5kQ0E0w69CmBoIs2","updated_at":"2016-06-08T11:56:57.556+00:00"}}	2016-06-07 11:33:08.005164	2016-06-08 11:56:57.557539	\N	f	\N	\N	\N	\N	1	\N	\N
66	\N	Christian Clarizio	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208355051339981	$2a$10$RMEkbrLWxCScDPuy30eJd.zHmeEnNeIgnNCIaTeokf94kRmKvNxzi	\N	\N	\N	1	2015-11-03 16:45:23.486488	2015-11-03 16:45:23.486488	213.218.53.133	213.218.53.133	\N	2015-11-03 16:45:23.486018	\N	\N	\N	http://graph.facebook.com/10208355051339981/picture	christian.clarizio@gmail.com	{"5wwQTvRHuMU8lIRuyiFOaw":{"token":"$2a$10$zo4dcz/81v50CgCTDeIdMOR8lQbBtEjtpwJ/Rn7JjFgmF0Z9R1CFi","expiry":1447778815,"last_token":"$2a$10$iuV0YE4V7JFDLep5PeOSmuwEOBytPL.oJjatHhRkBDBefQUyTCA8m","updated_at":"2015-11-03T16:46:58.546+00:00"}}	2015-11-03 16:45:23.488072	2015-11-03 16:46:58.548271	\N	\N	\N	\N	\N	\N	0	\N	\N
207	1983-08-08	Emanuele	F	\N	Via Guastalla 14	Torino	TO	\N	\N	\N	email	fallar55@libero.it	$2a$10$dzu5AO3vrTkR4YixJgwV2eVJ9M6JSr0Szr6X/Cb/u1GYqHesuwwsq	\N	\N	\N	1	2016-10-25 21:16:34.393785	2016-10-25 21:16:34.393785	94.161.142.75	94.161.142.75	MxwFyNyz_tMVxTibKFVx	2016-10-25 21:13:17.144207	2016-10-25 21:11:46.792582	\N	Emanuele83	\N	fallar55@libero.it	{"Rg2CGlEUVyZWw_aROntK9w":{"token":"$2a$10$MIYwHz6nao8zRjbQbiw1SOXwsIAo3Fu87d8EP/92mW2xHkt20OVMi","expiry":1478639602,"last_token":"$2a$10$Fjm5Yi4anbH8vACh4A3EHeFk8OHJ3WmUWsBh7iTdD5M29Bf0dPe9.","updated_at":"2016-10-25T21:13:23.508+00:00"},"3HIxo_KGACWEgkgapRIA5Q":{"token":"$2a$10$Pt2Q8ixc1ne4CwOoytB/yO96jeBOoi5pH/tOESpKtHVcLzcqc3kEu","expiry":1478639643,"last_token":"$2a$10$t9I2VMfBLLhjDDspRbYz9OdrbcJnvFY6p36bo4jMU1DnaKkyZ3B5u","updated_at":"2016-10-25T21:14:05.062+00:00"},"ZxVlDeqwqUy2lAZPtzIuQA":{"token":"$2a$10$j4xnpBnMW3aRMQMigFkekeQc5k2/fboLVuxNi37ZDSIDHq84aDjQ.","expiry":1478899227,"last_token":"$2a$10$6WDuQ6NJl8PQJqACSgY6BeZGSnVdn5C5Zbl/oHHA47UOu2dZmMqea","updated_at":"2016-10-28T21:20:34.817+00:00"},"PMhvfFPqMx5nJkm5nmC_wQ":{"token":"$2a$10$v3fzecNYPPUgCS9BiTQr9.XakTt9Yq9DtiTudsdJ5URaNxM36ICnS","expiry":1478639895}}	2016-10-25 21:11:46.792078	2016-10-28 21:20:34.819497	\N	\N	data	image/jpeg	13428	2016-10-25 21:11:49.997332	0	---\n- cLUV1E42f_8:APA91bHJyEfGhrtR0ORNQnSi6gRUTUa18YWvtxEojirTse6Ul3kPwwHGwy4njVP0j_lEL3KqsiKDgzM6ZB0GjT0cm5S-ItUYbiFj85OmRUuQwb5h0-NZxCy74Z2Vl8LFu51niH1MvJrW\n	10124
82	1982-12-02	Elena	Bobbola	\N	Via rivetti 50	Vigliano biellese	BI	\N	\N	\N	email	info.elena@gmail.com	$2a$10$F0CsrJSUewX3ET7o1hEI3.oaUArO6isp81.4P8/r7xCcAmd4WcBnq	\N	\N	\N	0	\N	\N	\N	\N	syGhJ4AWZe9hYHpFK4sg	\N	2015-12-03 09:07:47.529045	\N	Ele	\N	info.elena@gmail.com	{}	2015-12-03 09:07:47.321775	2015-12-03 09:07:50.585504	\N	\N	data	image/jpeg	24471	2015-12-03 09:07:50.425651	0	\N	\N
69	1991-04-23	Andrea	Macchieraldo	\N	Via Brovarone 15	Biella	BI	t	\N	\N	email	a.meloni@koodit.it	$2a$10$6LqOV/fFLCX8xzoC.8QDGODQFzKR/8CdgPRrmJVEtDEDHcFaKg.2m	\N	\N	\N	2	2015-11-06 00:13:44.254644	2015-11-06 00:12:32.492649	93.40.186.195	93.40.186.195	rqTswzLyTxS-SbyToYDR	2015-11-06 00:11:58.812984	2015-11-06 00:11:32.193123	\N	Melaz	\N	a.meloni@koodit.it	{"Z7XkUtGyiU89KZ-pr4inBg":{"token":"$2a$10$hulWntSj2NuCNjElATKrW.mc47R06o3PWTS0iRWy1nosiDUirxDvq","expiry":1447978390,"last_token":"$2a$10$EKfU26Ui6zfpWubvpOQIwO04BKWZETmZPmiahAv2IiARxtqhtS08e","updated_at":"2015-11-06T00:13:11.949+00:00"},"xTypsqQjbIFqOmX1FqTrdA":{"token":"$2a$10$FHMUtDAvoZx60/c8R.KR/.joAUgZotRgFrttPPHNA6.2gsFFSS9Wu","expiry":1448006310,"last_token":"$2a$10$bW5kUAXnBD3eeuQPICHv0Ox0BHbfd1bOWolCfBSdOuxmxAqwKoy0K","updated_at":"2015-11-06T07:58:30.417+00:00"}}	2015-11-06 00:11:31.985825	2015-11-16 09:29:20.645984	\N	f	data	image/jpeg	37019	2015-11-06 00:14:37.81435	1	\N	\N
58	1991-03-07	Andrea	Macchieraldo	\N	via monte bo 44	biella	BI	t	\N	\N	email	a.macchieraldo@gmail.com	$2a$10$MpraXYu/72DOe.ulAYKUuekJLOmni3.l0D1w8zmh6yW4AQIS.Z.56	cBSykcanUwd5Rg3LCqbE	2016-03-22 11:53:07.331074	\N	133	2016-09-28 20:26:53.06414	2016-09-19 21:48:16.426849	17.200.2.214	17.200.11.44	65746c4d821dfb940e9dde1e1884ec9c99d63ac32a37b3f15cf752b3d6e61af8	2015-10-29 16:13:52.753593	2015-10-27 13:58:38.600269	\N	macchie	\N	a.macchieraldo@gmail.com	{"ppgkKgUK4LAtd0dmhaNYdw":{"token":"$2a$10$Yb17.r1E/z0jEQducQjgMuOQrNpY2Pe4gF9H54wCqPGDRgxMTZNZ2","expiry":1475531296,"last_token":"$2a$10$HjwesSa4SDay8o7.KzGBo.wOFP1Op9jDTvIy2JfnTa6zEtzjD4PLu","updated_at":"2016-09-19T21:48:18.442+00:00"},"Srtp6ZU2y2_Jakly1NIipw":{"token":"$2a$10$vj1Og8FNt/Yt3HSKT0kCKe/b12.jPUfpfYOgrgKbRbpSMDnvFMkdq","expiry":1476304047,"last_token":"$2a$10$y4Zy.w02JMEZzIBKqzPOA.ufLuscce8Y/p/WG2H8U.OGnmnfXDgbW","updated_at":"2016-09-28T20:27:29.829+00:00"}}	2015-10-27 13:58:38.598282	2016-09-28 20:27:29.830686	\N	f	data	image/jpeg	62239	2016-05-04 19:31:49.425702	1	---\n- 4a7a15895311ba21a4d2cdcd65e4eaa7e4ee49f6d20f71039a5817a65e25886d\n- 02bd50a93c574a13f5f7f852a1e0b6f7e69534e95d38f2906855799e4d3154a5\n	\N
110	1980-09-15	Enrico	Gremmo	\N	Via trivero 6	Biella	BI	\N	\N	\N	email	egremmo@libero.it	$2a$10$6rGz7DMkRILDA0Wi6zj.SuLYzHKdVta8il6N0f4lwcWiTKA6gyNjy	\N	\N	\N	2	2016-06-14 15:55:02.505859	2016-05-21 13:19:12.398857	151.68.26.160	5.170.24.84	B493WHicp4c5syw4BipS	2016-05-21 13:16:04.838247	2016-05-21 10:47:27.528368	\N	Enrico	\N	egremmo@libero.it	{"vxsEMHTBhycLwyCpdIhdnw":{"token":"$2a$10$nxqvaF5c/Y5PpBNN0QWlouTEcS.N3XHd7PYL/utWh3y/vFr5t7Pmu","expiry":1467129349,"last_token":"$2a$10$LeeOf7ucPKrTu3nOT36Ape44M53JS4TlFWAVEXfmn0kn85b/p9KZ2","updated_at":"2016-06-14T15:55:49.727+00:00"}}	2016-05-21 10:47:27.328084	2016-06-14 15:55:49.728666	\N	\N	data	image/jpeg	36332	2016-05-21 10:47:35.31751	0	---\n- eorN1WXvqs8:APA91bFYSykz-idebWkd0S32LhZWH6zDwZ2WdLSEWHqUsbbJQ11rFOcLEj9hy477-mNVGU_uYQbcM1SdJNP6T60E77V00pW2f1NaCLl-v6JFqTXmnCfFBMQ6N1RLsyOWR4GdqXWmnMAD\n	\N
172	\N	Julia Ponomarenko	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1196292670440801	$2a$10$0Zx8mpbB34G0RSDQk11kr.iURPHm5RwvBDHTj9kvFCXAsw7o8G2uC	\N	\N	\N	1	2016-09-03 13:43:00.340919	2016-09-03 13:43:00.340919	179.40.104.45	179.40.104.45	\N	2016-09-03 13:43:00.340517	\N	\N	\N	http://graph.facebook.com/1196292670440801/picture	yuliya-ponomarenko13@yandex.ru	{"-xVYCllH4ZFaBh0v4A5YAw":{"token":"$2a$10$lAAv2/BHFoThDoeMXhH48uQMltyXCCWfy4Usz0pfNd4v92dSJwrfi","expiry":1474119784,"last_token":"$2a$10$i3tVRCRhlNN1Q9aAVXRdv.455l9mvPZYvXcCgCEJJxgvAZZFbEh0m","updated_at":"2016-09-03T13:43:07.739+00:00"}}	2016-09-03 13:43:00.34234	2016-09-03 13:43:07.740674	\N	\N	\N	\N	\N	\N	0	---\n- c9baa274f208c96d77339b69ec9e8708910410125f0d9bd75cf529c50301d7b3\n	\N
103	\N	Alice Krizman	\N	\N	\N	\N	BI	t	\N	\N	facebook	10154211596849225	$2a$10$XyVxIb1LsJGsK39HrQW.4e4SqOWNG3UtbULWuP7OdPyRuKQqOmdNW	\N	\N	\N	3	2016-07-14 11:55:53.589753	2016-04-22 09:14:53.020487	93.38.164.218	93.40.186.20	\N	2016-07-14 11:55:53.589177	\N	\N	\N	http://graph.facebook.com/10154211596849225/picture	alimankriz@gmail.com	{"TKsG2wn0RemUq6RsOB_oeQ":{"token":"$2a$10$YVdNeV3QQ61NmaKmpbKgA.G2caD7B89H.D.H43b99UCEuJDi4TiAm","expiry":1469707229,"last_token":"$2a$10$cOmP5.5xrJjrbOK1vQh.Wum7FCYR2JX9vHyf.3HnOnlvFHirJ7TtC","updated_at":"2016-07-14T12:00:29.705+00:00"}}	2016-04-22 09:11:29.353594	2016-07-14 12:00:29.707244	\N	f	\N	\N	\N	\N	1	---\n- ciF0lafuMu8:APA91bGyYFw3GUToyuwweYGVzOq3D_k4QTj80yPh0BnxnaQjhRkujvVtORtbk1NYf1ad_AE11s_I6j2r4phfnPYtdB0rg_zLl8Ea_B7vuMmpB4epx0aZGWHXMUFh6FYBu-73jU_70uw5\n	\N
165	\N	Gabriele Savarelli	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1114587888654673	$2a$10$ryl0/ZJ96kvg5oiqAoPsFOp92/UJNcbGIL9KMTGTN4ja9blOlWrAa	\N	\N	\N	1	2016-07-16 18:21:20.610524	2016-07-16 18:21:20.610524	91.253.30.13	91.253.30.13	\N	2016-07-16 18:21:20.610136	\N	\N	\N	http://graph.facebook.com/1114587888654673/picture	gabrisavlazio@gmail.com	{"mM02PFQ1dNUjh6fRBCkQJg":{"token":"$2a$10$Mf5s11QPyz.WQa8oDOZnbuqPXPy7JOzG5Fqit2igte4iBabHWpaau","expiry":1469902950,"last_token":"$2a$10$yVJxIIsDDP9HIwFEJiGe1u8LVqdeE5WSs9jhjsvEMmZTKWym4Kxtm","updated_at":"2016-07-16T18:22:30.097+00:00"}}	2016-07-16 18:21:20.612002	2016-07-16 18:22:30.099228	\N	\N	\N	\N	\N	\N	0	---\n- f377fd23c2655f9daf9ad357e5b1e35ee624fc4fffb134ee6a4c22e874675ac1\n	\N
124	2000-05-23	Giorgia	Mariani	\N	Via provinciale 21	Mongrando	BI	\N	\N	\N	email	giorgia.mariani.71@iisbona.gov.it	$2a$10$8cqzYTY85Z7dM.qr2cAdKOJPw491RwS6kQH1fzrwShhS.T626jORy	\N	\N	\N	0	\N	\N	\N	\N	cEBSwguXyoNUxyepHZ67	2016-06-08 20:23:26.378966	2016-06-08 20:18:20.100317	\N	GiorgiaMariani8	\N	giorgia.mariani.71@iisbona.gov.it	{"qQxaYntkNEUpcllh9C0-aA":{"token":"$2a$10$d56ab5kPAlXVnyDYt9jJjeQuD1DDih9rkfbnMbi9OjLsxNsxTqBB6","expiry":1466627015,"last_token":"$2a$10$VhtwlrFMxwTfEYIOYBPXw.psQ3Ot8peEhqNO19eLT62Ec9WC4B9Ei","updated_at":"2016-06-08T20:23:37.130+00:00"}}	2016-06-08 20:18:19.868444	2016-06-08 20:23:37.131136	\N	\N	\N	\N	\N	\N	0	\N	\N
147	1989-08-23	ILARIA	FEY	\N	VIA PONTE DORA 100	STRAMBINO	TO	t	\N	\N	email	fey@bonprixitalia.net	$2a$10$WC8GHmVU0aoAgMKqs3pNguiwnJq9VQ8c1AZSmCudMkLxbIz59DHRO	\N	\N	\N	2	2016-11-04 14:35:31.896809	2016-10-11 13:14:42.915321	185.59.164.51	185.59.164.51	Pf6k3Vueryv8bG9HsSYD	2016-06-22 10:08:13.154679	2016-06-22 10:02:26.249151	\N	feyila	\N	fey@bonprixitalia.net	{"3lbGnjluAH2y8tNP16MEAA":{"token":"$2a$10$Z5ExnzRkEARtApcuMS17Uu.BZbZxC3TD9wygORJMGXPQXliM2Eqre","expiry":1479479840,"last_token":"$2a$10$vV/4NyNcNxNXVep4/COuXuRTLlC.b7pQWC6rLyRd7RDbluq3Ua0nO","updated_at":"2016-11-04T14:37:23.300+00:00"}}	2016-06-22 10:02:26.050219	2016-11-04 14:37:23.302561	\N	f	Cattura.JPG	image/jpeg	22395	2016-06-22 10:02:35.210845	1	\N	10019
148	1979-01-31	Damiana	Boggio	\N	Fr Baldo 10	Masserano	BI	t	\N	\N	email	boggio@bonprixitalia.net	$2a$10$hno4QRPBt448rVeWaZGHeuFCrr9hRwatRGEcDO8F72Oe1JsG/hewK	\N	\N	\N	0	\N	\N	\N	\N	8orA5ctJmJfj27xU2brm	2016-06-22 10:18:59.879459	2016-06-22 10:14:41.274717	\N	Damiana	\N	boggio@bonprixitalia.net	{}	2016-06-22 10:14:41.272846	2016-06-22 11:24:55.226949	\N	f	foto.jpg	image/jpeg	60680	2016-06-22 10:14:48.468283	0	\N	13866
104	\N	Emanuele Diodato	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208984887370417	$2a$10$WpjW1QXzz2oqqblPSxK8Xe5qXG6dl0HkKcY4jqpQzXnlxbWh/2xxO	\N	\N	\N	1	2016-04-23 18:10:39.947781	2016-04-23 18:10:39.947781	2.34.119.115	2.34.119.115	\N	2016-04-23 18:10:39.947405	\N	\N	\N	http://graph.facebook.com/10208984887370417/picture	diodatoemanuele@gmail.com	{"hyj5wuNKuMn9rc-6d5vXmA":{"token":"$2a$10$yQYG2OipkVliC9wtql2mK.jle8nMXK78j6d0bf7Xew7JpY5nP6bxS","expiry":1462984849,"last_token":"$2a$10$O8aln3fj1YrgVH8fj/d4mOTuE1J58X9/NnlaIPp3KMr0tbvg5xyMO","updated_at":"2016-04-27T16:40:49.726+00:00"}}	2016-04-23 18:10:39.949166	2016-04-27 16:40:49.728362	\N	\N	\N	\N	\N	\N	0	\N	\N
179	\N	Antonietta Marrazzo	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10210613537759840	$2a$10$FnNWxEC9hffTdEbQz763luNS31gi3.h89EWDjOayqJIE94hOVo0Xi	\N	\N	\N	1	2016-09-29 13:12:34.95159	2016-09-29 13:12:34.95159	93.51.141.2	93.51.141.2	\N	2016-09-29 13:12:34.95121	\N	\N	\N	http://graph.facebook.com/10210613537759840/picture	marylin87na@hotmail.it	{"HSc7E-UzY0dYjQhcAt7Eug":{"token":"$2a$10$gSnlBh2./uT4Q8g40VFbdu6ub0A2AYhAOHW9TVMKC/tUZnYsAaxv2","expiry":1476364492,"last_token":"$2a$10$Yj4Ry4CDA/FZNYEuxH8D9OL.t2AgDbPs.ViiT6zHOWvY98hMfzXFK","updated_at":"2016-09-29T13:14:52.624+00:00"}}	2016-09-29 13:12:34.952955	2016-09-29 13:14:52.625659	\N	\N	\N	\N	\N	\N	0	\N	\N
121	\N	Beatrice Colombo	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10206578771892710	$2a$10$OKvrAD6SU3I033cCepjVx.kfX3Vd46jGnXhrrdWfkQlwaNYZ.IqYu	\N	\N	\N	1	2016-06-08 10:37:11.87784	2016-06-08 10:37:11.87784	62.18.100.248	62.18.100.248	\N	2016-06-08 10:37:11.877225	\N	\N	\N	http://graph.facebook.com/10206578771892710/picture	colombobeatrice@libero.it	{"paQzCjDGsrjH1vn6mQqJgA":{"token":"$2a$10$ec21SbZM45HNm1ex8QyzleDFUarK/oNR5YATacdrY6Jjn/GMlH4P.","expiry":1466600833,"last_token":"$2a$10$wh28wSx4Fkq2QbZGFcDIqO3hW2rf3VRvP/W3tgghaSBr2iTXvByKe","updated_at":"2016-06-08T13:07:13.088+00:00"}}	2016-06-08 10:37:11.880258	2016-06-08 13:07:13.089357	\N	\N	\N	\N	\N	\N	0	---\n- 97c7743d1b106c2cb5a089c944a7151a38d3f6abb5afe8782d8ec1f455eb25a6\n	\N
146	\N	Emanuele Bissacca	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10209801533375604	$2a$10$AmdJa1pjwxnhtZhh1jA8ju1ac/G.VVcaq7uVvYrN50z5UJAKbpwZu	\N	\N	\N	1	2016-06-20 12:50:53.927619	2016-06-20 12:50:53.927619	79.62.207.205	79.62.207.205	\N	2016-06-20 12:50:53.927024	\N	\N	\N	http://graph.facebook.com/10209801533375604/picture	emanuele.bissacca@alice.it	{"_4_w9riZFg1HLFbs-rGhxQ":{"token":"$2a$10$MbmKGJHC4CKDB5vJJP9mt.4AXKentZLD.t/gBqtv9dqXIZkf/YFta","expiry":1467637185,"last_token":"$2a$10$wc6xXmHzJNhsMcfOKXaFBOz/LmyVBxxPxiXMjtXHETGkzf08cJQZq","updated_at":"2016-06-20T12:59:45.316+00:00"}}	2016-06-20 12:50:53.929486	2016-06-20 12:59:45.317449	\N	\N	\N	\N	\N	\N	0	\N	\N
14	\N	Andrea Meloni	\N	\N	\N	\N	\N	t	\N	\N	facebook	10206634595771174	$2a$10$UnyeFmrF3m8CcsB/joZMkOMaIdi6uRRdD48BuaqaPhdSQFLw4q88q	\N	\N	\N	32	2016-11-10 16:09:31.361333	2016-07-18 13:10:28.595535	79.7.218.57	93.32.193.128	\N	2016-11-10 16:09:31.360332	\N	\N	\N	http://graph.facebook.com/10206634595771174/picture	\N	{}	2015-07-09 22:17:33.845154	2016-11-10 16:09:46.895362	\N	f	\N	\N	\N	\N	2	---\n- 38188e544264bfc89793602b4d7b0ce5230ead03bb180dc54fea02783d3dac1d\n	\N
111	\N	Elena Mocco	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1158308494179271	$2a$10$MXBeDL9hbvkXHmlKOxzMBuuwAbISf0bL6Wy7CG7iau9qQrvg2/kVa	\N	\N	\N	2	2016-10-29 17:51:37.654584	2016-05-23 21:00:32.72546	37.227.161.91	5.90.207.116	\N	2016-10-29 17:51:37.654056	\N	\N	\N	http://graph.facebook.com/1158308494179271/picture	nemocco@yahoo.it	{}	2016-05-23 21:00:32.727614	2016-10-29 17:54:10.939425	\N	\N	\N	\N	\N	\N	0	\N	\N
112	\N	Valentina de Rocco	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10209668623615386	$2a$10$DmClpelWGk8kOSepAb.V1uHlFB5SbLO7beLE7TJ5kSTRbl5Ji7ONi	\N	\N	\N	1	2016-05-23 21:40:21.191161	2016-05-23 21:40:21.191161	5.90.35.245	5.90.35.245	\N	2016-05-23 21:40:21.190753	\N	\N	\N	http://graph.facebook.com/10209668623615386/picture	vale.vdr@gmail.com	{"fPSZx0YIgFrzCwNQqif3gQ":{"token":"$2a$10$l7jm4q13Fy7DLhAjGqoeneS5VeM67elnBNfScfcz5t0bw4zzu1dbG","expiry":1465374998,"last_token":"$2a$10$Juc3X/qa8qmeNfK.OnAi5Otp8s4F2z/6mzPh.kC5ERz5ikyFSMMSe","updated_at":"2016-05-25T08:36:39.976+00:00"}}	2016-05-23 21:40:21.192757	2016-05-25 08:36:39.977752	\N	\N	\N	\N	\N	\N	0	\N	\N
150	1970-02-07	STEFANIA	FALLA	\N	VIA RESISTENZA N.11A	CANDELO	BI	\N	\N	\N	email	falla@bonprixitalia.net	$2a$10$YbsZh1pLZ.B/1Mdjr65TNu8pOkSJMpiNSva.MwKKjuhPDB4zWZloe	\N	\N	\N	0	\N	\N	\N	\N	sZyeAjP3p-YrsoystzyK	2016-06-22 11:53:26.409523	2016-06-22 10:55:02.449543	\N	STEFY	\N	falla@bonprixitalia.net	{"2UZUZhOQiu0UsW1VVg2ufA":{"token":"$2a$10$mRD5wJq7sldpWu1p4O3acup2Fy8dQGZ.H8b4fVCp70fDQVJWRQWZ6","expiry":1467806009,"last_token":"$2a$10$Xj94hQaafZItVMhW/KqowuN1Bsyon9moh9sajGAZ1nEYXWZQX8Rz.","updated_at":"2016-06-22T11:53:29.639+00:00"},"ZvmbgJbUSnCKATIEQjb9_A":{"token":"$2a$10$unnjQ9jSSz5kHEIDzVpZt.NrIn0eVVQoL6IcASXq.fq4sLDIan..e","expiry":1467807192,"last_token":"$2a$10$LYJUSkaEGTR7ZhiRtdnPwe75CnFLBSZ4LtqU2B0yHOefbVT0SYELi","updated_at":"2016-06-22T12:13:13.622+00:00"},"KBmUCY3UMyH6uPVK0uH_zA":{"token":"$2a$10$ya56OBgicbUgR7yi/AM//OdhQXQ3USvblAWH28qSIdQ5dCvr9Ss5u","expiry":1467974725,"last_token":"$2a$10$/zjapTaPswL4I0yLxxkvkOXf/EB.J/xpEFBo8KHrt421/.w9eJZQm","updated_at":"2016-06-24T10:45:25.681+00:00"}}	2016-06-22 10:55:02.447419	2016-06-24 10:45:25.682545	\N	\N	\N	\N	\N	\N	0	\N	13878
149	1987-08-18	Lorenzo	Galleran	\N	Via Martiri della Libertà 32	Mongrando	BI	t	\N	\N	email	galleran@bonprixitalia.net	$2a$10$8YAWhT21k2DTNzzOeVoacuirG.wR5lAwMQFgax/eYskI9iqZDOiSO	\N	\N	\N	4	2016-10-31 11:08:50.310433	2016-10-11 18:49:56.373386	185.59.164.51	93.38.96.215	75aUWRz8nWUCs38bN9Mr	2016-06-23 07:39:00.095399	2016-06-22 10:42:57.583308	\N	lori.galle	\N	galleran@bonprixitalia.net	{"27kzHWBAjkcNNwMLiqZ1Vw":{"token":"$2a$10$R/qvMamcedf38Kvklu06N.Gn8ewQuybXyBCCK8FN4XV1ZDGTyiliC","expiry":1479986063,"last_token":"$2a$10$PkPXlcxsTHK1Kzd7qBRFxeJ4ltYF57PW9OVPS4gsEiOwIQsaKLShS","updated_at":"2016-11-10T11:14:26.999+00:00"}}	2016-06-22 10:42:57.581524	2016-11-10 11:14:27.003333	\N	f	Mia_foto.JPG	image/jpeg	15309	2016-10-26 16:47:01.825699	1	\N	13888
180	\N	Stefania Cerruti	\N	\N	\N	\N	\N	\N	\N	\N	facebook	999673206808932	$2a$10$bLP4W6.Ps..XUIwBTFYPHuqXFliPQCX56j/9fpBaSlUYSUJSxQQm6	\N	\N	\N	1	2016-09-30 05:02:23.879759	2016-09-30 05:02:23.879759	77.242.190.68	77.242.190.68	\N	2016-09-30 05:02:23.879387	\N	\N	\N	http://graph.facebook.com/999673206808932/picture	cerruti.stefania@gmail.com	{}	2016-09-30 05:02:23.881179	2016-09-30 05:05:48.279413	\N	\N	\N	\N	\N	\N	0	---\n- fVPk6JC90jY:APA91bHk_ErzyFK6DHeOHN5Gy897WWTSVGoOKBt-Lwu90wT8k0_Hai6llzrbEMzARE9Azw6lhAByqjyK_yNC32RzRhW2uICScIzyNRruLexLAShk1XddXT8eaG45ZuaEmVieuxQeu8Ks\n	\N
20	\N	groove	aps	\N	via milano 32	vigliano	BI	\N	\N	\N	email	groovepas@gmail.com	$2a$10$mWtJBxW4Sutn04wMNZOiF.Ugy2uxaoyVo7rCIhEi/5xq2DdfdeR9K	\N	\N	\N	0	\N	\N	\N	\N	81937499b109eed89ac9f95ffa08761584ec00ff9653cbf2dc2e51c2b07644c2	\N	2015-07-15 14:18:33.110866	\N	grooveaps	\N	groovepas@gmail.com	{}	2015-07-15 14:18:33.107922	2015-07-15 14:18:36.269073	\N	\N	Thug_Life_Png_04.jpg	image/jpeg	122452	2015-07-15 14:18:35.74751	0	\N	\N
91	1991-03-06	Andrea	Macchieraldo	\N	Via monte bo 44	Biella	BI	\N	\N	\N	email	a.makkssn@koodit.it	$2a$10$eWTj4J6IGngAfSslMbmTzOLXydf/1U2kpSxRW/ndJYlrAMDiWyDwC	\N	\N	\N	0	\N	\N	\N	\N	F6As_1rR1kkF_bff_xve	\N	2016-02-25 22:07:37.818374	\N	Makks	\N	a.makkssn@koodit.it	{}	2016-02-25 22:07:37.613284	2016-02-25 22:07:46.344688	\N	\N	data	image/jpeg	17795	2016-02-25 22:07:46.122023	0	\N	\N
74	1962-08-27	Paolo	Rossi	\N	Regione Bazzera 11	Sagliano Micca	BI	\N	\N	\N	email	paolo@silviaepaolo.eu	$2a$10$xzkJul4nAa9gM1UNLNyn7ugQUqsRZRSqEAd1IygRzssoKfjvfyUDW	\N	\N	\N	6	2016-10-26 08:24:45.20987	2016-10-26 08:19:47.931858	5.90.76.19	83.103.26.39	joihdRnrKsN7X7yMVZBW	2015-11-21 06:52:07.146771	2015-11-21 06:51:51.005251	\N	Curzondax	\N	paolo@silviaepaolo.eu	{"V5weRpIVM4lK6HZqP_vT5g":{"token":"$2a$10$L6NjFwBNfS83EJAjhzxIg.xoQgVAE3yPtl4XU8vZgZVdoxllFlxoC","expiry":1479366833,"last_token":"$2a$10$pIkRUz0FYuqk8duB6M3MZ.TUKx3pCiW.KEwQe7mOBn0C6Cjm.lt9W","updated_at":"2016-11-03T07:13:54.427+00:00"},"q6tvTLyrXAX_2TlK26w05A":{"token":"$2a$10$TLA0KnMM1xU5xmwfSkD61OVQSO/lM1JypdrX4IR6q43advC26pOnW","expiry":1478670795,"last_token":"$2a$10$YVDHqBmAxl4EQL4h6B9zCODNEt8zwsIDbHcjiNqwnz7fQzrpy5dm6","updated_at":"2016-10-26T05:53:15.367+00:00"},"ks5wXEsE3DuVf7-giUC0ew":{"token":"$2a$10$yXggVpXzqn8sq0/3EExGPOCnkh45uTKu4JXfdr9B6iRfbwkduBRf2","expiry":1478679588,"last_token":"$2a$10$euTZHGWlwCcmlrQOwwpOx.aElKBDP7LNCZY3c33iUoFwwM8o4bijO","updated_at":"2016-10-26T08:19:48.246+00:00"},"Z-Xaavm5MGdz3uPFRKHEcg":{"token":"$2a$10$49nR7eMLoVvTBiFCKIjtiuy5y7ufstVXPh4IBcGk5P1rAKGqg/KZu","expiry":1478899886,"last_token":"$2a$10$mZyycuD2mCM7BdOWDZSWz.OhpCMOwhXnHhZ4gT8GniG7HchrZrlIm","updated_at":"2016-10-28T21:31:29.199+00:00"}}	2015-11-21 06:51:50.798828	2016-11-03 07:13:54.429169	\N	\N	paolo_-_Copia.jpg	image/jpeg	30631	2015-11-21 06:51:53.900896	0	---\n- ejCmTTMQp0o:APA91bFxf66Zncmz7XJZF2qZxvDrlfeu2znGP3t3ne7QtwT5n-G39FIIy7GTRUFeN4kMeTy6LWbNZ84SsLclmiLrMmThC6nPW_GWv0iE6BcoFvdhwtQQnEEKiTWp9QzKs0flD9uiu5Hs\n	\N
70	\N	Alex Hynte	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10153644687161886	$2a$10$zrwGUlOrHZR8NE0ohCZkQ.uNh7Ynpvs7J6AlStQdJ.4e78n.Tesxq	\N	\N	\N	1	2015-11-09 18:48:34.704796	2015-11-09 18:48:34.704796	93.51.20.164	93.51.20.164	\N	2015-11-09 18:48:34.704085	\N	\N	\N	http://graph.facebook.com/10153644687161886/picture	rerosku@gmail.com	{"kEqO734ynSk9YlcTMT4-uw":{"token":"$2a$10$ZpXHpSdSCqOZ13rNAEn7oO0opCig3GEOifYfqAbQplYySaHFX2baC","expiry":1448304524,"last_token":"$2a$10$.uNPifJnn86q0ft7nhnwr..NnmTW.yKT0xH8BY5zOt9UaNmbAUcGm","updated_at":"2015-11-09T18:48:45.325+00:00"}}	2015-11-09 18:48:34.707087	2015-11-09 18:48:45.326691	\N	\N	\N	\N	\N	\N	0	\N	\N
181	\N	Francesca Carà	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10209210019320936	$2a$10$sCGoeaVbl2m.wppbbJumUeODu3bB8yU6voTG34j0cEf4wQn27EA6C	\N	\N	\N	1	2016-09-30 20:50:28.88525	2016-09-30 20:50:28.88525	93.56.112.134	93.56.112.134	\N	2016-09-30 20:50:28.884824	\N	\N	\N	http://graph.facebook.com/10209210019320936/picture	cara.francesca@gmail.com	{"jQaCxzgj6PS7_Wlxm2Al1g":{"token":"$2a$10$zoS3V9PDoWcXXGf.lhNaROUvLIJK0.sO0Ohv/517ClIRKTjxVl9Lu","expiry":1476478228}}	2016-09-30 20:50:28.886929	2016-09-30 20:50:28.886929	\N	\N	\N	\N	\N	\N	0	\N	\N
113	1969-06-02	Cinzia	Alberica comuniello	\N	Via Rosmini 6	Biella 13900	BI	\N	\N	\N	email	cinzia.comuniello@gmail.com	$2a$10$CsSwAKOiWe3bTydczKuO.OSckIV3x3Qz.gfh7lGHfBRwgNgPAzCL2	\N	\N	\N	2	2016-09-30 05:23:55.009295	2016-06-01 08:45:38.411506	5.169.97.229	62.18.107.22	LT9VZBz1ep6sMNVqqCWX	2016-06-01 08:44:06.130341	2016-06-01 08:39:01.834585	\N	Cindy	\N	cinzia.comuniello@gmail.com	{"FwWwqp8Zr2Al7Om7ujdIxA":{"token":"$2a$10$9c8VAub2ogKAIFJW.hZ2serjMpgs4s9NdSPZrXuPuBd5rAhGWkwWu","expiry":1476762934,"last_token":"$2a$10$9wn54lSLnIbwzw8tRNA6feDN/ortXsroHRB8r/osm/0aPGCSVayaW","updated_at":"2016-10-04T03:55:34.640+00:00"}}	2016-06-01 08:39:01.566431	2016-10-04 03:55:34.641912	\N	\N	data	image/jpeg	19043	2016-06-01 08:39:09.578513	0	\N	\N
105	\N	Stefano Mancia	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10206116550904852	$2a$10$zJtV9NYFT/kxR5UzGcDb8.5dlhvelN.SzfcZ71lOjI7jF.SRSum7q	\N	\N	\N	1	2016-04-29 12:57:02.346959	2016-04-29 12:57:02.346959	151.68.126.152	151.68.126.152	\N	2016-04-29 12:57:02.346548	\N	\N	\N	http://graph.facebook.com/10206116550904852/picture	stefanomancia@gmail.com	{}	2016-04-29 12:57:02.348475	2016-04-29 13:03:52.622515	\N	\N	\N	\N	\N	\N	0	\N	\N
151	\N	Antonella Didero	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208552189035065	$2a$10$4MmVbnXBxcpIrXr3CBXboO6L355PnJme/86AEKdnPZlDx8aGkyDoy	\N	\N	\N	1	2016-06-23 12:34:58.589999	2016-06-23 12:34:58.589999	79.51.69.71	79.51.69.71	\N	2016-06-23 12:34:58.589598	\N	\N	\N	http://graph.facebook.com/10208552189035065/picture	antonella@fuma.it	{"aagxAt6_O-9wFksRmbf1-w":{"token":"$2a$10$SSRefypJEBVTYunt8Z7pL.vZ69gRgBEVtU2PtF9iONHTBHMJ3mic6","expiry":1467924076,"last_token":"$2a$10$pa1M06f1fiOJwQCy4xzBLO6DitYx7PCplxvTw9ujGdbhv7i7/.JqS","updated_at":"2016-06-23T20:41:16.689+00:00"}}	2016-06-23 12:34:58.591568	2016-06-23 20:41:16.69048	\N	\N	\N	\N	\N	\N	0	\N	\N
164	1987-11-02	Lucia	Boschetto	\N	Via Pajetta	Cossato	BI	t	\N	\N	email	boschettol@bonprixitalia.net	$2a$10$rxARPiWJs4EfSZ/aC8rfKeyXxdGC/ihpu.PK.sj/mnDgj8czWvC5q	\N	\N	\N	8	2016-11-10 10:34:57.077441	2016-10-13 13:21:27.509361	185.59.164.10	185.59.164.51	R7K1Uzydo7cuERmvHEMj	2016-07-14 09:43:47.635873	2016-07-14 09:23:26.11112	\N	Lucy	\N	boschettol@bonprixitalia.net	{"zlI9AVzWdcRELqDGQLNHjQ":{"token":"$2a$10$R0BO127ijFSB0UNeTEVlE.O1Rg4nZtIvOPDIgB5S/U7a3a4Zov5Yi","expiry":1478852617,"last_token":"$2a$10$pWK4mYh/gHEgPR9u8jQJx.BS8Jg6MzdY0aihKRe7/2r2ZQaCVcRyi","updated_at":"2016-10-28T08:25:26.416+00:00"}}	2016-07-14 09:23:26.108442	2016-11-10 10:36:27.11202	\N	f	\N	\N	\N	\N	1	\N	13836
86	1991-03-07	Andre	Macchie	\N	via monte bo 44	biella	BI	t	\N	\N	email	test@koodit.it	$2a$10$VacO9v0PPimWsyOa.cSIDufxcCW3UGpAuXC8Uvc58ImTeg.jkwcRm	\N	\N	\N	7	2016-01-22 16:42:59.95218	2016-01-22 15:09:55.859453	93.40.187.140	5.90.35.191	BGULjfys9fyKknT1Jvsj	2016-01-22 14:35:37.820698	2016-01-22 14:35:23.616538	\N	makks	\N	test@koodit.it	{"-772QWOozYWKlpNU1fPFkQ":{"token":"$2a$10$uqDn.0GcfZEp4MxRHtNWh.JwMAl0ZwHArrRIwLSRC5pYa/VVk6lnm","expiry":1454682937},"I7la0Cv12fxXtb1qI4Zvng":{"token":"$2a$10$gZAwNS5X5Mn09b51Y.EdMu9K4edOlsJM7Fy9ydHrbMFm7wuX.r3sS","expiry":1454683128,"last_token":"$2a$10$3SEQV3Fc4zDmwkBZGfKXLuOzSS52T1EDEHg/o0C1On9bo0P5nDZHK","updated_at":"2016-01-22T14:38:49.196+00:00"},"aA4_ZdYUHbo2jNIuFCB62w":{"token":"$2a$10$z3CtN4YANFmUP5Nryycc6ujrAiiv2HUFyWPd0IM/XHzKPhryslCQu","expiry":1454683345,"last_token":"$2a$10$czc3gbRodwr3IeJiv22hO.1gqx55tGb01RL/qi.4Hrv7pqmNhboqG","updated_at":"2016-01-22T14:42:26.684+00:00"},"DSwThdEsiubHUjmknMpygg":{"token":"$2a$10$tHO3o1YXAjyq0soOcWj6teLuYC0425gpKgfmCBESBRh3yXAU0BQbG","expiry":1454683568,"last_token":"$2a$10$x7bvdL2zkHjucxhFvfrSs.f6rhEikECxZHMTc4T4lfW.PavSLUL5q","updated_at":"2016-01-22T14:46:09.220+00:00"},"2rYzDIahO30qA0NcV8TfCg":{"token":"$2a$10$1TK4B3ziB4AiFOkMTVy0zu7jj2H3peRV4SicOfGfVRArSD3Jly72K","expiry":1454683692,"last_token":"$2a$10$8eYPrMYzlO1OEhjfNa62vupTBEjnbcfZnrrosHpHUAGWb/JS4c17q","updated_at":"2016-01-22T14:48:16.492+00:00"},"iAT9YTMi1tZCLT_mykiJrQ":{"token":"$2a$10$hdke6HbEk4YuQ7s9He9jXenp9gnHITVrSdoildrmcoeAy9LvtCtKS","expiry":1454684900,"last_token":"$2a$10$/bd7foVfiSk2sZzRJWU/0OVppWFinN48T0xgKpTAo4CdjiS1i2pSW","updated_at":"2016-01-22T15:08:20.363+00:00"},"GYLGpS7IjggWd5q32QBwzg":{"token":"$2a$10$Uk2Q9vczwKk.p1OSNI8GYuR/4yfTNabcacmoz9BrrliBh9VdjwseC","expiry":1454685147,"last_token":"$2a$10$kn9Ubbku7yLbm/SR3EHON.se3ATmH5sdxAIVKnnRLcZGYb9nwv0aq","updated_at":"2016-01-22T15:12:27.777+00:00"},"yyWUfmUjFFtl5dh2xoOnaw":{"token":"$2a$10$5T/ahbtHgpe2rbCmPtMiDOnVJQQmgotmFKPLDyzgkmeGAwB3fx3E6","expiry":1454690636,"last_token":"$2a$10$jHio.eysv93dcMrc6kvNVePDPPkLMq72byJC5Lh9KveuzOFWzxQ8C","updated_at":"2016-01-22T16:43:58.168+00:00"}}	2016-01-22 14:35:23.407147	2016-01-26 13:18:13.052959	\N	f	\N	\N	\N	\N	0	\N	\N
135	\N	Gigi Sabarino	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10209487599417631	$2a$10$UsTN9iFBUDiLqW50iwwHB.eWN2RfzCMiunhfNx/7QCa4eJw9Wbwu2	\N	\N	\N	1	2016-06-17 12:23:30.590004	2016-06-17 12:23:30.590004	5.90.45.125	5.90.45.125	\N	2016-06-17 12:23:30.589611	\N	\N	\N	http://graph.facebook.com/10209487599417631/picture	ilpreside@hotmail.it	{"sV56lyryx6HxatopdR_lbA":{"token":"$2a$10$Ka1AUnth5zDFy7bZIE.VPe3VEAfoeg0VNCgxck/h4gCR2EK9SvEAW","expiry":1467375978,"last_token":"$2a$10$h7T0jpBxO/ZFZIauVpP4heSL4RVhqfKLaw3tSfA5MyfyHN5N/ZnOC","updated_at":"2016-06-17T12:26:21.083+00:00"}}	2016-06-17 12:23:30.59196	2016-06-17 12:26:21.084564	\N	\N	\N	\N	\N	\N	0	---\n- 160ac2c64ca4fe6dd98f187dd3788a7689aa5954d743defb84fe54b592c47aba\n	\N
23	1991-03-07	Andrea	Macchieraldo	\N	Via Monte Bo 44	Biella	BI	\N	\N	\N	email	amacchie@koodit.it	$2a$10$zvuBRUagWjVdLEnJ3bOO/Oo8uEpBEW49tcwZ64BanQrqlT.Tar5WO	\N	\N	\N	9	2015-07-29 19:55:47.893373	2015-07-29 18:35:24.51681	93.49.203.151	93.49.203.151	VWyvUy7QBs8jzQmifTUs	2015-07-28 14:22:53.010476	2015-07-28 14:22:07.292272	\N	macchie7	\N	amacchie@koodit.it	{"jEJhO0w_m95q2ujvJ4oxLA":{"token":"$2a$10$B3S5z0vmmYEE7XxcgXf5EeTaqxM91/46b1v4mSTWDeSS.CWEtxVNi","expiry":1439302974,"last_token":"$2a$10$Lhc85JoWsoo6uERide6BGu8HK9raDNSQfHtyR.TEbUqaYQ4z.vnWG","updated_at":"2015-07-28T14:22:54.440+00:00"},"WWW7ciSvN2BO0vvJZq6EAQ":{"token":"$2a$10$.tAH3.RHyXAzFxIjnOjg6eMYikj4YKudxHh7wXXaYCnhT6Ou3TgOO","expiry":1439303458,"last_token":"$2a$10$Yqk4FGQGOnVJ8KrkL8E/c.mwEzYTK1gXoypvNeHJ3MppTd89Z3GC2","updated_at":"2015-07-28T14:30:58.690+00:00"},"VYTQId6wcdfyh5Yqv7J-4g":{"token":"$2a$10$Gfb6pCMEBBwRjiUdlBc/3.cfStfuCf4tZVB6KNEg30IWfUIVSBQtW","expiry":1439303877,"last_token":"$2a$10$mJJdaqpAyCpJ.oV6XkDCsuuzdWaKpc725eLiyi4mu56GihmlMPAuG","updated_at":"2015-07-28T14:37:57.801+00:00"},"644_eLk54ddXizrYt01Z2A":{"token":"$2a$10$jTPMHhFaUclLhZJNTZ7duu6zpwbnsClGCA520Lj.CADFF/Frqsp3a","expiry":1439304832,"last_token":"$2a$10$JYxSseMXNnZMuvt56y0LtuI7Du7O2CRBudGcsPCV5..023CT03FQi","updated_at":"2015-07-28T14:53:54.116+00:00"},"trkQ7O0RLhIkn6GpuGcjIg":{"token":"$2a$10$xfagrOvzsJex451HvaMiv.LNGOfzwM5Mr2JZ8vIxwAgSFsNNX/6Zu","expiry":1439305095,"last_token":"$2a$10$pcenqTXkYHbIjOOdHCqNBembTmIN3/hzdejFyaO.tiAohHRzvQ0eq","updated_at":"2015-07-28T14:58:15.191+00:00"},"vAu-gIZCFLlSjVqVaY_oJQ":{"token":"$2a$10$DRFdLD4DfLrCfOQzaOFdhOYscscPcq6hM8FJ7gRNa4q13CJL2Xf/O","expiry":1439305299,"last_token":"$2a$10$7L8lXptPEMMj96SJDyt3COpd5.RxN7dj1Ky0C.4e3EFGq5Rj6c6Fa","updated_at":"2015-07-28T15:01:45.511+00:00"},"ZmMPhFr3RhJIqso13TNo0w":{"token":"$2a$10$A3jgeM.TuKqlKJrvo9dTL.GRzbV2vlA/StwrfIMr0kk9qoaoqNYyO","expiry":1439307883,"last_token":"$2a$10$/vaoY6aQ6V.cATS9Ji67Sej2kPBwb3ZbZe4SHC3W3T9OBugDh0qkG","updated_at":"2015-07-28T15:44:48.530+00:00"},"qs31oZZ8NcCcXXFdftW-zQ":{"token":"$2a$10$d2bnC6N4RGU7XHCDSNfdF.ofdG6C/kOMQR7icGkQrIzeCYtIgUSGS","expiry":1439312150,"last_token":"$2a$10$cCJMun6qsD1Yuk5byrACbupBrsdEvU.rTGQt3f4YKNFQ6QZ7sM7Z.","updated_at":"2015-07-28T16:55:55.676+00:00"},"lea2tqtrJ879X4d2CpTEGQ":{"token":"$2a$10$.LyJ1Pv2VyKdHbq4bGIz7eBNtKf9cOZqrO0glisF8tmAOYmenfdUS","expiry":1439312136,"last_token":"$2a$10$1KWavadnZJNZDppz.E3vneMKUvx1yrfibwQjvIB2StO2c1gNLBM2a","updated_at":"2015-07-28T16:55:36.631+00:00"},"XjLJGkvrWTc0urzoOgX5kA":{"token":"$2a$10$/ge1S4MKDhGVq7dVxuQs/.xpiRWSMictDk0UJ6RpPZFpRag7FtYu2","expiry":1439311051,"last_token":"$2a$10$MxFwF55F0ul71jkTwNudROWceItGeSXOZubxMP1eP9N3BJlXWoTHG","updated_at":"2015-07-28T16:37:31.318+00:00"},"T3TDrHyrc7LpNffpH94-KA":{"token":"$2a$10$AB1aAYU2vUK/2/3UNphD3umOSq4z0sF9odnddskR7RzZQLKlsezza","expiry":1439312320,"last_token":"$2a$10$QY7kYDDdcb4ikTb6ONzVb.s0bxcS23kzWNYCKZDUQXzJWPzo8Sr/.","updated_at":"2015-07-28T16:58:40.917+00:00"},"hAtWIWcTQfGDijEQaKX0sA":{"token":"$2a$10$5RLWuP/0L8THPgAdmbkzg.NpJ.8EEB79IViM7XnKb39pbeABnnmpa","expiry":1439404524,"last_token":"$2a$10$/yXAIDqcRvEZJKnYEcJQcOyycgZ/bDONbMpUCA553bA2exxTMkzuu","updated_at":"2015-07-29T18:35:24.599+00:00"},"hwTz7lVcEV6W8isNv4FgUw":{"token":"$2a$10$TtCun9spJYpGxlq29pXh9eNrFnM3rt.g2TUWrXh59Fgsh6CfGPaiq","expiry":1439409347,"last_token":"$2a$10$xVNBvp4UkddjyHPebe.po.YN/ZB1aHUhKKgQm/XpiCt1L99jx9ktO","updated_at":"2015-07-29T19:55:47.977+00:00"}}	2015-07-28 14:22:07.066558	2015-07-29 19:55:47.979997	\N	\N	\N	\N	\N	\N	0	\N	\N
136	\N	Giulia Pancotti	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10154285751356692	$2a$10$CjA7alMtrAsogLvSMQRha.uk2nXfuhSHcJynZsmOKqEYUHWZM1yqC	\N	\N	\N	2	2016-06-17 12:51:35.826508	2016-06-17 12:49:26.010192	2.34.122.20	2.34.122.20	\N	2016-06-17 12:51:35.825983	\N	\N	\N	http://graph.facebook.com/10154285751356692/picture	caramellina_giu@hotmail.com	{"3oYnhVA8EOo-9JqVVnXtUA":{"token":"$2a$10$Yyg7oGivVQ1t4M8ndWvTLuy6GEjfbgOdJ8PyZ8E18O43ZRB4UkpFe","expiry":1467377365},"UBjPBKsOgLqf7HVqHZxk2g":{"token":"$2a$10$fVG0c9r7h7EGTv8QNVibHeh0ZYoUomNgSNCpUI50N1T57cvvAc6s.","expiry":1467377544,"last_token":"$2a$10$vlH/GinwAwlaZK9Vg1pExu5kNklqPjfhUyA9dUhagJl7lslezU1Zi","updated_at":"2016-06-17T12:52:24.203+00:00"}}	2016-06-17 12:49:26.011641	2016-06-17 12:52:24.204826	\N	\N	\N	\N	\N	\N	0	\N	\N
31	1978-05-26	Dario	Lo Iacono	\N	via toscana, 19	biella	\N	\N	\N	\N	email	dario.loiacono@iisvaglio.it	$2a$10$.xmkjZTkKf2nW49Ex2Zok.84j6JnvP8M5C.rDWEV0/BVCz/uXqCLq	\N	\N	\N	1	2016-06-01 08:53:33.012475	2016-06-01 08:53:33.012475	79.1.108.117	79.1.108.117	37b7d8aeadecca0b29166fb62bb4e7fb7de49c6ece86a3537ce351d56b2f2d12	2016-06-01 07:04:17.4785	2015-09-04 08:15:48.491059	\N	dario.loiacono	\N	dario.loiacono@iisvaglio.it	{"NBMO5Zax6tMw7BeggM-RCg":{"token":"$2a$10$PLFlj9tLMOg8GjOCC0xdqefFCgX3q0Q1fQIAfjByNzBfEJmVsTMb2","expiry":1465974268,"last_token":"$2a$10$BAxLeGpxGvWyV.1MnSJnfOKGsEXmr2YX3utL79xQCFENjVj0QDgva","updated_at":"2016-06-01T07:04:30.715+00:00"},"R1wVjmjcNRA8YQf4FgMpjg":{"token":"$2a$10$4b5WLltwAMxr4iG5DrPMpOlgDQ0Tbw9IVeKHIFm/EpUPcfuI/L9n6","expiry":1465974730,"last_token":"$2a$10$7r0r6gOc8UXE5sYt29vlLO3z6VI.sqwjoY6Hmgzx8VG2Plpmiz1TS","updated_at":"2016-06-01T07:12:13.041+00:00"}}	2015-09-04 08:15:48.270064	2016-06-01 08:56:38.848739	\N	\N	\N	\N	\N	\N	0	\N	\N
123	1997-04-05	Othmane	Garouj	\N	Strada regione croce N.14	Biella	BI	\N	\N	\N	email	sheikh468@yahoo.it	$2a$10$n5wf7zoQ8x09c4M5PjQtOOzLb/32b4QoDLAD7nSQ3i3Fr7CCg4bN6	df5bcd4458d0d652dfca2b4f4d7d64da6c98d8b11acff69ba715d0450cd8e4d2	2016-06-08 13:08:59.533759	\N	1	2016-06-08 13:10:55.938773	2016-06-08 13:10:55.938773	151.60.186.109	151.60.186.109	NHA2oEc7A5fH9vxrSPN-	2016-06-08 13:10:30.498271	2016-06-08 13:07:04.774441	\N	Otty68	\N	sheikh468@yahoo.it	{"GZA_VxFKVquoNYy1OrVEqg":{"token":"$2a$10$lV3OQc2/.VRR74aqNvLCkeOQLbbj26U.ShVk2N3kQb8b3bz43vUO.","expiry":1466601034,"last_token":"$2a$10$8OmTH2LFQ5tET5Y0MfFn4.gopenYJ6LDC0rMfavrw9oVtPoEqwNgC","updated_at":"2016-06-08T13:10:35.163+00:00"}}	2016-06-08 13:07:04.77244	2016-06-08 13:13:17.276681	\N	\N	\N	\N	\N	\N	0	---\n- 6fa789d7d9fde7d6938dec4f171d4a38c33cbfe72bdb6f37a72bbed2a9030925\n	\N
22	\N	Andrea	Meloni	\N	via brovarone	biella	BI	t	\N	\N	email	andrea.meloni91@gmail.com	$2a$10$T5zjUv4gTvLMxkWpyaUe6.y/kWSTfLo/T8wAR.Eq50yZUHQnO5Qle	\N	\N	\N	11	2016-09-05 09:51:20.100852	2015-11-16 09:35:10.729958	93.51.26.183	93.48.237.3	SjyULPtqatF-cz8wsqCf	2015-07-26 15:59:25.457071	2015-07-26 15:58:59.656843	\N	Melaz	\N	andrea.meloni91@gmail.com	{"xytKhtOj7BpQglJPKMF8YQ":{"token":"$2a$10$dPanVSUw4WGdoyWZPjrJQOhIk6uORLvjNp3Z6iHZM2wReQ8mD4W3m","expiry":1474278687,"last_token":"$2a$10$ySZ5UthBaShyDx4WIyVE3.rrivPvOBSlmDvr/NM2h.dZwdVThT5zK","updated_at":"2016-09-05T09:51:27.524+00:00"}}	2015-07-26 15:58:59.437624	2016-09-05 09:51:27.526231	\N	f	data	image/jpeg	21751	2015-11-16 09:28:39.649472	1	\N	\N
15	1980-02-09	Riccardo	Ruggeri	\N	via milano 32	vigliano	BI	t	\N	\N	email	ruggeririccardo@hotmail.com	$2a$10$uykr9p9qrrRQdhe.Sm49PebBWVG47T85DAupHJ7QJuihSLOcpnCRe	tMoK4wxHuGHsJTznU6Tf	2015-12-18 12:31:37.901894	\N	102	2016-11-09 16:24:26.735949	2016-10-24 09:06:06.727161	79.62.103.149	185.59.164.51	\N	2015-07-10 08:08:17.09451	\N	\N	Ricky_ruggeri	\N	ruggeririccardo@hotmail.com	{"itT9FwHLk2yv-VDbhFL_iA":{"token":"$2a$10$A1jtm02cKrKq04NiRUr9UOO3/G1lMzQTSI9McWi7JBT9yupKsClLm","expiry":1480072268,"last_token":"$2a$10$w17lZQL08w5xuGmMuUlVwOcP9i9Ii/D3JOIV7RDCNwrT3WRR1YQre","updated_at":"2016-11-11T11:11:10.661+00:00"},"WVh7zJFaqS2lM10poIXRDw":{"token":"$2a$10$fvMWj92Iypb.gqvdCjJ34e7OWzTv2bopnrJcdgvGt8Mz4lqethITK","expiry":1479918286,"last_token":"$2a$10$MY0pOlGpdgmgoy1lvmMZbOI67juNJjQ9KWYmkDOyTDezHhgUGrMyy","updated_at":"2016-11-09T16:24:46.654+00:00"}}	2015-07-09 23:08:11.953445	2016-11-11 11:11:10.664327	administrator	f	data	image/jpeg	63364	2016-09-30 16:41:40.865313	2	---\n- 8b0069cc56ecf00be3294646886891fb558d8b1b049945caa32d99fc5a40786a\n- 6de2cec969936fd75df311c7324f6d09410ee512ded8238f3cef2341cb46cb8b\n	\N
122	1999-10-28	Giacomo	Miglietti	\N	Piazza 25 aprile 2	Biella	BI	\N	\N	\N	email	giacomo.miglietti.71@iisbona.gov.it	$2a$10$gY4ve7vdYV1W9gsj/QX3cudQD3H6nCHTQHkBf1d8ecqUDhFq6BeKS	\N	\N	\N	0	\N	\N	\N	\N	UuZV1xMfaGx6yzdWHE8u	2016-06-08 16:18:13.252924	2016-06-08 13:00:28.964006	\N	Giack	\N	giacomo.miglietti.71@iisbona.gov.it	{"qHd7gO_elWdqtE1xU93shA":{"token":"$2a$10$RXkcDerT79xZSRkUabBYQeosIhlvTjIyid/i2wGAu6DKddexhYaTW","expiry":1478689564,"last_token":"$2a$10$TfaA/cD2S3rn0IiK4.eSnuaFRDNhRVQ5PumRwDjhrdlhCGC8laEDG","updated_at":"2016-10-26T11:06:04.199+00:00"}}	2016-06-08 13:00:28.763297	2016-10-26 11:06:04.200879	\N	\N	\N	\N	\N	\N	0	\N	\N
13	\N	Pietro Perona	\N	\N	\N	\N	\N	t	\N	\N	facebook	10207531688314849	$2a$10$mQJtO.I5LOOq1KXgOZ1dU.Dobnr112ImdeotAXs1GfpVlBcq5tY7K	\N	\N	\N	26	2016-07-18 12:52:40.01366	2016-07-18 12:49:49.889447	93.32.193.128	93.32.193.128	\N	2016-07-18 13:57:12.023575	\N	\N	\N	http://graph.facebook.com/10207531688314849/picture	pietroperona@gmail.com	{"gM8mRYUhXEU-BDngQmchzw":{"token":"$2a$10$yezSouRhumr6i8Hp3SKCyeSf96E23PSYysordHk3Qvs/dReqlVv1m","expiry":1470122773,"last_token":"$2a$10$/lW22KopjvseuTVK6/uvQOikXp9bCnVyxeT7gWiU09dMS2wDvoiLe","updated_at":"2016-07-19T07:26:14.072+00:00"},"FHgI3R0Aq8j6r71TQSoAyQ":{"token":"$2a$10$8GlANfk.cUcUwZMBpPRIf.0ej8s9T03ufiPkwRKDBwfbFUi3u4v66","expiry":1470060389,"last_token":"$2a$10$xl4E1ifDD5tc7.Qmvjn/lerDExygNcQ/d5JJNNt7aF1i./7RRwvFK","updated_at":"2016-07-18T14:06:30.055+00:00"}}	2015-07-08 17:25:29.742766	2016-07-19 07:26:14.073611	administrator	f	data	image/jpeg	53096	2016-07-18 12:54:33.527087	1	---\n- 42aadca37e38c58520165935027f9a56ea7fd0908715b20fbf3d05d39a098e1d\n- f1439de69a71985b905d5f99f7b847a27d5903a5133b3263bd5a059aacff6c15\n	\N
194	1991-05-05	Enrico	Panigoni	\N	Via trieste 35	Biella	BI	\N	\N	\N	email	panigoni@bonprixitalia.net	$2a$10$tgJyx2gic5t9Xwc38DUh3eN9IQVx11uRMvSISxKM3yfWiqJBpBb4i	\N	\N	\N	1	2016-10-18 16:22:20.476282	2016-10-18 16:22:20.476282	5.169.97.143	5.169.97.143	JLo-cKkKv5Cu21DUZBop	2016-10-18 16:21:24.720446	2016-10-18 16:19:08.634446	\N	Panigoni	\N	panigoni@bonprixitalia.net	{"Ib8YZohI-Q6gK0KEVgfFkw":{"token":"$2a$10$P0vQSo.l7Uq2cmvbpX1B.OcYWNRohuFq5DWgj8FJbxh72yo7R1gA6","expiry":1478017286,"last_token":"$2a$10$MyqMTo.TToQ7RQSsyrLZH.2nF55rbA/sSw3yAioJLS10q8cKxJ4Nm","updated_at":"2016-10-18T16:21:26.506+00:00"},"Ij7rpx5_C7pVYF910kaoyw":{"token":"$2a$10$wJlllvZ1Ox6E1dq/EWniDeEU/umrcgjnsepkV6iWblHbrcSC7eNGi","expiry":1478880453,"last_token":"$2a$10$6NwQsHCTeInojblNAiWELeb.5UCj3TUaxBWzgEBJPARskfpMT2u9i","updated_at":"2016-10-28T16:07:33.369+00:00"}}	2016-10-18 16:19:08.634008	2016-10-28 16:07:33.370724	\N	\N	data	image/jpeg	23269	2016-10-18 16:19:11.800082	0	---\n- clmdcrcjRx0:APA91bHPjSWZ3lYiYgUUWl9gUmGAp1QLDJd9XE3H5lwV4ydcRGTBzNOZHfR8cdIqmJL9vPVTVS6-mIceN5kPjvzE00oUpJ_14bfxl46QYCNV3GXoD_gJpPsAj4Z7AALzxY8atxw4LTI3\n	13900
209	2001-03-28	Barbara	Izzo	\N	Via Faglia 27	Gattinara	VC	\N	\N	\N	email	barbara.izzo@liceocossato.eu	$2a$10$c1k5nz3X8cXDufQmHIq2cu9iLvjCXh5Q2NyYGWBFeVDpREl8DR0H2	\N	\N	\N	1	2016-10-28 12:28:52.459917	2016-10-28 12:28:52.459917	2.34.109.210	2.34.109.210	i-Yx3dtDHew2b8s-S9Az	2016-10-28 12:26:42.416373	2016-10-28 12:24:57.010439	\N	Barbara	\N	barbara.izzo@liceocossato.eu	{"hT7i3U4Zk3bdQRVyV9Dv5g":{"token":"$2a$10$e3F8ADUgY28T8Aphf.Shr.bPshRlMHh7CDjlLkpVtqffkwXHIHMO6","expiry":1478867206,"last_token":"$2a$10$nKR.AhtrvMZ.ZyABD9/sWO0Kxq/hQAIZ.2297TJaY8rrogXFp4oXS","updated_at":"2016-10-28T12:26:47.746+00:00"},"e7Q0NDg1ZXo29yWg1EYt7g":{"token":"$2a$10$5859OoDvEV73sgly3C70j.tw7mLDfl3JMe9kkSx4DJEZgMso5qWJq","expiry":1478867298,"last_token":"$2a$10$WVnrC1629ZbNRnmlfYtu3elJBGJNzsUGuEedIwmwI9/k9UxyRgJNa","updated_at":"2016-10-28T12:28:18.616+00:00"},"RnmKDffW7NnWbI4_wU3AQQ":{"token":"$2a$10$qZyKLUdXQn2NSfXXY/rSTuFB043nK7/Ohey0mIpKzV1aAvnnG5rg.","expiry":1478889867,"last_token":"$2a$10$FZQxZ1oOXJe1RVxu/hGSf.Pgnv0f7OBOy9ceSrJdT8b/660RH73cS","updated_at":"2016-10-28T18:44:31.503+00:00"}}	2016-10-28 12:24:57.010017	2016-10-28 18:44:31.504737	\N	\N	data	image/jpeg	56966	2016-10-28 13:34:28.177588	0	---\n- 2671c4249958796ea427e085a6890b71ed6ccabedc9a5f2813aa800ffab38e48\n	13045
208	2001-12-27	Emma	Marafante	\N	Via santa marta 22	Gattinara	VC	\N	\N	\N	email	emma.marafante@liceocossato.eu	$2a$10$1PTtuTN7VjqfwCTLD.5IEO26xRzkRqpEaYIkMY78RE0r1ybF64b7G	\N	\N	\N	1	2016-10-28 12:15:30.422183	2016-10-28 12:15:30.422183	62.18.105.4	62.18.105.4	sX3k4RQRzBLV2p231zm9	2016-10-28 12:14:58.69661	2016-10-28 12:13:21.896709	\N	Emma Marafante	\N	emma.marafante@liceocossato.eu	{"dmcUcYowlZiEHDShE0dsGA":{"token":"$2a$10$TCF5vMIU6t.SiaS0TwI3TefG96JazomfK11qaD.9c9wTlADueVPeS","expiry":1478866501,"last_token":"$2a$10$9vpemEgYIC/6htPcoSwtxeFxY.xwvNmzsS4Gpj1sWmRChSZHIbXPy","updated_at":"2016-10-28T12:15:02.095+00:00"},"Jb8Tvi3-mHXnMlbZJnVWzg":{"token":"$2a$10$dwLcFU0Ei8MBIQDAp0jWKOW3iVLFfdigeq3OkWI9O89YQR07BDcMC","expiry":1479809112,"last_token":"$2a$10$IoQWNMW6wALPv2FYn0mfS.MSym9GlxhcJ14ktsJ3soRL7pWkinGF.","updated_at":"2016-11-08T10:05:14.409+00:00"}}	2016-10-28 12:13:21.896025	2016-11-08 10:05:14.411816	\N	\N	\N	\N	\N	\N	0	---\n- 6ae62537eeddde0b9451ecbdea8edb76922cc206b7a5a7d7b2f8fea2e7693612\n	13045
97	\N	Alessandro Il Biondo Giusio	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10208027580800169	$2a$10$CFpzgsJo1hYUp3d4ZI4l..1qH0pEx04RJiPX4mf/CoeGinaCCDJw6	\N	\N	\N	1	2016-04-07 12:49:15.438819	2016-04-07 12:49:15.438819	93.56.119.84	93.56.119.84	\N	2016-04-07 12:49:15.438332	\N	\N	\N	http://graph.facebook.com/10208027580800169/picture	ax22-tommymotosega@hotmail.it	{"_gmzNLaqyXaDoBztMHuCxQ":{"token":"$2a$10$vX/pFskffM1GnEISQswMVe8sp/RzLrCIkAdgChpuegb55R7cOMKqO","expiry":1461243026,"last_token":"$2a$10$66x1ebS7tF6Ext0Hw6sQi.jaFjOpd25W435AtbO6oCdRY2CE5nHk6","updated_at":"2016-04-07T12:50:26.538+00:00"}}	2016-04-07 12:49:15.440249	2016-04-07 12:50:26.53949	\N	\N	\N	\N	\N	\N	0	\N	\N
202	1996-12-04	Giovanni	Vergnasco	\N	Via Oropa 336	Biella	BI	\N	\N	\N	email	vergnascogiovanni@yahoo.it	$2a$10$6N8TczoQfUTyovT8igR/6ub18CwKre6Oum64ZEGlZmJUVFm/Rr7N2	\N	\N	\N	1	2016-10-18 19:03:06.396497	2016-10-18 19:03:06.396497	5.90.49.136	5.90.49.136	rQJNnHQ-o6upChQwyefy	2016-10-18 19:02:29.155025	2016-10-18 19:01:14.946727	\N	Gvergnasco	\N	vergnascogiovanni@yahoo.it	{"8c1zOIm6EDKkTSxVPAkkmA":{"token":"$2a$10$gnPnnHujw1AwW.7Vw4k7u.IImGrHfKpkmu.tLqGUWqcCa0ACWa/Mq","expiry":1478026950,"last_token":"$2a$10$allFHWdEyrAANLjhkVjEmOVfXiRFHhqm1TAXnsTAVrEVYqJilfd7i","updated_at":"2016-10-18T19:02:31.542+00:00"},"t0ZREzn0v9KLe0FJCQ3T9A":{"token":"$2a$10$nH9xQlenTbcRGr17fwaHGezessNbY5VsUHOHAK67a18i5aC/mN3/O","expiry":1478027031,"last_token":"$2a$10$JsCUHOYNb5JKdLfVW.HOpO/pRhXoWILjK8h4aaoPKqeHHQPugpL8S","updated_at":"2016-10-18T19:03:55.528+00:00"}}	2016-10-18 19:01:14.946135	2016-10-18 19:03:55.53012	\N	\N	\N	\N	\N	\N	0	---\n- af893088deb64f9624bade1bc11fbf4fbe0ca39e1e801c7f10c42c5885ae16c9\n	13900
144	1983-10-05	Andrea	Tempia Scopello	\N	Via Florindo Comotto20	Vigliano Biellese	BI	\N	\N	\N	email	tempia@bonprixitalia.net	$2a$10$CK4PRBhVjKmRJtOxr4Kkb.ofcwuQK8q4LxVoKfP5V29Gbvj5BxD0S	\N	\N	\N	1	2016-06-20 10:54:33.05477	2016-06-20 10:54:33.05477	185.59.164.4	185.59.164.4	qtEaWyQdxyyGs3g5yksE	2016-06-20 09:33:05.721427	2016-06-20 09:17:00.083066	\N	andreatempia	\N	tempia@bonprixitalia.net	{"TSQm-rhIDUby5kswswtIag":{"token":"$2a$10$tzMSbQEyknHwQRuANw3YeeXFtQwJnTMTcj1orXVxdn2d3B1MWPQF2","expiry":1467624787,"last_token":"$2a$10$t8vE2sEjUfCtuHsEWEljVuETj78xfOmjh8sG4N6E7wa3ajFv4rZ4a","updated_at":"2016-06-20T09:33:07.506+00:00"},"6Rzw15BYnshwYcPaKkR3IA":{"token":"$2a$10$bNh6jGUkw8KC4wAkg0jAbuVU8eXMtbnVIxgrMZulaZtX58yhmJ.6e","expiry":1467629665,"last_token":"$2a$10$bufaINp0ASBsju2XYWIH8OIWyaQRseVjzANHdZoZJ75pGguaHNSU.","updated_at":"2016-06-20T10:54:25.186+00:00"},"TdNT8t8F_cuFR_CVE6YBPA":{"token":"$2a$10$aVBpL7d8zytQlwCYG1ayFO4cB9IwTbwnww17OKXg7NrIi2L9TXdOS","expiry":1467629737,"last_token":"$2a$10$g4HtdOsqeqMHnovyy6HM2Ob6X.VsTyRQ2EBoqXvQ6E3aiaF92CXjO","updated_at":"2016-06-20T10:55:37.776+00:00"},"To2H0XjMkw7MFlPr-PCWxQ":{"token":"$2a$10$0atdFylwYvq8SUwgFjAQ7OjfDpBpkYteTEryrw42jFkdVYLiPHu8G","expiry":1467640730,"last_token":"$2a$10$KYtOWAEkbXASPZqJYCj0uu3TG/l6YNM4Wt0QN6t6VSZG/3oSn/pOS","updated_at":"2016-06-20T13:58:50.428+00:00"}}	2016-06-20 09:16:59.87361	2016-06-20 13:58:50.429504	\N	\N	\N	\N	\N	\N	0	\N	13856
203	1996-02-26	Astro	Callcenter	\N	Via Adua 33	Valdengo	BI	\N	\N	\N	email	astrocallcenter@gmail.com	$2a$10$1NJULwkZSETCxYAtkFEQTOj784Nkkj4eh27AU2hr44RqLWAlDVNIi	\N	\N	\N	2	2016-10-26 18:13:10.732779	2016-10-19 15:28:09.42308	79.59.75.18	77.242.190.68	eBJ4ptUaxF9AmRYby94j	2016-10-19 14:47:26.637806	2016-10-19 14:41:00.971267	\N	Astro	\N	astrocallcenter@gmail.com	{"O6YrTjhPRw1XsLnKk9w3Zg":{"token":"$2a$10$UEHj27kDTEHd7hhkwI3Anu2WCVSwHADnsCwdLQ6/sVpQ8csYjdkGm","expiry":1478100656,"last_token":"$2a$10$QeV.DQl89APE/czFnX8wFu0sGogUP5.UytI3YzkV8.16YmnwzNvx.","updated_at":"2016-10-19T15:30:56.806+00:00"}}	2016-10-19 14:41:00.970774	2016-10-26 18:14:10.474829	\N	\N	\N	\N	\N	\N	0	---\n- fVPk6JC90jY:APA91bHk_ErzyFK6DHeOHN5Gy897WWTSVGoOKBt-Lwu90wT8k0_Hai6llzrbEMzARE9Azw6lhAByqjyK_yNC32RzRhW2uICScIzyNRruLexLAShk1XddXT8eaG45ZuaEmVieuxQeu8Ks\n	13855
155	1997-08-17	Fosca	Zanone	\N	Via Castello 38	Ronco Biellese	BI	\N	\N	\N	email	valchirioscura@gmail.com	$2a$10$GlwoddiL/FH9QN9QF9dbpuINnr5OPoTretNnxK/fN3kWwuxn8B/3K	\N	\N	\N	0	\N	\N	\N	\N	sAysZVuKCF7xFp7jX5d3	2016-07-02 14:44:42.756081	2016-07-01 17:58:52.778649	\N	Citoyenne Robespierre	\N	valchirioscura@gmail.com	{"o6kxaiFQIpk4Jd1PKbwjcg":{"token":"$2a$10$MYYeo4zu6N1cEmWviotaG.qCnmbVrNbLWfF1W6KhSE5raZTqpeQ.O","expiry":1468680318,"last_token":"$2a$10$zQK27gvRdYQi12VZjEBRQujFV51QodcCAXu6Sw0aj7MUuUwmjJzam","updated_at":"2016-07-02T14:45:20.621+00:00"},"OrAkptC0sy19Wj1Nh4eMmw":{"token":"$2a$10$cI8aG5YrSOVPljNnu/bEwezsCogq.9dB85HRtnhQli99H6upPVEN.","expiry":1468680314}}	2016-07-01 17:58:52.572184	2016-07-02 14:45:20.622731	\N	\N	\N	\N	\N	\N	0	\N	13845
210	2000-07-22	Simone	Brandalese	\N	Frazione Crose 6	Valle Mosso	BI	\N	\N	\N	email	simone.brandalese@liceocossato.eu	$2a$10$XNz49jbXY3ZeE55E3eLRHuUWUFuJFTVvRV8RLSauEKb8xO/rzjboq	\N	\N	\N	1	2016-10-28 12:55:22.087816	2016-10-28 12:55:22.087816	95.232.70.118	95.232.70.118	CxjipKMyiXn3AxmezofW	2016-10-28 12:54:35.189689	2016-10-28 12:52:37.045888	\N	Simo	\N	simone.brandalese@liceocossato.eu	{"pMETmLcwZZdAIHkv1LRE2w":{"token":"$2a$10$UDi8x8.6J0a5M3vZWiioxOvFKY4aSFf.0r8jlx7T.64LpAKljNrCe","expiry":1478868875},"oE_YHhcmiolHsvLAGdH2VQ":{"token":"$2a$10$ZuZhhUbRKZ3.uYoP0exBJ.zrAmbqEQ/7jBkxHeDqC4zb5OjHXdVje","expiry":1478868885},"AoPQvJyZAJY5i9iyJLFylg":{"token":"$2a$10$UHsJdSuisvbOwGoi3O9zdupFSSBR9cOkflAvduMrOeQZXc4ZxF.FK","expiry":1479989719,"last_token":"$2a$10$JkDCtJtSXQ4V4fHzaAc/XewzWKMqvUWot3p/6rpPKuHmMdnURV61K","updated_at":"2016-11-10T12:15:23.963+00:00"}}	2016-10-28 12:52:37.045467	2016-11-10 12:15:23.966869	\N	\N	\N	\N	\N	\N	0	---\n- elXhAb3_Lto:APA91bFuQuaznXcSkgB2AJqvJzw_GXF0qtAzng0wuVQAPS-7MRimuiiE-xl9Qrivo9wEflsTUm4VF1ZX4D109imYVhyk9t898w0hshmMmyvZiFe27wAHrI8GIsfH070Pj3E7zsVoRgwk\n	13825
211	\N	Marta Iannì	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10207549852690066	$2a$10$XBRS75R272GBu7CXasBFeuZ/N1IZZ3oJcdMTBi7.BRIqJlVHBOD8m	\N	\N	\N	1	2016-10-28 12:53:53.659947	2016-10-28 12:53:53.659947	93.56.106.44	93.56.106.44	\N	2016-10-28 12:53:53.659502	\N	\N	\N	http://graph.facebook.com/10207549852690066/picture	marta.ianni@libero.it	{"lfLhlj5nYAsXNWqVfmavRg":{"token":"$2a$10$RIjFtVpEd5KwWJNi9gF3O.PP8lWeFqMBOPuD.1Z2/1xgjFKYYYRmG","expiry":1478871660,"last_token":"$2a$10$IV9vgX2EApzoBRoDhQUZSu22C2LbRo1Q1XDIfGTaYbTqdw93mvwTW","updated_at":"2016-10-28T13:41:00.736+00:00"}}	2016-10-28 12:53:53.661307	2016-10-28 13:41:00.737226	\N	\N	\N	\N	\N	\N	0	\N	\N
212	1998-03-29	Chiara	Vallivero	\N	Via Libertà 10	Valdengo	BI	\N	\N	\N	email	chiara.vallievero@liceocossato.eu	$2a$10$d5ZZ86s9Uey3LNeZL3HDFO3It26GHLaS0yHrZTtM41JvcWVlDGEEi	\N	\N	\N	0	\N	\N	\N	\N	oPGyzL2Nq2zS-Rm7vtns	\N	2016-10-28 13:07:07.430957	\N	Chiara98	\N	chiara.vallievero@liceocossato.eu	{}	2016-10-28 13:07:07.430399	2016-10-28 13:07:07.430399	\N	\N	\N	\N	\N	\N	0	\N	13855
213	2001-04-25	Alice	Pasin	\N	Via Chiesa	Valle Mosso	BI	\N	\N	\N	email	alice.pasin@liceocossato.eu	$2a$10$2E1laafmkywHqZCWamcXbOCnMTLJjdo3qims2iNCn1HRAYeiozqeG	\N	\N	\N	2	2016-10-29 14:40:13.25809	2016-10-28 13:45:36.534786	94.163.129.139	94.166.29.114	RGeGgDxKscxxCthsx2La	2016-10-28 13:43:38.686342	2016-10-28 13:41:54.999783	\N	Ali	\N	alice.pasin@liceocossato.eu	{"Wgev7iddISEq4XGAxMSujA":{"token":"$2a$10$DKY2kDAZnj72ksA2mOTs3OPIHKn2CHAxZNwQLjrd1b5EdZMVdMq3O","expiry":1478871877,"last_token":"$2a$10$A6D5QPxDcJIb8RifOpHHhut680UnXsFvsfNOGfGBWShE5BN21akvm","updated_at":"2016-10-28T13:44:37.685+00:00"},"QjOFd5iqfIammqYqC0mvWg":{"token":"$2a$10$TRvUPSIsYtv4r6fokqxwFey/CyHzWdCGyR5a3jUJ.7Fw9UU/H.Sjm","expiry":1478872047,"last_token":"$2a$10$rJGQlFg7t.lv9a9cjK0kouDArJZzs.uhS.HaTb671.jJGuFaP97WW","updated_at":"2016-10-28T13:47:28.281+00:00"},"Eu3_YKQQEvO_KAyVNRmqWg":{"token":"$2a$10$IQ1yMYz7zxPN1YhqxtzC0uqIUJMiTXfzLg/IumB4GYLSxpM4MRpJq","expiry":1478961624,"last_token":"$2a$10$AxTSGIIiQ59CWjLulRNhN.weh8LJGRkFHAKbPBznUydFXIBq/EMgO","updated_at":"2016-10-29T14:40:24.279+00:00"}}	2016-10-28 13:41:54.999381	2016-10-29 14:40:24.280401	\N	\N	\N	\N	\N	\N	0	---\n- 3cf112b96aeafe226a1d7e58467866350978165ce5082cb4ac3c5fc272eb6b9a\n	130825
215	\N	Matteo Bianchi	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10154677040369810	$2a$10$MFaqaUHifS0v1.JwdQ7/ouDeIUQ9Yh1.chmbJAEj7xrRN7/CSAtg.	\N	\N	\N	1	2016-10-28 15:26:49.554257	2016-10-28 15:26:49.554257	93.51.20.195	93.51.20.195	\N	2016-10-28 15:26:49.553817	\N	\N	\N	http://graph.facebook.com/10154677040369810/picture	matteo.b1980@gmail.com	{"vXpR1n_q9eb0fxtI2GBLLA":{"token":"$2a$10$SsC0Ns/nOYCdy67Q3P15Oeb.p9Tc9UxpbUnbPaBkqPQVajw7RWOeu","expiry":1478878044,"last_token":"$2a$10$JJWK0faaqt5974htf8YcDuWbzexCqcOsh.lxE9DYXIkffx6U/y9Si","updated_at":"2016-10-28T15:27:24.307+00:00"}}	2016-10-28 15:26:49.55557	2016-10-28 15:27:24.309443	\N	\N	\N	\N	\N	\N	0	---\n- fth3fBWcLDY:APA91bHzqmsSR-csskTL1mGxW5OnHmC5XyJjq8SzYobfP51vA8jFpvRhtRTVoB0QIv8Em5fuAZwNjwizY8B8dVrbCLgl7wP_iuQhm05YihB7BhPDZmmHTygXwtc2jN8bsxU1emoOWpmB\n	\N
216	2000-12-15	Hamza	Choukri	\N	Via cesare battisti 10/A	Cossato	BI	\N	\N	\N	email	hamza.choukri@liceocossato.eu	$2a$10$nZbJuHCNNDSn8AczZUEKYeRN.dkTYurk9HQlcf37FjdIS9i31eSSm	\N	\N	\N	0	\N	\N	\N	\N	7xNbXXqTa4KsDrxfv8Vs	2016-10-28 16:09:16.919042	2016-10-28 16:07:45.277721	\N	Hamza	\N	hamza.choukri@liceocossato.eu	{"BUweUnDoLg4vsxG6fPQgDA":{"token":"$2a$10$bl0dVdV9PCp1dG.Qx8682ugEVJpxQGN9k8.tsre2UvccTy6Qz14zq","expiry":1478880668,"last_token":"$2a$10$QJetS7FrPTOJ6f5Heoig2OgOw1ifSllV5fvaIdIsZ54Xs6xTeoiIq","updated_at":"2016-10-28T16:11:08.425+00:00"}}	2016-10-28 16:07:45.277032	2016-10-28 16:11:08.427757	\N	\N	IMG_20160806_185632.jpg	image/jpeg	755038	2016-10-28 16:07:48.150961	0	\N	13836
221	1985-04-15	Valeria	La Rocca	\N	Via Italia 11	Gaglianico	BI	\N	\N	\N	email	laroccavaleria@virgilio.it	$2a$10$Qw5KIw4aCaStWW/NSgMjzOHMx.DVllykL1jLJDOpgGFYEdx3gg.ju	\N	\N	\N	3	2016-11-08 18:06:38.160417	2016-11-08 13:49:33.827628	5.90.8.250	5.90.83.225	3m2SbCv5tn6Y5qsYzFpV	2016-11-08 12:25:28.533883	2016-11-08 12:20:06.530259	\N	Gufetta	\N	laroccavaleria@virgilio.it	{"LDl2cHsE4T_okAz6A0Ym3Q":{"token":"$2a$10$3KWVFxBNK.i89NWY6qMlkOq/a7wgbfeSU8oMpUjMbijafIAMN252q","expiry":1479817684,"last_token":"$2a$10$4RJADNvSc1vCLaoTjdFo5.sOULAmN1TrvpLZZF6sirAA4ehiRy9vi","updated_at":"2016-11-08T12:28:05.020+00:00"},"Q7KVkbAsRap5jrAj3pWm0A":{"token":"$2a$10$qRb207aelwi0014flWeYL.u0qscI02I1JpSpthNcyscoY7wFQFnFK","expiry":1479817733,"last_token":"$2a$10$yqJenQAvSvs0Op7aBzEgOe4n3oVgQeopHOX4VoviJLZXOlPYGKqai","updated_at":"2016-11-08T12:28:53.586+00:00"},"I47PZJ9-80Wjy8a5sDgDiQ":{"token":"$2a$10$dDXeV5L2egCh7nF1EsHoBe8mTxPjhNHx0ky0pIaTwTQTho/MGlUNy","expiry":1479910386,"last_token":"$2a$10$G72LcH4CBi658aUtNDt9zOSJQxO47D6wZyT1EELcALdsNVBAo6yXq","updated_at":"2016-11-09T14:13:06.241+00:00"}}	2016-11-08 12:20:06.52913	2016-11-09 14:13:06.243524	\N	\N	\N	\N	\N	\N	0	---\n- eWK2ZB6n3OU:APA91bHRtBhNeS-ivzlQh8ND77UqA1-wUZ8qHuoVSBuIXDBkpfZO3ahh9uWiF_JY--iU4Iqyo5AHSQBy_D5F8QjfpRmBZj81_H5MRWpWibRtAbk0h7Awet2m_j2trsv-ElFnxl7CbkTD\n	13894
204	\N	Mirko Lamantia	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10210838020895471	$2a$10$w9wry41glY/V/s9d4sW4hOyQhh2FQ8sdsM69o2ABx3pnOYEcyWbmm	\N	\N	\N	1	2016-10-22 11:37:49.750763	2016-10-22 11:37:49.750763	77.242.185.44	77.242.185.44	\N	2016-10-22 11:37:49.750149	\N	\N	\N	http://graph.facebook.com/10210838020895471/picture	mirko.lamantia@gmail.com	{"EjU5gMk6Xn8id2Y_jXtT6g":{"token":"$2a$10$9x7OkCQWSxQRiYBGamNxN.fjX7auEAKeudbfrY/WVkOdRaTBU7ukW","expiry":1478345902,"last_token":"$2a$10$X3UP0tBqG/3TUpq0mw9fZuqE.ySE8zOKw7pxKgKDRqe2bdWspxZBO","updated_at":"2016-10-22T11:38:22.939+00:00"}}	2016-10-22 11:37:49.752546	2016-10-22 11:38:22.940477	\N	\N	\N	\N	\N	\N	0	\N	\N
206	1991-04-17	Sophie	Pastrovicchio	\N	Strada Provinciale 200 numero 8	Pettinengo	BI	\N	\N	\N	email	s.pastrovicchio@getaline.it	$2a$10$6B0krwjgBvgE.JuJYFHAiei2/rlVXxEBS1GRWqHM1pMHCsOfHe4lq	\N	\N	\N	0	\N	\N	\N	\N	Tq8P-aGyZ-rgji-zfAQH	2016-10-24 11:40:21.486366	2016-10-22 20:27:31.90851	\N	Sophie	\N	s.pastrovicchio@getaline.it	{"mbFf77WTxIysI73-EyoWSA":{"token":"$2a$10$IURWdrjbB7jxyiV20xA3ce85g89TigJRmeGrUbFo8Eu7bLjqhUEEK","expiry":1478518934,"last_token":"$2a$10$ZiQQ5D0pPBLsy9G/6tnQf.HfcjMTqKSf/RdyV02EU2DgdyTdn11Fu","updated_at":"2016-10-24T11:42:17.950+00:00"}}	2016-10-22 20:27:31.908094	2016-10-24 11:42:17.952251	\N	\N	\N	\N	\N	\N	0	\N	13843
182	\N	Elisa Cogo	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10210801192248750	$2a$10$sxpfZhCjGbQhM9ElwnZjSugvSN8zSSrnS98reorlw4N3bLtfyFWle	\N	\N	\N	1	2016-10-06 17:43:45.469568	2016-10-06 17:43:45.469568	93.36.2.5	93.36.2.5	\N	2016-10-06 17:43:45.469139	\N	\N	\N	http://graph.facebook.com/10210801192248750/picture	elico_93@hotmail.com	{"kmJrvFvD5oDgNoq2I4vV9Q":{"token":"$2a$10$GJidtdi5cK34WqMYFQU57eQ2Ns2P/F7nPqnwsLN/ZpIVo15lvEimW","expiry":1476985485,"last_token":"$2a$10$/WsQodeIokE4MqJoiI0jaOkX3XC69BG/dPz8AIH9tLFHM6TPzWhde","updated_at":"2016-10-06T17:44:50.950+00:00"}}	2016-10-06 17:43:45.471085	2016-10-06 17:44:50.951219	\N	\N	\N	\N	\N	\N	0	\N	\N
217	1998-03-23	Fabio	Tiberto	\N	Via tarino 62	Cossato	BI	\N	\N	\N	email	fabio.tiberto@liceocossato.eu	$2a$10$0XsTmrNYdnixvl7wwKa0Re6B/bhNUxWLO5cmmtSgjPy9gwv1wwGKG	\N	\N	\N	0	\N	\N	\N	\N	rJqGwvx_u7oS4N8oHbqx	2016-10-29 15:38:00.582188	2016-10-29 15:35:51.830038	\N	Tibby	\N	fabio.tiberto@liceocossato.eu	{"cVE06JHg83wsl9Apu3fpag":{"token":"$2a$10$fbUAabLIGnm0vMi.saTvzOLZYpf6zWwFFkCj.ZASvQMT8SPNGCLa.","expiry":1478965080},"RBlNApcDe78ycCEXtFZ7tA":{"token":"$2a$10$gkvPiOzPd/dH8IhsiZkJaO/QIi9AuDbDjpeWXPp0aKcj2a8NYbtm.","expiry":1478965092},"RRXKya_ZufslX1tApNYjWA":{"token":"$2a$10$WV4H.pObHkAO70PUAgNOMOTHrKkLaBIdo1OqFVVKacgVZvy2SzRli","expiry":1478965134}}	2016-10-29 15:35:51.829683	2016-10-29 15:38:54.455328	\N	\N	\N	\N	\N	\N	0	\N	13836
222	\N	Carla Patricia Morales Schebesta	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10211242683849037	$2a$10$HsZPRdKVUxAbKl2sD50UbO/NcFE2GtcglgW91dEQKL/zhTTUiXDbq	\N	\N	\N	1	2016-11-13 16:29:04.882323	2016-11-13 16:29:04.882323	190.239.81.118	190.239.81.118	\N	2016-11-13 16:29:04.881507	\N	\N	\N	http://graph.facebook.com/10211242683849037/picture	carla_ms0912@hotmail.com	{"A0Ax9WxdLdluSbsXQECzvA":{"token":"$2a$10$89J5MXVw5B53DBke6CQN4uQGVuoSAcc8JVHTDFD93mrse1vAEplj6","expiry":1480264263,"last_token":"$2a$10$S43XKBN.YzWcuvjrmfg.W..yLvnsZopEVDq4H0/bA6gZW/j0UX/3C","updated_at":"2016-11-13T16:31:08.034+00:00"}}	2016-11-13 16:29:04.884733	2016-11-13 16:31:08.036785	\N	\N	\N	\N	\N	\N	0	---\n- 51a88f602eedb7da3a63d3dd5d5be5ac8b516352ae342f46519d77a43bcfab2c\n	\N
218	2002-12-01	Francesco	Piacentini	\N	Via Marconi 3	Quaregna	BI	\N	\N	\N	email	piacentini.francesco@liceocossatese.eu	$2a$10$cAn04mbE/0xqfuX4oOBJn.svz92IRPXfA4bkR0OKWg3eKxAH6.Z3S	\N	\N	\N	0	\N	\N	\N	\N	nRTubTArFsSAhP2op3Xk	\N	2016-10-30 09:28:39.458158	\N	FraPiace	\N	piacentini.francesco@liceocossatese.eu	{}	2016-10-30 09:28:39.457775	2016-10-30 09:28:39.457775	\N	\N	\N	\N	\N	\N	0	\N	13854
185	\N	Salvatore Butera	\N	\N	\N	\N	\N	\N	\N	\N	facebook	1240673099317685	$2a$10$h9zPQksAQ/1iW95vo0yNQeiO/SxAMC5sMTSKuqxcQW/fxgL4wwDMa	\N	\N	\N	1	2016-10-08 11:44:58.039104	2016-10-08 11:44:58.039104	79.17.64.204	79.17.64.204	\N	2016-10-08 11:44:58.038625	\N	\N	\N	http://graph.facebook.com/1240673099317685/picture	salvatore-butera@alice.it	{"vHCgbmahKrEdD8xeACgfdw":{"token":"$2a$10$zkmcbzWE2fI3ToJJrQD9/.21We4a4yH/lk/ogFuYqdGfoY.ObsCWq","expiry":1478210070,"last_token":"$2a$10$SIC/KZz/2Sl3zdlf25/8juRJrOy/MX2CdWDprrfjk9XonDYLMkhHS","updated_at":"2016-10-20T21:54:34.390+00:00"}}	2016-10-08 11:44:58.040472	2016-10-20 21:54:34.39214	\N	\N	\N	\N	\N	\N	0	---\n- b92b3ec4f81e6aa048842b6c1bfb819d5f10970194d46f4c38fb0421c64825ca\n	\N
186	\N	Lisa Costa	\N	\N	\N	\N	\N	\N	\N	\N	facebook	10210711547895388	$2a$10$cJgiWschFDkbcn7u5yVcUeJu0pipmcUWDmYgi4A.ly49AxGkcmYX2	\N	\N	\N	1	2016-10-08 15:08:28.602655	2016-10-08 15:08:28.602655	93.51.17.7	93.51.17.7	\N	2016-10-08 15:08:28.602268	\N	\N	\N	http://graph.facebook.com/10210711547895388/picture	costalisa@libero.it	{"jwTS3_rvYOAGYbWWKdNAIg":{"token":"$2a$10$CGkVsCPysgDXaNLuvUSdvOfSCe9fwqdvWrrcKQK6C8fuEcy4gNgDW","expiry":1478500998,"last_token":"$2a$10$IBap5Zypqw8si4sLMcHRsux6mSgbUck9ok6uAuXvAm5qGdzKpcRl2","updated_at":"2016-10-24T06:43:18.377+00:00"}}	2016-10-08 15:08:28.603943	2016-10-24 06:43:18.379035	\N	\N	\N	\N	\N	\N	0	\N	\N
220	2000-09-03	Marianna	Caucino	\N	via Marconi, 69	Quaregna	BI	\N	\N	\N	email	marianna.caucino@liceocossato.eu	$2a$10$Rbq9KNZJt7kK4xM1sOYsuOknJNyAAwNamcVOwTZctCdzhcmR3dRVu	\N	\N	\N	0	\N	\N	\N	\N	MteUKRrr4bDGrKNZyAaK	2016-10-30 13:21:36.817956	2016-10-30 13:18:52.011196	\N	maricau	\N	marianna.caucino@liceocossato.eu	{"dB8_-Xs_Zc4BN3XoWNxUdw":{"token":"$2a$10$lErIy0Nk5v3YKwbDIuATWOv0BRjoS6qXs6/CCUq8BriPS0OjWQst6","expiry":1479043381,"last_token":"$2a$10$MMcaW04oGvyZJc66OId1TeZPOfWqRs9K1olrNYr8BXuYj75gxYgt.","updated_at":"2016-10-30T13:23:01.730+00:00"}}	2016-10-30 13:18:52.010782	2016-10-30 13:23:01.732347	\N	\N	DSCF1683.JPG	image/jpeg	4305614	2016-10-30 13:18:54.537975	0	\N	13854
219	1976-09-26	valeria	brocchin	\N	via Marconi, 69	Quaregna	BI	\N	\N	\N	email	valeb6791@gmail.com	$2a$10$5YI6TRuFtP80pr7hJ0HseO5hv6XAXOLrkQzjiQv8qX/wKiXE.919W	\N	\N	\N	0	\N	\N	\N	\N	n4oc9LsN5xsPPL5BApK6	2016-10-30 13:18:59.825311	2016-10-30 13:14:03.514742	\N	valeb6791	\N	valeb6791@gmail.com	{"aLOcu3SGyHvyTajvnia8ag":{"token":"$2a$10$AZy.cHOOMblwf9hDHRb1HOF8.wY4nnpzQVPB0NV8/qT65LmpVPDwS","expiry":1479043141,"last_token":"$2a$10$ZMV4bXE/mRnY.ofbtvpV0eg76KVjZ0UKdujmuKQ6ScFjrgwvsTRJC","updated_at":"2016-10-30T13:19:01.991+00:00"}}	2016-10-30 13:14:03.514113	2016-10-30 13:19:01.993574	\N	\N	IMG-20160925-WA0007.jpg	image/jpeg	257270	2016-10-30 13:14:06.403461	0	\N	13854
214	2000-05-23	Sara	Turato	\N	Via castellengo 32/a	Cossato	BI	\N	\N	\N	email	sara.turato@liceocossato.eu	$2a$10$esJ8qte3qXsOuHf8iOvd8.poW.2Qkt2yMsUb17tkXdJ6ZKhtBKs9O	\N	\N	\N	1	2016-10-28 14:17:29.888758	2016-10-28 14:17:29.888758	77.242.184.73	77.242.184.73	2RbsGZ_3L67abya-814h	2016-10-28 14:16:50.748799	2016-10-28 14:15:25.718673	\N	Sara	\N	sara.turato@liceocossato.eu	{"3tFDCNn4MEyFfmDddH3_wQ":{"token":"$2a$10$hjJwrGYS3YoJ2Imm288VUu.VcOvN0zoZKvjFJ750kM2zWQA5f.x6u","expiry":1478873815,"last_token":"$2a$10$0bhE5l7Xss79DJL9T3RSHuzxLTWC9P.HTQf0KFInSN3aZ3xryjOWu","updated_at":"2016-10-28T14:16:55.735+00:00"},"5SMHJ8sJpo2aXyCau7ZsNw":{"token":"$2a$10$8QWRhh4CGc0vzm9rrwjxZuTpAw./B4liP55BqbnAEe7kg8kKp8xmG","expiry":1479915053,"last_token":"$2a$10$CYPvzhOkB2t8uC2YNa4KresFbhgyOHiYLkSQqvmF6byTNW1Bbnima","updated_at":"2016-11-09T15:30:56.878+00:00"}}	2016-10-28 14:15:25.718242	2016-11-09 15:30:56.881673	\N	\N	\N	\N	\N	\N	0	---\n- 1b4fa682d4d59753e5a281bcb683f3cc50515abbc703417a8708ae44e849d7b5\n	13836
12	\N	Andrea Macchieraldo	\N	\N	\N	\N	\N	t	\N	\N	facebook	10153911944004377	$2a$10$.yszVk2tQ10B9ImJYVTQ4eGtqqWM3Nlp24m8Gr0q65MqkZMYeJgei	\N	\N	\N	122	2016-10-20 10:11:42.964971	2016-09-29 11:11:56.448398	93.32.196.1	93.33.59.96	\N	2016-11-10 17:28:04.391487	\N	\N	\N	http://graph.facebook.com/10153911944004377/picture	a.macchieraldo@gmail.com	{"dGuPjOQUFQSjOt5E5LBcZw":{"token":"$2a$10$.VhyROty8xa5.22gSpRjIeBvxJhsyy72WWh6GGMvcqMMXNq5oGX8S","expiry":1480098166,"last_token":"$2a$10$yzy3B.J6ZFo4IZDsPgFwVuIFXrAfWvRVOeuuRgFr3tAS5mlwZ3dHG","updated_at":"2016-11-11T18:36:23.419+00:00"}}	2015-07-08 17:19:35.384105	2016-11-11 18:36:23.42317	administrator	\N	data	image/jpeg	61181	2016-04-06 08:37:19.674116	1	---\n- d8230251cfeb29661b3d315e150186e616edd64e4382ca5b023eef9d217a2cad\n	\N
175	\N	Biagio Moccia	\N	\N	\N	\N	\N	\N	\N	\N	facebook	872600446217514	$2a$10$IHQwQyafojJsElPlVBjkIu3.qjVFo4wwugvXStELGCivbhYahuacW	\N	\N	\N	1	2016-09-15 10:03:29.489374	2016-09-15 10:03:29.489374	82.58.110.213	82.58.110.213	\N	2016-09-15 10:03:29.488938	\N	\N	\N	http://graph.facebook.com/872600446217514/picture	biagiomoccia@alice.it	{"O7gzyalAXbMarMM2wt93Jw":{"token":"$2a$10$d5aiaK9F2EvbpH0.UQEi7OYpDJvtVWh0a9Eqj0fqeSdLUSQKKAQOa","expiry":1475143491,"last_token":"$2a$10$f1/CkHu0Ygi6gVrNdeU4X.TyNwU6CqgqlQoaXEkCSXs6cgBx0R3KC","updated_at":"2016-09-15T10:04:51.537+00:00"}}	2016-09-15 10:03:29.490714	2016-09-15 10:04:51.539507	\N	\N	\N	\N	\N	\N	0	\N	\N
188	1977-02-25	Sonia	Milani	\N	Via campile 36	Candelo	BI	\N	\N	\N	email	gasm4@live.it	$2a$10$/9PQD.InsjNkLNACxEGB9ec6JOaSsO8aqt6SVWDM95MNxW3.0Ipli	\N	\N	\N	1	2016-10-09 18:51:50.680331	2016-10-09 18:51:50.680331	79.25.66.75	79.25.66.75	8GJsyy51AavV7YqV23iA	2016-10-09 18:50:50.371455	2016-10-09 18:46:53.191947	\N	Sonia77	\N	gasm4@live.it	{"azpAO9UcEQO26d3VsQKSJg":{"token":"$2a$10$yQnj9F9mfOr3dxB3yp99Z.L9rbAaEB2I.5MvCGkghPkx.swPBA7ES","expiry":1477333609,"last_token":"$2a$10$gxbqTtzdIszHYBfVLdWaS.EYNv7oR/MOsPHoY0ur/cW1fyUkpHELK","updated_at":"2016-10-10T18:26:51.206+00:00"},"CYyIlFBFgyuGWjheexpxug":{"token":"$2a$10$GkzfUR2tTVNr/VOdxF9sJO.iNvb8Z00Al1PCnIMfKYe/I3MOr59xK","expiry":1477248896,"last_token":"$2a$10$irOOgQJ3hnwf7h3KnruFs.rVnUZIiXFmgj0XannfdK/DK0vJoNCMe","updated_at":"2016-10-09T18:54:56.887+00:00"}}	2016-10-09 18:46:53.191511	2016-10-10 18:26:51.207517	\N	\N	\N	\N	\N	\N	0	---\n- 1239254fe094ca1d98de3b80ebd1c78941deabf5c4f240b909196fb215e78189\n	13878
169	1992-02-20	Michela	Perotti	\N	Via Mazzini 2	Biella	BI	\N	\N	\N	email	justmichi@hotmail.it	$2a$10$hI42PgtRrn89JtZeg/.DJeTBTUsCJCyjzEBr6jILyCtlVYzPhUi/K	\N	\N	\N	0	\N	\N	\N	\N	cX5T7323ggxMBuCC1D82	\N	2016-07-31 11:42:50.979691	\N	perozzz	\N	justmichi@hotmail.it	{}	2016-07-31 11:42:50.753734	2016-07-31 11:42:50.753734	\N	\N	\N	\N	\N	\N	0	\N	13900
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 222, true);


--
-- Name: administrated_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY administrated_rooms
    ADD CONSTRAINT administrated_rooms_pkey PRIMARY KEY (id);


--
-- Name: applied_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY applied_users
    ADD CONSTRAINT applied_users_pkey PRIMARY KEY (id);


--
-- Name: approved_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY approved_users
    ADD CONSTRAINT approved_users_pkey PRIMARY KEY (id);


--
-- Name: badge_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY badge_categories
    ADD CONSTRAINT badge_categories_pkey PRIMARY KEY (id);


--
-- Name: badges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: car_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY car_categories
    ADD CONSTRAINT car_categories_pkey PRIMARY KEY (id);


--
-- Name: cars_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- Name: citizen_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY citizen_badges
    ADD CONSTRAINT citizen_badges_pkey PRIMARY KEY (id);


--
-- Name: driver_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY driver_details
    ADD CONSTRAINT driver_details_pkey PRIMARY KEY (id);


--
-- Name: macro_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY macro_categories
    ADD CONSTRAINT macro_categories_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: parents_controls_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parents_controls
    ADD CONSTRAINT parents_controls_pkey PRIMARY KEY (id);


--
-- Name: passenger_travels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY passenger_travels
    ADD CONSTRAINT passenger_travels_pkey PRIMARY KEY (id);


--
-- Name: preferred_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY preferred_rooms
    ADD CONSTRAINT preferred_rooms_pkey PRIMARY KEY (id);


--
-- Name: private_chats_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY private_chats
    ADD CONSTRAINT private_chats_pkey PRIMARY KEY (id);


--
-- Name: private_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY private_messages
    ADD CONSTRAINT private_messages_pkey PRIMARY KEY (id);


--
-- Name: private_room_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY private_room_settings
    ADD CONSTRAINT private_room_settings_pkey PRIMARY KEY (id);


--
-- Name: public_chat_partecipants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public_chat_partecipants
    ADD CONSTRAINT public_chat_partecipants_pkey PRIMARY KEY (id);


--
-- Name: public_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public_messages
    ADD CONSTRAINT public_messages_pkey PRIMARY KEY (id);


--
-- Name: room_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY room_categories
    ADD CONSTRAINT room_categories_pkey PRIMARY KEY (id);


--
-- Name: room_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY room_images
    ADD CONSTRAINT room_images_pkey PRIMARY KEY (id);


--
-- Name: room_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY room_reviews
    ADD CONSTRAINT room_reviews_pkey PRIMARY KEY (id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: school_room_partecipants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY school_room_partecipants
    ADD CONSTRAINT school_room_partecipants_pkey PRIMARY KEY (id);


--
-- Name: school_room_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY school_room_settings
    ADD CONSTRAINT school_room_settings_pkey PRIMARY KEY (id);


--
-- Name: selected_macro_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY selected_macro_categories
    ADD CONSTRAINT selected_macro_categories_pkey PRIMARY KEY (id);


--
-- Name: selected_room_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY selected_room_categories
    ADD CONSTRAINT selected_room_categories_pkey PRIMARY KEY (id);


--
-- Name: social_master_badge_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY social_master_badge_relations
    ADD CONSTRAINT social_master_badge_relations_pkey PRIMARY KEY (id);


--
-- Name: social_master_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY social_master_badges
    ADD CONSTRAINT social_master_badges_pkey PRIMARY KEY (id);


--
-- Name: travel_request_chat_partecipants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY travel_request_chat_partecipants
    ADD CONSTRAINT travel_request_chat_partecipants_pkey PRIMARY KEY (id);


--
-- Name: travel_request_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY travel_request_messages
    ADD CONSTRAINT travel_request_messages_pkey PRIMARY KEY (id);


--
-- Name: travel_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY travel_requests
    ADD CONSTRAINT travel_requests_pkey PRIMARY KEY (id);


--
-- Name: travel_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY travel_reviews
    ADD CONSTRAINT travel_reviews_pkey PRIMARY KEY (id);


--
-- Name: travel_stops_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY travel_stops
    ADD CONSTRAINT travel_stops_pkey PRIMARY KEY (id);


--
-- Name: travels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY travels
    ADD CONSTRAINT travels_pkey PRIMARY KEY (id);


--
-- Name: user_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_badges
    ADD CONSTRAINT user_badges_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_administrated_rooms_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_administrated_rooms_on_room_id ON administrated_rooms USING btree (room_id);


--
-- Name: index_administrated_rooms_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_administrated_rooms_on_user_id ON administrated_rooms USING btree (user_id);


--
-- Name: index_applied_users_on_travel_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_applied_users_on_travel_id ON applied_users USING btree (travel_id);


--
-- Name: index_applied_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_applied_users_on_user_id ON applied_users USING btree (user_id);


--
-- Name: index_approved_users_on_travel_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_approved_users_on_travel_id ON approved_users USING btree (travel_id);


--
-- Name: index_approved_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_approved_users_on_user_id ON approved_users USING btree (user_id);


--
-- Name: index_citizen_badges_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_citizen_badges_on_user_id ON citizen_badges USING btree (user_id);


--
-- Name: index_driver_details_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_driver_details_on_user_id ON driver_details USING btree (user_id);


--
-- Name: index_notifications_on_receiver_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_notifications_on_receiver_id ON notifications USING btree (receiver_id);


--
-- Name: index_passenger_travels_on_travel_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_passenger_travels_on_travel_id ON passenger_travels USING btree (travel_id);


--
-- Name: index_passenger_travels_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_passenger_travels_on_user_id ON passenger_travels USING btree (user_id);


--
-- Name: index_preferred_rooms_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_preferred_rooms_on_room_id ON preferred_rooms USING btree (room_id);


--
-- Name: index_preferred_rooms_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_preferred_rooms_on_user_id ON preferred_rooms USING btree (user_id);


--
-- Name: index_public_chat_partecipants_on_travel_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_public_chat_partecipants_on_travel_id ON public_chat_partecipants USING btree (travel_id);


--
-- Name: index_public_chat_partecipants_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_public_chat_partecipants_on_user_id ON public_chat_partecipants USING btree (user_id);


--
-- Name: index_room_images_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_room_images_on_room_id ON room_images USING btree (room_id);


--
-- Name: index_school_room_partecipants_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_school_room_partecipants_on_room_id ON school_room_partecipants USING btree (room_id);


--
-- Name: index_school_room_partecipants_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_school_room_partecipants_on_user_id ON school_room_partecipants USING btree (user_id);


--
-- Name: index_school_room_settings_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_school_room_settings_on_code ON school_room_settings USING btree (code);


--
-- Name: index_school_room_settings_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_school_room_settings_on_room_id ON school_room_settings USING btree (room_id);


--
-- Name: index_selected_macro_categories_on_macro_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_selected_macro_categories_on_macro_category_id ON selected_macro_categories USING btree (macro_category_id);


--
-- Name: index_selected_macro_categories_on_room_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_selected_macro_categories_on_room_category_id ON selected_macro_categories USING btree (room_category_id);


--
-- Name: index_selected_room_categories_on_room_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_selected_room_categories_on_room_category_id ON selected_room_categories USING btree (room_category_id);


--
-- Name: index_selected_room_categories_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_selected_room_categories_on_room_id ON selected_room_categories USING btree (room_id);


--
-- Name: index_social_master_badges_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_social_master_badges_on_user_id ON social_master_badges USING btree (user_id);


--
-- Name: index_travel_request_chat_partecipants_on_travel_request_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_travel_request_chat_partecipants_on_travel_request_id ON travel_request_chat_partecipants USING btree (travel_request_id);


--
-- Name: index_travel_request_chat_partecipants_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_travel_request_chat_partecipants_on_user_id ON travel_request_chat_partecipants USING btree (user_id);


--
-- Name: index_travel_requests_on_passenger_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_travel_requests_on_passenger_id ON travel_requests USING btree (passenger_id);


--
-- Name: index_travel_requests_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_travel_requests_on_room_id ON travel_requests USING btree (room_id);


--
-- Name: index_travel_stops_on_travel_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_travel_stops_on_travel_id ON travel_stops USING btree (travel_id);


--
-- Name: index_user_badges_on_badge_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_badges_on_badge_id ON user_badges USING btree (badge_id);


--
-- Name: index_user_badges_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_badges_on_user_id ON user_badges USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_uid_and_provider; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_uid_and_provider ON users USING btree (uid, provider);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

