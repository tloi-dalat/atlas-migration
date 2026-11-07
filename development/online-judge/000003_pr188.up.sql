-- Modify "urlshortener_urlshortener" table
ALTER TABLE `urlshortener_urlshortener` DROP CONSTRAINT `access_count`, DROP COLUMN `is_active`, DROP INDEX `short_code`;
