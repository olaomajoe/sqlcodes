use united_nation;

create table region_list (region varchar (227));

insert into
 region_list (region)
 select distinct region
 from access_to_basic_services
