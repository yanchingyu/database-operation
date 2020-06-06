from selectGame import *
from dataGame import *

SELECT_GRAMMAR = '''
--------------------------------------------------------
| 搜尋語法: select 欄位名稱 from 表格名稱 where 條件式
--------------------------------------------------------
'''

def showTable(mysqldb, cursor):
    print(scheme)   ## 有哪些table

    while(1):
        table = input('\n<<< 選擇要查找的表格: ')
        if table in gameprojects.keys():
            sql = '''SELECT * FROM {table}'''.format(table = table)
            sel(mysqldb, cursor, sql, NUMBER)
        else:
            print('\n<<< 沒有這個table，請重新輸入 >>>')

        if int(input(CONTINUE)) == 0:
            return MENU

def select(mysqldb, cursor, SELECT_GRAMMAR = SELECT_GRAMMAR):
    if printTable() == '88':   ## 選擇要查看的table
        return MENU
    
    print(SELECT_GRAMMAR)
    while(1):
        search = input(SELECT)
        form = input(FROM)
        have_condition = int(input(HAVE_WHERE)) ## 詢問是否有where

        sql = 'SELECT ' + search + ' FROM ' + form
        if have_condition == True:
            condition = input(WHERE)
            sql += ' WHERE ' + condition      

        print(CORRECT.format(grammar=sql), end='') ## 語法
        have = int(input(TRUE_FALSE))   ## 語法是否正確
        if have == True:    ## 語法正確就搜尋資料
            sel(mysqldb, cursor, sql, NUMBER)
        
        if int(input(CONTINUE)) == 0:
            return MENU
            
def text(mysqldb, cursor):
    print('\n\n<<< Search Action~~ >>>')
    return select(mysqldb, cursor)
