-- This database represents a common structure of a college with general information about students and teaching staff. Data was generated using online tools.

DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;

DROP TABLE IF EXISTS lecturers;
CREATE TABLE lecturers (
	id SERIAL,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	email VARCHAR (200) UNIQUE,
	birthday DATE,
	is_phd INT
);

INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('1', 'Summer', 'Powlowski', 'ewiegand@example.com', '1977-11-13', '0');
INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('2', 'Aida', 'Welch', 'rdickens@example.net', '1999-01-12', '0');
INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('3', 'Neva', 'Runte', 'leonora.bins@example.com', '2003-03-23', '0');
INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('4', 'Dorthy', 'Roob', 'murl44@example.org', '2015-11-03', '1');
INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('5', 'Claude', 'Feil', 'kkautzer@example.com', '1975-08-14', '0');
INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('6', 'Kaitlyn', 'Schmeler', 'carole.mueller@example.com', '1987-03-27', '0');
INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('7', 'Lavada', 'Wuckert', 'wilkinson.chyna@example.net', '1998-05-10', '0');
INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('8', 'Kory', 'Mertz', 'dgoldner@example.net', '2016-03-24', '0');
INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('9', 'Ismael', 'Predovic', 'batz.rubie@example.com', '1995-08-30', '1');
INSERT INTO `lecturers` (`id`, `first_name`, `last_name`, `email`, `birthday`, `is_phd`) VALUES ('10', 'Zackary', 'Monahan', 'harrison97@example.com', '1983-07-24', '0');

DROP TABLE IF EXISTS faculties;
CREATE TABLE faculties (
	id SERIAL,
	name VARCHAR(100) DEFAULT NULL,
	dean_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (dean_id) REFERENCES lecturers(id)
);

INSERT INTO `faculties` (`id`, `name`, `dean_id`) VALUES ('1', 'sit', '1');
INSERT INTO `faculties` (`id`, `name`, `dean_id`) VALUES ('2', 'non', '2');
INSERT INTO `faculties` (`id`, `name`, `dean_id`) VALUES ('3', 'aut', '3');
INSERT INTO `faculties` (`id`, `name`, `dean_id`) VALUES ('4', 'porro', '4');

DROP TABLE IF EXISTS programs;
CREATE TABLE programs (
	id SERIAL,
	name VARCHAR(100) DEFAULT NULL,
	faculty_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (faculty_id) REFERENCES faculties(id)
);

INSERT INTO `programs` (`id`, `name`, `faculty_id`) VALUES ('1', 'provident', '1');
INSERT INTO `programs` (`id`, `name`, `faculty_id`) VALUES ('2', 'quas', '2');
INSERT INTO `programs` (`id`, `name`, `faculty_id`) VALUES ('3', 'praesentium', '3');
INSERT INTO `programs` (`id`, `name`, `faculty_id`) VALUES ('4', 'excepturi', '4');
INSERT INTO `programs` (`id`, `name`, `faculty_id`) VALUES ('5', 'voluptatem', '1');
INSERT INTO `programs` (`id`, `name`, `faculty_id`) VALUES ('6', 'in', '2');

DROP TABLE IF EXISTS students;
CREATE TABLE students (
	id SERIAL,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	program_id BIGINT UNSIGNED NOT NULL,
	email VARCHAR (200) UNIQUE,
	enrolled DATETIME DEFAULT NOW(),
	birthday DATE,
	
	FOREIGN KEY (program_id) REFERENCES programs(id)
);

INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('1', 'Shannon', 'Rolfson', '1', 'hpacocha@example.org', '2013-03-19 16:34:45', '1992-10-22');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('2', 'Zula', 'Leannon', '2', 'elsa81@example.com', '2007-10-25 05:34:10', '2012-07-20');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('3', 'Lorenza', 'Cassin', '3', 'ohomenick@example.com', '1993-07-18 14:50:24', '1996-04-11');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('4', 'Coby', 'Ward', '4', 'mbartoletti@example.org', '2009-11-22 03:03:09', '1995-04-29');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('5', 'Adrian', 'Nitzsche', '5', 'nbuckridge@example.org', '1998-11-08 16:32:47', '2020-08-04');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('6', 'Joseph', 'Bechtelar', '6', 'heidenreich.christophe@example.net', '1981-10-29 17:13:43', '1979-10-02');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('7', 'Faye', 'Kub', '1', 'turner.abigayle@example.com', '2000-06-22 17:25:33', '1974-02-12');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('8', 'Kenton', 'Dietrich', '2', 'ahmed.bode@example.org', '1978-10-31 04:19:56', '1992-03-16');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('9', 'Genoveva', 'Funk', '3', 'bsipes@example.net', '2003-01-23 04:33:35', '2006-04-14');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `program_id`, `email`, `enrolled`, `birthday`) VALUES ('10', 'Malika', 'O\'Keefe', '4', 'gorczany.zackary@example.org', '1970-08-12 03:08:19', '1970-06-09');

-- ALTER TABLE students 
-- ADD CONSTRAINT program_fk 
-- FOREIGN KEY (program_id) REFERENCES programs(id);

DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
	id SERIAL,
	name VARCHAR(100) DEFAULT NULL,
	description TEXT,
	coordinator_id BIGINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (id, coordinator_id),
	FOREIGN KEY (coordinator_id) REFERENCES lecturers(id),
	INDEX courses_name_idx(name)
);

INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('1', 'aut', 'Pariatur doloribus aut dolorum recusandae non. Qui accusamus dolor est. Omnis nobis illo ex et. Qui eos quia sapiente et eligendi consequuntur quia.', '1');
INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('2', 'dolorem', 'Perferendis qui ut id laborum perspiciatis iusto iure. Reiciendis molestias et porro et voluptate voluptatum enim ipsam. Blanditiis nobis non dolores earum qui.', '2');
INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('3', 'ipsa', 'Et magni assumenda corrupti. Quo aut aut facere dolor et velit. Soluta perferendis iste itaque et praesentium. Quisquam quaerat est earum.', '3');
INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('4', 'recusandae', 'Ad qui aliquam quia. Ea accusamus est id minima excepturi in. Similique sed expedita tempora nisi sunt voluptas qui.', '4');
INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('5', 'cupiditate', 'Et a nihil quo qui possimus beatae. Et et et ullam quia quia necessitatibus. Minima eos dignissimos optio nisi quae. Cum consequatur aspernatur reprehenderit placeat dolorum mollitia asperiores.', '5');
INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('6', 'incidunt', 'Et dolorem tempore sit a. Dignissimos vel qui impedit harum illo. Porro blanditiis non saepe ea tempore. Quo molestiae eligendi repellat doloribus at tempore.', '6');
INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('7', 'porro', 'Voluptatem officiis fugiat eum asperiores in aliquid. Assumenda quas eius incidunt maxime. Et provident maiores unde voluptatem officia. Amet eligendi ea qui atque expedita. Sunt culpa doloremque nihil ea quia.', '7');
INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('8', 'et', 'Officiis assumenda accusamus iusto sapiente impedit amet et. Qui ad assumenda harum ut dolore dolor. Sequi illo eaque fugiat sed. Consequuntur ea fuga voluptatem cumque dolorem. Praesentium ullam porro omnis et iusto rem provident.', '8');
INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('9', 'eos', 'Voluptatem et libero repellat rerum quis et similique. Dolore sint sed cum autem sequi. Nesciunt dolores assumenda aut error id ipsum qui.', '9');
INSERT INTO `courses` (`id`, `name`, `description`, `coordinator_id`) VALUES ('10', 'eos', 'Et sit et odit. Labore asperiores voluptas animi qui voluptatum fugiat inventore. Aut harum enim eius quia consectetur odio.', '10');

DROP TABLE IF EXISTS course_participants;
CREATE TABLE course_participants (
	course_id BIGINT UNSIGNED NOT NULL,
	student_id BIGINT UNSIGNED NOT NULL,
	joined DATETIME DEFAULT NOW(),
	
	PRIMARY KEY (course_id, student_id),
	FOREIGN KEY (course_id) REFERENCES courses(id),
	FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('1', '1', '1981-04-20 17:17:55');
INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('2', '2', '1983-11-05 07:06:02');
INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('3', '3', '2020-03-09 22:15:46');
INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('4', '4', '2014-08-21 03:04:51');
INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('5', '5', '1992-09-01 14:53:57');
INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('6', '6', '2020-03-06 19:49:44');
INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('7', '7', '1996-03-30 09:10:38');
INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('8', '8', '1996-12-27 22:01:27');
INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('9', '9', '1972-03-14 03:18:47');
INSERT INTO `course_participants` (`course_id`, `student_id`, `joined`) VALUES ('10', '10', '1980-12-04 22:38:46');

DROP TABLE IF EXISTS assignments;
CREATE TABLE assignments (
	id SERIAL,
	course_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	deadline_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('1', '1', '1974-09-27 11:53:19', '1999-04-10 04:33:36');
INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('2', '2', '1999-12-10 16:43:21', '1997-06-21 04:40:02');
INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('3', '3', '1995-02-02 01:19:08', '1985-03-06 23:04:06');
INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('4', '4', '1984-03-30 13:35:39', '1992-10-31 22:32:40');
INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('5', '5', '1972-03-21 02:25:07', '2020-11-19 07:34:36');
INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('6', '6', '1975-02-17 14:28:00', '1979-08-05 22:53:12');
INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('7', '7', '1972-07-28 11:59:31', '1972-06-13 19:38:40');
INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('8', '8', '1991-03-31 11:20:40', '2000-05-13 07:33:08');
INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('9', '9', '1998-10-24 06:54:56', '1991-01-13 03:39:28');
INSERT INTO `assignments` (`id`, `course_id`, `created_at`, `deadline_at`) VALUES ('10', '10', '1994-06-10 07:16:14', '1999-09-27 17:19:03');

DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
	assign_id BIGINT UNSIGNED NOT NULL,
	student_id BIGINT UNSIGNED NOT NULL,
	grade BIGINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (assign_id, student_id),
	FOREIGN KEY (assign_id) REFERENCES assignments(id),
	FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('1', '1', '0');
INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('2', '2', '0');
INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('3', '3', '0');
INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('4', '4', '0');
INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('5', '5', '0');
INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('6', '6', '0');
INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('7', '7', '0');
INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('8', '8', '0');
INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('9', '9', '0');
INSERT INTO `grades` (`assign_id`, `student_id`, `grade`) VALUES ('10', '10', '0');

DROP TABLE IF EXISTS lectures;
CREATE TABLE lectures (
	course_id BIGINT UNSIGNED NOT NULL,
	lecturer_id BIGINT UNSIGNED NOT NULL,
	scheduled_at DATETIME DEFAULT NOW(),
	description text,
	
	PRIMARY KEY (scheduled_at, lecturer_id),
	FOREIGN KEY (lecturer_id) REFERENCES lecturers(id),
	FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('10', '10', '1970-09-26 12:18:30', 'Quia voluptatem totam vitae non. Suscipit consequatur inventore laudantium iste esse ut laudantium. Ipsa est omnis dolor repellendus voluptate nulla non.');
INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('9', '9', '1974-02-27 02:21:38', 'Quis quo et laborum. Ut inventore et dolores illum delectus. Qui consectetur ut optio et. Sit occaecati repellat nobis.');
INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('2', '2', '1975-11-14 10:45:27', 'Esse et assumenda omnis porro voluptatem sit. Et velit voluptas harum mollitia laborum. Laudantium nemo ea recusandae architecto labore ut sit iusto. Quo incidunt pariatur ut nam.');
INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('3', '3', '1984-07-07 10:33:12', 'Modi enim dolore accusantium vitae beatae qui incidunt molestiae. Numquam quia sit ea deleniti eum. Cupiditate labore dignissimos eius quam.');
INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('1', '1', '1989-09-16 05:21:57', 'Qui nihil commodi fugit. Consequuntur odit eligendi est quod illo quaerat. Maiores quidem et magnam. Molestiae minus aut est neque.');
INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('7', '7', '1996-07-28 23:50:27', 'Quaerat est quia saepe iste. Quia ex voluptatem rerum non cumque qui.');
INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('4', '4', '1996-08-20 04:19:10', 'Ipsum repellendus distinctio adipisci sit sint aut enim fugiat. Quis cumque sunt omnis explicabo. Iste eos magni sed voluptas harum quidem et. Inventore eaque beatae sequi illum earum quia.');
INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('6', '6', '2001-11-16 19:41:15', 'Blanditiis culpa laudantium ut in est nostrum aut. Qui et aut molestias vel. Quaerat perferendis vero accusamus voluptatem architecto. Consequatur veritatis et iste numquam qui.');
INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('8', '8', '2005-03-22 23:59:25', 'Impedit sit eveniet et dicta doloribus architecto consequuntur tempora. Debitis earum quas ea in enim et. Esse sit voluptatem qui quo reprehenderit repellat voluptatem.');
INSERT INTO `lectures` (`course_id`, `lecturer_id`, `scheduled_at`, `description`) VALUES ('5', '5', '2018-09-11 03:28:48', 'Vel et molestiae voluptatem hic. Ut sapiente quisquam et. Consectetur iusto eaque explicabo at.');

DROP TABLE IF EXISTS publications;
CREATE TABLE publications (
	id SERIAL,
	student_id BIGINT UNSIGNED NOT NULL,
	instructor_id BIGINT UNSIGNED NOT NULL,
	last_reviewed_at DATETIME DEFAULT NOW(),
	published_at DATETIME DEFAULT NOW(),
	journal_name text,
	
	FOREIGN KEY (instructor_id) REFERENCES lecturers(id),
	FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO `publications` (`id`, `student_id`, `instructor_id`, `last_reviewed_at`, `published_at`, `journal_name`) VALUES ('1', '1', '1', '2018-07-16 01:11:42', '2006-09-08 12:06:10', 'labore');
INSERT INTO `publications` (`id`, `student_id`, `instructor_id`, `last_reviewed_at`, `published_at`, `journal_name`) VALUES ('2', '2', '2', '2019-07-03 00:17:12', '1981-10-06 12:35:34', 'quia');
INSERT INTO `publications` (`id`, `student_id`, `instructor_id`, `last_reviewed_at`, `published_at`, `journal_name`) VALUES ('3', '3', '3', '1974-04-27 21:34:21', '1988-04-21 07:18:05', 'consequatur');

-- selects all ranked grades for a particular asssignment

SELECT 
	CONCAT(s.first_name, ' ', s.last_name) AS 'student', 
	a.id AS 'assignment', 
	g.grade 
FROM assignments AS a
LEFT JOIN grades AS g ON a.id=g.assign_id
LEFT JOIN students AS s ON g.student_id=s.id
WHERE a.id = 1
ORDER BY grade DESC;

-- selects an average grade of a student

SELECT
	AVG(g.grade) AS 'average grade', 
	CONCAT(s.first_name, ' ', s.last_name) AS 'student'
FROM grades AS g
LEFT JOIN students AS s ON g.student_id=s.id
WHERE s.id = 1;

-- selects student with unsatisfactory grades 

SELECT CONCAT(first_name, ' ', last_name) AS student 
FROM students 
WHERE id IN (SELECT student_id FROM grades WHERE grade <= 2);

-- the view shows general course information 

DROP VIEW IF EXISTS courses_view;
CREATE VIEW courses_view AS 
SELECT 
	c.name AS 'course name', 
	l.last_name AS coordinator, 
	COUNT(*) AS 'students enrolled' 
FROM course_participants AS c_p 
LEFT JOIN courses AS c ON c.id=c_p.course_id 
LEFT JOIN lecturers AS l ON l.id=c.coordinator_id 
GROUP BY name;

-- general information about students

DROP VIEW IF EXISTS students_info;
CREATE VIEW students_info AS
SELECT
	CONCAT(first_name, ' ', last_name) AS student,
	COUNT(publications.id) AS 'number of publications',
	TIMESTAMPDIFF(YEAR, enrolled ,NOW()) AS 'year',
	programs.name AS program
FROM students
LEFT JOIN programs ON programs.id=students.program_id
LEFT JOIN publications ON publications.student_id=students.id
GROUP BY student
ORDER BY COUNT(publications.id) DESC;

-- the procedure selects best performing students 

DELIMITER //

DROP PROCEDURE IF EXISTS best_students;
CREATE PROCEDURE best_students (IN usernumber INT)
BEGIN
	IF (usernumber >= 0) THEN
		SELECT 
			AVG(g.grade) AS 'average grade', 
			CONCAT(s.first_name, ' ', s.last_name) AS 'student'
		FROM grades AS g
		LEFT JOIN students AS s ON g.student_id=s.id
		GROUP BY s.id
		ORDER BY AVG(g.grade) DESC
		LIMIT usernumber;
	ELSE 
		SELECT 'Error';
	END IF;
END //

-- the procedure creates x assignments for a particular course

DROP PROCEDURE add_assignments;
CREATE PROCEDURE add_assignments (IN usercount INT, IN usercourse BIGINT)
BEGIN
	DECLARE i INT DEFAULT 0;
	IF (usercount > 0) THEN
		WHILE i < usercount DO
			INSERT INTO `assignments` (`course_id`) VALUES (usercourse);
			i = i + 1;
		END WHILE;
	ELSE 
		SELECT 'Error';
	END IF;
END//

-- the trigger automatically adds new students to the introductory course

CREATE TRIGGER intro_course AFTER INSERT ON students 
	FOR EACH ROW 
		BEGIN
		INSERT INTO course_participants 
		VALUES ('1', NEW.id, NOW());
	END //
	
DELIMITER ;
