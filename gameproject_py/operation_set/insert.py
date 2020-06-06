from selectGame import *
from dataGame import *

INSERT_GRAMMAR = '''
---------------------------------------------
| 新增語法: INSERT INTO 表格名稱 VALUES (值)
---------------------------------------------
'''
##  commit資料到書據庫
def ins(mysqldb, cursor, insert):
    try:
        cursor.execute(insert)
        mysqldb.commit()
    except Exception as e:
        print(e)
    else:
        print('\n<<< 資料添加成功 >>>')

def insert(mysqldb, cursor, INSERT_GRAMMAR = INSERT_GRAMMAR):
    if printTable() == '88':   ## 選擇要查看的table
        return MENU
    
    print(INSERT_GRAMMAR) 
    while(1):
        sql = '''INSERT INTO {table} ({keys}) VALUES ({values})'''
        
        ## 表格名稱
        insert = input(INSERT)

        ## (括弧屬性)
        attributeList = list(gameprojects[insert].keys())
        attributeList.remove('id')
        keys = ','.join(attributeList)
        
        ## VALUES => 輸入
        attrlist = []
        values = ''
        for item in attributeList:
            if item in ['online', 'multuplayer', 'price']:
                values += ''.join(['%s'])
                attr = int(input('\n<<< %s: '% item))       
            else:
                values += ''.join(['\'%s\''])
                attr = input('\n<<< %s: '% item)
            values += ','
            attrlist.append(attr)
            
        values = values.rstrip(',')
        sql = sql.format(table=insert, keys=keys, values=values)
        sql = sql % tuple(attrlist)
        
        
        print(CORRECT.format(grammar=sql), end='')  ## 語法
        have = int(input(TRUE_FALSE))   ## 語法是否正確
        if have == True:
            ins(mysqldb, cursor, sql)    
        
        if int(input(CONTINUE)) == 0:
            return MENU       
                    
def text(mysqldb, cursor):
    print('\n\n<<< Insert Action~~ >>>')
    return insert(mysqldb, cursor)
