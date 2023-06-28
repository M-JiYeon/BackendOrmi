-- ### SQL 연습문제 1-1
--회원(users) 테이블의 모든 데이터를 조회하세요.
select * from users;


-- ### SQL 연습문제 1-2
-- 상품정보(products) 테이블의 모든 데이터를 조회하세요.
select * from products;


-- ### SQL 연습문제 1-3
-- 주문정보(orders) 테이블의 모든 데이터를 조회하세요.
select * from orders;


-- ### SQL 연습문제 1-4
-- 회원(users) 테이블의 이메일(email) 정보를 조회하세요.
select email from users;


-- ### SQL 연습문제 1-5
-- 회원(users) 테이블의 이름(first_name), 성(lastname), 이메일(email), 국가 정보(country)를 조회하세요.
select first_name, last_name, email, country from users;


-- ### SQL 연습문제 1-6
-- 상품정보(products) 테이블의 id, 카테고리(category), 이름(name), 판매가격(retail_price), 비용(cost)을 조회하세요.
select id, category, name, retail_price, cost from products;


-- ### SQL 연습문제 1-7
-- 상품정보(products) 테이블의 id, 카테고리(category), 이름(name), 판매가격(retail_price), 비용(cost), 판매이익(판매가격 - 비용)을 조회하세요.
select id, category, name, retail_price, cost, (retail_price - cost) from products;


-- ### SQL 연습문제 1-8
-- 회원(users) 테이블의 이름(first_name), 나이(age), 출생연도(나이 데이터로 계산, 만 나이로 기준) 데이터를 조회해보세요.
select first_name, age, (2022 - age) from users;