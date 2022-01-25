# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors
from prettytable import PrettyTable

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']



def connect():
  
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")
        

# your code here

def get_response(msg): 
  
  data = msg.split()
  errors = []
  response = None
  
  command = data[0]
  if "/student-extracurricular-loans" in command: #this runs
     if not data[1]:
       #Check if the input message has one word and show error
       errors.append("You are missing the arguments")
     else:
       #If input message has more than command return business_rule_1 output 
       amount = data[1]
       response = business_rule_1(amount)
  elif "/phd-acceptance" in command: #this runs
     if not data[1]:
       errors.append("You are missing arguments")
     else: 
       number = data[1] 
       response = business_rule_2(number)
  elif "/conference-faculty" in command: #this runs
     if not data[1]:
       errors.append("You are missing arguments")
     else: 
       subject = data[1] 
       response = business_rule_3(subject)
  elif "/student-scholarship-loans" in command: #this runs
     if not data[1]:
       errors.append("You are missing arguments")
     else: 
       receive = data[1] 
       response = business_rule_4(receive)
  elif "/non-alumni-guest-speaker" in command: #this runs
     if not data[1]:
       errors.append("You are missing arguments")
     else: 
       activity = data[1] 
       response = business_rule_5(activity)

  elif "/offcampus-parttime-job" in command: #this runs
     if not data[1]:
       errors.append("You are missing arguments")
     else: 
       off_campus= data[1] 
       response = business_rule_6(off_campus)

  elif "/guest-speaker" in command: #this runs
     if not data[1]:
       errors.append("You are missing arguments")
     else: 
       activity_date = data[1] 
       response = business_rule_7(activity_date)

  elif "/student-group-college" in command: #this runs
     if not data[1]:
       errors.append("You are missing arguments")
     else: 
       college = data[1] 
       response = business_rule_8(college)
  if len(errors) >= 1: 
    return errors 
  return response 



# create the business rules functions 

def business_rule_1(amount):
  #output = None
  
  conn = connect()
  rows = []
  headers = ["Student", "Amount"] 
  if conn: 
    # there is a connection with the database
    cursor = conn.cursor() 
    query = """SELECT Student.student_name AS Student, StudentLoan.student_loan_amount AS Amount
                FROM Student
                INNER JOIN StudentLoan
                ON Student.student_id = StudentLoan.student_id
                WHERE has_extracurricular = 1
                AND student_loan_amount = %s""" 
    # %s is a wildc 
    variable = (amount)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query 
    if data: # check that data is not Null 
       for student_data in data: 
           row = []
           student = student_data['Student']
           amount = student_data['Amount']
           row.append(student)
           row.append(amount)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"

   


def business_rule_2(number): 
  #choice_number = 1 
  #output = None
  conn = connect()
  rows = []
  headers = ["Student", "Attended"] 
  if conn: 
    # there is a connection with the database
    cursor = conn.cursor() 
    query = """SELECT Student.student_name AS Student, phd_attended AS Attended
                FROM Student
                JOIN PhDProgram
                ON Student.phd_id = PhDProgram.phd_program_id
                JOIN TeachingAssistant
                ON TeachingAssistant.student_id = Student.student_id
                WHERE Student.accepted_to_choice = %s""" 
    # %s is a wildc 
    variable = (number)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query 
   
    if data: # check that data is not Null 
       for student_data in data: 
           row = []
           Student = student_data['Student']
           Attended = student_data['Attended']
           row.append(Student)
           row.append(Attended)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again" 



def business_rule_3(subject):
  #output = None
  
  conn = connect()
  rows = []
  headers = ["Conference", "Number"] 
  if conn: 
    # there is a connection with the database
    cursor = conn.cursor() 
    query = """ SELECT conference_name AS Conference, COUNT(faculty_name) AS Number
                FROM Conference, Faculty
                JOIN FacultyConference
                ON FacultyConference.conference_id = Faculty.faculty_id
                WHERE faculty_subject = %s
                GROUP BY conference_name """ 
    # %s is a wildc 
    variable = (subject)#, amount)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query 
    if data: # check that data is not Null 
       for student_data in data: 
           row = []
           conference = student_data['Conference']
           number = student_data['Number']
           row.append(conference)
           row.append(number)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"



def business_rule_4(receive): 
  #output = None
  conn = connect()
  rows = []
  headers = ["Student", "Amount"] 
  if conn: 
    # there is a connection with the database
    cursor = conn.cursor() 
    query = """SELECT student_name AS student, student_loan_amount AS amount
                FROM Student
                JOIN StudentLoan
                ON StudentLoan.student_id = Student.student_id
                WHERE received_scholarship = %s
                ORDER BY  student_loan_amount ASC""" 
    # %s is a wildc 
    variable = (receive)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query 
    if data: # check that data is not Null 
       for student_data in data: 
           row = []
           student = student_data['student']
           amount = student_data['amount']
           row.append(student)
           row.append(amount)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again" 





def business_rule_5(activity): 
  #output = None
  conn = connect()
  rows = []
  headers = ["Count"] 
  if conn: 
    # there is a connection with the database
    cursor = conn.cursor() 
    query = """SELECT COUNT(activity_type) AS Count
                FROM Activity
                JOIN GuestSpeaker
                ON GuestSpeaker.activity_id = Activity.activity_id
                WHERE is_alumni = %s""" 
    # %s is a wildc 
    variable = (activity)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query 
    if data: # check that data is not Null 
       for student_data in data: 
           row = []
           Count = student_data['Count']
           row.append(Count)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again" 



def business_rule_6(off_campus):
  #output = None
  
  conn = connect()
  rows = []
  headers = ["College", "Count"] 
  if conn: 
    # there is a connection with the database
    cursor = conn.cursor() 
    query = """ SELECT college_name AS College, COUNT(student_name) AS Count
                FROM Student
                JOIN College
                ON Student.college_id = College.college_id
                JOIN LivingSituation
                ON LivingSituation.living_situation_id = Student.livingsit_id
                JOIN Occupation
                ON Occupation.student_occ_name = Student.student_name
                WHERE is_on_campus = %s
                AND is_full_time = 1
                GROUP BY college_name """ 
    # %s is a wildc 
    variable = (off_campus)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query 
    if data: # check that data is not Null 
       for student_data in data: 
           row = []
           college = student_data['College']
           count = student_data['Count']
           row.append(college)
           row.append(count)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"

def business_rule_7(activity_date): 
  #output = None
  conn = connect()
  rows = []
  headers = ["Guest Speaker", "Average"] 
  if conn: 
    # there is a connection with the database
    cursor = conn.cursor() 
    query = """SELECT guest_speak_name as Name, COUNT(activity_name) AS Average
                FROM GuestSpeaker
                JOIN Activity
                ON Activity.activity_id = GuestSpeaker.activity_id
                WHERE activity_date = %s
                GROUP BY guest_speak_name""" 
    # %s is a wildc 
    variable = (activity_date)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query 
    if data: # check that data is not Null 
       for student_data in data: 
           row = []
           name = student_data['name']
           average = student_data['average']
           row.append(name)
           row.append(average)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again" 



def business_rule_8(college):
  #output = None
  
  conn = connect()
  rows = []
  headers = ["Campus", "Average"] 
  if conn: 
    # there is a connection with the database
    cursor = conn.cursor() 
    query = """ SELECT student_group_campus AS Campus, AVG(num_of_students) AS Average
                FROM StudentGroup
                WHERE student_group_campus = %s
                GROUP BY student_group_campus """ 
    # %s is a wildc 
    variable = (college)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query 
    if data: # check that data is not Null 
       for student_data in data: 
           row = []
           Campus = student_data['Campus']
           Average = student_data['Average']
           row.append(Campus)
           row.append(Average)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"

   






def format_data(headers, rows ): 
  # format in a nice way all the data.      
  table = PrettyTable() 
  table.field_names = headers
  for row in rows: 
    table.add_row(row)
  return table 


