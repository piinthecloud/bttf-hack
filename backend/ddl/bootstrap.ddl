drop table if exists provider cascade;
drop table if exists seeker cascade;
drop table if exists users cascade;

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
       primary key (seeker_id)
);

create table provider (
       user_id bigserial references users (user_id),
       provider_id bigserial,
       primary key (provider_id)
);
