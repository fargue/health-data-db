CREATE TABLE IF NOT EXISTS healthdata.Song_Type
(
  id SERIAL PRIMARY KEY,
  type varchar(45) NOT NULL,
  file_extension varchar(10)
);

INSERT INTO healthdata.Song_Type( type, file_extension ) VALUES ('MP3','mp3');
INSERT INTO healthdata.Song_Type( type, file_extension ) VALUES ('OGG','ogg');

CREATE TABLE IF NOT EXISTS healthdata.Artist
(
  id SERIAL PRIMARY KEY,
  name varchar(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS healthdata.Users
(
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  created_at timestamp NOT NULL,
  modified_at timestamp NOT NULL
);


CREATE TABLE IF NOT EXISTS healthdata.Album
(
  id SERIAL PRIMARY KEY,
  name varchar(200) NOT NULL,
  artist_id int NOT NULL REFERENCES healthdata.artist(id)
);


CREATE TABLE IF NOT EXISTS healthdata.Song
(
  id SERIAL PRIMARY KEY,
  title varchar(200) NOT NULL,
  comment varchar(200),
  song varchar(200),
  year int,
  track_number int,
  filename varchar(500) NOT NULL,
  artist_id int NOT NULL REFERENCES healthdata.artist(id),
  album_id int REFERENCES healthdata.album(id),
  song_type_id int4 NOT NULL REFERENCES healthdata.song_type(id)
);