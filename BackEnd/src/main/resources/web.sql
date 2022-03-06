#sql("sys_url_role")
SELECT
*
FROM
oem.sys_url_role
#end

#sql("sys_url")
SELECT
*
FROM
oem.sys_url
#end

#sql("KEY_COLUMN_USAGE")
SELECT
KEY_COLUMN_USAGE.REFERENCED_TABLE_SCHEMA AS targetSchema,
KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AS targetTable,
KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME AS targetColumn
FROM
KEY_COLUMN_USAGE
WHERE
KEY_COLUMN_USAGE.CONSTRAINT_NAME LIKE '%fk%' AND
KEY_COLUMN_USAGE.TABLE_SCHEMA = 'oem' AND
KEY_COLUMN_USAGE.TABLE_NAME = ? AND
KEY_COLUMN_USAGE.COLUMN_NAME = ?
#end

#sql("t_work")
SELECT
*
FROM
oem.t_work
#end

#sql("t_work_type")
SELECT
*
FROM
oem.t_work_type
#end

#sql("t_class")
SELECT
*
FROM
oem.t_class
#end

#sql("t_gender")
SELECT
*
FROM
oem.t_gender
#end

#sql("t_grade")
SELECT
*
FROM
oem.t_grade
#end

#sql("t_major")
SELECT
*
FROM
oem.t_major
#end

#sql("t_rank")
SELECT
*
FROM
oem.t_rank
#end

#sql("t_review")
SELECT
*
FROM
oem.t_review
#end

#sql("t_role")
SELECT
*
FROM
oem.t_role
#end

#sql("t_student")
SELECT
*
FROM
oem.t_student
#end

#sql("t_teacher")
SELECT
*
FROM
oem.t_teacher
#end

#sql("t_user")
SELECT
*
FROM
oem.t_user
#end

#sql("t_user_work")
SELECT
*
FROM
oem.t_user_work
#end

#sql("t_user_role")
SELECT
*
FROM
oem.t_user_role
#end

#sql("t_teacher_link_student")
SELECT
*
FROM
oem.t_teacher_link_student
#end

#sql("t_notice")
SELECT
*
FROM
oem.t_notice
#end

    #sql("t_subject")
SELECT
    *
FROM
    oem.t_subject
        #end

#sql("t_inform")
SELECT
*
FROM
oem.t_inform
#end

#sql("t_picture")
SELECT
*
FROM
oem.t_picture
#end

#sql("v_work_info")
SELECT
*
FROM
oem.v_work_info
#end

#sql("v_student_info")
SELECT
*
FROM
oem.v_student_info
#end

#sql("v_teacher_info")
SELECT
*
FROM
oem.v_teacher_info
#end

#sql("v_student_work")
SELECT
*
FROM
oem.v_student_work
#end

#sql("v_teacher_work")
SELECT
*
FROM
oem.v_teacher_work
#end

#sql("v_student_work_teacher")
SELECT
*
FROM
oem.v_student_work_teacher
#end