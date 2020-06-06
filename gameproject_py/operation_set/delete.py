from dataGame import *
from selectGame import *
import time

DELETE_GRAMMAR = ''' 
--------------------------------------------
| 刪除語法 : DELETE FROM 表格名稱 WHERE 條件式
--------------------------------------------
'''

def dele(mysqldb, cursor, drop):
    try:
        cursor.execute(drop)
        mysqldb.commit()
    except Exception as e:
        print(e)
    else:
        print('\n<<< 資料刪除成功 >>>')
        
def delete(mysqldb, cursor, DELETE_GRAMMAR = DELETE_GRAMMAR):
    while(1):
        print(scheme) ## 印出表格內容

        while(1):
            table = input('輸入要刪除的表格(離開請輸入: exit): ')
            if table != 'exit':
                print(DELETE_GRAMMAR + '\n')  ## 印出所選表格的屬性
                attribute = table + 'Attribute'
                if attribute in tableAttribute.keys():
                    print(tableAttribute[attribute])
                    break
                else:
                    print('<<< 輸入錯誤，請重新輸入 >>>')
            elif table == 'exit':
                return MENU
 
        have_conditions = int(input(HAVE_WHERE))    ## 詢問是否有where

        sql = '''DELETE FROM ''' + table
        if(have_conditions == 1):   ## 執行刪除指令
            sql += ' WHERE ' + input(WHERE)
            
        ## 刪除語法是否正確
        print(CORRECT.format(grammar=sql), end='')
        have = int(input(TRUE_FALSE))
        if have == 1:
            dele(mysqldb, cursor, sql)
        
        if int(input(CONTINUE)) == 0:   ## 執行完成，轉跳回主頁
            return MENU
    
def text(mysqldb, cursor):
    print('\n\n<<< Delele Action~~ >>>')
    return delete(mysqldb, cursor)
