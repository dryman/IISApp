CREATE TABLE article (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  snipet TEXT,
  url TEXT NOT NULL,
  cluster INTEGER NOT NULL,
  finished BOOLEAN NOT NULL
);
CREATE TABLE random_set (
  id INTEGER PRIMARY KEY
);
CREATE TABLE random_num (
  id INTEGER PRIMARY KEY,
  article INTEGER NOT NULL REFERENCES article(id),
  random_set INTEGER NOT NULL REFERENCES random_set(id)
);
CREATE TABLE user (
  id INTEGER PRIMARY KEY,
  ptt TEXT NOT NULL,
  random_set INTEGER NOT NULL REFERENCES random_set(id),
  useragent TEXT
);
CREATE TABLE time_stamps (
  id INTEGER PRIMARY KEY,
  time DATE NOT NULL,
  article INTEGER NOT NULL REFERENCES article(id),
  user INTEGER NOT NULL REFERENCES user(id)
);
