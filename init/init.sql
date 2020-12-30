-- run on local db only.  DBA user in RDS is created as part of db create
CREATE ROLE app_user PASSWORD 'hd' INHERIT LOGIN;
CREATE SCHEMA healthdata;
GRANT USAGE ON SCHEMA healthdata TO app_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA healthdata GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA healthdata GRANT USAGE, SELECT ON SEQUENCES TO app_user;
