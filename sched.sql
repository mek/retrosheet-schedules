--- Date,Num,Day,Visitor,V_League,V_Game,Home,H_League,H_Game,Day/Night,Postponed,Makeup
--- "20230330","0","Thu","BAL","AL",1,"BOS","AL",1,"d","",""
--- "20230330","0","Thu","MIL","NL",1,"CHN","NL",1,"d","",""
--- "20230330","0","Thu","PIT","NL",1,"CIN","NL",1,"d","",""
--- "20230330","0","Thu","CHA","AL",1,"HOU","AL",1,"n","",""
--- "20230330","0","Thu","MIN","AL",1,"KCA","AL",1,"d","",""
--- "20230330","0","Thu","ARI","NL",1,"LAN","NL",1,"n","",""
--- "20230330","0","Thu","NYN","NL",1,"MIA","NL",1,"d","",""
--- "20230330","0","Thu","SFN","NL",1,"NYA","AL",1,"d","",""
--- "20230330","0","Thu","ANA","AL",1,"OAK","AL",1,"n","",""
DROP TABLE IF EXISTS schedules
;
CREATE TABLE schedules (
	gamedate  	CHAR(8), 	--- day in YYYYMMDD format
	num	  	INTEGER,	--- 0, one game, 1, first game of double header, 2 second game of double header
	dow	  	CHAR(3),	--- Day of week Sun, Mon, Tue, Wed, Thu, Fri, Sat
	v_team	  	CHAR(3),	--- Visiting team
	v_lg	  	CHAR(2),	--- Visiting team league
	v_gamenum 	INTEGER,	--- Visiting team's game number
	h_team		CHAR(3),	--- Home team
	h_lg		CHAR(2),	--- Home team league
	h_gamenum	INTEGER,	--- Home team's game number
	gametime	CHAR(1),	--- Game time (D)ay, (N)ight, (A)fternoon, (E)vening
	postponed	TEXT,		--- https://retrosheet.org/schedule/index.html for more detail
	makeup_data	CHAR(8)		--- If game was made up, the date.
)
;
-- .import --csv --skip 1 2023schedule.csv schedules
