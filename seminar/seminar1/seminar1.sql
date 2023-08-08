SELECT `seminar1_task1`.`students`.student_name, `seminar1_task1`.`courses`.name_courses
FROM `seminar1_task1`.`students`
JOIN `seminar1_task1`.`courses`
ON `seminar1_task1`.`students`.idstudent = `seminar1_task1`.`courses`.idcourses;