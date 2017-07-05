CREATE TABLE syntax_practice (
    user_id serial PRIMARY KEY,
    username character varying(12),
    city character varying(128),
    transactions_completed integer,
    transactions_attempted integer,
    account_balance numeric(12,2)
);

INSERT INTO syntax_practice (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('shawn', 'chicago', 5, 10, 355.80),
('cherise', 'minneapolis', 9, 9, 4000.00),
('larry', 'minneapolis', 3, 4, 77.01),
('dallas', 'new york', 6, 12, 0.99),
('anthony', 'chicago', 0, 0, 0.00),
('travis', 'miami', 1, 100, 500000.34),
('davey', 'chicago', 9, 99, 98.04),
('ora', 'phoenix', 88, 90, 3.33),
('grace', 'miami', 7, 9100, 34.78),
('hope', 'phoenix', 4, 10, 50.17);

/*Get all users from Chicago.*/
SELECT * FROM "syntax_practice" 
WHERE "city" = 'chicago';

/* Get all usernames that contain the letter a.*/
SELECT * FROM "syntax_practice" 
WHERE "username" LIKE '%a%';

/*giving a new customer bonus*/
UPDATE "syntax_practice" 
SET "account_balance" = '10.00'
WHERE "account_balance" = 0.00 AND "transactions_attempted" = 0; 

/* Select all users that have attempted 9 or more transactions*/
SELECT * FROM "syntax_practice"
WHERE "transactions_attempted" > 9;

/*3 users with the highest balances*/
SELECT "username", "account_balance"
FROM "syntax_practice"
ORDER BY "account_balance" DESC LIMIT 3;


/*GET the user names and balance of the brokest folks*/
SELECT "username", "account_balance"
FROM "syntax_practice"
ORDER BY "account_balance" ASC LIMIT 3;

/*Get all users with account balances that are more than $100*/
SELECT * FROM "syntax_practice"
WHERE "account_balance" > 100.00;

/*Add a new record*/
INSERT INTO "syntax_practice" ("username", "city", "transactions_completed", "transactions_attempted", "account_balance")
VALUES ('Catherine', 'Minneapolis', 100, 100, 10000000);

/*Delete users that reside in miami OR phoenix and have completed fewer than 5 transactions.*/
DELETE FROM "syntax_practice"
WHERE ("city" = 'miami' OR "city" = 'phoenix') AND "transactions_completed" < 5;