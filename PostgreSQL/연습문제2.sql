-- ### SQL 연습문제 2-1
-- 상품정보(products) 테이블에서 5개 레코드만 조회하세요.
select * from products limit 5;


-- ### SQL 연습문제 2-2
-- 회원(users) 테이블에서 이메일 주소(email) 20개를 조회하세요.
select email from users limit 20;


-- ### SQL 연습문제 2-3
-- 주문정보(orders) 테이블에서 상태정보(status)를 중복제거하여 아래와 같이 결과가 나오도록 조회하세요.
select distinct status from orders;


-- ### SQL 연습문제 2-4
-- 상품정보(products) 테이블에서 카테고리(category)를 중복제거하여 아래와 같이 조회하세요.
select distinct category from products;


-- ### SQL 연습문제 2-5
-- 상품정보(products) 테이블에서 카테고리(category), 브랜드(brand)를 중복제거하여 30개 조회하세요.
-- 각 결과 컬럼의 이름은 다음과 같이 지정하세요.
-- - 카테고리 → product_category
-- - 브랜드 → product_brand
select distinct category as product_category, brand as product_brand from products limit 30;


-- ### SQL 연습문제 2-6
-- 상품정보(products) 테이블에서 id, 카테고리(category), 이름(name), 판매가격(retail_price), 비용(cost), 판매이익(판매가격 - 비용), 수익율을 조회하세요.
-- 수익율 : (판매가 - 비용) / 비용 x 100
-- 각 컬럼의 이름은 다음과 같이 표현합니다.
-- - id → product_id
-- - 카테고리 → product_category
-- - 상품명 → product_name
-- - 판매가격 → product_price
-- - 비용 → product_cost
-- - 판매이익 → product_profit
-- - 수익율 → product_profit_rate
select 
    id as product_id,
    category as product_category,
    name as product_name,
    retail_price as product_price, 
    cost as product_cost,
    (retail_price - cost) as product_profit,
    (retail_price - cost) / cost * 100 as product_profit_rate
from products;