--Contare quanti iscritti ci sono stati ogni anno.
SELECT YEAR(`enrolment_date`), COUNT(*) AS `students_per_year`
FROM `students`
GROUP BY YEAR(`enrolment_date`);

--Contare gli insegnanti che hanno l'ufficio nello stesso edificio.
SELECT `office_address`, COUNT(*) AS `teacher_count`
FROM `teachers`
GROUP BY `office_address`
	HAVING `teacher_count` > 1
ORDER BY `teacher_count` DESC;

--Calcolare la media dei voti di ogni appello d'esame.
SELECT `exam_id`, AVG(`vote`) AS `average_vote`
FROM `exam_student` 
GROUP BY `exam_id`;

--Contare quanti corsi di laurea ci sono per ogni dipartimento.
SELECT `department_id`, COUNT(`name`) 
FROM `degrees`
GROUP BY `department_id`;



--Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia.
SELECT `students`.`id`, `students`.`degree_id` , `students`.`name`, `students`.`surname`,
       `degrees`.`name`, `degrees`.`level`
FROM `students`
INNER JOIN `degrees`
	ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "corso di laurea in economia";
-- oppure WHERE `students`.`degree_id` = 53; 53 => è il numero identificativo del corso di laurea in economia.

--Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze.
SELECT `degrees`.`id`, `degrees`.`name`, `degrees`.`level`,
	   `departments`.`id`, `departments`.`name`
FROM `degrees`
INNER JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "dipartimento di neuroscienze";

--Selezionare tutti i corsi in cui insegna Fulvio Amato. (id=44)
SELECT `courses`.`id`, `courses`.`name`, `courses`.`period`, `courses`.`year`,
	   `teachers`.`id`, `teachers`.`name`, `teachers`.`surname`
FROM `courses`
JOIN `course_teacher`
	ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44;

--Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome.
SELECT `students`.`surname`, `students`.`name`, `students`.`registration_number`,
	   `degrees`.`name`, `degrees`.`level`, `departments`.`name`
FROM `students`
JOIN `degrees`
	ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments`
	ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`, `students`.`name`;

--Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti.
SELECT `degrees`.`name`, `degrees`.`level`, `courses`.`name`, `courses`.`period`, 
	   `courses`.`year`, `teachers`.`name`, `teachers`.`surname` 
FROM `degrees`
JOIN `courses`
	ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
	ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
ORDER BY `degrees`.`name`;

--Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica. (54)
SELECT `teachers`.`name`, `teachers`.`surname`, `courses`.`name`, `courses`.`period`,
	   `courses`.`year`, `degrees`.`name`, `degrees`.`level`, `departments`.`name`
FROM `teachers`
JOIN `course_teacher`
	ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` 
	ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "dipartimento di matematica";

--BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami.

