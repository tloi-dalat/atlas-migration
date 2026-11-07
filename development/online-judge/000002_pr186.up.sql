-- Modify "oauth2_provider_idtoken" table
ALTER TABLE `oauth2_provider_idtoken` MODIFY COLUMN `jti` uuid NOT NULL;
-- Modify "oauth2_provider_refreshtoken" table
ALTER TABLE `oauth2_provider_refreshtoken` MODIFY COLUMN `token_family` uuid NULL;
