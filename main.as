package  {		import flash.display.MovieClip;	import flash.external.ExternalInterface;	import com.data.FBData;	import com.data.FBFriend;	import flash.events.Event;	import com.object.Footer;		import flash.display.StageAlign;	import flash.display.StageScaleMode;	import com.object.Menu;	import com.object.BG;	import com.object.Logo;	import com.object.KV;	import com.object.Box;	import com.grid.Grid;	import com.object.StepDesWindow;	import com.object.CreateCookieWindow;	import flash.display.Sprite;	import com.object.Square;	import com.connect.Send;	import com.object.FriendWindow;	import com.object.TagOkWindow;	import flash.events.MouseEvent;	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import com.object.TwoFriendWindow;
	import flash.display.LoaderInfo;
		public class main extends MovieClip {				public var fd:FBData;		public var ff:FBFriend;				public var menu:Menu;		public var footer:Footer;		public var bg:BG;		public var logo:Logo;		public var kv:KV;		public var box:Box;		public var indexGrid:Grid;		public var makeCooWin:CreateCookieWindow;				public var stepWin:StepDesWindow;		public var black:Square;		public var sd:Send;				public var fw:FriendWindow;		public var tow:TagOkWindow;
		
		public var twoFriendStr:String = new String();
		public var twoFr:TwoFriendWindow;
		
		private var fr1:String = new String();
		private var fr2:String = new String();				public function main() {									this.addEventListener(Event.ADDED_TO_STAGE,loadInit);			/*//var aa:String = '{friend:[{"uid":"27215833","name":"Kai-Yun Pang","pic_big":"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/1118079_27215833_1561257691_n.jpg"},{"uid":"146000267","name":"Ursula Mei Hung Lin","pic_big":"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash4/186115_146000267_1991090108_n.jpg"},{"uid":"517138954","name":"Ws Tsai","pic_big":"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/1119679_517138954_1303854605_n.jpg"}]}'			//var aa:String = '{\"c\":\"bbb\"}'			//var aa = '{friend:[{\"uid\":\"27215833\",\"name\":\"Kai-Yun Pang\",\"pic_big\":\"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/1118079_27215833_1561257691_n.jpg\"},{\"uid\":\"146000267\",\"name\":\"Ursula Mei Hung Lin\",\"pic_big\":\"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash4/186115_146000267_1991090108_n.jpg\"},{\"uid\":\"517138954\",\"name\":\"Ws Tsai\",\"pic_big\":\"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/1119679_517138954_1303854605_n.jpg\"}]}'			var aa = '{\"friend\":{\"uid\":\"27215833\"}}'			//var str = JSON.stringify(aa);			trace(aa);			trace('------------');			var obj:Object = JSON.parse(aa);			trace(obj)			//trace(obj.friend[0].uid)*/ 			//getURLPar();
			
					}		
		
		
		public function getURLPar()
		{
			var str:String = new String(ExternalInterface.call("getNowLocation"));
			var num = str.indexOf("?key=");
			var slistr = str.substring(num+5,str.length);
			trace(str +","+slistr)
			twoFriendStr =  slistr;
		}
		
		public function judgePage():void
		{
			var str:String = new String(ExternalInterface.call("getNowLocation"));
			if(str.indexOf("single.html") != -1)
			{
				inIndexPage();
			}else{

				judgeCanIntoTwoFriendPage();
				//inTwoFriendPage();
			}
			var ob =  stage.loaderInfo.parameters;
			for(var a in ob)
			{
				trace(a +":"+ob[a]);
			}
			
		}
		
		public function judgeCanIntoTwoFriendPage()
		{
			sd = new Send();
			getURLPar();
			sd.sendTwoFrStr(twoFriendStr);
			sd.addEventListener("GotTwoFriend",gotTodoHandler);
		}
		
		public function inIndexPage()
		{
			trace("indexPage");
			stage.addEventListener(Event.RESIZE, stageResize);
			//------------------------------- first part --------
			footer = new Footer();
			menu = new Menu(false);
			bg = new BG();
			logo = new Logo();
			kv = new KV();
			//偵測的dyTxt
			box = new Box();
			sd = new Send();
			//------------------------------- second part --------
			indexGrid = new Grid();
			stepWin = new StepDesWindow();
			makeCooWin = new CreateCookieWindow();
			black = new Square();
			fw = new FriendWindow();
			ff = new FBFriend();
			tow = new TagOkWindow();
			
			//
			//
			this.addChild(bg);
			this.addChild(indexGrid);
			this.addChild(menu);
			this.addChild(footer);
			this.addChild(kv);
			this.addChild(box);
			this.addChild(logo);
			
		}
		
		public function inTwoFriendPage()
		{
			trace("twoFriendPage");
			
			
					
			
			//
			stage.addEventListener(Event.RESIZE, stageResize2);
			//------------------------------- first part --------
			footer = new Footer();
			menu = new Menu(true);
			bg = new BG();
			logo = new Logo();
			//kv = new KV();
			//偵測的dyTxt
			//box = new Box();
			sd = new Send();
			twoFr = new TwoFriendWindow();
			//------------------------------- second part --------
			//indexGrid = new Grid();
			//stepWin = new StepDesWindow();
			//makeCooWin = new CreateCookieWindow();
			//black = new Square();
			//fw = new FriendWindow();
			//ff = new FBFriend();
			//tow = new TagOkWindow();
			//
			//
			this.addChild(bg);
			//this.addChild(indexGrid);
			this.addChild(menu);
			this.addChild(footer);
			//this.addChild(kv);
			//this.addChild(box);
			this.addChild(twoFr);
			this.addChild(logo);
			
			
			
		}
		
		public function gotTodoHandler(e:Event)
		{
			//{user:[{"fb1Name":"xxx","fb2Name":"Kzzz"}]}
			 // {"user":[{"fb1Name":"xx"},{"fb2Name":"xx"}]}
			//var str = sd.getJson().toString().replace(',','},{').replace('user','\"user\"');
			var str = sd.getJson();
			trace("STR:" + str)
			var obj:Object =  JSON.parse(str);
			fd.fr1 = obj.user[0].fbName
			fd.fr2 = obj.user[1].fbName
			fd.fr1_id = obj.user[0].fbId
			fd.fr2_id = obj.user[1].fbId
			
				
			
			
			if(fd.getFB_id() == fd.fr1_id || fd.getFB_id() == fd.fr2_id )
			{
				
				var selfAryNum
				if(fd.getFB_id() == fd.fr1_id)
				{
					selfAryNum = 0;
				}else
				{
					selfAryNum = 1;
				}
				
				trace("SELF_aryNum:" + selfAryNum )
				trace("obj.user[selfAryNum].isClickBtn:" + obj.user[selfAryNum].isClickBtn)
				
				if(obj.user[selfAryNum].isClickBtn == "2" || obj.user[selfAryNum].isClickBtn == "1")
				//if(obj.user[selfAryNum].isClickBtn == "1" )
				{
					inIndexPage();
				}
				
				else{
					inTwoFriendPage();
				}
				
			}else{
				inIndexPage();	
			}			
			
			
			
		}
				public function loadInit(e:Event):void		{			this.removeEventListener(Event.ADDED_TO_STAGE,loadInit);			//ExternalInterface.addCallback("jsInit",jsInit);
			jsInit();			//			stage.align = StageAlign.TOP_LEFT;			stage.scaleMode = StageScaleMode.NO_SCALE;			
			//									
			
						
			
			//------------------------------- event --------			this.addEventListener("ClickKV",clickKVHandler);
			this.addEventListener("ClickKVFromMenu",clickKVFromMenuHandler);			this.addEventListener("clearKV",makeCookieStepHandler);		}				public function jsInit()		{			getFBData();			//getFBFriend();			//ff.getFriendData();		}						//--------------------------------------------------------- FB Data -----------------------------		private function getFBData()		{			ExternalInterface.call("GetTotalFriendNum");			ExternalInterface.addCallback("selfData",selfData);		}		public function selfData(json):void		{			fd = new FBData();			fd.addEventListener("gotFBData",finishSetFBData);			fd.setFBData(json);
			trace(fd.getFB_id());			//box.dy_txt.text = fd.getFB_name();
			judgePage();		}				function finishSetFBData(e:Event):void		{			//box.dy_txt2.text=fd.getFB_id();		}		//--------------------------------------------------------- FB Friend Data -----------------------------		private function getFBFriend()		{						ExternalInterface.call("GetFriendList",ff.startNum,ff.range);			ExternalInterface.addCallback("resultFriendData",resultFriendData);		}				public function resultFriendData(json):void		{						//json = JSON.stringify(json);			//json = "{friend:" + json + "}";			box.dy_txt2.text = json;			var obj = JSON.parse(json);						box.dy_txt3.text = obj.friend[0].uid;		}		//--------------------------------------------------------- resize -----------------------------		private function stageResize(e:Event):void		{
						footer.scale();			menu.scale();			bg.scale();			logo.scale();						kv.dispatchEvent(new Event("ON_RESIZE",true));			indexGrid.dispatchEvent(new Event("ON_RESIZE",true));			stepWin.dispatchEvent(new Event("ON_RESIZE",true));			makeCooWin.dispatchEvent(new Event("ON_RESIZE",true));			black.dispatchEvent(new Event("ON_RESIZE",true));			fw.dispatchEvent(new Event("ON_RESIZE",true));			tow.dispatchEvent(new Event("ON_RESIZE",true));		}
		private function stageResize2(e:Event):void
		{
			
			footer.scale();
			menu.scale();
			bg.scale();
			logo.scale();

			twoFr.dispatchEvent(new Event("ON_RESIZE",true));
		}		//--------------------------------------------------------- Click -----------------------------		private function clickKVHandler(e:Event):void		{			indexGrid.remove();		}
		
		private function clickKVFromMenuHandler(e:Event):void
		{
			kv.dispatchEvent(new Event("TWEENKV",true));
			indexGrid.remove();
		}		//--------------------------------------------------------- Make Cookie Step-----------------------------		private function makeCookieStepHandler(e:Event):void		{						this.addEventListener("clearStepWindow",makeCookieHandler);			this.addChild(stepWin);					}		//--------------------------------------------------------- Make Cookie Window-----------------------------		private function makeCookieHandler(e:Event):void		{						this.removeEventListener("clearStepWindow",makeCookieHandler);			this.addEventListener("OpenFriendWindow",openFriendHandler);			this.addChild(makeCooWin);		}				private function openFriendHandler(e:Event):void		{			this.removeEventListener("OpenFriendWindow",openFriendHandler);			//trace("des:"+ fd.getSelf_loveDes());			//trace("ary1:" + fd.getCookie1());			sd.sendFB();			openFriendWin();		}				private function openFriendWin()		{			this.addChild(black);			this.addChild(fw);			fw.addEventListener("FinishFrWindow",clearFrWindow);		}
		
		private function openAgainFriendWin()
		{
			this.addChild(fw);
			fw.addEventListener("FinishFrWindow",clearFrWindow);
		}				private function clearFrWindow(e:Event)		{			this.removeChild(fw);			if(tow == null)
			{
				tow = new TagOkWindow();
			}			this.addChild(tow);			tow.addEventListener("TagAgainEvent",tagAgainHandler);
			tow.addEventListener("TagCloseEvent",tagCloseHandler);		}				private function tagAgainHandler(e:Event)		{
			tow.removeEventListener("TagAgainEvent",tagAgainHandler);
			tow.removeEventListener("TagCloseEvent",tagCloseHandler);			this.removeChild(tow);			openAgainFriendWin();		}
		
		
		private function tagCloseHandler(e:Event)
		{
			tow.removeEventListener("TagAgainEvent",tagAgainHandler);
			tow.removeEventListener("TagCloseEvent",tagCloseHandler);
			//this.removeChild(tow);
			//
			var linkStr = "single.html";
			
			var urr:URLRequest = new URLRequest(linkStr);
			navigateToURL(urr,'_self');
		}			}	}