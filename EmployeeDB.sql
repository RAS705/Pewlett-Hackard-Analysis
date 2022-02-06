-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_number" varchar(4)  NOT NULL,
    "dept_name" varchar(40)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_number"
     )
);

CREATE TABLE "Dept_Emps" (
    "emp_number" int   NOT NULL,
    "dept_number" varchar(4)   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "dept_number" varchar(4)   NOT NULL,
    "emp_number" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_number" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" char   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_number"
     )
);

CREATE TABLE "Salaries" (
    "emp_number" int   NOT NULL,
    "salary" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL
);

CREATE TABLE "job_titles" (
    "emp_number" int   NOT NULL,
    "title" varchar   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL
);

ALTER TABLE "Dept_Emps" ADD CONSTRAINT "fk_Dept_Emps_emp_number" FOREIGN KEY("emp_number")
REFERENCES "Employees" ("emp_number");

ALTER TABLE "Dept_Emps" ADD CONSTRAINT "fk_Dept_Emps_dept_number" FOREIGN KEY("dept_number")
REFERENCES "Departments" ("dept_number");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_number" FOREIGN KEY("dept_number")
REFERENCES "Departments" ("dept_number");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_number" FOREIGN KEY("emp_number")
REFERENCES "Employees" ("emp_number");

ALTER TABLE "job_titles" ADD CONSTRAINT "fk_job_titles_emp_number" FOREIGN KEY("emp_number")
REFERENCES "Employees" ("emp_number");

