-- liquibase formatted sql
-- changeset html:update_db_core_html-2.0.14-5.0.1.sql
-- preconditions onFail:MARK_RAN onError:WARN
ALTER TABLE html_portlet MODIFY html LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
