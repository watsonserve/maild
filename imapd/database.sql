
CREATE TYPE gender_t AS ENUM (
    Seen = 1,
    Answered = 2,
    Flagged = 4,
    Deleted = 8,
    Draft = 16,
    Recent = 32
);

CREATE TABLE IF NOT EXISTS "mail_boxes" (
    id            SERIAL       PRIMARY KEY,
    user_id       UUID,        /* 用户ID */
    uidvalidity   INT,         /* 唯一标识符校验码 */
    parent_box_id BIGINT,      /* 父级邮箱id */
    box_name      VARCHAR(64), /* 邮箱名 */
    recent        BIGINT,
    next_uid      INT,
    has_children  BOOLEAN,
    selectable    BOOLEAN,
    noinferiors   BOOLEAN,
    marked        BOOLEAN,
    sys_defined   BOOLEAN,
);

CREATE TABLE IF NOT EXISTS "mails" (
    id          SERIAL   PRIMARY KEY,
    mail_id     INT,
    box_id      BIGINT   REFERENCES mail_boxes(id),
    seen        BOOLEAN,
    answered    BOOLEAN,
    flagged     BOOLEAN,
    deleted     BOOLEAN,
    draft       BOOLEAN,
    mail        TEXT
)

/*
SELECT uidvalidity, recent FROM mail_boxes WHERE box_name=? AND user_id=?
SELECT COUNT(mail_id) AS exists FROM mails WHERE box_name=? AND uidvalidity=?
*/