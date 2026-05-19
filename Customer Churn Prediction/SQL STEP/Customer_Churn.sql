-- نسبه الناس اللي مشيت
select 
	Churn,
	count(*) as [Churn and not]
	,Round(COUNT(*)*100/sum(count(*))over(), 2 ) AS [Percenting]
from Customer_Churn
Group by Churn
----------------------------------------------------------
--   InternetService نسبه الناس اللي مشيت بالنسبه ل 
select
	InternetService,
	Count(Churn) as [Counter]
	,Round(Sum(CASe when Churn = 'Yes' then 1 else 0 end)*100/count(Churn),2) as [Percenting]
from Customer_Churn
group by InternetService
---------------------------------------------------------------
--   Contract نسبه الناس اللي مشيت بالنسبه ل 
select
	Contract,
	Count(Churn) as [Counter]
	,Round(Sum(CASe when Churn = 'Yes' then 1 else 0 end)*100/count(Churn),2) as [Percenting]
from Customer_Churn
group by Contract
--------------------------------------------------------------------------------------------------
select* from Customer_Churn
----------------------------------------------------------------------------------------------------
-- Dependents نسبه الناس اللي مشيت بالنسبه ل
select
	Dependents,
	Count(Churn) as [Counter]
	,Round(Sum(CASe when Churn = 'Yes' then 1 else 0 end)*100/count(Churn),2) as [Percenting]
from Customer_Churn
group by Dependents
---------------------------------------------------------------------------------------------------
---- PaymentMethod نسبه الناس اللي مشيت بالنسبه ل

select
	PaymentMethod,
	Count(Churn) as [Counter]
	,Round(Sum(CASe when Churn = 'Yes' then 1 else 0 end)*100/count(Churn),2) as [Percenting]
from Customer_Churn
group by PaymentMethod