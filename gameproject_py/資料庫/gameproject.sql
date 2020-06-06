-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 
-- 伺服器版本： 10.4.10-MariaDB
-- PHP 版本： 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `gameproject`
--

-- --------------------------------------------------------

--
-- 資料表結構 `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URL` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisherid` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publisherid` (`publisherid`)
) ENGINE=MyISAM AUTO_INCREMENT=2014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `agent`
--

INSERT INTO `agent` (`id`, `name`, `URL`, `publisherid`) VALUES
(2001, 'Garena', 'https://www.garena.tw/', 1001),
(2002, 'Blizzard Entertainment', 'https://www.blizzard.com/zh-tw/', 1002),
(2003, 'Gameflier International Corp', 'https://gf2.gameflier.com/', 1003),
(2004, 'Steam', 'https://store.steampowered.com/', 1004),
(2005, 'NC Taiwan', 'http://www.nctaiwan.com/', 1005),
(2006, 'NEXON', 'https://tw.nexon.com/main/zh', 1006),
(2007, 'beanfun', 'https://tw.beanfun.com/', 1007),
(2008, 'Electronic Arts', 'https://www.ea.com/zh-tw', 1008),
(2009, 'Game First International Corp.', 'https://www.gamefirst.com.tw/', 1002),
(2010, 'Butterfly Digital Entertainment', 'http://www.bfage.com/pc/zh/index.html#', 1009),
(2011, 'X-Legend Entertainment Corp', 'http://www.x-legend.tw/', 1010),
(2012, 'NCsooft', 'https://kr.ncsoft.com/cn/index.do', 1011),
(2013, 'Happytuk', 'https://www.mangot5.com/Index', 1012);

-- --------------------------------------------------------

--
-- 資料表結構 `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online` tinyint(1) DEFAULT NULL,
  `multiplayer` tinyint(1) DEFAULT NULL,
  `price` int COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` date DEFAULT NULL,
  `message` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisherid` int(15) DEFAULT NULL,
  `agentid` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publisherid` (`publisherid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=3018 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `games`
--

INSERT INTO `games` (`id`, `type`, `name`, `online`, `multiplayer`, `price`, `time`, `message`, `publisherid`, `agentid`) VALUES
(3001, 'MOBA', 'League of Legends', 1, 1, 0, '2009-10-27', '「英雄聯盟」是一款獲獎無數，在全世界引起廣大風潮的 MOBA 類型遊戲，在「英雄聯盟」的戰鬥裡，你最重要的任務就是與你的團隊攜手合作，像剝洋蔥般逐層突破敵方的防線，最終摧毀敵人的「主堡」來贏得勝利！當然你的敵人也不會坐視不管，他們會竭盡所能的阻止你，並且運用各種可能的戰術來試圖擊敗你的隊伍。戰鬥主要是以「英雄」為重心，而玩家則是扮演天賦異稟的「召喚師」。召喚師懂得強大的召喚魔法，能將自己的意志與英雄合而為一，進而操控英雄在戰場上奮戰。召喚師同時也懂得藉由各種特殊的「召喚師技能」、「天賦」與「符文」來強化自己所操控英雄的作戰能力。每位召喚師都能夠藉由各種戰鬥來累積自己的經驗並提昇「召喚師等級」，每當「召喚師等級」提昇後，召喚師便能獲得更多的「天賦點數」、「召喚師技能」與「符文插槽」。', 1001, 2001),
(3002, 'FPS', 'OverWatch', 1, 1, 1300, '2016-05-24', '《鬥陣特攻》是一個6v6的多人團隊遊戲。就像一個多人線上戰鬥競技遊戲一樣，玩家可以從幾個角色中選擇一個，每個角色都有自己獨特的能力和風格，依據定位可分為四型：攻擊型角色擁有較高的速度及攻擊力，但他們也會因此犧牲部分裝甲；而防禦型與輔助型角色可以掐住敵人的重要道路，並為隊友提供屬性加成、治療或其他幫助；肉盾則擁有極高的護甲和命中率來阻擋敵人攻擊。玩家在遊戲中死亡後可以切換角色——這是遊戲設計所鼓勵的。遊戲的地圖靈感來源於現實世界。已經公佈的十二個地圖分別來源於英國、日本和古埃及等。', 1002, 2002),
(3003, 'MMORPG', 'swords of legends online', 1, 1, 0, '2019-07-11', '《古劍奇譚網路版》採用互動性更強的ARPG戰鬥模式，由於加入了動作要素，遊戲將具有更爽快的操作感和打擊感，也更強調玩家之間的配合與協作，真實玩家的互動也會給戰局帶來更豐富的變化。《古劍奇譚網路版》的遊戲世界將會涉及到神州大地上幾乎所有的地方。玩家可以在龐大的遊戲世界裡，體驗豐富多彩的人間萬象。《古劍奇譚網路版》在重視傳統網路遊戲的成長、戰鬥系統之餘，還將加入多種輔助系統，並由此衍生出不同風格的遊戲方式。', 1003, 2003),
(3004, 'FPS', 'Counter-Strike: Global Offensive', 1, 1, 0, '2012-08-21', '大致分為3種玩法，死鬥模式：相信是最簡單易懂的模式，選擇一個隊伍，然後看到敵對角色就開槍打他，殺死一個敵人獲得分數，直到時間結束，分數最高的人獲得MVP。休閒模式：你可以把它當做CS的經典模式，槍枝需要金錢購買，每回合會依照前一局的結果獲得金錢，輸的隊伍獲得比較少，贏的隊伍比較多，若隊伍連敗則每回合獲得的金錢會少量增加。競技模式：競技模式限定的5vs5人數，相當要求報位，掩護隊友、聽腳步聲、擲彈技巧也是必備，十勝之後，將會得到軍階，可以大致知道自己的實力分布位置。', 1004, 2004),
(3005, 'MMORPG', 'Blade & Soul', 1, 1, 0, '2012-06-21', '劍靈：革命繼承了PC原作的精彩故事和龐大世界觀，將經典故事劇情一一重現，玩家可以在龍族、人族、靈族、天族之間選擇自己喜歡的職業，踏上自己的復仇之路。玩家將可以在電腦上回味代表性的「輕功」系統，在天空、大地、水面、原野之間自由賓士。 你還可以用BlueStacks在電腦上下載劍靈：革命，在高解析度大螢幕上繼續探索龐大的劍靈世界，探索「比武」PVP系統、勢力戰爭、16人副本、野外BOSS、升龍穀、幻影盆地等新鮮有趣的遊戲玩法！', 1005, 2005),
(3006, 'MMORPG', 'Moonlight Blade', 1, 1,0, '2016-07-01', '《天涯明月刀》遊戲中共有十大門派，分別是太白、唐門、真武、天香、丐幫、神威、神刀、五毒。玩家可以隨意選擇一個門派。每個門派都有不同的武器和技能。遊戲中裝備從低到高分別是凡品（白色）、良品（綠色）、上品（藍色）、絕品（紫色）和極品（橙色）。裝備可通過副本、打怪跌落或者任務獲取。最容易獲得的是每天2次當前等級副本掉落，裝備為綁定屬性。40級的夜探副本不出紫武器和紫職業裝備；50級的郡王府副本出紫色武器和每個職業的紫色裝備並且不區分職業；60級的龍首山副本掉落紫馬，不綁定。擊殺野外BOSS掉裝備，難度較高。萬象門兌換的裝備為紫裝，沒有鑑定屬性，還可以收購其他玩家挖寶挖出的紫武器。', 1006, 2006),
(3007, 'MMORPG', 'MapleStory', 1, 1, 0, '2005-06-02', '楓之谷是橫向捲軸平面動作遊戲，使用電腦鍵盤和滑鼠進行操作。通過鍵盤可以完成各種遊戲操作，玩家也可自訂鍵盤快捷鍵，釋放機能或者打開不同介面。滑鼠主要用來與非玩家角色進行互動或者使用物品。如大多數大型多人線上角色扮演遊戲相同，遊戲的核心玩法是在地城冒險，擊殺怪物。通過消滅怪物完成任務，獲取遊戲內金幣\"Mesos\"、經驗值和各種物品。玩家通過學習遊戲內專業技術，製造裝備、視訊或者藥水。作為多人線上遊戲，遊戲提供多種與其他玩家交互的方法。玩家之間可以組成隊伍一起狩獵，異性之間可以結婚成為情侶，組建公會。除此以外，玩家之間可以相互增減名譽度，也可以一起遊玩諸如五子棋或翻牌的小遊戲。玩家之間可以使用遊戲內金幣進行交易。', 1007, 2007),
(3008, 'Racing', 'CrazyRacing KartRider', 1, 1, 0, '2006-12-19', '跑跑卡丁車首創漂移按鍵，且在遊戲手感和數據上充分模擬物理原理，打造“全民漂移”的理念。遊戲角色延續使用了泡泡堂中的人物，角色可以駕駛卡丁車在城鎮、森林、沙漠、冰河、墓地、礦山等29個主題的數百條賽道上進行遊戲。跑跑卡丁車分為多人遊戲和單人遊戲，其中多人遊戲包括道具賽、競速賽、挑戰賽、GP賽以及RP賽，單人遊戲包括計時賽、駕照考試、故事模式以及挑戰者模式。', 1007, 2007),
(3009, 'FPS', 'Apex Legends', 1, 1, 0, '2019-02-04', '《Apex英雄》適用經典的大逃殺遊戲規則，但加入了英雄系統。遊戲背景設定在《泰坦降臨2》的30年以後。遊戲中並不會出現泰坦，但包含了很多《泰坦》的元素和特徵。遊戲以3人小隊為單位進行遊戲，每局遊戲最多有60人（目前新增了雙排模式）。每位玩家可以從十二位傳奇角色中選擇一位進行遊戲，每位英雄都有其獨特的技能，玩家可以自訂其外觀。隊伍空投落地後需要尋找武器、彈藥及其他裝備，小隊間互相戰鬥至最後存活一隊為勝。遊戲特有復活系統，如有隊友死亡，玩家可以在時限內(90s)取得陣亡隊友的旗幟，並將其攜至重生點即可復活隊友。同時，遊戲也設有較為詳細的標記功能，也可進行隊伍語音。', 1008, 2008),
(3010, 'ARPG', 'Diablo III', 1, 1, 1150, '2012-05-15', '戰鬥是《暗黑破壞神III》的主要核心。隨時都會有怪物從暗處竄出、成群結隊衝向你，或是挖洞躲藏在你的腳下。你能聽見螢幕範圍外的怪物在黑暗中發出的聲音，而且就算你掉頭逃跑，許多怪物還是會繼續窮追不捨。在《暗黑破壞神III》中，怪物分為普通、勇士（Champion）、稀有（Rare）、獨特（Unique），分別以白色、藍色、黃色、紫色名字顯示，所以玩家們可以選擇7種職業：力量：野蠻人、聖教軍(需資料片《奪魂之鐮》)；敏捷：武僧、狩魔獵人；智力：巫醫、秘術師、死靈法師(需購買數位組合包《死靈法師的崛起》)，來對抗各式各樣的怪物。', 1002, 2009),
(3011, 'MMORPG', 'Age of WuShu', 1, 1, 0, '2012-08-08', '《九陰真經Online》是由中國大陸遊戲開發商遊戲蝸牛開發的多人在線角色扮演遊戲。遊戲特色，武功的學習不再侷限於某個門派，亦有其他各種江湖武功可供玩家選擇。如果玩家修為較高，則可自行領悟一些招式，可透過選擇門派、買賣、奪書、挑戰禁地、奇遇...獲得。內功在遊戲中扮演重要角色。建議天天團練並把疲勞度弄滿100%、天天演武，平時(上線時)則點內修。內功有分成江湖內功、門派內功，無論是什麼內功都十分重要，且可能會依內功比較玩家實力與切磋時的勝率，所以練好內功是十分重要的。遊戲採用了明朝的著名景色以及現代中國的風景，再結合遊戲的世界觀，對場景中的各種元素進行定義詮釋。', 1009, 2010),
(3012, 'MMORPG', 'Finding Neverland Online', 1, 1, 0, '2012-06-28', '《聖境傳說FNO》以「注重角色扮演與社群本質」為主要之設計概念，可愛的角色風格、豐富的遊戲系統等等皆能為玩家帶來全新的不同體驗。玩家將會在遊戲中碰到各種不同的種族：鼠人、熊人、龜人、蛙人、蜥蜴龍人、獸人及野豬人等等。每個種族各有著截然不同的背景文化，連建築風格也是各個獨樹一格，將世界觀完整呈現。職業設計方面，擁有15種以上的職業供玩家選擇，並且還可隨時隨地依需求變換，使玩家在進行遊戲的同時不但能體會到各種職業所帶來的不同樂趣，更重要的是－大大提高了每個玩家面臨團隊需求時的配合度。讓遊戲回歸角色扮演最初的本質：毫無壓力地玩出屬於自己的個人特色。', 1010, 2011),
(3013, 'MMORPG', 'Glory Destiny Online', 1, 1, 0, '2011-07-07', '《晴空物語》是由台灣傳奇網路所研發的一款大型多人在線角色扮演遊戲，故事描述位於世界中心的南北大陸所發生的戰事。在《晴空物語》的世界，每個種族都是遠古神獸的後代，玩家在戰鬥過程中可以累積特殊的能量，當能量值滿時，將可在短暫的時間內，讓體內的神獸血統覺醒，化身為擁有強大力量的神獸給予敵人致命一擊。', 1010, 2011),
(3014, 'MMORPG', 'Aura Kingdom', 1, 1, 0, '2013-08-08', '《幻想神域》裡玩家可以透過主副武器選擇來打造屬於自己的戰鬥定位，不同武器的技能各有不同，有的強調傷害輸出、有的擅長團隊輔助。在戰鬥時你將不用切換武器，就能隨意使用主、副武器的所有技能，讓戰鬥的連招搭配更加自由、豐富。透過冒險之路系統，你可以學習各種被動技能來打造屬於自己的獨特能力，根據學習路線你將有機會學習到雙武器的強力組合技能，無論是培養暴力輸出或是攻防一體的角色皆能讓你自由選擇。', 1010, 2011),
(3015, 'MMORPG', 'Guild Wars 2', 1, 1, 1950, '2012-08-28', '《激戰2》擁有展開可覆蓋現實世界114平方公里土地的龐大地圖面積，以及兩千多處地圖探索點等候你的足跡光臨。而橫亙在你的英雄之路上的敵人，將是改變大陸形狀，掀起洪水與風暴的上古巨龍！3個服務器（世界）之間，兩千人同時參與的空前規模的戰爭！你從未見過的宏大氣魄。龐大多變的戰場類型。有恢宏壯闊的國戰地圖，也有遭遇戰和偷襲戰等局部戰爭。畫面以頂尖物理引擎Havok打造。從神祐之城的一磚一石，到北國雪原搖曳的極光；從硝煙繚繞的鋼鐵城塞，到萬丈波濤下的海底古城……所有細節纖毫畢現，讓你領略這個世界會呼吸的生命力。', 1011, 2012),
(3016, 'MMORPG', 'TERA', 1, 1, 0, '2012-11-22', '《TERA》遊戲最大特色在於「非鎖定目標」（Non-Targeting）攻擊，不同於現在的線上遊戲是先決定攻擊的目標再發動攻擊的模式，研發團隊希望藉此讓玩家體驗戰鬥的最大真實感。而「7 大種族、13 大職業」為另一遊戲特色，共計可搭配出多種截然不同的男女性別角色。無論是我行我素的「卡斯塔尼克」（男、女）、溫順憨厚的「波波利」（限男）、可愛萌人的蘿莉「艾琳」（限女）、無堅不摧的「亞曼」（男、女）、深思熟慮的「巴拉卡」（限男）、高傲自大的「高等精靈」（男、女）、滿腹雄心壯志的「人類」（男、女）等7大特殊種族，還是劍鬥士、槍騎士、狂戰士、屠殺者、弓箭手、魔導士、祭司、元素使、飛劍士、魔工師、魔拳師、忍者、月光武士 等 13 大多元化職業，任玩家自由搭配選擇，創造出獨具個人風格的角色。', 1012, 2013),
(3017, 'ARPG', 'Path of Exile', 1, 1, 0, '2014-08-14', '《流亡黯道》最大的特色即為其龐大且複雜的天賦樹，目前有1325個天賦點可供選擇，起始選擇的角色將會決定天賦樹的起始位置，但不會影響天賦點可否點選，在遊戲中天賦點的點選影響極大，若無整體且一致性的規劃，將會導致角色失去特色而有如四不像。目前遊戲有十個章節，在每個章節初皆有供玩家短暫停留的城鎮或營地，玩家可在此處補充戰力，並可與NPC進行交流，而除了這些城鎮外，若非組隊，每位玩家會進入到各自的地圖，而每次生成的地圖皆有可能與之前生成的不同，如旋轉90度等差異，在地圖中亦有可能隨機出現「大師」任務以及副本，這也相當程度的提高了可玩性。在玩家突破了目前的所有章節後將被傳送到下一難度的地圖繼續挑戰，新的難度將會有更強大的怪物，並且死亡時會扣除經驗值。', 1013, 2001);

-- --------------------------------------------------------

--
-- 資料表結構 `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `country`) VALUES
(1001, 'Riot Games', 'United States'),
(1002, 'Blizzard Entertainment', 'United States'),
(1003, 'Aurogon Info&Tech (Shanghai) Co., Ltd.', 'China'),
(1004, 'Valve Corporation', 'United States'),
(1005, 'NCsoft', 'Korea'),
(1006, 'Tencent', 'China'),
(1007, 'NEXON', 'Korea'),
(1008, 'Respawn Entertainment', 'United States'),
(1009, 'Snail', 'China'),
(1010, 'X-Legend Entertainment Corp', 'Taiwan'),
(1011, 'ArenaNet', 'United States'),
(1012, 'Krafton', 'Korea'),
(1013, 'Grinding Gear Games', 'New Zealand');

-- --------------------------------------------------------

--
-- 資料表結構 `website`
--

DROP TABLE IF EXISTS `website`;
CREATE TABLE IF NOT EXISTS `website` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisherid` int(15) DEFAULT NULL,
  `agentid` int(15) DEFAULT NULL,
  `gamesid` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gamesid` (`gamesid`),
  KEY `agentid` (`agentid`),
  KEY `publisherid` (`publisherid`)
) ENGINE=MyISAM AUTO_INCREMENT=4018 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `website`
--

INSERT INTO `website` (`id`, `name`, `URL`, `telephone`, `publisherid`, `agentid`, `gamesid`) VALUES
(4001, 'League of Legends', 'https://lol.garena.tw/', '(02) 7735-2000', 1001, 2001, 3001),
(4002, 'OverWatch', 'https://playoverwatch.com/zh-tw/', '(02) 8170-5157', 1002, 2002, 3002),
(4003, 'Swords of legends online', 'https://gj.gameflier.com/index.aspx', '(02) 2788-0875', 1003, 2003, 3003),
(4004, 'Counter-Strike: Global Offensive', 'https://blog.counter-strike.net/', NULL, 1004, 2004, 3004),
(4005, 'Blade & Soul', 'http://tw.ncsoft.com/bns/index/', '(02) 6620-0500', 1005, 2005, 3005),
(4006, 'Moonlight Blade', 'https://tw.nexon.com/sky/zh/home/', NULL, 1006, 2006, 3006),
(4007, 'MapleStory', 'https://tw.beanfun.com/maplestory/main.aspx', '(02)2192-6100', 1007, 2007, 3007),
(4008, 'CrazyRacing KartRider', 'https://tw.beanfun.com/kartrider/game_intro09.htm', '(02)2192-6100', 1007, 2007, 3008),
(4009, 'Apex Legends', 'https://www.ea.com/zh-tw/games/apex-legends/about/characters', NULL, 1008, 2008, 3009),
(4010, 'Diablo III', 'https://tw.diablo3.com/zh/', NULL, 1002, 2009, 3010),
(4011, 'Age of WuShu', 'http://9y.bfage.com/', '(02) 2528-5108', 1009, 2010, 3011),
(4012, 'Finding Neverland Online', 'http://www.fnonline.com.tw/', '(02) 7719-2888', 1010, 2011, 3012),
(4013, 'Glory Destiny Online', 'https://gd.x-legend.com.tw/', '(02) 7719-2888', 1010, 2011, 3013),
(4014, 'Aura Kingdom', 'https://ff.x-legend.com.tw/', '(02) 7719-2888', 1010, 2011, 3014),
(4015, 'Guild Wars 2', 'https://www.guildwars2.com/en/', NULL, 1011, 2012, 3015),
(4016, 'TERA', 'https://tera.mangot5.com/tera/index', NULL, 1012, 2013, 3016),
(4017, 'Path of Exile', 'https://web.poe.garena.tw/', NULL, 1013, 2001, 3017);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
