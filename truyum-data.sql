use truyum;
-- 1.View Menu Item List
-- a.insert script to add data into menu_item table 
insert into menu_item(item_name,price,active_status,date_of_launch,category,free_delivery,item_id)
values('Sandwitch',99.00,'Yes','2017-03-15','Main Course','Yes',01),('Burger',129.00,'Yes','2017-12-23','Main Course','No',02),
('Pizza',149.00,'Yes','2017-08-21','Main Course','No',03),('French Fries',57.00,'No','2017-07-02','Starters','No',04),
('Chocolate Brownie',32.00,'Yes','2017-11-02','Dessert','Yes',05);
-- b. Frame sql query to get all menu items
select * from menu_item;
-- 4.Add to cart
-- a.create user table
insert into users(user_id,user_name)
values(4260,'Admin'),(4271,'Customer');
select * from users;
-- b. create cart table
insert into cart(user_id,item_id,cart_id)
values(4260,01,01),(4271,02,02),(4260,03,03),(4271,04,04),(4260,05,05);

desc cart;
select * from cart;

-- 2.Frame SQL query to get menu items which after launch date and is active.
select * from menu_item where active_status='Yes' and date_of_launch >'2017-03-15';

-- 3.Edit Menu Item.
-- a.Frame SQL query to get menu items based on menu item id
select * from menu_item where item_id in(1,3,5);
-- b.update sql menu item table to update all the columns values based on item id.
update menu_item set price = 97.00 ,date_of_launch='2018-11-02' where item_id=03;

-- 5.View Cart
-- a.Frame sql query to get all menu items in a particular user's cart
select m.item_name,m.free_delivery,m.price
from menu_item as m inner join cart as c 
on c.cart_id=m.item_id
inner join users as u on c.user_id=u.user_id
where u.user_id =4260;
-- b.frame a sql query to get total price of all menu items in a particular user's cart
select sum(m.price) as TotalPrice from menu_item m 
join cart c on c.cart_id=m.item_id
join users u on u.user_id=c.user_id
where u.user_id=4260;

-- 6.Remove Item from cart
-- a.frame sql query to remove a menu items from cart based on user id and menu item id
delete from cart where cart_id= 4;
select m.item_name,m.free_delivery,m.price from
menu_item as m inner join cart as c on c.cart_id=m.item_id
inner join users as u on c.user_id=u.user_id
where u.user_id=4260;