


# StoreTracker Design Document
-   Project’s title: **StoreTracker**
-   Name: Sander Sierra
-   Github: Xan007
-  edX: SanderSierra
-  Location: Villavicencio, Colombia

## Scope

The database for this **store** includes all entities necessary to facilitate the management of customers, products, and transactions, ensuring the smooth operation of day-to-day activities. The scope of the database includes:

-   **Customers**, with basic identifying information such as name, contact details, phone number, and address to track customer transactions and engagement.
-   **Categories**, which classify products into groups (e.g., beverages, snacks, produce).
-   **Suppliers**, detailing the companies responsible for providing products to the supermarket.
-   **Products**, containing information about each item that can be sold. The information contains name, price, description, associated category, and supplier.
-   **Invoices**, linking customers to products purchased and tracking details such as quantity, date of purchase.
-   **Invoice Items**, which track the individual products purchased within each invoice, enabling the system to manage multiple items per transaction.

Out of scope are elements like purchases from suppliers, including transactions where the supermarket buys products from suppliers, as well as employee management, such as roles, schedules, and payroll details.

## Functional Requirements

This database will support:

-   Managing CRUD operations for customers, products, categories, suppliers, and invoice items, ensuring accurate and up-to-date records for store operations.
-   Tracking customer purchases through invoices and invoice items, with the ability to manage multiple products in a single transaction.
-   Analyzing customer spending patterns by category and identifying trends in product popularity based on purchase history.
-   Categorizing products by type and supplier to simplify inventory management.

Note that in this iteration, the system will not support tracking purchases from suppliers or managing employee-related data.

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The database includes the following entities:

#### Customers

The `customers` table includes:

-   **`customer_id`**: Specifies the unique ID for each customer as an `INTEGER`. This column is the `PRIMARY KEY` to ensure uniqueness.
-   **`first_name`**: Stores the customer's first name as `TEXT`, suitable for descriptive fields.
-   **`last_name`**: Stores the customer's last name as `TEXT`.
-   **`phone_number`**: Stores the customer's phone number as `TEXT` to handle different formats.
-   **`address`**: Captures the customer's address as `TEXT` for record-keeping purposes.

All columns in the `customers` table are required to manage customer information efficiently.

#### Categories

The `categories` table includes:

-   **`category_id`**: Specifies the unique ID for each category as an `INTEGER`, with the `PRIMARY KEY` constraint applied.
-   **`name`**: Represents the category name as `TEXT`.

The `categories` table allows products to be grouped logically for better organization.

#### Suppliers

The `suppliers` table includes:

-   **`supplier_id`**: Specifies the unique ID for each supplier as an `INTEGER`, with the `PRIMARY KEY` constraint.
-   **`name`**: Stores the supplier's name as `TEXT`.
-   **`email`**: Stores the supplier's email address as `TEXT`.
-   **`website_url`**: Stores the supplier's website URL as `TEXT`.
-   **`address`**: Records the supplier's address as `TEXT`.

This table provides the means to track the origins of the products.

#### Products

The `products` table includes:

-   **`product_id`**: Specifies the unique ID for each product as an `INTEGER`, with the `PRIMARY KEY` constraint applied.
-   **`name`**: Represents the product's name as `TEXT`, with the `NOT NULL` constraint to ensure the name is always provided.
-   **`price`**: Stores the price of the product as a `REAL`, suitable for financial values. This column has the `CHECK` constraint to ensure the price is always greater than or equal to 0 (`CHECK("price" >= 0)`).
-   **`description`**: Contains a brief description of the product as `TEXT`.
-   **`category_id`**: An `INTEGER` column with a `FOREIGN KEY` constraint referencing the `category_id` in the `categories` table to ensure valid categorization.
-   **`supplier_id`**: An `INTEGER` column with a `FOREIGN KEY` constraint referencing the `supplier_id` in the `suppliers` table to ensure a valid supplier association.

This table captures all essential details about the items sold.


#### Invoices

The `invoices` table includes:

-   **`invoice_id`**: Specifies the unique ID for each invoice as an `INTEGER`, with the `PRIMARY KEY` constraint applied.
-   **`customer_id`**: Specifies the ID of the customer making the purchase as an `INTEGER`. This column has a `FOREIGN KEY` constraint referencing the `customer_id` in the `customers` table.
-   **`date`**: Records the purchase date as a `NUMERIC` with a default value of `CURRENT_TIMESTAMP`.

The `invoices` table links customers to their purchases, enabling transaction tracking and analysis. The `invoice_id` is the unique identifier for each invoice, ensuring that each transaction is uniquely identified.

----------

#### Invoice Items

The `invoice_items` table includes:

-   **`invoice_id`**: Specifies the unique ID for each invoice item as an `INTEGER`. This column is part of the composite primary key and has a `FOREIGN KEY` constraint referencing the `invoice_id` in the `invoices` table.
-   **`product_id`**: Specifies the ID of the product purchased as an `INTEGER`. This column is part of the composite primary key and has a `FOREIGN KEY` constraint referencing the `product_id` in the `products` table.
-   **`quantity`**: Captures the quantity of the product purchased as an `INTEGER`, with a `CHECK` constraint to ensure the quantity is always greater than or equal to 0 (`CHECK("quantity" >= 0)`).

The `invoice_items` table allows each invoice to track multiple products, including the quantity purchased. The composite primary key, composed of both `invoice_id` and `product_id`, ensures that each product in an invoice is uniquely identified.
  
### Relationships
The entity relationship diagram below illustrates the relationships between the entities in the database.

[![](https://mermaid.ink/img/pako:eNp1UV1rgzAU_SvhPtuitiYub8PKENZZWjvYEEqqWSvTRPyAdep_X_pht0qXl-ScnHvuPUkDkYw5UODFLGG7gmWhQGo561Xgz90las64O2_ey6vvOe6AXSz92doJBqzzGLhP_vJtQK_Wi8Wz95_zxgvc-Z-rwTRtOxrJ5joGRXnKIl7eDncUtc2tI0WRFBVLRHmn3aWgj0FRIqK0jnvfnu-kkrW_uSja8lSKXbmp5F3lNSpFZZ3nacLjzfYQCtAg40XGklg9_ClrCNWeZzwEqo4xKz5DCEWndKyu5OogIqBVUXMNClnv9kA_WFoqVOcxq_jl465szsS7lFlfoiDQBr6AGsQeT7FtTQzd1olBHkwNDkBH2Jwq3rQs29JNbBik0-D75GCMyQTrum1gYmJsTy3S_QAb1aSp?type=png)](https://mermaid.live/edit#pako:eNp1UV1rgzAU_SvhPtuitiYub8PKENZZWjvYEEqqWSvTRPyAdep_X_pht0qXl-ScnHvuPUkDkYw5UODFLGG7gmWhQGo561Xgz90las64O2_ey6vvOe6AXSz92doJBqzzGLhP_vJtQK_Wi8Wz95_zxgvc-Z-rwTRtOxrJ5joGRXnKIl7eDncUtc2tI0WRFBVLRHmn3aWgj0FRIqK0jnvfnu-kkrW_uSja8lSKXbmp5F3lNSpFZZ3nacLjzfYQCtAg40XGklg9_ClrCNWeZzwEqo4xKz5DCEWndKyu5OogIqBVUXMNClnv9kA_WFoqVOcxq_jl465szsS7lFlfoiDQBr6AGsQeT7FtTQzd1olBHkwNDkBH2Jwq3rQs29JNbBik0-D75GCMyQTrum1gYmJsTy3S_QAb1aSp)

As described in the diagram:

-   A **customer** can have 0 to many **invoices**, as a customer may or may not make a purchase. Each **invoice** is associated with one and only one **customer**.
-   An **invoice** can contain many **invoice items**, and each **invoice item** is associated with exactly one **product**. A **product** can appear in many **invoice items**, depending on how often it is purchased.
-   A **product** belongs to one and only one **category**, while a **category** can contain 0 to many **products**.
-   A **product** is supplied by one and only one **supplier**, but a **supplier** can supply 0 to many **products**.

## Optimizations

To optimize the performance of the database, the following indexes and views were created based on common query patterns.

### Indexes

1.  **Index on `first_name` and `last_name` in the `customers` table**: Since queries often retrieve customer information based on name, an index was added to speed up searches by first and last name.
    
2.  **Index on `customer_id` in the `invoices` table**: Since invoices are frequently queried by `customer_id`, indexing this column improves performance when retrieving all invoices for a particular customer.
    
3.  **Index on `name` in the `categories` table**: Since queries often search for categories by name, an index on this column speeds up searches for specific categories.
    
4.  **Index on `category_id` in the `products` table**: Products are frequently filtered by `category_id`, so an index on this column ensures fast retrieval of products within a specific category.
    
5.  **Index on `supplier_id` in the `products` table**: Queries that filter products by supplier benefit from this index, improving search performance for products from a particular supplier.
    
6.  **Index on `product_id` in the `products` table**: As `product_id` is often used for lookups, an index on this column speeds up searches for specific products.
    
7.  **Index on `invoice_id` in the `invoice_items` table**: Since invoices are frequently joined with invoice items, this index improves performance when retrieving items related to a specific invoice.
    
8.  **Index on `product_id` in the `invoice_items` table**: This index accelerates joins between `invoice_items` and `products`, speeding up queries that involve product details for invoice items.
    

### Views

1.  **`invoice_totals` view**: This view precomputes the total sales for each invoice, reducing the need to repeatedly join `invoice_items` and `products` and perform aggregation in queries.
    
2.  **`category_sales` view**: This view precomputes the total number of products sold per category, simplifying queries that need to calculate sales by category.
    

By creating these indexes and views, we target the most frequent query operations, ensuring that the database performs efficiently when accessing customer data, invoices, products, and sales totals.


## Limitations

The current schema assumes simple transactions without support for discounts, promotions, or product returns. To handle these, a discount system or return mechanism would need to be added, potentially through new tables or adjustments to the `invoice_items` table. Additionally, there is no way to track historical product data, such as pricing or availability changes over time. To address this, a separate table for price history or inventory adjustments would be required.