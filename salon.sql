create table if not exists customers(
customer_id serial primary key,
name varchar(30),
phone varchar(13) unique

); 

create table if not exists services(
service_id serial primary key,
name varchar(30)
);

create table if not exists appointments(
appointment_id serial primary key,
customer_id int references customers(customer_id),
service_id int references services(service_id),
time varchar(30)
);

INSERT INTO services (name)
VALUES
  ('cutting hair'),
  ('making your nails'),
  ('painting hair');
