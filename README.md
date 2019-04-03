# bamazon

## Description

bamazon is a back-end application that runs on the command line and simulates an ecommerce store.

In the Bamazon customer module, you can choose from list of supplies and specify the amount of that item to order. The total cost is calculated based on the number of units ordered plus 7% sales tax. The supply ordered is deducted from the inventory and revenue from sale is added to the total product sales for that item in the database.

In the bamazon manager module, you select from a list of actions including 'View Product List', 'View Low Inventory List', 'Add Inventory', and 'Add New Product'. The "View" options retrieve information from the database and display in a formatted table in the command line. The "Add" options ask what product and the amount of inventory you would like to add or the details of the new product and update the database with the new information.

## Setup
To run the Bamazon app, clone the repository and set up a locally hosted mysql database.

Install Node Modules: npm install<br>
Use the bamazon-schema.sql to create the database and tables in mysql.<br>
Use the bamazon-seeds.sql to insert the data into the products table.<br>
Add password and if necessary change host, port or user values in connect.js file.<br>
var connection = mysql.createConnection({<br>
host: 'localhost',<br>
port: 3306,<br>
user: 'root',<br>
password: '**Password**',<br>
database: 'bamazon'<br>
});

## **Attaching screenshot and GIF demonstarating the functioning:**

### `bamazonCustomer`
### Screenshot
![GitHub Logo](amazon-customer.PNG)


### **GIF**
![](amazon-customer.gif)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### `bamazonManager`

### `View products for sale`
### Screenshot
![GitHub Logo](view-products-manager.PNG)


### **GIF**
![](view-products-manager.gif)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### `View Low inventory`
### Screenshot
![GitHub Logo](low-inventory.PNG)


### **GIF**
![](view-low-inventory.gif)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### `Add to inventory`
### Screenshot
![GitHub Logo](add-to-inventory.PNG)


### GIF
![](add-to-inventory.gif)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### `Add New Product`
### Screenshot
![GitHub Logo](add-new-product.PNG)


### **GIF**
![](add-new-product.gif)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Program Logic

### `bamazonCustomer`
* imported packages mysql to access  MySQL database and imported inquirer to provide the user interface and the inquiry session flow.
* importied js file connect.js to establish connection to database
* Established connection to mysql db and callied function getProductList()
* function getProductList()
    - Selected all the records from products table and called function queryCustomer(data)
* function queryCustomer(data)
    - Using inquirer asking the customers to select the item to order, then called function itemTypeMessage(selectedItem)
* function itemTypeMessage(selectedItem)
    - asks the customer to enter the number of items that they want to order and calls function promptQuantity(item, question)
* function promptQuantity(item, question)
    - checks if ordered quantity is less than available stock  and calls function completeOrder(item, response.amount)
* function completeOrder(item, response.amount)
    - using inquirer confirming if customer wants to order the item and calculated the total price for ordered items and remaining stock, then calls function continueShopping()
* function continueShopping()
    - using inquirer asking if customer wants to continue shopping
    - if no, ending the connection
    - if yes, calling initial function getProductList

### `bamazonManager`
* imported cli-table to render tables on the command line from node.js scripts
* imported packages mysql to access  MySQL database and imported inquirer to provide the user interface and the inquiry session flow.
* importied js file connect.js to establish connection to database
* Established connection to mysql db and calling function promptAction()
* function promptAction()
    - Using inquirer asking the customers to select what action you would like to complete
        - if user choose 'View Products for Sale', calling function viewAllProducts();
        - if user choose 'View Low Inventory', calling function lowInventoryList();
        - if user choose 'Add to Inventory', calling function addInventory();
        - if user choose 'Add New Product', calling function addNewProduct();
* function viewAllProducts()
    - Selecting all the records from product table using Select query and rendering it as table on command line using cli-table
* function lowInventoryList()
    - Selecting all the low inventory records from product table using Select query with condition stock_quantity < 5 and rendering it as table on command line using cli-table
* function addInventory()
    - Using inquirer asking to 'Specify item and amount of stock to add' and using update query updating stock_quantity for that item in product table
* function addNewProduct()
    - Using inquirer asking to 'Specify name,department,price,stock quantity' and using insert query inserting new item as new record into product table
