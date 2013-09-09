package com.object {		import flash.display.Sprite;	import flash.events.Event;	import com.greensock.*; 	import com.greensock.easing.*;	import com.connect.URL;
	import flash.events.MouseEvent;
				public class Logo extends Sprite {		
		var ul:URL = new URL();				public function Logo() {			this.addEventListener(Event.ADDED_TO_STAGE,loadInit);		}				public function loadInit(e:Event):void		{			this.removeEventListener(Event.ADDED_TO_STAGE,loadInit);			this.y = 25;			this.x = stage.stageWidth+50;			this.alpha = 0;			TweenLite.to(this, 1, {x:stage.stageWidth-20 ,delay:1 , alpha:1 , ease:Circ.easeOut});			//scale();
			
		
			logo1.addEventListener(MouseEvent.CLICK,logo1Handler);
			logo2.addEventListener(MouseEvent.CLICK,logo2Handler);
			logo3.addEventListener(MouseEvent.CLICK,logo3Handler);
			
					}
		
		
		private function logo1Handler(e:MouseEvent):void
		{
			ul.getURL("http://www.isabelle.com.tw/","_blank")
		}
		
		private function logo2Handler(e:MouseEvent):void
		{
			ul.getURL("http://www.okuraya.com.tw/","_blank")
		}
		
		private function logo3Handler(e:MouseEvent):void
		{
			ul.getURL("http://www.emperorfood.com.tw/","_blank")
		}				public function scale()		{						this.x = stage.stageWidth-20;		}	}	}