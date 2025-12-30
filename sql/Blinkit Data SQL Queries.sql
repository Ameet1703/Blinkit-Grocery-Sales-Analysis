
select * from blinkit_data;

-- 1.Sum of total sales in millions

select cast(sum(Total_Sales)/1000000 as decimal(10,2)) AS Total_Sales_Millions
from blinkit_data;

-- 2.Total Sales by Fat_Content

select Item_Fat_Content, 
concat(cast(sum(Total_Sales)/1000 as decimal(10,2)),'k') as Total_Sales,
cast(avg(Total_Sales) as decimal(10,1)) as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
-- where Outlet_Establishment_Year = 2022
group by Item_Fat_Content
order by Total_Sales desc;

-- 3.Top 5 Item Type

select Item_Type, 
concat(cast(sum(Total_Sales)/1000 as decimal(10,2)),'k') as Total_Sales,
cast(avg(Total_Sales) as decimal(10,1)) as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
group by Item_Type
order by Total_Sales desc
limit 5;

-- 4.Fat Content By Outlet Location For Total Sales 

select 
  Outlet_Location_Type,
  cast(sum(case 
             when Item_Fat_Content = 'Low Fat' then Total_Sales 
             else 0 
           end) as decimal(10,2)) AS Low_Fat,
  cast(sum(CASE 
             when Item_Fat_Content = 'Regular' then Total_Sales 
             else 0 
           end) as decimal(10,2)) AS Regular
from blinkit_data
group by Outlet_Location_Type
order by Outlet_Location_Type;

-- 5.Total Sales by outlet Establishment

select Outlet_Establishment_Year,
concat(cast(sum(Total_Sales)/1000 as decimal(10,2)),'k') as Total_Sales
from blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year asc;

-- 6.Percentage of Sales by Outlet Size

select Outlet_Size,
concat(cast(sum(Total_Sales)/1000 as decimal(10,2)),'k') as Total_Sales,
cast(sum(Total_Sales) * 100.0 / sum(sum(Total_Sales)) over() as decimal(10,2)) as Sales_Percentage
from blinkit_data
group by Outlet_Size
order by Total_Sales desc;

-- 7.Sales by outlet Location

select Outlet_Location_Type,
concat(cast(sum(Total_Sales)/1000 as decimal(10,2)),'k') as Total_Sales,
cast(sum(Total_Sales) * 100.0 / sum(sum(Total_Sales)) over() as decimal(10,2)) as Sales_Percentage,
cast(avg(Total_Sales) as decimal(10,1)) as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
group by Outlet_Location_Type
order by Total_Sales desc;

-- 8.All metrics by Outlet Type

select Outlet_Type,
concat(cast(sum(Total_Sales)/1000 as decimal(10,2)),'k') as Total_Sales,
cast(sum(Total_Sales) * 100.0 / sum(sum(Total_Sales)) over() as decimal(10,2)) as Sales_Percentage,
cast(avg(Total_Sales) as decimal(10,1)) as Avg_Sales,
count(*) as No_of_Items,
cast(avg(Rating) as decimal(10,2)) As Avg_Rating
from blinkit_data
group by Outlet_Type
order by Total_Sales desc;


