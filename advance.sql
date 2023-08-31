select DISTINCT customer.email, customer.first_name, customer.last_name 
from
	customer inner join invoice on customer.customer_id = invoice.customer_id
	inner join invoice_line on invoice.invoice_id = invoice_line.invoice_id
	inner join track on invoice_line.track_id = track.track_id
	inner join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
order by 1 asc;


SELECT distinct first_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
JOIN track ON invoice_line.track_id = track.track_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Rock';




select artist.name, count(*) from 
artist join album on artist.artist_id = album.artist_id
       join track on album.album_id = track.album_id
       join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock'       
group by 1
order by 2 desc
limit 10;

select * from 
artist join album on artist.artist_id = album.artist_id
       join track on album.album_id = track.album_id
       join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock' ;    


select track.name, track.milliseconds
from track 
where track.milliseconds > (select avg(track.milliseconds) as avg_len from track)
order by 2 desc;


select customer.first_name, customer.last_name, artist.name, sum(invoice.total) as Total_Spend ,sum(invoice_line.unit_price*invoice_line.quantity)
from
track join album on track.album_id = album.album_id
	  join artist on album.artist_id = artist.artist_id
      join invoice_line on track.track_id = invoice_line.track_id
      join invoice on invoice_line.invoice_id = invoice.invoice_id
      join customer on invoice.customer_id = customer.customer_id
group by 1,2,3;      
      
      
select trim(country), max(total), genre_category
from
(select invoice.billing_country country, sum(invoice_line.unit_price) as total , genre.name genre_category 
from
invoice join invoice_line on invoice.invoice_id = invoice_line.invoice_id
        join track on invoice_line.track_id = track.track_id
        join genre on track.genre_id = genre.genre_id
group by 1,3
order by 2 ) tab_init
group by 1,3;





















