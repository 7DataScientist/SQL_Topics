import mysql.connector

import logging
logging.basicConfig(filename="sql1.log",level=logging.INFO, format="%(levelname)s %(name)s %(message)s %(asctime)s")


mydb = mysql.connector.connect(user='root', password='admin123',host='127.0.0.1',database = "stu_py")               
cursor = mydb.cursor()

try:

    db3 = 'create database stu_py3;'
    cursor.execute(db3)

    db = 'create database stu_py;'
    cursor.execute(db)

    db1 = 'create database stu_py1;'
    cursor.execute(db1)

    # db2 = 'create database stu_py2;'
    # cursor.execute(db2)

except:
    logging.info("Already existing")

show_db = "show databases;"
cursor.execute(show_db)

lt = cursor.fetchall()
print(type(lt))

logging.info(lt)
logging.info("--"*30)


# for i in lt:
#     logging.info(i)

cursor.execute("use stu_py;")
mydb.commit()

cursor.close()

logging.info("DB closed")
print("DB closed")

