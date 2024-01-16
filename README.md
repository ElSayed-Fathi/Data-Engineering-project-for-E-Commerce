# Data-Engineering-project-for-E-Commerce
## Project Description
Welcome to comprehensive end-to-end data engineering project tailored for e-commerce. In this project, We have meticulously crafted a streamlined data pipeline to handle diverse datasets from various sources. The journey involves extracting data from CSV files, utilizing Python for minimal transformations, transferring it to SQL Server for staging, and further refining it with Alteryx transformations. Finally, we delve into SQL Server for data modeling and leverage Tableau for insightful analysis.
## Data architecture
![Architecture Diagram](architecture_diagram.PNG)
## Key Components:

#### Python Transformations:
Witness the power of Python as it refines and transforms data within the SQL Server staging area, ensuring data quality and integrity before proceeding to the modeling phase.

#### Workflow with Alteryx:
Explore the Alteryx workflow that efficiently extracts data from CSV files and loads it into SQL Server with minimal transformations, ensuring a smooth transition from source to the staging area.

#### Data Modeling in SQL Server:
Delve into the intricacies of data modeling, where the structure of the data warehouse, including dimension and fact tables, is meticulously crafted for analytical purposes.

#### SQL Analysis for Strategic Insights:
Experience the synergy of SQL Server and Tableau as We leverage queries to uncover valuable insights, enabling informed decision-making in the dynamic e-commerce landscape.

### Project Highlights:

- **Efficient ETL Process:** Alteryx facilitates a seamless transition from CSV to SQL Server, ensuring data integrity with minimal transformations.

- **Robust Python Transformations:** Python enhances data quality during the staging process, preparing it for comprehensive analysis.

- **Scalable Data Modeling:** The architecture is designed to handle growing datasets and evolving business requirements during the modeling phase.

- **Actionable Intelligence:** The analysis phase, powered by SQL Server and visualized through Tableau, provides strategic insights to drive informed business decisions.


## [1. Source Data](https://github.com/ElSayed-Fathi/Data-Engineering-project-for-E-Commerce/blob/39ad69d2d37099fa41b76d7e503a428064980460/1%20Data%20Sources/README%20(2).md)


## Data Source:
![Data Source](source_data.png)

## [2. ETL Using Python](https://github.com/ElSayed-Fathi/Data-Engineering-project-for-E-Commerce/tree/0ebbe62252ef0016922c4cb9b87696cd8b87dff1/1%20Data%20Sources)

### ETL Using Python:
![ETL Using Python](code_example.PNG)

## [3. Alteryx Workflow ](https://github.com/ElSayed-Fathi/Data-Engineering-project-for-E-Commerce/tree/b23186f3ff775672d3c36ae8d8ae24422dd205e0/2%20Staging%20Layer)

###  Alteryx Workflow :
![Alteryx Workflow](https://github.com/ElSayed-Fathi/Data-Engineering-project-for-E-Commerce/blob/b23186f3ff775672d3c36ae8d8ae24422dd205e0/2%20Staging%20Layer/Full%20Workflow.PNG)

## [4. Data Warehouse Model ](https://github.com/ElSayed-Fathi/Data-Engineering-project-for-E-Commerce/tree/cc7b833140ddde630aa206cfcacba4e7d713dc18/5%20Data%20Warehouse%20Dimensional%20Model%20and%20Code)

###  Data Warehouse Model :
![Data Warehouse Model](Data_Warehouse_Diagram_11_light.png)

## [4. Analysis using SQL](https://github.com/ElSayed-Fathi/Data-Engineering-project-for-E-Commerce/tree/1e6ea70c5581a9dd6c38f746ea4f135d3c794e44/6%20SQL%20Analytical%20Queries)

Example of the analysis:
Question: 

Which Logistic Route Has Heavy Traffic In Our E-Commerce? (Delay Frequency)

```sql
SELECT TOP 10 CONCAT(Sellers.SellerState, ', ', Sellers.SellerCity,' ==>> ', Users.UserState, ', ', Users.UserCity) 'Logistic Route', AVG(SubQuery.MaxDeliveryDelayDays) / 
           COUNT(DISTINCT(OrderItems.OrderID)) AS 'Average Delivery Days Per Order'
FROM (
    SELECT OrderItems.OrderID, MAX(OrderItems.DeliveryDelayDays*1.0) AS MaxDeliveryDelayDays
    FROM OrderItems
	WHERE OrderItems.DeliveryDelayCheck = 'Delayed'
    GROUP BY OrderItems.OrderID
) AS SubQuery
JOIN OrderItems ON SubQuery.OrderID = OrderItems.OrderID
JOIN Users
ON Users.UserID = OrderItems.UserID
JOIN Sellers
ON Sellers.SellerID = OrderItems.SellerID
WHERE OrderItems.DeliveryDelayCheck = 'Delayed'
GROUP BY Sellers.SellerState, Sellers.SellerCity, Users.UserState, Users.UserCity
ORDER BY 'Average Delivery Days Per Order' DESC;
```
## [5. Final Insights](https://github.com/ElSayed-Fathi/Data-Engineering-project-for-E-Commerce/tree/6b65b53ece3c6922144ba7813b2b991c14dde1ea/7%20Data%20Visualization%20Using%20Tableau)

### Dashboard:
![Dashboard](https://github.com/ElSayed-Fathi/Data-Engineering-project-for-E-Commerce/blob/6b65b53ece3c6922144ba7813b2b991c14dde1ea/7%20Data%20Visualization%20Using%20Tableau/Dashboard_1.png)

### Examples Of Useful Insights : 

##### Best Payment Methods 
![Best Payment Methods](https://github.com/ElSayed-Fathi/Data-Engineering-project-for-E-Commerce/blob/6b65b53ece3c6922144ba7813b2b991c14dde1ea/7%20Data%20Visualization%20Using%20Tableau/Best_Payment_Method.png)


