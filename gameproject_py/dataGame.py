username = 'root'
password = 'aa131263'
database = 'gameproject'
host = 'localhost'

publisher = {
    'id': None,
    'name': None,
    'country': None,
}

agent = {
    'id': None,
    'name': None,
    'url': None,
    'publisherid': None,
}

website = {
    'id': None,
    'name': None,
    'url': None,
    'telephone': None,
    'publisherid': None,
    'agentid': None,
    'gamesid': None,
}

games = {
    'id': None,
    'type': None,
    'name': None,
    'online': None,
    'multiplayer': None,
    'price': None,
    'time': None,
    'message': None,
    'publisherid': None,
    'agentid': None,
}

primary = {
    'publisher': 'id',
    'agent': 'id',
    'website': 'id',
    'games': 'id',
}

gameprojects = {
    'publisher': publisher,
    'agent': agent,
    'website': website,
    'games': games,
}

foreign = {
    'agent': 'publisherid = publisher.id',
    'website': 'agentid = agent.id and publisherid = publisher.id and websiteid =website.id',
    'games': 'publisherid = publisher.id and agentid = agent.id',
}

NUMBER = 30 ## 幾筆資料

## -------------------------------介面--------------------------------

features = '''
----------------------------------
| 請選擇你要做的操作              
| 1. 各個表格全部資料                        
| 2. 搜尋                        
| 3. 新增                        
| 4. 修改                        
| 5. 刪除
| 6. 離開
----------------------------------
'''

scheme = '''
-----------------------------
| 請選擇要操作的table       
| publisher (廠商)          
| agent (代理商)            
| website (網站)            
| games (遊戲)              
-----------------------------
'''

## -----------------------------table屬性------------------------------

publisherAttribute = '''
------------------------
| =======開發商======= 
| 1.name (公司)  
| 2.country (國家)
------------------------
''' ## name varchar, country varchar

agentAttribute = '''
------------------------
| =======代理商======= 
| 1.name (公司)
| 2.url (公司網址)
------------------------
''' ## name varchar, url varchar

websiteAttribute = '''
------------------------
| =======網站======= 
| 1.name (遊戲官網)
| 2.url (遊戲網址)
| 3.telephone (電話)
------------------------
''' ## name varchar, url varchar,   telephone varchar

gamesAttribute = '''
------------------------
| =======遊戲======= 
| 1.type (類型)
| 2.name (名字)
| 3.online (是否為線上)
| 4.multiplayer (是否為多人遊戲)
| 5.price (價格)
| 6.time (製造日期)
| 7.message (訊息)
------------------------
''' ## type varchar, name varchar, online tinyint, multuplayer tinyint,
    ## price int, time date, message varchar

tableAttribute = {
    'publisherAttribute': publisherAttribute,
    'agentAttribute': agentAttribute,
    'websiteAttribute': websiteAttribute,
    'gamesAttribute': gamesAttribute,
}

## -------------------------------語法------------------------------

SELECT = '''
-----------------------------------------
| SELECT: '''

FROM = '''
-----------------------------------------
| FROM: '''

WHERE = '''
-----------------------------------------
| WHERE: '''

INSERT = '''
-----------------------------------------
| INSERT INTO: '''

VALUES = '''
-----------------------------------------
| VALUES: '''

UPDATE = '''
-----------------------------------------
| UPDATE: '''

SET = '''
-----------------------------------------
| SET: '''

DELETE = '''
-----------------------------------------
| DELETE FROM: '''

CORRECT = '''
-----------------------------------------
| 你的語法: {grammar}
-----------------------------------------
'''

## ----------------------------確認---------------------------------

HAVE_WHERE = '''
-----------------------------------------
| 有WHERE條件嗎? (true:1, false:0): '''

TRUE_FALSE = '\n語法是否正確?(true:1, false:0): '
CONTINUE = '\n是否繼續 (yes: 1, no: 0): '
MENU = "\n<<< 返回主頁面中... >>>" 
