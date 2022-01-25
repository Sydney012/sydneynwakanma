      -- Script name: tests.sql
       -- Author:      Sydney Nwakanma
       -- Purpose:     test the integrity of this database system
       
       -- the database used to insert the data into.
       USE BAMMScholarshipDB; 
       
       -- 1. Testing Activity table
       DELETE FROM Activity WHERE activity_name = 'Introduction';
       UPDATE Activity SET activity_id = 3  WHERE activity_name = 'Field of Dream Conference';
       
       -- 2. Testing College table
       -- 1. Error in College Delete
       -- query: DELETE FROM College WHERE college_name = 'Fresno State';
       -- Error: Cannot delete or update a parent row.
       -- DELETE FROM College WHERE college_name = 'Fresno State';
       UPDATE College SET college_id = 1  WHERE college_name = 'SFSU';
       
       -- 3. Testing Scholarship Amount table
       DELETE FROM ScholarshipAmount WHERE scholarship_amnt_student = 'Cara';
       UPDATE ScholarshipAmount SET scholarship_amount_id = 2  WHERE scholarship_amnt_student = 'David M';
       
       -- 4. Testing Courses Table
       DELETE FROM course WHERE course_professor = 'Dr. Jake Tapper';
       UPDATE course SET course_id = 2 WHERE course_professor = 'Dr. Anderson Cooper';
       
       -- 5. Testing Major Table
       DELETE FROM Major WHERE major_name = 'Mathematics';
       UPDATE Major SET major_id = 3 WHERE major_name = 'Mathematics';
       
       -- 6. Testing LivingSituation Table
       -- 2. Error in Living Situation Delete
       -- query: DELETE FROM LivingSituation WHERE is_on_campus = 0;
       -- Error: Cannot delete or update a parent row.
       -- DELETE FROM LivingSituation WHERE is_on_campus = 0;
       UPDATE LivingSituation SET living_situation_id = 1 WHERE is_on_campus = 0;
       
       -- Testing Phd Program Table
       DELETE FROM PhDProgram WHERE student_phd_name = 'Gabe';
       UPDATE PhDProgram SET phd_program_id = 2 WHERE student_phd_name = 'Vicky';
       
       -- Testing Research Topic Table
       DELETE FROM ResearchTopic WHERE research_topic_area = 'Combinatorics';
       UPDATE ResearchTopic SET research_topic_id = 2 WHERE research_topic_area ='Matrices';
       
       -- Testing Student Group Table
       DELETE FROM StudentGroup WHERE student_group_campus = 'SFSU';
       UPDATE StudentGroup SET student_group_id = 2 WHERE student_group_campus = 'CalPoly Pomona';
       
       -- Testing Extracurricular Table
       DELETE FROM Extracurricular WHERE extracurricular_type = 'Sports';
       UPDATE Extracurricular SET extracurricular_id = 2 WHERE extracurricular_type = 'Off-Campus Job';
       
        -- Testing Conference Table
       DELETE FROM Conference WHERE conference_name = 'Field of Dreams Conference';
       UPDATE Conference SET conference_id = 2 WHERE conference_name = 'Joint Math Meetings';
       
        -- Testing Student Table
       DELETE FROM Student WHERE student_name = 'Ezinne';
       UPDATE Student SET student_id = 2 WHERE student_name = 'Richard';
       
        -- Testing Student Loan Table
       DELETE FROM StudentLoan WHERE student_loan_id = 1;
       UPDATE StudentLoan SET student_loan_id = 2 WHERE student_loan_type = 'parent loan';
       
        -- Testing MentorAlumni Table
        -- 3. Error in MentorAlumni Update
       -- query: UPDATE MentorAlumni SET mentor_alumni_id = 2 WHERE extracurricular_type = 'Nairobi';
       -- Error: Unknown column 'extracurricular_type' in 'where clause'.
       DELETE FROM MentorAlumni WHERE mentor_name = 'Anastasia';
       -- UPDATE MentorAlumni SET mentor_alumni_id = 2 WHERE extracurricular_type = 'Nairobi';
       
       -- Testing Teaching Assistant Table
       DELETE FROM TeachingAssistant WHERE ta_name = 'Ezinne';
       UPDATE TeachingAssistant SET teaching_assistant_id = 2 WHERE ta_name = 'Richard';
       
       -- Testing Affiliate Table
       DELETE FROM Affiliate WHERE affiliate_id = 1;
       UPDATE Affiliate SET affiliate_id = 2 WHERE affiliate_name = 'Jason Mendez';
       
       -- Testing Occupation Table
       DELETE FROM Occupation WHERE occupation_type = 'Tutor';
       UPDATE Occupation SET occupation_id = 2 WHERE occupation_type = 'Cashier';
       
       -- Testing CollegeExtracurricular Table
       DELETE FROM CollegeExtracurricular WHERE college_id = 2;
       UPDATE CollegeExtracurricular SET college_id = 2 WHERE extracurricular_id = 2;
       
       -- Testing CollegeScholarshipAmount Table
       DELETE FROM CollegeScholarshipAmount WHERE college_id = 1;
       UPDATE CollegeScholarshipAmount SET college_id = 2 WHERE scholarship_id = 2;
       
       -- Testing CourseMajor Table
       DELETE FROM CourseMajor WHERE course_id = 1;
       UPDATE CourseMajor SET course_id = 2 WHERE major_id = 2;
       
       -- Testing GuestSpeaker Table
       DELETE FROM GuestSpeaker WHERE guest_speaker_id = 1;
       UPDATE GuestSpeaker SET guest_speaker_id = 2 WHERE guest_speak_name = 'Jane Karazin';
       
       -- Testing Faculty Table
       DELETE FROM Faculty WHERE faculty_id = 1;
       UPDATE Faculty SET faculty_id = 2 WHERE faculty_name = 'Shakira';
       
       -- Testing FacultyConference Table
       DELETE FROM FacultyConference WHERE faculty_id = 1;
       UPDATE FacultyConference SET faculty_id = 2 WHERE conference_id = 2;
       
       -- Testing FacultyCourse Table
       DELETE FROM FacultyCourse WHERE faculty_id = 1;
       UPDATE FacultyCourse SET faculty_id = 2 WHERE course_id = 2;
       
       -- Testing FacultyStudent Table
       DELETE FROM FacultyStudent WHERE faculty_id = 1;
       UPDATE FacultyStudent SET faculty_id = 2 WHERE student_id = 2;
       
       -- Testing Subject Table
       DELETE FROM Subject WHERE subject_id = 1;
       UPDATE Subject SET subject_id = 2 WHERE professor = 'Ansel E';
       
       -- Testing FacultySubject Table
       DELETE FROM FacultySubject WHERE faculty_id = 1;
       UPDATE FacultySubject SET faculty_id = 2 WHERE subject_id = 2;
       
       -- Testing StudentConference Table
       DELETE FROM StudentConference WHERE student_id = 1;
       UPDATE StudentConference SET student_id = 2 WHERE conference_id = 2;
       
       -- Testing StudentCourse Table
       DELETE FROM StudentCourse WHERE student_id = 1;
       UPDATE StudentCourse SET student_id = 2 WHERE course_id = 2;
       
       -- Testing StudentExtracurricular Table
       DELETE FROM StudentExtracurricular WHERE student_id = 1;
       UPDATE StudentExtracurricular SET student_id = 2 WHERE extra_id = 2;
       
       -- Testing StudentGroupStudent Table
       DELETE FROM StudentGroupStudent WHERE student_id = 1;
       UPDATE StudentGroupStudent SET student_id = 2 WHERE studentg_id = 2;
       
       -- Testing StudentMajor Table
       DELETE FROM StudentMajor WHERE student_id = 1;
       UPDATE StudentMajor SET student_id = 2 WHERE major_id = 2;
       
       -- Testing StudentOccupation Table
       DELETE FROM StudentOccupation WHERE student_id = 1;
       UPDATE StudentOccupation SET student_id = 2 WHERE occupatione_id = 2;
       
       -- Testing StudentResearch Table
       DELETE FROM StudentResearch WHERE student_id = 1;
       UPDATE StudentResearch SET student_id = 2 WHERE research_id = 2;
       
       -- Testing StudentScholarshipAmount Table
       DELETE FROM StudentScholarshipAmount WHERE student_id = 1;
       UPDATE StudentScholarshipAmount SET student_id = 2 WHERE scholarship_id = 2;
       
       -- Testing TACourse Table
       DELETE FROM TACourse WHERE ta_id = 1;
       UPDATE TACourse SET ta_id = 2 WHERE course_id = 2;
       
       