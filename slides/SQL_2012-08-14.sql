select distinct age,
	( select count(*) from orders
		join users u on orders.userId = u.userId
		where u.age = users.age
	) as orderCount
from users
where age is not null
order by age;


select distinct users.age, orderCount.c
from users
join
( 		select age, count(*) as c from orders
		join users u on orders.userId = u.userId
		group by age
	) as orderCount on users.age = orderCount.age

where users.age is not null
order by age;


select n as age,
	( select count(*) from orders
		join users u on orders.userId = u.userId
		where u.age = numbers.n
	) as orderCount,
	(
		select sum(i.itemPrice * oi.quantity)
		from users u
		join	orders o on o.userId = u.userId
		join	orderItem oi on oi.orderId = o.orderId
		join	item i on i.itemId = oi.itemId
		where u.age = numbers.n
	) as totalPurchases

from numbers
where n >= 18
and n <= 65;

select sum(i.itemPrice * oi.quantity) as ageTotal
from users u
join	orders o on o.userId = u.userId
join	orderItem oi on oi.orderId = o.orderId
join	item i on i.itemId = oi.itemId
where u.age = 21
;

select age, count(*) from orders
		join users u on orders.userId = u.userId
		group by age;

select count(*) from orders
join users u on orders.userId = u.userId
where	u.age = 18;

-- Create a view for the sales data (Age, OrderCount, SumTotal)
create view ageSalesData as
(select n as age,
	( select count(*) from orders
		join users u on orders.userId = u.userId
		where u.age = numbers.n
	) as orderCount,
	case when total is null then 0
		else total
		end as total
from numbers
left join ageSum on ageSum.age = numbers.n
where n >= 18
and n <= 65
);

-- Create a view to replace the inline view 
create view ageSum as (
select sum(i.itemPrice * oi.quantity) as total, age
		from users u
		join	orders o on o.userId = u.userId
		join	orderItem oi on oi.orderId = o.orderId
		join	item i on i.itemId = oi.itemId	
		group by age
);

		
