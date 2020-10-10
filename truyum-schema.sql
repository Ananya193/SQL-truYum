use truYum;
drop table menu_items;
show tables;
create table menu_item(
item_name varchar(30) not null,
price int,
active_status enum('Yes', 'No'),
date_of_launch date,
category varchar(30),
free_delivery enum('Yes','No'),
item_id int primary key
);
create table users(
user_id int primary key,
user_name varchar(30)
);
drop table user;
create table cart(
user_id  int not null,
item_id int not null,
cart_id int primary key,
foreign key(user_id) references users(user_id),
foreign key(item_id) references menu_item(item_id)
);
desc cart;