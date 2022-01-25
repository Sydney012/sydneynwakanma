USE BAMMScholarshipDB;

-- Script name: inserts.sql
   -- Author:      Sydney Nwakanma
   -- Purpose:     insert sample data to test the integrity of this database system
   
   -- the database used to insert the data into.
   USE BAMMScholarshipDB; 
   
   -----------------------------------------------------------------------------------------
     -- Activity table inserts
   INSERT INTO Activity (activity_id, activity_name, activity_type, activity_date) VALUES 
   (1, 'Introduction', 'Friday Meeting', '2021-09-01'), 
   (2, 'Panel of PhD Students','Friday Meeting', '2021-09-25' ), 
   (3, 'Field of Dream Conference','Conference', '2021-11-05');
    
    -- College table inserts
   INSERT INTO College (college_id, college_name, college_address) VALUES 
   (1, 'SFSU', '1600 Holloway Ave, San Francisco, CA 94132'), 
   (2, 'Cal Poly Pomona', '3801 W Temple Ave, Pomona, CA 91768'), 
   (3, 'Fresno State', '5241 N Maple Ave, Fresno, CA 93740');
   
    -- Scholarship Amount table inserts
   INSERT INTO ScholarshipAmount (scholarship_amount_id, scholarship_amnt_student, scholarship_date, is_first_year, is_completed) VALUES 
   (1, 'Cara', '2020', 1, 0), (2, 'David M', '2021', 0, 0), (3, 'Moses T', '2020', 1, 0);
   
    -- Course table inserts
   INSERT INTO course (course_id, course_description, course_name, is_math, is_mandatory, course_professor) VALUES 
   (1, 'Math 440', 'Probability and Statistics I', 1, 1, 'Dr. Jake Tapper' ), 
   (2, 'Math 441', 'Probability and Statistics', 1, 1, 'Dr. Anderson Cooper'), 
   (3, 'Math 448', 'Design and Experiments', 1, 0, 'Dr. Lester Holt');
   
   -- Major table inserts
   INSERT INTO Major (major_id, major_name, major_description, major_department) VALUES 
   (1, 'Statistical Data Science', NULL, 'Department of Statistics'), 
   (2, 'Mathematics', NULL, 'Department of Mathematics'), 
   (3, 'Mathematics', NULL, 'Department of Mathematics');
   
 -- Living Situation table inserts
   INSERT INTO LivingSituation (living_situation_id, is_on_campus) VALUES (1,0), (2,0), (3,1);
   
   -- PhD Program table inserts
   INSERT INTO PhDProgram (phd_program_id, student_phd_name, is_phd_track, phd_program_area, phd_school_1stchoice, phd_school_2ndchoice, phd_school_3rdchoice, accepted_to_1st, accepted_to_2nd, accepted_to_3rd, phd_attended, reason) VALUES 
   (1, 'Gabe', 1, 'Math', 'Stanford', 'Berkley', 'Texas A&M', 0,0,1, 'Texas A&M', 'Only school I got into'), 
   (2, 'Vicky', 1, 'Math Education', 'Berkley', 'Stanford', 'Texas A&M', 1,1,1, 'Berkley', 'I always wanted to go here'), 
   (3, 'Tish',1, 'Applied Math', 'Texas A&M', 'Berkley', 'Stanford', 0,1,1, 'Stanford', 'I like the flowers there');
   
    -- Research Topic table inserts
   INSERT INTO ResearchTopic (research_topic_id, research_topic_area, research_topic_advisor, research_topic_studentname) VALUES 
   (1, 'Combinatorics', 'Dr. Kelly', 'Joshua W'), 
   (2, 'Matrices', 'Dr. Poorva', 'Alex T'), 
   (3, 'Probabilities', 'Dr. Weston', 'Raya K');
   
     -- Student Group table inserts
   INSERT INTO StudentGroup (student_group_id, student_group_campus, num_of_students, student_group_date, student_group_faculty) VALUES 
   (1, 'SFSU', 12, '2020', 'Kimberly'), (2, 'CalPoly Pomona', 10, '2021', 'John A'), (3, 'SFSU', 13, '2021', 'Kimberly');
   
   -- Extracurricular table inserts
   INSERT INTO Extracurricular (extracurricular_id, extracurricular_type) VALUES 
   (1, 'Sports'), (2, 'Off-Campus Job'), (3, 'Off-Campus Job');
   ---------------------------------------------------------------------------------
   -- Conference table inserts
   INSERT INTO Conference (conference_id, conference_name, conference_fund_amnt_allocated, num_of_students_attended, conference_date, activity_id) VALUES 
   (1, 'Field of Dreams Conference', 1000, 10, '2021-11-05', 3), 
   (2, 'Joint Math Meetings', 1000, 15, '2022-01-04', 2), 
   (3, 'Blackwell-Tapia Conference', 500, 10, '2021-11-11', 1);
   
   
   -- Student table inserts
   INSERT INTO Student (student_id, student_name, student_email, student_phone, student_address, is_mentor, is_affiliate, livingsit_id, phd_id, college_id) VALUES 
   (1, 'Ezinne', 'ezinne@gmail.com', 7659340265, '67 A street, Santa Barbara CA', 0, 1, 1, 1, 1), 
   (2, 'Richard', 'richard@gmail.com', 6549346520, ' 23 B Street, Santa Clara CA', 0, 1, 2, 2, 1), 
   (3, 'Foxy P', 'foxy@gmail.com', 2387456342, '87 C Street, San Jose CA', 0,1, 3, 3, 3 );
   
   -- Student Loan table inserts
   INSERT INTO StudentLoan (student_loan_id, student_loan_type, student_loan_amount, student_id) VALUES 
   (1, 'subsidized loan', 2500, 1), 
   (2, 'parent loan', 10000, NULL), 
   (3, 'unsubsidize loan', 5000, NULL);
   
   -- Mentor/Alumni table inserts
   INSERT INTO MentorAlumni (mentor_alumni_id, mentor_name, mentor_email, mentor_phone, student_id, mentor_college) VALUES 
   (1, 'Anastasia', 'anastasia@gmail.com', 6748903478, NULL, 'University of Pittsburgh'), 
   (2, 'Nairobi', 'nairobi@gmail.com', 2349875643, NULL, 'Texas A&M'), 
   (3, 'Manuel', 'manuel@gmail.com', 1874560932, NULL, 'Stanford');
   
    -- Teaching Assistant
   INSERT INTO TeachingAssistant (teaching_assistant_id, ta_name, is_first_year_teaching, subject_teach_type, ta_email, student_id) VALUES 
   (1, 'Ezinne', 1, 'Math', 'ezinne@gmail.com', 1), 
   (2, 'Richard', 1, 'Math', 'richard@gmail.com', 2), 
   (3, 'Foxy', 0, 'Math', 'foxy@gmail.com', 3);
   
   -- Affiliate table inserts
   INSERT INTO Affiliate (affiliate_id, affiliate_name, affiliate_email, affiliate_phone, student_id, affiliate_college) VALUES 
   (1, 'Ari Xun', 'axun@gmail.com', 5106678900, NULL, 'Cal Poly Pomona'), 
   (2, 'Jason Mendez', 'jmendez@gmail.com', 7109221675, NULL, 'SFSU'), 
   (3, 'Karen Nwosu', 'knwosu@gmail.com', 6671285677, NULL, 'Fresno State');
   
    -- Occupation table inserts
   INSERT INTO Occupation (occupation_id, occupation_type, is_full_time, extracurricular_id) VALUES 
   (1, 'Secretary', 0, 2), (2, 'Cashier', 0, NULL), (3, 'Tutor', 0, NULL);
   
    -- CollegeExtracurricular table inserts
   INSERT INTO CollegeExtracurricular (college_id, extracurricular_id) VALUES (1, 1), (2,2), (3,3);
   
   -- CollegeScholarshipAmount table inserts
   INSERT INTO CollegeScholarshipAmount (college_id, scholarship_id) VALUES (1, 1), (1, 2), (1, 3);
   
   -- CourseMajor table inserts
   INSERT INTO CourseMajor (course_id, major_id) VALUES (1,1), (2,2), (3,3);
   
   -- Guest Speaker table inserts
   INSERT INTO GuestSpeaker (guest_speaker_id, guest_speak_name, guest_speak_email, is_faculty, is_in_person, is_alumni, activity_id) VALUES
   (1, 'Christina Thompson', 'cthompson@gmail.com', 0, 0, 1, 2), 
   (2, 'Jane Karazin', 'jkarazin@gmail.com', 0,0,1, 2), 
   (3, 'Joe Goldberg', 'jgoldberg@gmail.com', 0,0,0, 2);
   
   -- Faculty table inserts
   INSERT INTO  Faculty (faculty_id, faculty_name, is_bamm, faculty_email, faculty_phone, guest_speaker_id, faculty_college, faculty_subject) VALUES 
   (1, 'Dr. Beyonce Knowles', 1, 'bknowles@gmail.com', 5106634567, NULL, 'SFSU', 'Mathemathics'), 
   (2, 'Shakira', 1, 'shakira@gmail.com', 6234891048, NULL, 'Cal Poly Pomona', 'Mathematics'), 
   (3, 'Aretha Franklin', 1, 'afranklin@gmail.com', 3459087259, NULL, 'Fresno State', 'Mathematics');
   
   -- FacultyConference table inserts
   INSERT INTO FacultyConference (faculty_id, conference_id) VALUES (1,1), (2,2), (3,3);
   
   -- FacultyCourse table inserts
   INSERT INTO FacultyCourse (faculty_id, course_id) VALUES (1,1), (2,2), (3,3);
   
    -- FacultyStudent table inserts
   INSERT INTO FacultyStudent (faculty_id, student_id) VALUES (1,1),(2,2),(3,3);
   
   -- Subject table inserts
   INSERT INTO Subject (subject_id, faculty_id, professor, subject_type) VALUES 
   (1, NULL, 'James P', 'Mathematics'), (2, NULL, 'Ansel E', 'Statistics'), (3, NULL, 'Owen Z', 'Mathematics');
   
    -- FacultySubject table inserts
   INSERT INTO FacultySubject (faculty_id, subject_id) VALUES (1,1), (2,2), (3,3);
   
    -- StudentConference table inserts
   INSERT INTO StudentConference (student_id, conference_id) VALUES (1,1), (2,2), (3,3);
   
    -- StudentCourse table inserts
   INSERT INTO StudentCourse (student_id, course_id) VALUES (1,1), (2,2), (3,3);
   
   -- StudentExtracurricular table inserts
   INSERT INTO StudentExtracurricular (student_id, extra_id) VALUES (1,1), (2,2), (3,3);
   
   -- StudentGroupStudent table inserts
   INSERT INTO StudentGroupStudent (studentg_id, student_id) VALUES (1,1), (2,2), (3,3);
   
   -- StudentMajor table inserts
   INSERT INTO StudentMajor (student_id, major_id) VALUES (1,1), (2,2), (3,3);
   
    -- StudentOccupation table inserts
   INSERT INTO StudentOccupation (student_id, occupatione_id) VALUES (1,1), (2,2), (3,3);
   
   -- StudentResearch table inserts
   INSERT INTO StudentResearch (student_id, research_id) VALUES (1,1), (2,2), (3,3);
   
   -- StudentScholarshipAmount table inserts
   INSERT INTO StudentScholarshipAmount (student_id, scholarship_id) VALUES (1,1), (2,2), (3,3);
   
   -- TACourse table inserts
   INSERT INTO TACourse (ta_id, course_id) VALUES (1,1), (2,2), (3,3);
   
   
   
   