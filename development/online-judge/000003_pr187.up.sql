-- Modify "django_site" table
ALTER TABLE `django_site` ADD UNIQUE INDEX `django_site_name_uniq` (`name`);
