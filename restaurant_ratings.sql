create table ratings_preview
(
    consumer_id varchar,
    restaurant_id int,
    overrall_rating int,
    food_Rating int,
    service_rating int
)

create table consumers_preview
(
    consumer_id varchar,
    city varchar,
    state varchar,
    country varchar,
    latitude float,
    longitude float,
    smoker varchar,
    drink_level varchar,
    transportation_method varchar,
    marital_status varchar,
    children  varchar,
    age varchar,
    occupation varchar,
    budget varchar)
)
create table restaurant_previews
(
    restaurant_id varchar,
    city varchar,
    state varchar,
    country varchar,
	zip_code int,
    latitude float,
    longitude float,
	alcohol_service  varchar,
    smoking_allowed varchar,
    price varchar,
	franchise varchar,
	area varchar,
	parking varchar
)
-- i created the rest tables with similar procedure
-- check for duplicates in consumers table
select consumer_id,city, state, country, marital_status,count(consumer_id)
from consumers_preview
group by 1,2,3,4,5
having count(consumer_id) > 1

--check for null values
-- we can see that the marital_status of some of ths consumers are null, so we change all the nulls to unknown
update consumers_preview
set marital_status ='unknown'
where marital_status is null

update consumers_preview
set smoker ='unknown'
where smoker is null

update consumers_preview
set age ='unknown'
where age is null

-- update null values to unknown
update consumers_preview
set children = 'unknown' 
where children is null

-- check the counts of restaurants that allow smokers
select smoking_allowed, count(*) as smokers_count
from restaurant_previews
group by 1
order by smokers_count asc

-- counts of restaurants based off on price
 select price,count(*) as tot_price
     from restaurant_previews as rps
     group by price
     order by 2
-- overrall rating of restaurant based off on price
select price,  round(avg(rp.overrall_rating),2) as average
from restaurant_previews as rps
inner join ratings_preview as rp ON 
rps.restaurant_id = rp.restaurant_id
group by 1


	

--total restaurants there are 130 restaurants
select count(*) as total_restaurants
from restaurant_previews

-- There are 138 Total customers
select count(*) as total_customers
from consumers_preview

-- there are 28 unique restaurants cuisine
select count(distinct(cuisine)) from restaurants_cuisines_preview

-- there are 101 unique cuisines preffered by consumers
select count(distinct(preferred_cuisine))
from consumers_preference_preview

-- TOTAL ORDERS
select COUNT(CONSUMER_ID)AS TOTAL_ORDERS
from ratings_preview

-- total orders per cuisine, top cuisines loved by consumers
select cpp.preferred_cuisine, count(*) as cuisine_orders
from consumers_preference_preview as cpp 
inner join ratings_preview as rp on
rp.consumer_id = cpp.consumer_id
group by 1
order by 2 desc

-- Total consumer orders per age
with cte as (
select cp.age, count(rp.*) as total_orders
from  ratings_preview as rp
inner join consumers_preview as cp on
rp.consumer_id = cp.consumer_id
group by 1
order by 2  desc)
select cte.age,
 case when cte.age between '15' and '30'then total_orders
 when cte.age between '31' and '46' then total_orders
 when cte.age >= '47' then total_orders
 end as age_group
 from consumers_preview,cte
 group by cte.age,total_orders
    order by age_group desc
--		OR
--
select cp.age, count(rp.*) as total_orders
from  ratings_preview as rp
inner join consumers_preview as cp on
rp.consumer_id = cp.consumer_id
group by 1
order by 2  desc
O--OR
   with cte as (
select cp.age, count(rp.*) as total_orders
from  ratings_preview as rp
inner join consumers_preview as cp on
rp.consumer_id = cp.consumer_id
group by 1
order by 2  desc)
select cte.*,
case count(when age between '18' and '30' then 
    when age between '31' and '43' then sum(total_orders)
    when age >='44' then sum(total_orders)
    end as age_group
    from cte
    group by cte.total_orders,cte.age

--restaurants city used by consumers the most
select cp.city, count(rp.consumer_id)
from consumers_preview as cp
inner join ratings_preview as rp ON
cp.consumer_id = rp.consumer_id
group by 1
order by 2 desc

-- orders per occupation
select cp.occupation, count(rp.consumer_id)
from consumers_preview as cp
inner join ratings_preview as rp ON
cp.consumer_id = rp.consumer_id
group by 1
order by 2 desc

-- orders per budget
select cp.budget, count(rp.consumer_id)
from consumers_preview as cp
inner join ratings_preview as rp ON
cp.consumer_id = rp.consumer_id
group by 1
order by 2 desc

-- smokers orders
select cp.smoker, count(rp.consumer_id)
from consumers_preview as cp
inner join ratings_preview as rp ON
cp.consumer_id = rp.consumer_id
group by 1
order by 2 desc

-- orders per marital status
select cp.smoker, count(rp.consumer_id)
from consumers_preview as cp
inner join ratings_preview as rp ON
cp.consumer_id = rp.consumer_id
group by 1
order by 2 desc

-- orders per children 
select cp.children, count(rp.consumer_id)
from consumers_preview as cp
inner join ratings_preview as rp ON
cp.consumer_id = rp.consumer_id
group by 1
order by 2 desc


-- orders by restaurant parking space availability
select rps.parking, count(rps.restaurant_id)
from restaurant_previews as rps
inner join ratings_preview as rp ON
rps.restaurant_id = rp.restaurant_id
group by 1
order by 2 desc

-- restaurants with most orders
select rps.city, count(rps.restaurant_id)
from restaurant_previews as rps
inner join ratings_preview as rp ON
rps.restaurant_id = rp.restaurant_id
group by 1
order by 2 desc


-- restaurant with the most orders
select rps.name, count(rps.restaurant_id)
from restaurant_previews as rps
inner join ratings_preview as rp ON
rps.restaurant_id = rp.restaurant_id
group by 1
order by 2 desc

-- rating and count of restaurants by alcohol_service
select rps.alcohol_service, count(rps.restaurant_id), avg(food_rating)
from restaurant_previews as rps
inner join ratings_preview as rp ON
rps.restaurant_id = rp.restaurant_id
group by 1
order by 2 desc

-- restaurants with alcohol_service with highest service ratings
select rps.alcohol_service,rps.name, count(rps.restaurant_id), sum(service_rating)
from restaurant_previews as rps
inner join ratings_preview as rp ON
rps.restaurant_id = rp.restaurant_id
where alcohol_service <> 'None' and service_rating =2
group by 1,2
order by 3  desc


-- None based alcohol_service with highest service ratings
select rps.alcohol_service,rps.name, count(rps.restaurant_id), sum(service_rating)
from restaurant_previews as rps
inner join ratings_preview as rp ON
rps.restaurant_id = rp.restaurant_id
where alcohol_service = 'None' and service_rating =2
group by 1,2
order by 3  desc

-- cuisines preferred the mostly by consumers
select cpp.preferred_cuisine, count(cpp.preferred_cuisine)
from consumers_preference_preview as cpp
inner join ratings_preview as rp ON
cpp.consumer_id = rp.consumer_id
group by 1
order by 2 desc

-- top cuisines ordered from restaurant
select rcp.cuisine, count(rp.consumer_id)
from  restaurants_cuisines_preview as rcp
inner join ratings_preview as rp ON
rcp.restuarant_id = rp.restaurant_id
group by 1
order by 2 desc


--- top restaurants in terms of overrall_rating
select rsp.restaurant_id,rp.name, round(avg(food_rating),2) as average_food_rating, count(*)
from ratings_preview as rsp
inner join restaurant_previews as rp on
rsp.restaurant_id = rp.restaurant_id
group by 1,2
order by 4 desc

--- top restaurants in terms of overrall_rating
select rsp.restaurant_id,rp.name, round(avg(overrall_rating),2) as average_service_rating, count(*)
from ratings_preview as rsp
inner join restaurant_previews as rp on
rsp.restaurant_id = rp.restaurant_id
group by 1,2
order by 4 desc


--- top restaurants in terms of service rating
select rsp.restaurant_id,rp.name, round(avg(service_rating),2) as average_service_rating, count(*)
from ratings_preview as rsp
inner join restaurant_previews as rp on
rsp.restaurant_id = rp.restaurant_id
group by 1,2
order by 4 desc
