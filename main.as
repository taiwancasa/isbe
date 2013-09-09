﻿package  {
	import flash.net.navigateToURL;
	import com.object.TwoFriendWindow;
	import flash.display.LoaderInfo;
	
		
		public var twoFriendStr:String = new String();
		public var twoFr:TwoFriendWindow;
		
		private var fr1:String = new String();
		private var fr2:String = new String();
			
			
		
		
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
		
			jsInit();
			//
			
			
			
			//------------------------------- event --------
			this.addEventListener("ClickKVFromMenu",clickKVFromMenuHandler);
			trace(fd.getFB_id());
			judgePage();
			
		private function stageResize2(e:Event):void
		{
			
			footer.scale();
			menu.scale();
			bg.scale();
			logo.scale();

			twoFr.dispatchEvent(new Event("ON_RESIZE",true));
		}
		
		private function clickKVFromMenuHandler(e:Event):void
		{
			kv.dispatchEvent(new Event("TWEENKV",true));
			indexGrid.remove();
		}
		
		private function openAgainFriendWin()
		{
			this.addChild(fw);
			fw.addEventListener("FinishFrWindow",clearFrWindow);
		}
			{
				tow = new TagOkWindow();
			}
			tow.addEventListener("TagCloseEvent",tagCloseHandler);
			tow.removeEventListener("TagAgainEvent",tagAgainHandler);
			tow.removeEventListener("TagCloseEvent",tagCloseHandler);
		
		
		private function tagCloseHandler(e:Event)
		{
			tow.removeEventListener("TagAgainEvent",tagAgainHandler);
			tow.removeEventListener("TagCloseEvent",tagCloseHandler);
			//this.removeChild(tow);
			//
			var linkStr = "single.html";
			
			var urr:URLRequest = new URLRequest(linkStr);
			navigateToURL(urr,'_self');
		}