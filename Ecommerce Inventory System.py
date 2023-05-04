import mysql.connector

# database connection 
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="root",
    database="ecommerceinventorysystem"
)

# cursor object for running query 
cursor = conn.cursor()
# table1 details 
print("\n--- Customer Details --- ")
query = "SELECT * FROM Customer"
cursor.execute(query)
with open('cust.txt','w') as file:
    for ecommerceinventorysystem in cursor:
        file.write(str(ecommerceinventorysystem))
        file.write('\n')
cursor.execute(query)
result = cursor.fetchall()
for i in result:
    print(i)

#table2 details 
print("\n--- Customer Address Details --- ")
query = "SELECT * FROM CustomerAddress"
cursor.execute(query)
with open('custAdd.txt','w') as file:
    for ecommerceinventorysystem in cursor:
        file.write(str(ecommerceinventorysystem))
        file.write('\n')
cursor.execute(query)
result = cursor.fetchall()
for i in result:
    print(i)

#table3 details 
print("\n--- Employee Details --- ")
query = "SELECT * FROM Employees"
cursor.execute(query)
with open('emp.txt','w') as file:
    for ecommerceinventorysystem in cursor:
        file.write(str(ecommerceinventorysystem))
        file.write('\n')
cursor.execute(query)
result = cursor.fetchall()
for i in result:
    print(i)

#table4 details 
print("\n--- Supplier Details --- ")
query = "SELECT * FROM Suppliers"
cursor.execute(query)
with open('sup.txt','w') as file:
    for ecommerceinventorysystem in cursor:
        file.write(str(ecommerceinventorysystem))
        file.write('\n')
cursor.execute(query)
result = cursor.fetchall()
for i in result:
    print(i)

#table5 details 
print("\n--- Inventory Details --- ")
query = "SELECT * FROM Inventory"
cursor.execute(query)
with open('inve.txt','w') as file:
    for ecommerceinventorysystem in cursor:
        file.write(str(ecommerceinventorysystem))
        file.write('\n')
cursor.execute(query)
result = cursor.fetchall()
for i in result:
    print(i)

#table6 details 
print("\n--- Order Details --- ")
query = "SELECT * FROM Orders"
cursor.execute(query)
with open('ord.txt','w') as file:
    for ecommerceinventorysystem in cursor:
        file.write(str(ecommerceinventorysystem))
        file.write('\n')
cursor.execute(query)
result = cursor.fetchall()
for i in result:
    print(i)

#table7 details 
print("\n--- Sales Details --- ")
query = "SELECT * FROM Sales"
cursor.execute(query)
with open('sale.txt','w') as file:
    for ecommerceinventorysystem in cursor:
        file.write(str(ecommerceinventorysystem))
        file.write('\n')
cursor.execute(query)
result = cursor.fetchall()
for i in result:
    print(i)

#table8 details 
print("\n--- Shipment Details --- ")
query = "SELECT * FROM Shipment"
cursor.execute(query)
with open('ship.txt','w') as file:
    for ecommerceinventorysystem in cursor:
        file.write(str(ecommerceinventorysystem))
        file.write('\n')
cursor.execute(query)
result = cursor.fetchall()
for i in result:
    print(i)

    
# connection close
conn.close()

