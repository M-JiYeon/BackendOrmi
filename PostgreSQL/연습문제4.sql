-- ### SQL 연습문제 4-1
-- 회원(users) 테이블에서 전체 유저의 평균연령을 조회하세요.
select avg(age)
from users;


-- ### SQL 연습문제 4-2
-- 회원(users) 테이블에서 여성 유저의 평균연령을 조회하세요.
select avg(age) 
from users
where gender = 'F';


-- ### SQL 연습문제 4-3
-- 회원(users) 테이블에서 국가별 가입자수를 조회하세요.
select country, count(id) as country_user_count
from users
group by country;


-- ### SQL 연습문제 4-4
-- 회원(users) 테이블에서 남성 유저의 국가별 가입자 수를 조회하세요.
select country, count(id) as country_user_count
from users
where gender = 'M'
group by country;


-- ### SQL 연습문제 4-5
-- 회원(users) 테이블에서 가입기간(created_at)이 2020년도 1월인 유저의 국가별 가입자 수 (country_user_count)를 조회하세요.
select country, count(id) as country_user_count
from users
where created_at between '2020-01-01' and '2020-02-01'
group by country;


-- ### SQL 연습문제 4-6
-- 회원(users) 테이블에서 가입기간(created_at)이 2020년도 1월인 유저의 국가별 성별 가입자 수(country_gender_user_count)를 조회하세요.
select country, gender, count(id) as country_gender_user_count
from users
where created_at between '2020-01-01' and '2020-02-01'
group by country, gender;


-- ### SQL 연습문제 4-7
-- 주문정보(orders) 테이블에서 주문생성일이 2022년도인 주문중에서 주문 상태가 환불(Returned)상태인 주문을 기준으로 유저 아이디(user_id)별 총 주문 아이템(num_of_item)의 합계를 조회하세요.
select user_id, sum(num_of_item)
from orders
where 
	created_at between '2022-01-01' and '2023-01-01' and
	status = 'Returned'
group by user_id;