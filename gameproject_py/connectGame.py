from dataGame import *
import mysql.connector as mysql

import sys	 ##添加模組
sys.path.append("operation_set")

import search
import insert
import update
import delete

##def show(mysql, cursor):
##    cursor.execute('''Show tables''')
##    result = cursor.fetchall()
##    print('Tables: ', end = ' ')
##    for i in result:
##        print(i[0], end = ' ')

## 連接資料庫
def switch(mysqldb, cursor, num):
    if num == 1:
        print(search.showTable(mysqldb, cursor))
    elif num == 2:
        print(search.text(mysqldb, cursor))
    elif num == 3:
        print(insert.text(mysqldb, cursor))
    elif num == 4:
        print(update.text(mysqldb, cursor))
    elif num == 5:
        print(delete.text(mysqldb, cursor))
    elif num == 6:
        print("\n<<< 關閉資料庫中... >>>")
    else:
        print('\n<<< 意外錯誤 >>>')

def conn(name, pword, db, mysqldb = None, cursor = None):
    try:
        mysqldb = mysql.connect( 
                host = host,
                user = name,
                password = pword,
                database = db,
                raise_on_warnings = True,
                charset = 'utf8'
            )
    except Exception as e:
        print(e)
    else:
        if mysqldb.is_connected():
##            print('Database: ', db)
            cursor = mysqldb.cursor()
##            show(mysqldb, cursor)
    return mysqldb, cursor


if __name__ == '__main__':
    try:
        mysqldb, cursor = conn(username, password, database)
        if (mysqldb or cursor) is None:
            print('Connected is error!')
    except Exception as e:
        print(e)
