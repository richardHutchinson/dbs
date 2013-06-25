/* Inner */
select * from users join userEmail on
from 	orderItem
join item on item.itemId = orderItem.itemId
group by itemId;

/* On, Where and Having */
from 	orderItem
join 	item on item.itemId = orderItem.itemId
where 	itemPrice > 1.50
group by itemId
having 	sumitemPrice > 20.00;

/* Unions */
select * from orders

/* Unions All */
select * from orders

/* Correlated Sub Query*/
select 	* 

/* Non-Correlated Sub Query*/
select 	* 

/* Inline View */
select u.userId, firstname, lastname, orderCount

/* Scalar Sub Query*/
SELECT userId, 

/* Self Join */
select 	* 
where 	3 < (select count(*) from orderItem oi2 where oi2.orderId = oi.orderId);

/* Case */
SELECT firstname, lastname, dob,