from selectGame import *
from dataGame import *

UPDATE_GRAMMAR = '''
--------------------------------------------------------
| 修改語法: update 表格名稱 set 欄位=新值 where 條件式
--------------------------------------------------------
'''

def upd(mysqldb, cursor, modify):
    try:
        cursor.execute(modify)
        mysqldb.commit()
    except Exception as e:
        print(e)
    else:
        print('\n<<< 資料修改成功 >>>')

def update(mysqldb, cursor, UPDATE_GRAMMAR = UPDATE_GRAMMAR ):
    if printTable() == '88':   ## 選擇要查看的table
        return MENU

    print(UPDATE_GRAMMAR)
    while(1):
        update = input(UPDATE)
        Set = input(SET)
        have_condition = int(input(HAVE_WHERE)) ## 詢問是否有where
        
        sql = 'UPDATE ' + update + ' SET ' + Set
        if have_condition == True:
            condition = input(WHERE)
            sql += ' WHERE ' + condition
            
        ## 新增語法是否正確
        print(CORRECT.format(grammar=sql), end='') 
        have = int(input(TRUE_FALSE)) 
        if have == True:    ## 語法正確就修改資料
            upd(mysqldb, cursor, sql)
            
        if int(input(CONTINUE)) == 0:
            return MENU
        
def text(mysqldb, cursor):
    print('\n\n<<< Update Action~~ >>>')
    return update(mysqldb, cursor)
