CREATE TABLE IF NOT EXISTS healthdata.google_fit_sleep_stages
(
  id SERIAL PRIMARY KEY,
  description varchar(45) NOT NULL
);

INSERT INTO healthdata.google_fit_sleep_stages
  ( id, description )
VALUES
  (1, 'Awake (during sleep cycle)');

INSERT INTO healthdata.google_fit_sleep_stages
  ( id, description )
VALUES
  (2, 'Sleep');
INSERT INTO healthdata.google_fit_sleep_stages
  ( id, description )
VALUES
  (3, 'Out of Bed');
INSERT INTO healthdata.google_fit_sleep_stages
  ( id, description )
VALUES
  (4, 'Light Sleep');
INSERT INTO healthdata.google_fit_sleep_stages
  ( id, description )
VALUES
  (5, 'Deep Sleep');
INSERT INTO healthdata.google_fit_sleep_stages
  ( id, description )
VALUES
  (6, 'REM');

CREATE TABLE IF NOT EXISTS healthdata.Users
(
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  google_access_token varchar(500),
  google_refresh_token varchar(500),
  created_at timestamp NOT NULL,
  modified_at timestamp NOT NULL
);

CREATE TABLE IF NOT EXISTS healthdata.sleep_session
(
  id SERIAL PRIMARY KEY,
  start_date timestamp NOT NULL,
  start_milliseconds bigserial NOT NULL,
  end_date timestamp NOT NULL,
  end_milliseconds bigserial NOT NULL,
  duration_ms serial NOT NULL
);


CREATE TABLE IF NOT EXISTS healthdata.sleep_session_data
(
  id SERIAL PRIMARY KEY,
  title varchar(200) NOT NULL,
  comment varchar(200),
  song varchar(200),
  year int,
  track_number int,
  filename varchar(500) NOT NULL,
  sleep_session_id int NOT NULL REFERENCES healthdata.sleep_session(id)
);