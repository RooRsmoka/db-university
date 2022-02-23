--Contare quanti iscritti ci sono stati ogni anno.
SELECT YEAR(`enrolment_date`), COUNT(*) AS `students_per_year`
FROM `students`
GROUP BY YEAR(`enrolment_date`);

--Contare gli insegnanti che hanno l'ufficio nello stesso edificio.
SELECT `office_address`, COUNT(*) AS `teacher_count`
FROM `teachers`
GROUP BY `office_address`
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
WHERE `departments`.`name` LIKE "%neuro%";

--Selezionare tutti i corsi in cui insegna Fulvio Amato. (id=44)
SELECT `courses`.`id`, `courses`.`name`, `courses`.`period`, `courses`.`year`,
	   `teachers`.`id`, `teachers`.`name`, `teachers`.`surname`
FROM `courses`
JOIN `course_teacher`
	ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44

--Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome.


--Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti.


--Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica. (54)


--BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami.

