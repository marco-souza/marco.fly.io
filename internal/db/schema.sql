CREATE TABLE IF NOT EXISTS crons (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        text NOT NULL,
    expression  text NOT NULL,
    script      text NOT NULL
);
