

--Create Database

CREATE DATABASE Manufacturer;

Use Manufacturer;


--Create  Schema
CREATE SCHEMA Fabrika;
---



--create Fabrika.[Product] table
CREATE TABLE [Fabrika].[Product](
	[prod_id] [int] PRIMARY KEY NOT NULL,
	[Prod_Name] [varchar](50) NOT NULL,
	[quantity] INT NOT NULL,
	);


--create Fabrika.[[Prod_Comp]] table

CREATE TABLE [Fabrika].[Prod_Comp](
	[prod_id] [int]  NOT NULL,
	[comp_id] [int]  NOT NULL,
	[quantity_comp] INT NOT NULL,
	PRIMARY KEY ([prod_id], [comp_id])
	);

--create Fabrika.Component table

CREATE TABLE [Fabrika].[Component](
	[comp_id] [int] PRIMARY KEY ,
	[comp_name] [varchar](50) Not NULL,
	[description] [varchar](50) Not NULL,
	[quanrity_comp] INT NOT NULL,
	);

--create Fabrika.[[[Comp_Supp]]] table

CREATE TABLE [Fabrika].[Comp_Supp](
	[supp_id] [int]  NOT NULL,
	[comp_id] [int]  NOT NULL,
	[order_date] [date] NOT NULL,
	[quantity] INT NOT NULL,
	PRIMARY KEY ([supp_id], [comp_id])
	);

--create Fabrika.Supplier table

CREATE TABLE [Fabrika].[Supplier](
	[supp_id] [int] PRIMARY KEY ,
	[supp_name] [varchar](50) Not NULL,
	[supp_location] [varchar](50) Not NULL,
	[supp_country] [varchar](50) Not NULL,
	[is_active] bit NOT NULL,
	);

-- Foreign key konstraint' leri belirlememiz gerekiyor

ALTER TABLE [Fabrika].[Prod_Comp] ADD CONSTRAINT FK_product FOREIGN KEY ([prod_id]) REFERENCES [Fabrika].[Product] ([prod_id])

ALTER TABLE [Fabrika].[Prod_Comp] ADD CONSTRAINT FK_component FOREIGN KEY ([comp_id]) REFERENCES [Fabrika].[Component] ([comp_id])




ALTER TABLE [Fabrika].[Comp_Supp] ADD CONSTRAINT FK_supplier FOREIGN KEY ([supp_id]) REFERENCES [Fabrika].[Supplier] ([supp_id])

ALTER TABLE [Fabrika].[Comp_Supp] ADD CONSTRAINT FK_component2 FOREIGN KEY ([comp_id]) REFERENCES [Fabrika].[Component] ([comp_id])






