create database tushu
go

use tushu
go

create table denglu
(
zhanghao nvarchar(20) not null primary key,
mima nvarchar(50) not null,
xingming nvarchar(20) not null,
leibie nvarchar(10) not null
)
go


create table tushu
(
id int identity(1,1) not null primary key,
mingcheng nvarchar(50) not null,
zuozhe nvarchar(20) not null,
chubanshe nvarchar(50) not null,
zhuangtai nvarchar(10) null
)
go

create table jieshu
(
	id int identity(1,1) not null primary key,
	tushu_id int not null,
	zhanghao  nvarchar(20) not null,
	rq datetime default getdate() not null,
	hsrq datetime null
)
go