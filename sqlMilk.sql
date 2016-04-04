
select c.[CustomerId]
from [dbo].[Customer] as c
where c.[CustomerId] in (select [CustomerId]
from [dbo].[Order] as o
join [dbo].[Product] as p
on o.ProductId = p.[ProductId]
where p.ProductName = 'молоко'and DateDiff(m, o.OrderDate, getdate())<1)
and c.[CustomerId] not in (select o.[CustomerId]
from [dbo].[Product] as p
join [dbo].[Order] as o
on p.ProductId = o.[ProductId] --or o.ProductId is null
where p.ProductName = 'сметана' and DateDiff(m, o.OrderDate, getdate())<1)

