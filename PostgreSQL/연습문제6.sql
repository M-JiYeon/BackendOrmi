-- ### SQL 연습문제 6-1
-- 상품정보(products) 테이블에서 상품의 id, 상품명(name), 판매가격(retail_price)를 조회합니다. 
-- 판매가격은 소수점 2자리에서 반올림 합니다.
select 
	id, 
	name, 
	round(retail_price, 2)
from products;


-- ### SQL 연습문제 6-2
-- 회원(users) 테이블에서 나이가 홀수인 유저만 조회하세요.
-- 조회 항목은 id, first_name, last_name, age 입니다.
select
	id, 
	first_name,
	last_name,
	age
from users
where mod(age, 2) = 1;


-- ### SQL 연습문제 6-3
-- 회원(users) 테이블에서 전체이름(full_name)을 조회하세요.
-- 성(first_name)과 이름(last_name)을 합쳐서 조회합니다.
-- 이름(last_name)은 모두 대문자로 표시합니다.
select
	concat(first_name, ', ', upper(last_name)) as full_name
from users;


-- ### SQL 연습문제 6-4
-- 회원(users) 테이블에서 회원아이디(id), 이메일(email), 가입연도(signup_year)을 조회하세요.
select
	id,
	email,
	extract(year from created_at) as signup_year
from users;


#-- ## SQL 연습문제 6-5
-- 회원(users) 테이블에서 2020년 7월 1일 부터 2020년 7월 10일까지 
-- 가입한 회원정보를 조회하세요.
-- 가입일시는 created_at 입니다.
-- 가입일(DATE 타입)을 만든후 비교해보세요.
select *
from users
where date(created_at) between '2020-07-01' and '2020-07-11';


-- ### SQL 연습문제 6-6
-- 주문정보(orders) 테이블에서 현재로부터 1년전에서 오늘까지 주문한 데이터를 조회하세요.
-- - 현재일시 : now()
-- - 주문일시 : created_at
select *
from orders
where date(created_at) <= (now() - interval '1 year');


-- ### SQL 연습문제 6-7
-- 회원(users) 테이블에서 가입연도(signup_year), 연도별 가입자(user_count)를 조회하세요.
select 
	 extract(year from created_at) as singup_year,
	 count(id) as user_count
from users
group by singup_year
order by singup_year;


-- ### SQL 연습문제 6-8
-- 가입회원들이 시간대별 가입자수를 확인하려고 합니다.
-- 회원(users) 테이블에서 0~23으로 표시되는 시간대(hour), 시간대별 가입자 수(user_count)를 조회하세요.
-- 정렬 순서는 시간대(hour)순입니다.
select 
    extract(hour from created_at) as signup_hour,
    count(id) as user_count
from users
group by signup_hour
order by signup_hour;


-- ### SQL 연습문제 6-9
-- 특정 연도의 월별 주문건수
-- 주문정보(orders) 테이블에서 2020년도의 월별 주문건수를 조회하세요.
-- 조회항목은 연도, 월, 주문건수 입니다.
select
	extract(year from created_at) as year,
	extract(month from created_at) as month,
	count(order_id) as order_count
from orders
where extract(year from created_at) = 2020
group by year, month
order by 1, 2;


-- ### SQL 연습문제 6-10
-- 회원(users) 테이블에서 다음 내역을 조회하세요.
-- - id
-- - 이름(first_name)
-- - 이름의 길이(name_length)
-- - 이름(first_name)의 앞 3글자(part_name)
-- - 이름의 앞 3글자를 별표 처리한 이름(name_with_asterisk)
select 
	id,
	first_name,
	length(first_name) as name_length,
	substring(first_name, 1, 3) as part_name,
	replace(first_name, substring(first_name, 1, 3), '***') as name_with_asterisk
from users;


-- ### SQL 연습문제 6-11
-- 회원(users) 테이블에서 전체 유저의 가입연도별 데이터를 조회하려고 합니다.
-- 가입연도(signup_year), 연도별 가입자수(user_count), 최고나이(max_age), 최저나이(min_age), 평균나이(avg_age)를 조회하세요.
-- 평균나이는 소수점 둘째자리까지 표시해주세요. 이하 소수점은 반올림처리하여 표시해주세요.
-- 정렬 순서는 가입연도 순(signup_year)입니다.
select
	extract(year from created_at) as signup_year,
	count(id) as user_count,
	max(age) as max_age,
	min(age) as min_age,
	round(avg(age), 2) as avg_age
from users
group by signup_year
order by signup_year;


-- ### SQL 연습문제 6-12
-- 회원(users) 테이블에서 브라질 여성유저의 시간대별 유저 가입자수를 조회하세요.
-- 조회 항목은 다음과 같습니다.
-- - 시간대(hour)
-- - 가입자수(user_count)
select 
	extract(hour from created_at) as hour,
	count(id) as user_count
from users
where country = 'Brasil' and gender = 'F'
group by hour
order by hour;


-- ### SQL 연습문제 6-13
-- 회원(users) 테이블에서 남성유저의 가입연도별 국가별 데이터를 조회하려고 합니다.
-- 조회 항목은 다음과 같습니다.
-- - 가입 연도(signup_year)
-- - 국가명(country)
-- - 가입자수(user_count)
-- - 최고나이(max_age)
-- - 최저나이(min_age)
-- - 평균나이(avg_age) - 소수점 2자리 반올림
-- 정렬순서는 가입연도 내림차순, 가입자수 내림차순 입니다.
-- 그룹핑 결과에서 가입자수가 100명 이상인 데이터만 표시해주세요.
select
	extract(year from created_at) as signup_year,
	country,
	count(id) as user_count,
	max(age) as max_age,
	min(age) as min_age,
	round(avg(age), 2) as avg_age
from users
where gender = 'M'
group by signup_year, country
having count(id) >= 100
order by signup_year desc, user_count desc;


-- ### SQL 연습문제 6-14
-- 다음은 회원(users) 테이블에서의 이메일의 아이디부분만 조회하는 쿼리입니다.
-- select left(email, position('@' in email) - 1)
-- from users;
-- 위 쿼리를 수정하여 이메일의 아이디부분의 4번째글자부터 뒤의 글자를 별표5개로 변경처리하여 조회하세요.
select 
	replace(email, substr(left(email, position('@' in email) - 1), 4), '*****')
from users;