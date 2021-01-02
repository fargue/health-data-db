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
  google_fit_modified_milliseconds bigserial,
  google_fit_modified_date timestamp,
  duration_ms serial NOT NULL,
  active boolean NOT NULL DEFAULT TRUE,
  unique(start_date,end_date)
);


CREATE TABLE IF NOT EXISTS healthdata.sleep_session_data
(
  id SERIAL PRIMARY KEY,
  start_date timestamp NOT NULL,
  start_nanoseconds bigserial NOT NULL,
  end_date timestamp NOT NULL,
  end_nanoseconds bigserial NOT NULL,
  duration_ms serial NOT NULL,
  sleep_stage_id int NOT NULL REFERENCES healthdata.google_fit_sleep_stages(id),
  sleep_session_id int NOT NULL REFERENCES healthdata.sleep_session(id),
  unique(start_date,end_date)
);