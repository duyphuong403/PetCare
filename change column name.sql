use PetcareDB
go
alter table Accounts
drop column ReasonBaned
go

alter table Accounts
add ReasonBanned nvarchar(1000) null
go

alter table Accounts
alter column Phone int not null
go


alter table Products
drop column UnitPrice
go

alter table Products
add Unit nvarchar(50)
go

