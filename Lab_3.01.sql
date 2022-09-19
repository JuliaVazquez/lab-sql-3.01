-- 1. Drop column picture from staff.
ALTER TABLE sakila.staff
DROP COLUMN picture;

SELECT * FROM sakila.staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM sakila.customer
WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';
SELECT * FROM sakila.staff;

INSERT INTO sakila.staff(first_name, last_name, address_id, email, store_id, active, username, last_update)
VALUES ('Tammy','Sanders', 79,'TAMMY.SANDERS@sakilacustomer.org', 2,1,'Tammy',now());

SELECT * FROM sakila.staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well.

SELECT * FROM sakila.rental;
SELECT * FROM sakila.film
WHERE title = "Academy Dinosaur";
SELECT * FROM sakila.inventory;
SELECT * FROM sakila.customer
WHERE first_name = 'Charlotte' AND last_name = 'Hunter';
SELECT * FROM sakila.staff;


INSERT INTO sakila.rental (rental_date, inventory_id, customer_id, staff_id, last_update)
VALUES (now(), 1, 130, 1, now());

SELECT * FROM sakila.rental;


-- Activity 2: propose a new structure for the Sakila database:
-- I think we could refer the category in the film table, because there is only one category per film and we would be able to drop film_category.
-- We could remove film_text or add the description column to the film table, but it's not information that is going to be needed or usefull for analysis, because it's unique for each film
-- We could remove city and country tables as long as we have only 2 stores in 2 countries, but we saw that there are lots of customers from a lot of countries and cities and we don't really understand that data.
-- We can drop the column address2 from the table address, because it doesn't have any information

