CREATE USER 'kurogami'@'localhost' IDENTIFIED BY 'kalajadu';
GRANT ALL PRIVILEGES ON * . * TO 'kurogami'@'localhost';
CREATE DATABASE Schola;

DROP TABLE TO_DO;
DROP TABLE RT_COURSES;
DROP TABLE ROUTINE;
DROP TABLE ST_COURSES;
DROP TABLE COURSES;
DROP TABLE FACULTY;
DROP TABLE STUDENT;
DROP TABLE DPS;
DROP TABLE PROGRAMS;
DROP TABLE DEPARTMENT;




CREATE TABLE DEPARTMENT(
	D_ID INT,
	D_NAME VARCHAR (4),
	D_HEAD VARCHAR(40),
	CONSTRAINT PK_DEPT PRIMARY KEY (D_ID)
);

INSERT INTO DEPARTMENT VALUES (4, 'CSE', 'Abu Raihan Mostofa Kamal' );
INSERT INTO DEPARTMENT VALUES (2, 'EEE', 'Md. Ruhul Amin' );
INSERT INTO DEPARTMENT VALUES (1, 'MPE', 'Md. Anayet Ullah Patwari' );
INSERT INTO DEPARTMENT VALUES (5, 'CEE', 'Hossain Md. Shahin' );
INSERT INTO DEPARTMENT VALUES (6, 'BTM', 'Md. Zahid Hossain' );
INSERT INTO DEPARTMENT VALUES (3, 'TVE', 'Md Abu Raihan' );



CREATE TABLE PROGRAMS(
	P_ID INT,
	P_NAME VARCHAR (4),
	DEPT_ID INT,
	CONSTRAINT PK_PROG PRIMARY KEY (P_ID, P_NAME),
	CONSTRAINT FK_PROG FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(D_ID)
);


INSERT INTO PROGRAMS VALUES (1, 'CSE', 4 );
INSERT INTO PROGRAMS VALUES (2, 'SWE', 4 );
INSERT INTO PROGRAMS VALUES (1, 'EEE', 2 );
INSERT INTO PROGRAMS VALUES (1, 'ME',  1 );
INSERT INTO PROGRAMS VALUES (2, 'IPE', 1 );
INSERT INTO PROGRAMS VALUES (1, 'CEE', 5 );
INSERT INTO PROGRAMS VALUES (1, 'BTM', 6 );




CREATE TABLE DPS(
    DPS_ID INT,
    DEPT_ID INT,
    PROG_ID INT,
    SEMESTER INT,
    CONSTRAINT PK_DPS PRIMARY KEY (DPS_ID),
    CONSTRAINT FK_DPS_DEPT FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(D_ID),
    CONSTRAINT FK_DPS_PROG FOREIGN KEY (PROG_ID) REFERENCES PROGRAMS(P_ID)
);

INSERT INTO DPS VALUES (1, 4, 1, 1 );
INSERT INTO DPS VALUES (2, 4, 1, 2 );
INSERT INTO DPS VALUES (3, 4, 1, 3 );
INSERT INTO DPS VALUES (4, 4, 1, 4 );
INSERT INTO DPS VALUES (5, 4, 1, 5 );
INSERT INTO DPS VALUES (6, 4, 1, 6 );
INSERT INTO DPS VALUES (7, 4, 1, 7 );
INSERT INTO DPS VALUES (8, 4, 1, 8 );
INSERT INTO DPS VALUES (9, 4, 2, 1 );
INSERT INTO DPS VALUES (10, 4, 2, 2 );
INSERT INTO DPS VALUES (11, 4, 2, 3 );
INSERT INTO DPS VALUES (12, 4, 2, 4 );
INSERT INTO DPS VALUES (13, 4, 2, 5 );
INSERT INTO DPS VALUES (14, 4, 2, 6 );
INSERT INTO DPS VALUES (15, 4, 2, 7 );
INSERT INTO DPS VALUES (16, 4, 2, 8 );


CREATE TABLE STUDENT(
    ST_ID INT,
    ST_NAME VARCHAR (40),
    EMAIL VARCHAR (40),
    DoB DATE,
    DPS_ID INT,
    SEC INT,
    GROUP_LAB CHAR,
    CR BOOLEAN,
    CONSTRAINT PK_STU PRIMARY KEY (ST_ID),
    CONSTRAINT UC_STU_EM UNIQUE (EMAIL),
    CONSTRAINT FK_STU FOREIGN KEY (DPS_ID) REFERENCES DPS(DPS_ID)
);

INSERT INTO STUDENT VALUES (180041108, 'Tasnim Ferdous Anan',       'tasnimferdous@iut-dhaka.edu',   '1999-03-24', 5, 1, 'A', FALSE);
INSERT INTO STUDENT VALUES (180041118, 'Sidratul Muntaha Adrita',   'sidratulmuntaha@iut-dhaka.edu', '1999-12-23', 5, 1, 'A', FALSE);
INSERT INTO STUDENT VALUES (180041120, 'Md. Farhan Ishmam',         'farhanishmam@iut-dhaka.edu',    '2000-01-22', 5, 1, 'A', FALSE);
INSERT INTO STUDENT VALUES (180041136, 'Nahian Ibn Asad',           'nahianasad@iut-dhaka.edu',      '2001-07-01', 5, 1, 'B', TRUE);


CREATE OR REPLACE VIEW STUDENT_PROFILE AS
SELECT ST_ID, ST_NAME, EMAIL, DATE_FORMAT(DoB,'%d/%m/%Y') AS DoB, SEC, GROUP_LAB, D_NAME, P_NAME, SEMESTER, CR
FROM STUDENT, DPS, DEPARTMENT, PROGRAMS
WHERE STUDENT.DPS_ID=DPS.DPS_ID AND DPS.DEPT_ID=DEPARTMENT.D_ID AND DPS.PROG_ID=PROGRAMS.P_ID AND DPS.DEPT_ID=PROGRAMS.DEPT_ID;




CREATE TABLE FACULTY(
    F_ID INT,
    F_NAME VARCHAR (40),
    F_EMAIL VARCHAR (40),
    DEP_ID INT,
    PHONE_NO INT,
    DESIGNATION VARCHAR (20),
    CONSTRAINT PK_FAC PRIMARY KEY (F_ID),
    CONSTRAINT FK_F_DEPT FOREIGN KEY (DEP_ID) REFERENCES DEPT(D_ID)
);



INSERT INTO FACULTY VALUES (0, '', '', 4, 0, '');
INSERT INTO FACULTY VALUES (1,  'Talha Ibn Aziz',           'talhaibnaziz@iut-dhaka.edu',   4, 017,         'Lecturer');
INSERT INTO FACULTY VALUES (2,  'Abu Raihan Mostofa Kamal', 'raihan.kamal.edu',             4, 01843925543, 'Professor and HoD');
INSERT INTO FACULTY VALUES (3,  'Md. Mahbub Alam',          'mma@iut-dhaka.edu',            4, 017,         'Professor');
INSERT INTO FACULTY VALUES (4,  'Md. Hasanul Kabir',        'hasanul@iut-dhaka.edu',        4, 017,         'Professor');
INSERT INTO FACULTY VALUES (5,  'Kamrul Hasan',             'hasank@iut-dhaka.edu',         4, 017,         'Professor');
INSERT INTO FACULTY VALUES (6,  'Tareque Mohmud Chowdhury', 'tareque@iut-dhaka.edu',        4, 017,         'Assistant Professor');
INSERT INTO FACULTY VALUES (7,  'Hasan Mahmud',             'hasan@iut-dhaka.edu',          4, 01844056187, 'Assistant Professor');
INSERT INTO FACULTY VALUES (8,  'Md. Sakhawat Hossen',      'sakhawat@iut-dhaka.edu',       4, 017,         'Assistant Professor');
INSERT INTO FACULTY VALUES (9,  'Md. Moniruzzaman',         'milton@iut-dhaka.edu',         4, 01618054411, 'Assistant Professor');
INSERT INTO FACULTY VALUES (10, 'Ashraful Alam Khan',       'ashraful@iut-dhaka.edu',       4, 017,         'Assistant Professor');
INSERT INTO FACULTY VALUES (11, 'A.B.M. Ashikur Rahman',    'ashikiut@iut-dhaka.edu',       4, 017,         'Assistant Professor');
INSERT INTO FACULTY VALUES (12, 'Shohel Ahmed',             'a.shohel@iut-dhaka.edu',       4, 01755556629, 'Assistant Professor');
INSERT INTO FACULTY VALUES (13, 'Sadia Sharmin',            'sharmin@iut-dhaka.edu',        4, 017,         'Assistant Professor');
INSERT INTO FACULTY VALUES (14, 'Lutfun Nahar Lota',        'lota@iut-dhaka.edu',           4, 017,         'Assistant Professor');
INSERT INTO FACULTY VALUES (15, 'Md. Azam Hossain',         'azam@iut-dhaka.edu',           4, 017,         'Assistant Professor');
INSERT INTO FACULTY VALUES (16, 'Md. Hamjajul Ashmafee',    'ashmafee@iut-dhaka.edu',       4, 01750245685, 'Lecturer');
INSERT INTO FACULTY VALUES (17, 'Redwan Karim Sony',        'redwankarim@iut-dhaka.edu',    4, 01721748071, 'Lecturer');
INSERT INTO FACULTY VALUES (18, 'Faisal Hussain',           'faisalhussain@iut-dhaka.edu',  4, 01681082013, 'Lecturer');
INSERT INTO FACULTY VALUES (19, 'Njayou Youssouf',          'njayou@iut-dhaka.edu',         4, 01793570834, 'Lecturer');
INSERT INTO FACULTY VALUES (20, 'Sabbir Ahmed',             'sabbirahmed@iut-dhaka.edu',    4, 01754221481, 'Lecturer');
INSERT INTO FACULTY VALUES (21, 'Ridwan Kabir',             'ridwankabir@iut-dhaka.edu',    4, 01731842323, 'Lecturer');
INSERT INTO FACULTY VALUES (22, 'Md. Bakhtiar Hasan',       'bakhtiarhasan@iut-dhaka.edu',  4, 01941882844, 'Lecturer');
INSERT INTO FACULTY VALUES (23, 'Md. Mohsinul Kabir',       'mohsinulkabir@iut-dhaka.edu',  4, 01779794934, 'Lecturer');
INSERT INTO FACULTY VALUES (24, 'Shahriar Ivan',            'shahriarivan@iut-dhaka.edu',   4, 01720968532, 'Lecturer');
INSERT INTO FACULTY VALUES (25, 'S. M. Sabit Bananee',      'smsabitbananee@iut-dhaka.edu', 4, 01925215306, 'Lecturer');
INSERT INTO FACULTY VALUES (26, 'Fardin Saad',              'fardinsaad@iut-dhaka.edu',     4, 01622036553, 'Lecturer');
INSERT INTO FACULTY VALUES (27, 'Md. Mezbaur Rahman',       'mezbaurrahman@iut-dhaka.edu',  4, 01780472447, 'Lecturer');
INSERT INTO FACULTY VALUES (28, 'Tasnim Ahmed',             'tasnimahmed@iut-dhaka.edu',    4, 01713934471, 'Lecturer');
INSERT INTO FACULTY VALUES (29, 'Mohammad Anas Jawad',      'anasjawad@iut-dhaka.edu',      4, 017,         'Lecturer');
INSERT INTO FACULTY VALUES (30, 'Tanjila Alam Sathi',       'tanjilaalam187@iut-dhaka.edu', 4, 017,         'Lecturer');
INSERT INTO FACULTY VALUES (31, 'Md. Jubair Ibna Mostafa',  'jubair@iut-dhaka.edu',         4, 01783905098, 'Lecturer');
INSERT INTO FACULTY VALUES (32, 'Md. Zahidul Islam',        'zahidulislam@iut-dhaka.edu',   4, 01753638013, 'Lecturer');
INSERT INTO FACULTY VALUES (33, 'Mohammad Ishrak Abedin',   'ishrakabedin@iut-dhaka.edu',   4, 017,         'Lecturer');
INSERT INTO FACULTY VALUES (34, 'Imtiaj Ahmed Chowdhury',   'imtiajahmed@iut-dhaka.edu',    4, 017,         'Lecturer');
INSERT INTO FACULTY VALUES (35, 'Md. Shafkat Rahman Farabi','shafkatrahman@iut-dhaka.edu',  4, 01963291740, 'Lecturer');
INSERT INTO FACULTY VALUES (36, 'Nafisa Sadaf Hriti',       'nafisasadaf@iut-dhaka.edu',    4, 017,         'Lecturer');
INSERT INTO FACULTY VALUES (37, 'Mohammed Saidul Islam',    'saidulislam@iut-dhaka.edu',    4, 01521325416, 'Lecturer');
INSERT INTO FACULTY VALUES (38, 'Md. Nazmul Haque',         'nazmul.haque@iut-dhaka.edu',   4, 01786870220, 'Lecturer');
INSERT INTO FACULTY VALUES (39, 'Fazlul Hasan Siddiqui',    'siddiqui@duet.ac.bd',          4, 017,         'Professor (PT)');
INSERT INTO FACULTY VALUES (40, 'Md. Obaidur Rahman',       'orahman@duet.ac.bd',           4, 017,         'Professor (PT)');
INSERT INTO FACULTY VALUES (41, 'Md. Feroz Alam Khan',      'fakhan@phy.buet.ac.bd',        4, 017,         'Professor (PT)');
INSERT INTO FACULTY VALUES (42, 'Md. Abdul Hakim Khan',     'mahkhan@math.buet.ac.bd',      4, 017,         'Professor (PT)');
INSERT INTO FACULTY VALUES (43, 'Manirul Alam Sarker',      'masarker45@gmail.com',         4, 017,         'Professor (PT)');
INSERT INTO FACULTY VALUES (44, 'Md. Shariful Islam',       'shariful@iit.du.ac.bd',        4, 017,         'Professor (PT)');
INSERT INTO FACULTY VALUES (45, 'Md. Abu Taher',            'tahermath@duet.ac.bd',         4, 017,         'Professor (PT)');
INSERT INTO FACULTY VALUES (46, 'Nazrul Islam',             'nazrul@uits.edu.bd',           4, 017,         'Professor (PT)');
INSERT INTO FACULTY VALUES (47, 'Md. Abul Kalam Azad',      'azad@iut-dhaka.edu',           1, 017,         'Assistant Professor');



CREATE OR REPLACE VIEW FACULTY_PROFILE AS
SELECT F_ID, F_NAME, F_EMAIL, D_NAME
FROM FACULTY, DEPARTMENT
WHERE FACULTY.DEP_ID=DEPARTMENT.D_ID;



CREATE TABLE COURSES(
    C_ID INT,
    C_CODE VARCHAR (9),
    C_NAME VARCHAR (50),
    FA1_ID INT,
    FA2_ID INT,
    DPS_ID INT,
    CONSTRAINT PK_CRS PRIMARY KEY (C_ID, DPS_ID),
    CONSTRAINT FK_CRS_DPS FOREIGN KEY (DPS_ID) REFERENCES DPS(DPS_ID),
    CONSTRAINT FK_CRS_FAC1 FOREIGN KEY (FA1_ID) REFERENCES FACULTY(F_ID),
    CONSTRAINT FK_CRS_FAC2 FOREIGN KEY (FA2_ID) REFERENCES FACULTY(F_ID)
);

INSERT INTO COURSES VALUES (4501, 'CSE 4501', 'Operating Systems', 21, 0, 5);
INSERT INTO COURSES VALUES (4503, 'CSE 4503', 'Microprocessor and Assembly Language', 40, 0, 5);
INSERT INTO COURSES VALUES (4511, 'CSE 4511', 'Computer Networks', 8, 0, 5);
INSERT INTO COURSES VALUES (4513, 'CSE 4513', 'Software Engineering and Object-Oriented Design', 12, 0, 5);
INSERT INTO COURSES VALUES (4502, 'CSE 4502', 'Operating Systems Lab', 21, 0, 5);
INSERT INTO COURSES VALUES (4504, 'CSE 4504', 'Microprocessor and Assembly Language Lab', 40, 0, 5);
INSERT INTO COURSES VALUES (4508, 'CSE 4508', 'RDBMS Programming Lab', 27, 12, 5);
INSERT INTO COURSES VALUES (4510, 'CSE 4510', 'Software Development', 6, 13, 5);
INSERT INTO COURSES VALUES (4512, 'CSE 4512', 'Computer Networks Lab', 8, 25, 5);
INSERT INTO COURSES VALUES (4541, 'MATH 4541','Multivariable Calculus and Complex Variables', 47, 0, 5);
INSERT INTO COURSES VALUES (4531, 'CSE 4531', 'E-Commerce and Web Security', 2, 0, 5);
INSERT INTO COURSES VALUES (4537, 'CSE 4537', 'Decision Support Systems', 0, 0, 5);
INSERT INTO COURSES VALUES (4547, 'CSE 4547', 'Parallel and Distributed Systems', 0, 0, 5);
INSERT INTO COURSES VALUES (4539, 'CSE 4539', 'Web Programming', 19, 0, 5);
INSERT INTO COURSES VALUES (4543, 'CSE 4543', 'Geographical Information Systems', 0, 0, 5);
INSERT INTO COURSES VALUES (4549, 'CSE 4549', 'Simulation and Modeling', 3, 0, 5);
INSERT INTO COURSES VALUES (4551, 'CSE 4551', 'Computer Graphics and Multimedia Systems', 24, 0, 5);
INSERT INTO COURSES VALUES (4540, 'CSE 4540', 'Web Programming Lab', 19, 7, 5);
INSERT INTO COURSES VALUES (4544, 'CSE 4544', 'Geographical Information Systems Lab', 0, 0, 5);
INSERT INTO COURSES VALUES (4550, 'CSE 4550', 'Simulation and Modeling Lab', 3, 34, 5);
INSERT INTO COURSES VALUES (4552, 'CSE 4552', 'Computer Graphics and Multimedia Systems Lab', 24, 0, 5);



CREATE TABLE ST_COURSES(
    STUDENT_ID INT,
    COURSE_ID INT,
    CONSTRAINT UQ_ST_CRS UNIQUE (STUDENT_ID,COURSE_ID),
    CONSTRAINT FK_ST_CRS_STID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(ST_ID),
    CONSTRAINT FK_ST_CRS_CRSID FOREIGN KEY (COURSE_ID) REFERENCES COURSES(C_ID)
);

INSERT INTO ST_COURSES VALUES (180041108, 4501);
INSERT INTO ST_COURSES VALUES (180041108, 4502);
INSERT INTO ST_COURSES VALUES (180041108, 4503);
INSERT INTO ST_COURSES VALUES (180041108, 4504);
INSERT INTO ST_COURSES VALUES (180041108, 4508);
INSERT INTO ST_COURSES VALUES (180041108, 4510);
INSERT INTO ST_COURSES VALUES (180041108, 4511);
INSERT INTO ST_COURSES VALUES (180041108, 4512);
INSERT INTO ST_COURSES VALUES (180041108, 4513);
INSERT INTO ST_COURSES VALUES (180041108, 4541);
INSERT INTO ST_COURSES VALUES (180041108, 4551);
INSERT INTO ST_COURSES VALUES (180041108, 4552);
INSERT INTO ST_COURSES VALUES (180041118, 4501);
INSERT INTO ST_COURSES VALUES (180041118, 4502);
INSERT INTO ST_COURSES VALUES (180041118, 4503);
INSERT INTO ST_COURSES VALUES (180041118, 4504);
INSERT INTO ST_COURSES VALUES (180041118, 4508);
INSERT INTO ST_COURSES VALUES (180041118, 4510);
INSERT INTO ST_COURSES VALUES (180041118, 4511);
INSERT INTO ST_COURSES VALUES (180041118, 4512);
INSERT INTO ST_COURSES VALUES (180041118, 4513);
INSERT INTO ST_COURSES VALUES (180041118, 4541);
INSERT INTO ST_COURSES VALUES (180041118, 4551);
INSERT INTO ST_COURSES VALUES (180041118, 4552);
INSERT INTO ST_COURSES VALUES (180041136, 4501);
INSERT INTO ST_COURSES VALUES (180041136, 4502);
INSERT INTO ST_COURSES VALUES (180041136, 4503);
INSERT INTO ST_COURSES VALUES (180041136, 4504);
INSERT INTO ST_COURSES VALUES (180041136, 4508);
INSERT INTO ST_COURSES VALUES (180041136, 4510);
INSERT INTO ST_COURSES VALUES (180041136, 4511);
INSERT INTO ST_COURSES VALUES (180041136, 4512);
INSERT INTO ST_COURSES VALUES (180041136, 4513);
INSERT INTO ST_COURSES VALUES (180041136, 4541);
INSERT INTO ST_COURSES VALUES (180041136, 4551);
INSERT INTO ST_COURSES VALUES (180041136, 4552);
INSERT INTO ST_COURSES VALUES (180041120, 4501);
INSERT INTO ST_COURSES VALUES (180041120, 4502);
INSERT INTO ST_COURSES VALUES (180041120, 4503);
INSERT INTO ST_COURSES VALUES (180041120, 4504);
INSERT INTO ST_COURSES VALUES (180041120, 4508);
INSERT INTO ST_COURSES VALUES (180041120, 4510);
INSERT INTO ST_COURSES VALUES (180041120, 4511);
INSERT INTO ST_COURSES VALUES (180041120, 4512);
INSERT INTO ST_COURSES VALUES (180041120, 4513);
INSERT INTO ST_COURSES VALUES (180041120, 4541);
INSERT INTO ST_COURSES VALUES (180041120, 4549);
INSERT INTO ST_COURSES VALUES (180041120, 4550);



CREATE TABLE ROUTINE(
    R_ID INT,
    DPS_ID INT,
    SEC INT,
    CONSTRAINT PK_RT PRIMARY KEY (R_ID),
    CONSTRAINT UQ_RT UNIQUE (DPS_ID, SEC),
    CONSTRAINT FK_RT_DPS FOREIGN KEY (DPS_ID) REFERENCES DPS(DPS_ID)
);

INSERT INTO ROUTINE VALUES (9,5,1);
INSERT INTO ROUTINE VALUES (10,5,2);

CREATE TABLE RT_COURSES(
    ROUTINE_ID INT,
    COURSE_ID INT,
    GROUP_LAB CHAR,
    WEEKDAY INT,
    SLOT INT,
    CLASS_LINK VARCHAR(100),
    CONSTRAINT UQ_RT_CRS UNIQUE (ROUTINE_ID, COURSE_ID, GROUP_LAB, WEEKDAY, SLOT),
    CONSTRAINT FK_RT_CRS_RT FOREIGN KEY (ROUTINE_ID) REFERENCES ROUTINE(RT_ID),
    CONSTRAINT FK_RT_CRS_CRS FOREIGN KEY (COURSE_ID) REFERENCES COURSES(C_ID)
);

INSERT INTO RT_COURSES VALUES (9,4503, '0',1,1,NULL);
INSERT INTO RT_COURSES VALUES (9,4501, '0',1,2,NULL);
INSERT INTO RT_COURSES VALUES (9,4511, '0',1,3,NULL);
INSERT INTO RT_COURSES VALUES (9,4513, '0',1,4,NULL);
INSERT INTO RT_COURSES VALUES (9,4540, '0',1,5,NULL);
INSERT INTO RT_COURSES VALUES (9,4540, '0',1,6,NULL);
INSERT INTO RT_COURSES VALUES (9,4550, '0',1,5,NULL);
INSERT INTO RT_COURSES VALUES (9,4550, '0',1,6,NULL);
INSERT INTO RT_COURSES VALUES (9,4552, '0',1,5,NULL);
INSERT INTO RT_COURSES VALUES (9,4552, '0',1,6,NULL);
INSERT INTO RT_COURSES VALUES (9,4501, '0',2,1,NULL);
INSERT INTO RT_COURSES VALUES (9,4539, '0',2,2,NULL);
INSERT INTO RT_COURSES VALUES (9,4549, '0',2,2,NULL);
INSERT INTO RT_COURSES VALUES (9,4551, '0',2,2,NULL);
INSERT INTO RT_COURSES VALUES (9,4541, '0',2,4,NULL);
INSERT INTO RT_COURSES VALUES (9,4531, '0',2,4,NULL);
INSERT INTO RT_COURSES VALUES (9,4512, 'A',2,5,NULL);
INSERT INTO RT_COURSES VALUES (9,4512, 'A',2,6,NULL);
INSERT INTO RT_COURSES VALUES (9,4508, 'B',2,5,NULL);
INSERT INTO RT_COURSES VALUES (9,4508, 'B',2,6,NULL);
INSERT INTO RT_COURSES VALUES (9,4502, 'A',3,1,NULL);
INSERT INTO RT_COURSES VALUES (9,4508, 'A',3,2,NULL);
INSERT INTO RT_COURSES VALUES (9,4508, 'A',3,3,NULL);
INSERT INTO RT_COURSES VALUES (9,4512, 'B',3,2,NULL);
INSERT INTO RT_COURSES VALUES (9,4512, 'B',3,3,NULL);
INSERT INTO RT_COURSES VALUES (9,4511, '0',3,4,NULL);
INSERT INTO RT_COURSES VALUES (9,4504, '0',3,5,NULL);
INSERT INTO RT_COURSES VALUES (9,4504, '0',3,6,NULL);
INSERT INTO RT_COURSES VALUES (9,4502, 'B',4,1,NULL);
INSERT INTO RT_COURSES VALUES (9,4539, '0',4,3,NULL);
INSERT INTO RT_COURSES VALUES (9,4549, '0',4,3,NULL);
INSERT INTO RT_COURSES VALUES (9,4551, '0',4,3,NULL);
INSERT INTO RT_COURSES VALUES (9,4541, '0',4,4,NULL);
INSERT INTO RT_COURSES VALUES (9,4531, '0',4,4,NULL);
INSERT INTO RT_COURSES VALUES (9,4510, '0',4,5,NULL);
INSERT INTO RT_COURSES VALUES (9,4510, '0',4,6,NULL);
INSERT INTO RT_COURSES VALUES (9,4503, '0',5,2,NULL);
INSERT INTO RT_COURSES VALUES (9,4513, '0',5,3,NULL);




CREATE OR REPLACE VIEW STUDENT_ROUTINE AS
SELECT COURSES.C_CODE AS COURSE_CODE, RT_COURSES.CLASS_LINK AS C_LINK, RT_COURSES.WEEKDAY AS WEEKDAYS, SLOT, STUDENT.EMAIL AS ST_EMAIL
FROM RT_COURSES, ROUTINE, STUDENT, ST_COURSES, COURSES
WHERE STUDENT.ST_ID=ST_COURSES.STUDENT_ID AND RT_COURSES.ROUTINE_ID=ROUTINE.R_ID AND STUDENT.DPS_ID=ROUTINE.DPS_ID AND STUDENT.SEC=ROUTINE.SEC
AND ST_COURSES.COURSE_ID=RT_COURSES.COURSE_ID AND (RT_COURSES.GROUP_LAB=STUDENT.GROUP_LAB OR RT_COURSES.GROUP_LAB='0') AND COURSES.C_ID=RT_COURSES.COURSE_ID
ORDER BY RT_COURSES.WEEKDAY, RT_COURSES.SLOT;




CREATE TABLE TO_DO(
    TD_ID INT AUTO_INCREMENT,
    STUDENT_ID INT,
	TD_DATE DATE,
	DONE_FLAG BOOLEAN,
	TD_TEXT VARCHAR(160),
    CONSTRAINT PK_TD PRIMARY KEY (TD_ID),
    CONSTRAINT UQ_TD UNIQUE (STUDENT_ID,TD_DATE,TD_TEXT),
    CONSTRAINT FK_TD_ST FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(ST_ID)
);


INSERT INTO TO_DO VALUES (1,180041108, '2021-08-06',FALSE,'Test1');
INSERT INTO TO_DO VALUES (2,180041108, '2021-08-07',FALSE,'Test2');
INSERT INTO TO_DO VALUES (3,180041108, '2021-08-08',FALSE,'Test3');
INSERT INTO TO_DO VALUES (4,180041108, '2021-08-09',TRUE,'Test4');



