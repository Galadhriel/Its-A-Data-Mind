-- Deborah Sylvester
-- Feb 17, 2017
-- Lab 5


-- Question 1

select city
from agents a,
     orders o
where o.aid = a.aid
  and o.cid = 'c006'
order by city ASC;


-- Question 2

select distinct pid
from orders o,
     customers c
where o.cid = c.cid
  and city = 'Kyoto'
;


-- Quesion 3

select name
from customers
where cid not in (select cid
                  from orders
                  )
;

-- Question 4

select c.name
from customers c left outer join orders o 
on c.cid = o.cid
where ordNumber is null;


-- Question 5

select distinct c.name,
                a.name
from customers c,
     orders o,
     agents a
where o.cid = c.cid
  and o.aid = a.aid
and a.city = c.city;

-- Question 6

select c.name as "customer name",
       c.city as "cust city",
       a.name as "agent name",
       a.city as "agent city"
from customers c inner join agents a
on c.city = a.city
order by c.city

-- Question 7

select p.city as "product city",
       p.name as "product name"
from products p inner join customers c on c.city = p.city
group by p.city
-- order by count (*)ASC city  
limit 1




select a.name as "agent",
       sum(o.totalUSD)as "sales"
from orders o inner join agents a on o.aid = a.aid
group by a.name
order by "sales" DESC
;



select c.name,
       c.city
order by count (*) ASC city
limit 1