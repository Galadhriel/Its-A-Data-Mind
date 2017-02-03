--02-03-2017 Lab 3

-- Question 1

select ordNumber,
       totalUSD
from orders;

-----------------------------------------------------------------

-- Question 2
select name,
       city
from agents
where name = 'Smith';

-----------------------------------------------------------------
-- Question 3

select pid,
       name,
       priceUSD
from products
where quantity > 200100;

-----------------------------------------------------------------
-- Question 4

select name,
       city
from customers
where city = 'Duluth';

-----------------------------------------------------------------
-- Question 5

select name
from agents
where city <> 'New York' and
      city <> 'Duluth';

-----------------------------------------------------------------
-- Question 6

select pid,
       name,
       city,
       quantity,
       priceUSD
from products
where city != 'Dallas' and
      city != 'Duluth' and
      priceUSD > 1;

-----------------------------------------------------------------
-- Question 7
select ordNumber,
       month,
       cid,
       aid,
       pid,
       qty,
       totalUSD
from orders
where month = 'Feb' or
      month = 'May';

-----------------------------------------------------------------
-- Question 8
select ordNumber,
       month,
       cid,
       aid,
       pid,
       qty,
       totalUSD
from orders
where month = 'Feb' and
      totalUSD >= 600;

-----------------------------------------------------------------
-- Question 9

select ordNumber
from orders
where cid = 'c005';