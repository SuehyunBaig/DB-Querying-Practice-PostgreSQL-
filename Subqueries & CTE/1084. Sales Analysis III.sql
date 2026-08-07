select i.product_id, p.product_name
from 
    (select product_id
    from (select distinct product_id
        from sales
        where sale_date between '2019-01-01' and '2019-03-31')
    where product_id not in 
        (select distinct product_id
        from sales
        where sale_date < '2019-01-01' or sale_date >'2019-03-31')) as i
    left join product as p on i.product_id = p.product_id
