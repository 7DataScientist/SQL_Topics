import mysql.connector as conn

mydb = conn.Connect(user='root', password = 'admin123', host = '127.0.0.1',database = 'sty_py4')
cursor = mydb.cursor()

db = 'create database sty_py4;'
# cursor.execute(db)

# s_db = 'show databases;'
# cursor.execute(s_db)

# lt = cursor.fetchall()

# for i in lt:
#     print(i)

# tb = 'create table tb_py4(slno int, name varchar(50), phone_number int);'
# cursor.execute(tb)

i_tb = "insert into tb_py4 values(2, 'Singh', 560);"
# cursor.execute(i_tb)

mydb.commit()

s_tb = "select * from tb_py4;"
cursor.execute(s_tb)

# print(cursor.fetchall())

s_lt = cursor.fetchall()

for i in s_lt:
    print(i)
