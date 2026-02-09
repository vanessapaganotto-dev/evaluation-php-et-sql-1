For the French version of this README, please [click here](README.md).

# School Management Application - PHP & SQL

## Description

This application manages students enrolled in a school as well as their participation in sports activities.  
It is developed in object-oriented PHP with a SQL database to store information about students, sports, and their registrations.

Main features include:  
- Management of students (first name, last name, class)  
- Management of sports offered by the school  
- Associating students with sports via registrations  
- Viewing lists of students by sport and sports by student  

---

## Technologies Used

- PHP 8.x (OOP)  
- MySQL / MariaDB  
- PDO for secure database connection  
- Simple HTML/CSS frontend  

---

## Installation

1. Clone this repository:  
 
   git clone https://github.com/your-username/your-project.git


2. Import the database:

Use the provided schema.sql file to create tables and structure.

Import via phpMyAdmin or command line:

mysql -u user -p database_name < schema.sql

3. Configure the database connection in Database.php (host, dbname, user, password).

4. Deploy the files on a local server (e.g., XAMPP, MAMP) or remote server supporting PHP.
   
