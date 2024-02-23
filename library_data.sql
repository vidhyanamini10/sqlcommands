create table address(
address_id int primary key ,
line1 varchar(30),
line2 varchar(30),
city varchar(20),
state char(2),
zip int);



create table library_member(
member_id int primary key,
first_name varchar(25),
last_name varchar(25),
email_address varchar(35),
phone_number bigint,
membership_level varchar(10),
address_id INT,
Constraint fk_address_id  Foreign key (address_id) references address(address_id));


create table book (
book_id int primary key,
title varchar(45),
author_name varchar(50),
year_published int,
quantity int );

create table book_isbn(
isbn bigint primary key ,
book_id int,
Constraint fk_book_id Foreign Key (book_id) references book(book_id));


CREATE TABLE checkout (
    id INT PRIMARY KEY,
    isbn BIGINT,
    
    member_id INT,
    
    checkout_date DATETIME,
    due_date DATETIME,
    is_returned BOOLEAN
);

alter table checkout add foreign key (member_id) REFERENCES library_member (member_id);
alter table checkout add foreign key (isbn) REFERENCES book_isbn (isbn);
drop table book_isbn;

CREATE TABLE checkout (
     id INT PRIMARY KEY,
     isbn BIGINT,
     Constraint fk_isbn FOREIGN KEY (isbn) REFERENCES book_isbn(isbn),
     member_id INT,
     constraint fk_membebook_isbnr_id FOREIGN KEY (member_id) REFERENCES library_member(member_id),
     checkout_date DATETIME,
     due_date DATETIME,
     is_returned BOOLEAN
);


insert into book values (1, 'The Great Gatsby', 'Scott','1925',2),
(2,'Mockingbird','Harper',1960,4),
(3,'Pride and Prejudice','Jane ',1813,1),
(4,'The Catcher in the Rye','J.D. Salinger',1951,5),
(5,'The Hobbit','J.R.R. Tolkien',1937,7),
(6,'Harry Potter','J.K. Rowling',1997,10);
select * from book;


insert into book_isbn values (9780743273565, 1),
(9780061120084, 2),
(9780451524935, 3),
(9780141439518, 4),
(9780316769488,5),
(9780547928227,6),
(9780307474278, 1),
(9780747532743, 2),
(9780618640157, 3),
(9780439023528,4),
(9780451526342,5),
(9780060850524,6),
(9780486280615,1),
(9780066238500,2),
(9780062315007,3),
(9780307743657,4),
(9781416548942,5),
(9780143124672,6),
(9780307387899,6),
(9780307269751,6);

INSERT INTO address  
VALUES (001,'123 Main Street', 'Apt 101', 'Anytown', 'NY', 12345),
       (002,'456 Elm Avenue', 'Suite B', 'Springfield', 'IL', 67890),
       (003,'789 Oak Street', 'apt 301', 'Smallville', 'CA', 54321),
       (004,'101 Pine Lane', 'suite 104', 'Lakeside', 'FL', 98765),
       (005,'234 Maple Drive', 'Apt 201', 'Rivertown', 'WA', 24680),
       (006,'567 Cedar Street', 'apt 200', 'Mountainview', 'CO', 13579);
       

INSERT INTO library_member (member_id, first_name, last_name, email_address, phone_number, membership_level, address_id)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', 1234567890, 'Gold', 001),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', 2345678901, 'Silver', 002),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com', 3456789012, 'Bronze', 003),
    (4, 'Michael', 'Brown', 'michael.brown@example.com', 4567890123, 'Gold', 004),
    (5, 'Emily', 'Davis', 'emily.davis@example.com', 5678901234, 'Silver', 005),
    (6, 'David', 'Miller', 'david.miller@example.com', 6789012345, 'Bronze', 006),
    (7, 'Sarah', 'Wilson', 'sarah.wilson@example.com', 7890123456, 'Gold', 002),
    (8, 'Matthew', 'Martinez', 'matthew.martinez@example.com', 8901234567, 'Silver', 003),
    (9, 'Jessica', 'Taylor', 'jessica.taylor@example.com', 9012345678, 'Bronze', 005),
    (10, 'Christopher', 'Anderson', 'christopher.anderson@example.com', 1234567890, 'Gold', 002);

SET SQL_SAFE_UPDATES = 0;

UPDATE library_member
SET email_address = CONCAT(first_name, '.', last_name, '@gmail.com')
WHERE email_address NOT LIKE '%@gmail.com';


select * from library_member



