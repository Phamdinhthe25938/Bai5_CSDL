use btvn246;


create table Phong(
    PhongID int primary key,
    TenPhong varchar(50),
    TrangThai tinyint
);
drop table Phong;
create table Ghe(
    GheID int primary key,
    PhongID int ,
    SoGhe varchar(50) ,
    foreign key (PhongID) references Phong(PhongID)
);
drop table Ghe;
create table Phim(
    PhimID int primary key,
    TenPhim varchar(50),
    LoaiPhim varchar(50),
    ThoiGian int
);
drop table Phim;
create table Ve(
   PhimID int,
    GheID int,
    primary key(PhimID,GheID),
    NgayChieu date,
    TrangThai varchar(20),
    foreign key (PhimID) references Phim(PhimID),
	foreign key (GheID) references Ghe(GheID)
);
drop table Ve;

-- Cau 1:
select * from Phim order by ThoiGian;
 -- Cau 2:
 select * from Phim where ThoiGian = (select max(ThoiGian) from Phim ) ;
-- cau 3:
 select * from Phim where ThoiGian = (select min(ThoiGian) from Phim ) ;
 -- cau 4:
 select * from Ghe where SoGhe like  "A%";
 -- cau 5:
 ALTER TABLE Phong
CHANGE COLUMN `TrangThai` `TrangThai` NVARCHAR(25) NULL DEFAULT NULL ;
-- cau 6:
 update  Phong set TrangThai = if(TrangThai=0,"Dang sua",if(TrangThai=1,"Dang su dung","unknow")) where PhongID>0;
-- cau 7:
select * from Phim where length(TenPhim)>15 and length(TenPhim)<25;
-- cau 8:
select concat(TenPhong," ",TrangThai) as `Trang Thai Phong Chieu `from Phong;
-- cau 9:
create view RankView as 
select TenPhim 'Ten phim' ,ThoiGian 'Thoi gian' from Phim;
create table Ranks(
    Stt int auto_increment primary key,
    TenPhim varchar(255),
    ThoiGian int 
); 
insert into Ranks(TenPhim,ThoiGian) select TenPhim,ThoiGian from Phim order by TenPhim;
-- cau 12:
update  Phim set LoaiPhim = concat("Đây là bộ phim thể loại", LoaiPhim) where PhimID>0;
update  Phim set TenPhim = concat("Film ", TenPhim) where PhimID>0;
  
  alter table Ghe drop constraint ghe_ibfk_1;
  alter table Ve drop constraint  ve_ibfk_1 ,  drop constraint ve_ibfk_2;
delete from Ghe where GheID>0;

select now();