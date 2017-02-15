
-- Deborah Sylvester 2-08-2017 Lab 4

-- Question 1

select city
from agents
where aid in (select aid
              from orders
              where cid = 'c006'
              )
order by city ASC;


-- Question 2

select distinct pid
from orders
where cid in (select cid
              from customers
              where city = 'Kyoto'
              )
order by pid ASC;

-- Question 3

select cid,
       name
from customers
where cid not in (select cid
                  from orders
                  where aid = 'a01'
                  )
order by cid ASC;
            

-- Question 4

select distinct cid
from orders
where pid = 'p01'
and cid in (select cid
            from orders
            where pid = 'p07'
            )
order by cid ASC;

-- Question 5

select distinct pid
from products
where pid not in (select pid
                  from orders
                  where aid = 'a08'
                  )
order by pid ASC;


-- Question 6

select name,
       discount,
       city
from customers
where cid in  (select cid 
               from orders
               where aid in (select aid
                             from agents
                             where city in ('Tokyo', 'New York')
                              )
               )
order by name ASC;
                
                     
-- Question 7         
                
select *
from customers
where discount in (select discount
                   from customers
                   where city in ('Duluth', 'London')
                   )
order by cid ASC;

-- Question 8

-- Check constraints are used to restrict the values and properties a given column or table can contain. 
-- Check constraints help ensure referential integrity. Examples of check constraints are not null, UNIQUE, FOREIGN and PRIMARY key. 
-- A good use of check constraints would be by using PRIMARY key to define a column(s) that distinguishes a row in a table, for example cid in the customers table.
-- No two rows can have the same PRIMARY key value, thus ensuring each row is unique.
-- A bad use of check constraints would be allowing PRIMARY keys to have a nullable values.
          
  
