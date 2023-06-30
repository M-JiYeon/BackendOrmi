-- ### SQL 연습문제 7-1
-- 주문정보(orders) 테이블에서 order_id, gender, gender_label(gender의 값에 따른 성별을 한글로 표시)을 해주세요.
-- - 필드명 : gender_label
--    - gender가 F 이면 '여성'
--    - gender가 M 이면 '남성'
-- - 결과로 표시할 필드
--    - order_id
--    - gender
--    - gender_label
-- - 정렬순서 : order_id 오름차순
select 
	order_id,
	gender,
  	case
	  	when gender = 'F' then '여성'
    	when gender = 'M' then '남성'
  	end as gendr_label
from orders
order by order_id;

select 
	order_id,
	gender,
  	case gender
	  	when 'F' then '여성'
    	when 'M' then '남성'
  	end as gendr_label
from orders
order by order_id;


-- ### SQL 연습문제 7-2
-- 회원(users) 테이블에서 다음 정보를 조회하세요.
-- 1) 조회 항목
-- - 유저아이디 - id,
-- - 가입연도 - year
-- - 가입월 - month
-- - 가입일 - day
-- - 이용경로(traffic_source) 한글 텍스트 -  traffic_source_label
--    - Search → 검색엔진
--    - Organic → 검색결과
--    - Email → 이메일
--    - Display → 디스플레이 광고
--    - Facebook → 페이스북
-- 2) 정렬순서
-- - id 오름차순
select 
	id,
	extract(year from created_at)  as year,
	extract(month from created_at) as month,
	extract(day from created_at)   as day, 
	case traffic_source
		when 'Search' 	then '검색엔진'
		when 'Organic' 	then '검색결과'
		when 'Email' 	then '이메일'
		when 'Display' 	then '디스플레이 광고'
		when 'Facebook' then '페이스북'		
	end	as traffic_source_label
from users
order by id;


-- ### SQL 연습문제 7-3
-- 회원(users) 테이블에서 가입연도별 이용경로(traffic_source)별 가입자수를 조회하세요.
-- 조회 항목
-- - year
-- - Search
-- - Organic
-- - Email
-- - Display
-- - Facebook
-- - Total
-- 정렬순서
-- - year 오름차순
select 
	extract(year from created_at) as year, 
	count(case when traffic_source = 'Search'  	then 'o' end) as Search,
	count(case when traffic_source = 'Organic' 	then 'o' end) as Organic,
	count(case when traffic_source = 'Email' 	then 'o' end) as Email,
	count(case when traffic_source = 'Display' 	then 'o' end) as Display,
	count(case when traffic_source = 'Facebook' then 'o' end) as Facebook,
	count(id) as total
from users
group by year
order by year;


-- ### SQL 연습문제 7-4
-- 주문정보(orders) 테이블에서 주문을 3번 이상 구매한 사람의 등급을 ‘Gold’, 4번 이상 구매한 사람의 등급은 ‘VIP’, 그 외에는 'Silver'라고 등급을 지정해 줍니다.
select 
	user_id,
	case 
		when count(user_id) >= 4 then 'VIP'
		when count(user_id) >= 3 then 'Gold'
		else 'Silver'
	end as Grade
from orders
group by user_id
order by user_id;


-- ### SQL 연습문제 7-5
-- 상품정보(products) 테이블에서 상품의 id, 상품명(name), 사이즈(size)라는 컬럼을 하나 만들도록 하겠습니다.
-- 상품명 맨 끝에 ‘XS’, ‘S’, ‘M’, ‘L’, ‘XL’, ‘XXL’ 라고 적혀져 있습니다. 사이즈 컬럼에 맞는 값을 저장하고 조건에 부합하지 않는 경우에는 NULL 값을 넣어줍니다.
-- - 정렬순서 : size 내림차순
select
	id, 
	name,
	case 
		when name like '%S' then 'S'
		when name like '%XS' then 'XS'
		when name like '%M' then 'M'
		when name like '%XXL' then 'XXL'
		when name like '%XL' then 'XL'
		when name like '%L' then 'L'
		else NULL
	end as size
from products
order by size desc;


-- ### SQL 연습문제 7-6
-- **각 연도의 분기별 매출 합계**
-- order_items 테이블에서 각 연도의 분기별 매출합계을 표시하세요.
-- order_items의 status가 `Complete` 인 항목만 포함합니다.
-- 표시항목
-- - year
-- - quarter
-- - sum_sale_price - 소수점 2자리 반올림
-- 정렬 순서
-- - year 오름차순
-- - quarter 오름차순
select 
	extract(year from created_at) as year, 
	extract(quarter from created_at) as quarter,
	round(sum(sale_price), 2) as sum_sale_price
from order_items
where status = 'Complete'
group by year, quarter
order by year, quarter;


-- ### SQL 연습문제 7-7
-- order_items 테이블에서 각 연도의 분기별 매출을 가로로 펼쳐서 표시하세요.
-- order_items의 status가 `Complete` 인 항목만 포함합니다.
-- 각 쿼터별 매출합계는 소수점 2자리까지 반올림하여 표시합니다.
-- 표시 항목
-- - YEAR
-- - Q1
-- - Q2
-- - Q3
-- - Q4
-- - TOTAL
-- 정렬순서
-- - YEAR
select 
	extract(year from created_at) as year,
  	round(sum(case when extract(quarter FROM created_at) = 1 then sale_price end), 2) as Q1,
	round(sum(case when extract(quarter FROM created_at) = 2 then sale_price end), 2) as Q2,
	round(sum(case when extract(quarter FROM created_at) = 3 then sale_price end), 2) as Q3,
	round(sum(case when extract(quarter FROM created_at) = 4 then sale_price end), 2) as Q4,
	round(sum(sale_price), 2) as TOTAL
from order_items
where status = 'Complete'
group by year
order by year;