-- ### SQL 연습문제 3-1
-- 상품정보(products) 테이블에서 카테고리(category)가 ‘Swim’ 인 레코드의 모든 항목를 조회하세요.
select *
from products
where category = 'Swim';


-- ### SQL 연습문제 3-2
-- 상품정보(products) 테이블에서 브랜드(brand)가 ‘2EROS’인 레코드의 id, 비용(cost), 브랜드(brand)를 조회하세요.
select id, cost, brand
from products
where brand = '2EROS';


-- ### SQL 연습문제 3-3
-- 상품정보(products) 테이블에서 비용(cost)이 30이하이고 상품대상, 구분, 분야(department)이 ‘Men’인 모든 레코드를 10개를 조회하세요.
select *
from products
where cost <= 30 and department = 'Men'
limit 10;


-- ### SQL 연습문제 3-4
-- 상품정보(products) 테이블에서 판매가격(retail_price)이 40이상인 레코드들의 카테고리(category) 속성값을 중복제거(distinct)하여 조회하세요.
select distinct category 
from products
where retail_price >= 40;


-- ### SQL 연습문제 3-5
-- 상품정보(products) 테이블에서 비용(cost)이 50이상이고 70이하인 모든 레코드들 조회하세요.
select *
from products
where cost between 50 and 70;


-- ### SQL 연습문제 3-6
-- 상품정보(products) 테이블에서 상품명(name)에 ‘Men’과 ‘Sport’ 두 단어가 들어간 모든 레코드들 조회하세요.
select *
from products
where name like '%Men%' and name like '%Sport%';


-- ### SQL 연습문제 3-7
-- 상품정보(products) 테이블에서 브랜드(brand)가 ‘TYR’이 아니고 이름(name)에 ‘Suit’가 포함되고 할인율이 50이상인 모든 레코드와 할인율을 조회합니다.
-- - 할인율 : (비용/판매비용)*100
-- - 할인율의 컬럼 이름은 sale_price로 표현합니다.
select *, (cost/retail_price)*100 as sale_price
from products
where brand != 'TYR'
and name like '%Suit%'
and (cost/retail_price)*100 >= 50;
