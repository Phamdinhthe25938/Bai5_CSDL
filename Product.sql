use btvn236;

Create table product(
    codeP int primary key,
    nameP varchar(255),
    priceP double
);
drop  table product;
create table orders(
    codeO int primary key,
    dateO date,
    totalMoney double default 0
);
drop table orders;
create table OrderDetail(
	codeP int ,
	codeO int,
	soluong int ,
    primary key(codeP,codeO),
    foreign key (codeP) references product(codeP),
	foreign key (codeO) references orders(codeO)
);
drop table OrderDetail;
drop trigger settotalMoney;
DELIMITER //
Create trigger settotalMoney
 after insert 
on OrderDetail for each row
begin 
     update orders
     set totalMoney = totalMoney + new.soluong *(select priceP from product where codeP = new.codeP)
     where codeO = new.codeO;
	END//
DELIMITER ;

DELIMITER //
Create trigger settotalMoneybyupdate
 after update 
on OrderDetail for each row
begin 
     update orders
     set totalMoney = totalMoney -(old.soluong -new.soluong)*(select priceP from product where codeP = new.codeP)
     where codeO = new.codeO;
	END//
DELIMITER ;

DELIMITER //
Create trigger settotalMoneybydelete
 after delete 
on OrderDetail for each row
begin 
     update orders
     set totalMoney = totalMoney -old.soluong *(select priceP from product where codeP = old.codeP)
     where codeO = old.codeO;
	END//
DELIMITER ;
drop trigger settotalMoneybydelete;

