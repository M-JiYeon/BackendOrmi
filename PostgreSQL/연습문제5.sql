-- ### SQL 연습문제 5-1
-- 회원 테이블(users)에서 국가별 유저수를 조회하세요. 
-- - 조회 항목 : 국가명(country), 국가별 유저수(user_count)
-- - 조건 : 국가의 유저수가 3000명 이상인 국가
-- - 정렬 : 국가별 유저수 많은순으로 정렬
select country, count(id) as user_count
from users
group by country
having count(id) >= 3000
order by count(id) desc;


-- ### SQL 연습문제 5-2
-- 상품정보(products) 테이블에서 여성 스웨터중 판매가격이 제일 저렴한 5개를 조회하세요.
-- - 조건
-- 	 - category : Sweaters
--   - department : Women
-- - 정렬 : 판매가격(retail_price)이 낮은 순
-- - 갯수제한 : 5개
select *
from products
where category = 'Sweaters' and department = 'Women'
order by retail_price
limit 5;


-- ### SQL 연습문제 5-3
-- 상품정보(products) 테이블에서 여성 스웨터의 브랜드별 평균 판매가격이 100이하인 브랜드의 브랜드 이름과 여성스웨터 평균판매가격을  조회하세요.
-- - 조건
--   - category : Sweaters
--   - department : Women
-- - 그룹조건 : 평균 판매가격이 100 이하
-- - 정렬순서 : 평균 판매가격이 낮은 순
select 
	brand,
	avg(retail_price) as retail_price_avg
from 
	products
where 
	category = 'Sweaters' and 
	department = 'Women'
group by brand
having avg(retail_price) <= 100
order by retail_price_avg;


-- ### SQL 연습문제 5-4
-- 상품정보(products) 테이블에서 각 제품의 id, 이름, 카테고리, 브랜드, 비용(cost), 판매가(retail_price), 이익금액(profit), 이익율(profit_rate)을 조회하세요.
-- - 이익금액(profit) : 판매가(retail_price) - 비용(cost)
-- - 이익율(profit_rate) : (판매가(retail_price) - 비용(cost)) / 판매가(retail_price) * 100
select 
	id, 
	name, 
	category, 
	cost, 
	retail_price, 
	(retail_price - cost) as profit, 
	((retail_price - cost) / retail_price) as profit_rate
from products;


-- ### SQL 연습문제 5-5
-- 상품정보(products) 테이블에서 수영카테고리 제품의 각 브랜드별 최소이익율, 최대 이익율, 평균 이익율을 조회하세요.
-- - 조건
--   - category : Swim
-- - 이익율(profit_rate) : (판매가(retail_price) - 비용(cost)) / 판매가(retail_price) * 100
select 
	brand,
	min(((retail_price - cost) / retail_price)) * 100 as min_profit_rate,
	max(((retail_price - cost) / retail_price)) * 100 as max_profit_rate,
	avg(((retail_price - cost) / retail_price)) * 100 as avg_profit_rate
from products
where category = 'Swim'
group by brand;


-- ### SQL 연습문제 5-6
-- 연습문제 5-5 데이터에서 평균이익율이 높은 TOP 5 브랜드와 평균이익율을 조회하세요.
select 
	brand,
	avg(((retail_price - cost) / retail_price)) * 100 as avg_profit_rate
from products
where category = 'Swim'
group by brand
order by avg_profit_rate desc 
limit 5;


-- ### SQL 연습문제 5-7
-- 상품정보(products) 테이블에서 카테고리 별 남성 제품의 수를 조회하세요. 
-- - 조회 항목 : 카테고리, 제품의 수
-- - 조건 : 카테고리 중 ‘Sport’가 들어가지 않은 카테고리, 남성 제품
-- - 정렬  : 제품의 수가 많은 순으로 정렬
select count(id), category
from products
where department = 'Men'
group by category
having category not like '%Sport%'
order by count(id) desc;
