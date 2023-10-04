--pubs
select pub_name,
case country
	when 'usa' then '미국'
	when 'germany' then '독일'
	when 'france' then '프랑스'
	else '기타국가'
	end 국가
	from publishers

-- SampleDB
select* from 제품

--범위가 있는 case문
--10만원 이상 가격 -> 고가
--5만원 이상 가격 -> 중가
--3만원 이상 가격 -> 저가
--3만원 미만 -> 초저가
--가격이 없는 경우 -> 해당없음

select 제품명, 
case 
	when 가격 >= 100000 then '고가' --큰수에서 작은 수 순서로 내려가지 않으면 제대로 계산되지 못한다.
	when 가격 >= 50000 then '중가'
	when 가격 >= 30000 then '저가'
	when 가격 < 30000 then '초저가'
	else '해당없음'
end 가격 -- 열이름
from 제품

--13장 7p 5.titles 테이블에서 책제목과 아래의 가격범위에 따라 
--‘비쌈’,’보통’,’쌈’ 을 출력하시오. (pubs)
-- 0~20달러 이상 -> 비쌈
-- 11~19달러 -> 보통
-- 0~10달러 -> 저렴

select title,
case 
	when price >= 20 then '비쌈' 
	when price >= 11 then '보통' 
	when price >= 0 then '저렴'
	else '가격없음'
	end price
from titles

--waitfor문
--1.time
waitfor time '14:48:50'
print '점심은 뭐드셨나요?'

--2.delay
waitfor delay '00:00:05'
print '5초 뒤'

--declare @변수명 자료형 = 값 / declare는 선언하고 초기화할때
-- set @변수명=값 / set은 값을 넣을때

--while문
declare @i int = 1 
while(@i<=10)
begin
	select @i 값 -- 열이름
	set @i=@i+1 --set @i+=1 
end

--1~10까지 누적된 값 출력
declare @a int = 1,@sum int = 0
while(@a<=10)
begin
	select @sum = @sum+@a
	set @a=@a+1
end 
select @sum 총합

--학번 1번~20번 학생들을 한명씩 출력(성적테이블)
declare @num int = 201901001
while(@num<=201901020)
begin
	select * from 성적 where 학번 = @num
	set @num+=1
end

--exec()문
declare @s char(100);
set @s='select * from 성적' -- 문자
exec(@s) -- 문자여도 실제로 풀어서 실행함

declare @t char(100);
set @t='create table t(id int)' -- 문자
exec(@t) -- 문자여도 실제로 풀어서 실행함

select * from t

--테이블을 a1~a10이라는 테이블을 생성
-- while문과 exec를 사용해서 테이블 생성
create table a1(id int)

declare @b char(100);
declare @n int = 1
while(@n<=10)
begin
	set @b='create table a'+convert(varchar(2),@n)+'(num int)'--convert(자료형,내가 바꾸고자 하는 변수)
	exec(@b)
	set @n+=1
end

--whlie문으로 비고행에 값넣기
select  학번,이름,점수 into #결과 from 성적 where 1=0 
alter table #결과
 add 비고 char(20) 

declare @학번 int = 201901001
while(@학번<=201901020)
begin
	if(select 점수 from 성적 where 학번=@학번)>=90
	insert #결과
	select 학번,이름,점수,'good' from 성적 where 학번=@학번
	set @학번+=1
end

select * from #결과