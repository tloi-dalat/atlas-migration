-- Modify "urlshortener_urlshortener" table
ALTER TABLE `urlshortener_urlshortener` DROP CONSTRAINT `access_count`, ADD COLUMN `is_deactive` bool NOT NULL;
