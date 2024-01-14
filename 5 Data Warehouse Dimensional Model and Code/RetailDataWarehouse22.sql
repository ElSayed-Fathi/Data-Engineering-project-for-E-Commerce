--CREATE Tables 
---------------------------------------------------------
--1-Feedback_Table
USE [RetailDataWarehouse]
GO
/****** Object:  Table [dbo].[Feedback_Dim]    Script Date: 12/01/2024 07:58:35 ã ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Feedback_Dim](
	[feedback_id] [varchar](254) NOT NULL,
	[feedback_score] [bigint] NULL,
	[feedback_sent_date] [datetime] NULL,
	[feedback_answer_date] [datetime] NULL,
	[Days_Between] [int] NULL,
 CONSTRAINT [PK_Feedback_Dim] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2-Order_Dim_Table
CREATE TABLE [dbo].[Order_Dim](
	[order_id] [varchar](254) NOT NULL,
	[order_status] [varchar](254) NULL,
	[order_date] [datetime] NULL,
	[order_approved_date] [datetime] NULL,
	[pickup_date] [datetime] NULL,
	[delivered_date] [datetime] NULL,
	[estimated_time_delivery] [datetime] NULL,
 CONSTRAINT [PK_Order_Dim] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3-Payment_Dim_Table
CREATE TABLE [dbo].[Payement_Dim](
	[payment_id] [bigint] NOT NULL,
	[payment_sequential] [bigint] NULL,
	[payment_type] [varchar](254) NULL,
	[payment_installments] [bigint] NULL,
	[payment_value] [real] NULL,
 CONSTRAINT [PK_Payement_Dim] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4-Product_Dim_Table
CREATE TABLE [dbo].[Product_Dim](
	[product_id] [varchar](254) NOT NULL,
	[product_category] [varchar](254) NULL,
	[product_name_lenght] [real] NULL,
	[product_description_lenght] [real] NULL,
	[product_photos_qty] [real] NULL,
	[product_weight_g] [real] NULL,
	[product_length_cm] [real] NULL,
	[product_height_cm] [real] NULL,
	[product_width_cm] [real] NULL,
 CONSTRAINT [PK_Product_Dim] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--5-Sales_Fact
CREATE TABLE [dbo].[Sales_Fact](
	[order_id] [varchar](254) NULL,
	[user_id] [varchar](254) NULL,
	[product_id] [varchar](254) NULL,
	[feedback_id] [varchar](254) NULL,
	[seller_id] [varchar](254) NULL,
	[pickup_limit_date] [datetime] NULL,
	[price] [real] NULL,
	[shipping_cost] [real] NULL,
	[payment_id] [bigint] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Feedback_Dim] FOREIGN KEY([feedback_id])
REFERENCES [dbo].[Feedback_Dim] ([feedback_id])
GO

ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Feedback_Dim]
GO

ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Order_Dim] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_Dim] ([order_id])
GO

ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Order_Dim]
GO

ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Payement_Dim] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payement_Dim] ([payment_id])
GO

ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Payement_Dim]
GO

ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Product_Dim] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product_Dim] ([product_id])
GO

ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Product_Dim]
GO

ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_Seller_Dim] FOREIGN KEY([seller_id])
REFERENCES [dbo].[Seller_Dim] ([seller_id])
GO

ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_Seller_Dim]
GO

ALTER TABLE [dbo].[Sales_Fact]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Fact_User_Dim] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_Dim] ([user_id])
GO

ALTER TABLE [dbo].[Sales_Fact] CHECK CONSTRAINT [FK_Sales_Fact_User_Dim]
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--6-Seller_Dim_Table
CREATE TABLE [dbo].[Seller_Dim](
	[seller_id] [varchar](254) NOT NULL,
	[seller_zip_code] [bigint] NULL,
	[seller_city] [varchar](254) NULL,
	[seller_state] [varchar](254) NULL,
 CONSTRAINT [PK_Seller_Dim] PRIMARY KEY CLUSTERED 
(
	[seller_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--7-User_Dim
CREATE TABLE [dbo].[User_Dim](
	[user_id] [varchar](254) NOT NULL,
	[user_zip_code] [bigint] NULL,
	[user_city] [varchar](254) NULL,
	[user_state] [varchar](254) NULL,
 CONSTRAINT [PK_User_Dim] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------







