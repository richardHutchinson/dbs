/* Inner */
select * from users join userEmail onusers.userId = userEmail.userId;/* Outer */select * from users left join userEmail onusers.userId = userEmail.userId;/* Cross (Cartesian Product) */select * from users join userEmail; /* Group By */select orderItem.itemId, sum(itemPrice)
from 	orderItem
join item on item.itemId = orderItem.itemId
group by itemId;

/* On, Where and Having */select 	orderItem.itemId, sum(itemPrice) as sumitemPrice
from 	orderItem
join 	item on item.itemId = orderItem.itemId
where 	itemPrice > 1.50
group by itemId
having 	sumitemPrice > 20.00;

/* Unions */
select * from ordersunionselect * from ordersArchive;

/* Unions All */
select * from ordersunion allselect * from ordersArchive;

/* Correlated Sub Query*/
select 	* from 	orderItem oiwhere 	2 < (	select count(*) 	from orderItem oi2 	where oi2.orderId = oi.orderId);

/* Non-Correlated Sub Query*/
select 	* from 	item iwhere	i.itemPrice >= (	select avg(i2.itemPrice) as averagePrice 	from item i2);

/* Inline View */
select u.userId, firstname, lastname, orderCountfrom users uleft join  (	select userId, count(*) as orderCount 	from orders group by userId) as oc	on  oc.userId = u.userId ;

/* Scalar Sub Query*/
SELECT userId, 	(SELECT count(*) FROM userEmail ue	WHERE ue.userId = u.userId)	AS emailCountFROM users u;

/* Self Join */
select 	* from 	orderItem oi
where 	3 < (select count(*) from orderItem oi2 where oi2.orderId = oi.orderId);

/* Case */
SELECT firstname, lastname, dob,	CASE WHEN DOB < '1980-01-01'			THEN 'I am Legal'	ELSE 'Go home kid'	END AS nicknameFROM users; 