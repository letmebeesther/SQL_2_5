--pubs
select pub_name,
case country
	when 'usa' then '�̱�'
	when 'germany' then '����'
	when 'france' then '������'
	else '��Ÿ����'
	end ����
	from publishers

-- SampleDB
select* from ��ǰ

--������ �ִ� case��
--10���� �̻� ���� -> ��
--5���� �̻� ���� -> �߰�
--3���� �̻� ���� -> ����
--3���� �̸� -> ������
--������ ���� ��� -> �ش����

select ��ǰ��, 
case 
	when ���� >= 100000 then '��' --ū������ ���� �� ������ �������� ������ ����� ������ ���Ѵ�.
	when ���� >= 50000 then '�߰�'
	when ���� >= 30000 then '����'
	when ���� < 30000 then '������'
	else '�ش����'
end ���� -- ���̸�
from ��ǰ

--13�� 7p 5.titles ���̺��� å����� �Ʒ��� ���ݹ����� ���� 
--����ӡ�,�����롯,���ӡ� �� ����Ͻÿ�. (pubs)
-- 0~20�޷� �̻� -> ���
-- 11~19�޷� -> ����
-- 0~10�޷� -> ����

select title,
case 
	when price >= 20 then '���' 
	when price >= 11 then '����' 
	when price >= 0 then '����'
	else '���ݾ���'
	end price
from titles

--waitfor��
--1.time
waitfor time '14:48:50'
print '������ ����̳���?'

--2.delay
waitfor delay '00:00:05'
print '5�� ��'

--declare @������ �ڷ��� = �� / declare�� �����ϰ� �ʱ�ȭ�Ҷ�
-- set @������=�� / set�� ���� ������

--while��
declare @i int = 1 
while(@i<=10)
begin
	select @i �� -- ���̸�
	set @i=@i+1 --set @i+=1 
end

--1~10���� ������ �� ���
declare @a int = 1,@sum int = 0
while(@a<=10)
begin
	select @sum = @sum+@a
	set @a=@a+1
end 
select @sum ����

--�й� 1��~20�� �л����� �Ѹ� ���(�������̺�)
declare @num int = 201901001
while(@num<=201901020)
begin
	select * from ���� where �й� = @num
	set @num+=1
end

--exec()��
declare @s char(100);
set @s='select * from ����' -- ����
exec(@s) -- ���ڿ��� ������ Ǯ� ������

declare @t char(100);
set @t='create table t(id int)' -- ����
exec(@t) -- ���ڿ��� ������ Ǯ� ������

select * from t

--���̺��� a1~a10�̶�� ���̺��� ����
-- while���� exec�� ����ؼ� ���̺� ����
create table a1(id int)

declare @b char(100);
declare @n int = 1
while(@n<=10)
begin
	set @b='create table a'+convert(varchar(2),@n)+'(num int)'--convert(�ڷ���,���� �ٲٰ��� �ϴ� ����)
	exec(@b)
	set @n+=1
end

--whlie������ ����࿡ ���ֱ�
select  �й�,�̸�,���� into #��� from ���� where 1=0 
alter table #���
 add ��� char(20) 

declare @�й� int = 201901001
while(@�й�<=201901020)
begin
	if(select ���� from ���� where �й�=@�й�)>=90
	insert #���
	select �й�,�̸�,����,'good' from ���� where �й�=@�й�
	set @�й�+=1
end

select * from #���