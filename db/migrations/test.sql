-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS bookmarks_id_seq;

-- Table Definition
CREATE TABLE "public"."bookmarks" (
    "id" int4 NOT NULL DEFAULT nextval('bookmarks_id_seq'::regclass),
    "url" varchar(60),
    PRIMARY KEY ("id")
);

INSERT INTO "public"."bookmarks" ("id", "url") VALUES ('1', 'http://www.makersacademy.com'),
('2', 'http://www.destroyallsoftware.com'),
('3', 'http://www.google.com');
