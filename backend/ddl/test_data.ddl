insert into users (user_id, first_name, last_name, email, password_bc, created_dtm, updated_dtm, last_login_dt) values (999, 'first', 'last', 'first.last@whatever.net', '$2a$12$PU7cdSA7LmbnavNDwLC/rOfyxTrcHZCJqpVKveqj4mfUH3n/kK12.', now(), now(), now());

insert into seeker (user_id, seeker_id, is_matched, is_active) values (999, 999, false, true);
