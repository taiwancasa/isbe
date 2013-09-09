package com.object {		import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;	import flash.net.URLRequest;	import flash.net.navigateToURL;	import com.greensock.*; 	import com.greensock.easing.*;	import flash.external.ExternalInterface;
		public class Menu extends MovieClip {				private var isTwoFr:Boolean = new Boolean();		public function Menu(isTwoFriend:Boolean) {
			isTwoFr = isTwoFriend;			this.addEventListener(Event.ADDED_TO_STAGE,loadInit);		}				public function loadInit(e:Event):void		{			this.removeEventListener(Event.ADDED_TO_STAGE,loadInit);			setBtnEvent();			this.y = stage.stageHeight+120;			this.x = Math.round(stage.stageWidth/2);			TweenLite.to(this, 1, {x:Math.round(stage.stageWidth/2), y:stage.stageHeight+5, ease:Circ.easeOut});			//scale();		}				public function setBtnEvent()		{
			btn0.addEventListener(MouseEvent.CLICK,btn0Handler);			btn1.addEventListener(MouseEvent.CLICK,btn1Handler);			btn2.addEventListener(MouseEvent.CLICK,btn2Handler);			btn3.addEventListener(MouseEvent.CLICK,btn3Handler);
			
			btn4.addEventListener(MouseEvent.CLICK,btn4Handler);
			btn5.addEventListener(MouseEvent.CLICK,btn5Handler);						for(var a=0;a<=5;a++)			{				var mc = this["btn" + a]				mc.addEventListener(MouseEvent.MOUSE_OVER,btnOver);				mc.addEventListener(MouseEvent.MOUSE_OUT,btnOut);				mc.useHandCursor = true;				mc.alpha = 0;				mc.y = -30;				TweenLite.to(mc, .7, {y:-56 ,delay:a*.1 , alpha:1 , ease:Back.easeInOut});			}		}				public function getURL(url)		{			var linkStr = url;			var urr:URLRequest = new URLRequest(linkStr);			navigateToURL(urr,'_self');		}
		public function btn0Handler(e:MouseEvent):void
		{
			trace("clickFB")
			ExternalInterface.call("fbPublish");
		}		public function btn1Handler(e:MouseEvent):void
		{
			getURL("index.html")
		}		public function btn2Handler(e:MouseEvent):void		{			getURL("promotion_tc.html")		}		public function btn3Handler(e:MouseEvent):void		{			//getURL("login.html")
			getURL("login.aspx");		}		public function btn4Handler(e:MouseEvent):void		{			getURL("prize.html")		}
		public function btn5Handler(e:MouseEvent):void
		{
			//parent.clickKVHandler(null);
			if(isTwoFr)
			{
				getURL("single.html")
			}
			else
			{
				this.dispatchEvent(new Event("ClickKVFromMenu",true));
			}
		}		public function btnOver(e:MouseEvent):void		{			MovieClip(e.currentTarget).gotoAndStop(2);			TweenMax.to(MovieClip(e.currentTarget), 1, {glowFilter:{color:0xff0ea1, alpha:1, blurX:30, blurY:30}});		}				public function btnOut(e:MouseEvent):void		{			MovieClip(e.currentTarget).gotoAndStop(1);			TweenMax.to(MovieClip(e.currentTarget), 1, {glowFilter:{color:0xff0ea1, alpha:0, blurX:3, blurY:3}});		}												public function scale()		{			this.x = Math.round(stage.stageWidth/2);						this.y = stage.stageHeight+5;		}	}	}