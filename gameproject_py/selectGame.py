from dataGame import *
import pandas as pd
import mysql.connector as mysql

def sel(mysql, cursor, sql = None, number = 5):
    cursor.execute(sql)
    result = cursor.fetchall()
    fieldname = [i[0] for i in cursor.description]
    df = pd.DataFrame(result, columns = fieldname)
    print(df.head(number))

def printTable():
    print(scheme)
    
    while(1):
        table = input('輸入要操作的表格(開始操作輸入: 98, 離開: 88): ')
        if table == '88':
            return '88'
        elif table != '98':
            table = table + 'Attribute'
            if table in tableAttribute.keys():
                print(tableAttribute[table], '\n')
            else:
                print('\n<<< 輸入表格錯誤! 請重新輸入 >>>')
        else:
            break

if __name__ == '__main__':
    sql = '''SELECT * from publisher'''
    sel(mysqldb, cursor, sql)    






