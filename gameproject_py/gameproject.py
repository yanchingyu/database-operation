import time
from dataGame import *
from connectGame import *
      
while(1):
    print(features, end='')
    com = int(input('請輸入指令: '))
    
    try:
        if(0 < com and com < 7):
            (mysqldb, cursor) = conn(username, password, database)  ## 連接資料庫
            if (mysqldb, cursor) is not None:
                switch(mysqldb, cursor, com)
                time.sleep(3)
                if com == 6:
                    cursor.close()
                    mysqldb.close()
                    print('\n<<< 關閉成功 >>>')
                    break
            else:
                print('<<< 連接失敗 >>>')
                
        else:
            print('<<< error 請重新輸入 >>>')
            break
    except Exception as e:
        print(e)
