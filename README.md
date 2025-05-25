# Question-1
1. What is PostgreSQL?
  

3. PostgreSql হলো একটি পাওয়ারফুল ওপেন সোর্স অবজেক্ট রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিষ্টেম (ORDBMS)।
4. এটি ব্যবহার করা হয় বিভিন্ন ধরণের অ্যাপ্লিকেশনের ডেটা সংরক্ষণ, পরিচালনা, এবং প্রসেস করার জন্য।

5. PostgreSQL হল এমন একটি সফটওয়্যার যেটা দিয়ে আমি  ডেটা গুছিয়ে রাখতে পারবো , দরকার হলে খুঁজে পেতে পারবো , এবং বিশ্লেষণ করতে পারবো।

. PostgreSQL-এর গুরুত্বপূর্ণ বৈশিষ্ট্য:
  বৈশিষ্ট্য	বর্ণনা

1. Open Source	এটি সম্পূর্ণ ফ্রি এবং ওপেন সোর্স।
2. Relational Database	এটি রিলেশনাল ডেটাবেস সিস্টেম, যেখানে ডেটা টেবিল আকারে সংরক্ষিত হয়।
3. SQL Support	এটি Standard SQL-কে সম্পূর্ণভাবে সমর্থন করে।
4. Extensible	আমি  চাইলে নিজের ফাংশন, ডেটা টাইপ, বা অপারেটর তৈরি করতে পারবো ।
5. ACID Compliance	এটি ACID properties (Atomicity, Consistency, Isolation, Durability) অনুসরণ করে — যার ফলে ডেটা সঠিকভাবে এবং নিরাপদে সংরক্ষিত হয়।
6. Multi-Version Concurrency Control (MVCC)	একাধিক ইউজার একসাথে ডেটা অ্যাক্সেস করলেও সমস্যা হয় না।


. PostgreSQL কোথায় ব্যবহৃত হয়?
  ওয়েব অ্যাপ্লিকেশন (যেমন: Django, Node.js, Laravel)

1.মোবাইল অ্যাপ ব্যাকএন্ড

2.Data Analytics এবং Reporting

3.IoT ডিভাইসের ডেটা সংরক্ষণ

4.Enterprise-level সফটওয়্যার


. কেন PostgreSQL ব্যবহার করব ?

1. Reliable (বিশ্বস্ত এবং স্টেবল)

2. Free এবং Open Source

3. Scalable (ছোট অ্যাপ থেকে বড় এন্টারপ্রাইজ সিস্টেমে ব্যবহারযোগ্য)

4. Security Features (Role-based access, SSL support)

5. Strong Community Support

   
. PostgreSQL-এর সাথে কাজ করার জন্য কী জানতে হয়?

1.SQL (Structured Query Language)

2.Basic Database Concepts (Tables, Rows, Columns, Primary/Foreign Key)

3.pgAdmin (Graphical Interface for PostgreSQL)

4.Command Line Interface (psql)








# Question-2
2.Explain the Primary Key and Foreign Key concepts in PostgreSQL.

. Primary Key কী?

Primary Key হলো একটি unique identifier — মানে একটি টেবিলের প্রতিটি রেকর্ডকে আলাদা করে শনাক্ত করার জন্য ব্যবহার হয়।

. বৈশিষ্ট্য:
1.Unique হতে হবে (একই মান দুইবার আসবে না)

2.NOT NULL হতে হবে (খালি থাকতে পারবে না)

3.একটি টেবিলে শুধুমাত্র একটি Primary Key থাকতে পারে


. উদাহরণ:

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

 . এখানে student_id হলো Primary Key।
 . এর মান প্রতিটি student এর জন্য আলাদা হবে এবং ফাঁকা রাখা যাবে না।


. Foreign Key কী?

  Foreign Key হলো একটি কলাম যা অন্য টেবিলের Primary Key-কে রেফারেন্স করে।

  এর মাধ্যমে দুইটি টেবিলের মধ্যে সম্পর্ক তৈরি হয় — যাকে বলে Relational Database।


. বৈশিষ্ট্য:
  এটি অন্য টেবিলের Primary Key-কে রেফার করে

  একটি টেবিলের একাধিক Foreign Key থাকতে পারে

  এটি ডেটার ইন্টেগ্রিটি নিশ্চিত করে

. উদাহরণ (দুইটি টেবিলের মাধ্যমে):

. Step 1: মূল টেবিল students

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

. Step 2: সম্পর্কিত টেবিল courses_enrolled

CREATE TABLE courses_enrolled (
  enroll_id SERIAL PRIMARY KEY,
  student_id INT,
  course_name VARCHAR(100),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

. এখানে student_id হলো Foreign Key
. এটি students টেবিলের student_id কে রেফার করে।

. কেন এগুলো গুরুত্বপূর্ণ?
  	কারণ
   1. Primary Key	প্রতিটি রেকর্ডকে ইউনিকভাবে চিনতে সাহায্য করে
   2. Foreign Key	একাধিক টেবিলের মধ্যে সম্পর্ক তৈরি করে
   3. Integrity	ভুল ডেটা এন্ট্রি রোধ করে, যেমন ভ্যালিড student_id ছাড়া courses_enrolled টেবিলে ডেটা ঢুকতে দেবে না


. ভুল/সতর্কতা:

 1.Primary Key ফাঁকা রাখা যাবে না

 2.Foreign Key রেফারেন্স না করা মান থাকলে error দিবে

 3.Parent টেবিল ডিলিট করলে Child টেবিলেও cascading delete করতে চাইলে ON DELETE CASCADE দিতে হয়






 

 # Question-3
   3.What is the difference between the VARCHAR and CHAR data types?
     
 1. VARCHAR (Variable Character)
 2. VARCHAR হল ভ্যারিয়েবল দৈর্ঘ্যের স্ট্রিং ডেটা টাইপ।
   এখানে যতটুকু চরিত্র দরকার, ততটুকুই মেমোরি ব্যবহার হবে।

 name VARCHAR(100)
 এখানে নাম ১০০ অক্ষর পর্যন্ত হতে পারবে।

 যদি তুমি "Abdullah" লেখো, তাহলে মাত্র 8 অক্ষরের জায়গা নিবে।

. খালি জায়গা ভরে না।
. মেমোরি efficient (যত দরকার ততই মেমোরি নিবে)।


 2. CHAR (Fixed Length Character)
    CHAR(n) হল ফিক্সড দৈর্ঘ্যের স্ট্রিং ডেটা টাইপ।
    নির্দিষ্ট দৈর্ঘ্যের জায়গা বরাদ্দ হয়, এমনকি যদি ডেটা ছোট হয় তাহলেও।

    code CHAR(5)
    যদি তুমি "AB" লেখো, তাহলে PostgreSQL এটি "AB " বানাবে (পিছনে 3টা স্পেস যোগ করবে) যাতে দৈর্ঘ্য 5 হয়।

   . ফাঁকা জায়গা স্পেস দিয়ে পূরণ হয়
   . কম ডেটা লিখলেও নির্দিষ্ট মেমোরি বরাদ্দ হয়


. তুলনামূলক পার্থক্য (Side-by-side Comparison):


    বিষয়	                  VARCHAR(n)	                         CHAR(n)
    _____________________________________________________________________________
    দৈর্ঘ্য	                  পরিবর্তনশীল                           নির্দিষ্ট
    _____________________________________________________________________________
    মেমোরি	               যতটা দরকার	                         সবসময় n
    _____________________________________________________________________________
    পারফরম্যান্স	            একটু ধীর (বড় ডেটায়)	                কিছু ক্ষেত্রে দ্রুত
    _____________________________________________________________________________
    খালি জায়গা      	      রাখে না	                            রাখে (স্পেস দিয়ে)
    ______________________________________________________________________________
    ব্যবহার	নাম ,          ইমেইল, অ্যাড্রেস	কোড,                 স্ট্যাটাস, ফ্ল্যাগ


. কখন কোনটা ব্যবহার করবো?

  প্রয়োজনে	ব্যবহার করো
  মানুষের নাম, ঠিকানা ইত্যাদি	VARCHAR
  Fixed length কোড যেমন "YES", "NO", "M", "F", বা Zip Code	CHAR


. উদাহরণ সহ PostgreSQL টেবিল:

CREATE TABLE employees (
  emp_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  gender CHAR(1),
  status CHAR(3)
);

. name → নাম বড় বা ছোট হতে পারে, তাই VARCHAR

. gender → শুধু 'M' বা 'F', তাই CHAR(1)

. status → "YES" / "NO", তাই CHAR(3)
  

. সংক্ষিপ্তভাবে মনে রাখার কৌশল:

  VARCHAR = Variable |  CHAR = Constant







# Question-4
  4.Explain the purpose of the WHERE clause in a SELECT statement.
         
. WHERE clause হল SQL-এর একটি অংশ যেটা ব্যবহার করা হয় ডেটা ফিল্টার করার জন্য।
. এর মাধ্যমে  শুধু নির্দিষ্ট শর্ত পূরণ করা রেকর্ডগুলো নির্বাচন করা যাই ।


. WHERE clause কোথায় ব্যবহার করা হয়?
. SELECT → ডেটা ফিল্টার করার জন্য 

. UPDATE → নির্দিষ্ট রেকর্ড আপডেট করার জন্য 

. DELETE → নির্দিষ্ট রেকর্ড ডিলিট করার জন্য 


. উদাহরণ দিয়ে ব্যাখ্যা (Step-by-step)
  মনে করি , আমাদের একটা টেবিল আছে:

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  department VARCHAR(50),
  salary INT
);

এবং এতে কিছু ডেটা আছে:

id	            name	                 department                   	salary
___________________________________________________________________________________
1	              Alice                     HR                          40000
2                Bob	                      IT	                       60000
3                Charlie                   IT	                       55000
4                David	                   Marketing                   45000


. 1. Example 1: নির্দিষ্ট department এর employee দেখানো

SELECT * FROM employees
WHERE department = 'IT';
. এটি শুধু IT ডিপার্টমেন্টের এমপ্লয়িদের দেখাবে:

id	           name	                      department	                 salary
___________________________________________________________________________________
2	             Bob	                         IT	                       60000
3	             Charlie	                      IT	                       55000

. 2. Example 2: salary 50000 এর বেশি এমন employee

SELECT name, salary FROM employees
WHERE salary > 50000;
.শুধু যারা ৫০,০০০ টাকার বেশি বেতন পান, তাদের দেখাবে:

name	            salary
Bob	            60000
Charlie	         55000

. 3. Example 3: Multiple Conditions (AND/OR)

SELECT * FROM employees
WHERE department = 'IT' AND salary > 55000;
. IT ডিপার্টমেন্টের এবং salary 55000-এর বেশি এমন এমপ্লয়ি:

id	name	department	salary
2	Bob	IT	60000

. 4. Example 4: Text pattern (LIKE)

SELECT * FROM employees
WHERE name LIKE 'A%';
. নাম 'A' দিয়ে শুরু এমন এমপ্লয়িদের দেখাবে:

id	          name	                  department	              salary
1	          Alice                  	HR	                    40000







# Question-5
5.How can you modify data using UPDATE statements?
       

. UPDATE স্টেটমেন্ট ব্যবহার করে আমরা ডেটাবেজের টেবিলের এক বা একাধিক রেকর্ডের মান (value) পরিবর্তন করতে পারি।

. উদাহরণ দিয়ে ব্যাখ্যা:
  Step 1: ধরো আমাদের একটি টেবিল আছে

  CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  department VARCHAR(50),
  salary INT
  );

. টেবিলের কিছু ডেটা:

id	    name	    department	    salary

1      Alice	    HR	            40000
2	    Bob	       IT	            60000
3      Charlie	    IT	            55000


. Example 1: একজন এমপ্লয়ির বেতন আপডেট করা

UPDATE employees
SET salary = 65000
WHERE name = 'Charlie';


. এতে করে Charlie-এর বেতন 55000 থেকে 65000 হয়ে যাবে।


UPDATE	কোন টেবিল আপডেট করবে তা নির্ধারণ করে
SET	    কোন কোন কলামের মান পরিবর্তন করতে হবে
WHERE	  কোন রেকর্ড/রেকর্ডগুলো পরিবর্তন করতে হবে












