drop table if exists visitor_reason_selection cascade;
drop table if exists barrier_selection cascade;
drop table if exists historical_connection_selection cascade;
drop table if exists provider cascade;
drop table if exists seeker cascade;
drop table if exists users cascade;

create table visitor_reason_selection (
       regular_community_visitor_reason_key bigserial,
       regular_community_visitor_reason_selection text not null,
       primary key (regular_community_visitor_reason_key)
);

create table barrier_selection (
       barrier_selection_key bigserial,
       barrier_selection text not null,
       primary key (barrier_selection_key)
);

create table historical_connection_selection (
       historical_connection_option_key bigserial,
       historical_connection_option_selection text,
       primary key (historical_connection_option_key)
);

create table users (
       user_id bigserial,
       first_name text not null,
       last_name text not null,
       email text not null,
       password_bc text not null,
       created_dtm timestamptz not null,
       updated_dtm timestamptz,
       primary key (user_id)
);

create table seeker (
       user_id bigserial references users (user_id),
       seeker_id bigserial,
       phone_number text,
       gender char,
       birthdate date,
       race_ethnicity text,
       profession text,
       income_level integer check (income_level > 0),
       budget integer check (budget > 0),
       household_size integer check (household_size > 0),
       adults_cnt integer check (adults_cnt > 0),
       children_cnt integer,
       has_pets boolean,
       photo bytea,
       current_zip text,
       historical_connection_option_key bigserial references historical_connection_selection (historical_connection_option_key),
       barrier_selection_key bigserial references barrier_selection (barrier_selection_key),
       regular_community_visitor boolean,
       regular_community_visitor_reason_key bigserial references visitor_reason_selection (regular_community_visitor_reason_key),
       primary key (seeker_id)
);

create table provider (
       user_id bigserial references users (user_id),
       provider_id bigserial,
       primary key (provider_id)
);




