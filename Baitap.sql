use bai5_baitap;

create table product(
      ProductID int primary key,
      ProductCode int unique,
      ProductName varchar(50),
      ProductPrice double  ,
      ProductAmount int ,
      ProductDescription varchar(50),
      ProductStatus bit 
);
alter table  product add unique index ProductCodeIndex(ProductCode);
   Explain select * from product where ProductCode=123;
   
alter table  product add  index  indexProductNameAndPrice(ProductName,ProductPrice);

Create view productView as
   select productCode, productName, productPrice, productStatus  from product;

select * from productView;
update productView set ProductName ="hello" where productCode=123;

   Delimiter //
   Create procedure findAllProduct()
   BEGIN
      SELECT * FROM product;
      END //
      Delimiter //;
CALL findAllProduct();

   Delimiter //
   Create procedure ADDsProduct()
   BEGIN
      insert into Product values(4,22,"banh mi",12,4,"ngon",1) ;
      END //
Delimiter ;
CALL ADDsProduct();