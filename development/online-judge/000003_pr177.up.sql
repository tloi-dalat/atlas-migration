-- Modify "judge_problem" table
ALTER TABLE `judge_problem` DROP INDEX `judge_probl_is_publ_b00d80_idx`, ADD INDEX `judge_probl_is_publ_735a10_idx` (`is_public`, `is_organization_private`, `deleted_at`, `points`), ADD INDEX `judge_probl_is_publ_7ded85_idx` (`is_public`, `is_organization_private`, `deleted_at`, `user_count`), ADD INDEX `judge_probl_is_publ_f72cb6_idx` (`is_public`, `is_organization_private`, `date`), ADD INDEX `judge_probl_organiz_f1caf4_idx` (`organization_id`, `is_public`, `deleted_at`, `date`);
-- Modify "judge_profile" table
ALTER TABLE `judge_profile` DROP COLUMN `allow_tagging`;
-- Drop "judge_tagdata" table
DROP TABLE `judge_tagdata`;
-- Drop "judge_tag" table
DROP TABLE `judge_tag`;
-- Drop "judge_taggroup" table
DROP TABLE `judge_taggroup`;
-- Drop "judge_tagproblem" table
DROP TABLE `judge_tagproblem`;
