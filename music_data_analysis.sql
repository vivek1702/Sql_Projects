-- Q senior most employee according to job title ?

-- select * from employee order by levels desc limit 1;

-- Q which country have the most invoices ?

-- select count(invoice_id),
-- 	billing_country
-- from invoice
-- group by billing_country
-- order by count(invoice_id) desc;

-- Q what are top three values of total invoices ?

-- select total from invoice
-- order by total desc
-- limit 3

-- Q city with higest sum of total invoice

-- select billing_city, 
-- 	sum(total) as S
-- from invoice
-- group by billing_city
-- order by S desc
-- limit 1;

-- Q who is the best customer which spend more money

-- select first_name, last_name, sum(total)
-- from customer Cm
-- join invoice Iv on Cm.customer_id = Iv.customer_id
-- group by Cm.customer_id
-- order by sum(total) desc
-- limit 1

--Q to written first_name, last_name, genere for all music lover with rock music listener


-- select distinct first_name,
-- 	 last_name,
-- 	 email
-- from customer Cust join
-- invoice Iv on Cust.customer_id = Iv.customer_id
-- join
-- invoice_line Il on Iv.invoice_id = Il.invoice_id
-- join 
-- track tk on Il.track_id = tk.track_id
-- join
-- genre Ge on tk.genre_id = Ge.genre_id
-- where Ge.name = 'Rock'
-- order by email


-- Q lets invite the artist who written the most rock music in our dataset, 
--     query that return th artist name and total track count of top 10 bands ?

-- select count(Tr.track_id), 
-- 	al.artist_id,
-- 	ar.name
-- from track Tr 
-- join album al on Tr.album_id = al.album_id
-- join genre ge on Tr.genre_id = ge.genre_id
-- join artist ar on al.artist_id = ar.artist_id
-- where ge.name = 'Rock'
-- group by ar.name, al.artist_id
-- order by count(Tr.track_id) desc limit 10


-- Q Return all tracklength that have length longer than average length, 
-- 		return name and millisecond of each track, order by  song length desc


-- select name, milliseconds from track
-- where milliseconds > (select avg(milliseconds) from track)
-- order by milliseconds desc

-- find how much amount spent by each customer on artists? 
-- 		write a query to return customer name, artist name and total spent ?

-- with best_selling_artist as
-- (select ar.artist_id as artist_id,
-- 		ar.name as artist_name,
--  		sum(il.unit_price * il.quantity) as product_sum
--  from invoice_line il
--  join track tr on il.track_id = tr.track_id
--  join album al on tr.album_id = al.album_id
--  join artist ar on al.artist_id = ar.artist_id
--  group by 1
--  order by 3 desc
--  limit 1
-- )

-- select cs.customer_id, 
-- 	   cs.first_name, 
-- 	   cs.last_name, 
-- 	   bsa.artist_name, 
-- 	   sum(il.unit_price * il.quantity) as product_val
-- from invoice i
-- join customer cs on cs.customer_id = i.customer_id
-- join invoice_line il on il.invoice_id = i.invoice_id
-- join track tr on tr.track_id = il.track_id
-- join album al on al.album_id = tr.album_id
-- join best_selling_artist bsa on bsa.artist_id = al.artist_id
-- group by 1, 2, 3, 4
-- order by 5 desc


-- Q  we want to find out the most popular music genre for each country,
-- 		we determine the most popular genre as the genre with the highest amount of purchase

-- with cte as
-- (select count(il.quantity) as sold_genre,
-- 		iv.billing_country as country,
-- 		gr.name as genre_name
-- from invoice_line il 
-- join invoice iv on iv.invoice_id = il.invoice_id
-- join track tr on tr.track_id = il.track_id
-- join genre gr on tr.genre_id = gr.genre_id
-- group by gr.name, iv.billing_country)

-- select country, genre_name from
-- (select country, genre_name, sold_genre,
-- 	rank() over(partition by country order by sold_genre desc) as rnk
-- from cte) as A
-- where rnk = 1

-- Q  write a query that determines the customer that has spent most on music for each country
-- write a query to return the country along with top customers and how much they spent. for countries 
-- where the top amount spent is shared, provide all customers who spent this amount

-- with cte as 
-- (select customer_id, billing_country, spent from
-- (select customer_id, billing_country,
-- 		sum(total) as spent,
-- 		rank() over(partition by billing_country order by sum(total) desc) as rnk
-- from invoice
-- group by customer_id, billing_country) as A
-- where rnk = 1)

-- select first_name, last_name, billing_country, spent
-- from cte c1
-- join customer c2 on c2.customer_id = c1.customer_id




































		























	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	










































































