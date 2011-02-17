CREATE TABLE articles(id integer primary key not null, title string, body string, created_at integer, updated_at integer, edit_count integer not null default 0, author_id integer not null default 0);
CREATE TABLE "authors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110204214930');

INSERT INTO schema_migrations (version) VALUES ('20110206030841');

INSERT INTO schema_migrations (version) VALUES ('20110206033107');

INSERT INTO schema_migrations (version) VALUES ('20110207041706');

INSERT INTO schema_migrations (version) VALUES ('20110216000023');

INSERT INTO schema_migrations (version) VALUES ('20110217205102');

INSERT INTO schema_migrations (version) VALUES ('20110217205103');