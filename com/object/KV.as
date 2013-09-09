package com.object {		import flash.display.Sprite;	import flash.events.Event;	import com.greensock.*; 	import com.greensock.easing.*;	import flash.events.MouseEvent;	import flash.events.EventDispatcher;			public class KV extends Sprite {						public function KV() {			this.addEventListener(Event.ADDED_TO_STAGE,loadInit);		}				public function loadInit(e:Event):void		{			this.removeEventListener(Event.ADDED_TO_STAGE,loadInit);			TweenMax.to(this, 0, {colorMatrixFilter:{colorize:0xff6666, amount:1}});			TweenMax.to(this, 1.5, {colorMatrixFilter:{colorize:null, amount:0},delay:1.5,ease:Back.easeOut});			scale();			this.useHandCursor = true;			this.addEventListener(MouseEvent.CLICK,clickHandler);			this.addEventListener("ON_RESIZE",resizeHandler);
			this.addEventListener("TWEENKV",tweenHandler);		}				private function resizeHandler(e:Event):void		{			scale();		}				public function clickHandler(e:MouseEvent):void		{			this.removeEventListener(MouseEvent.CLICK,clickHandler);			this.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
			this.removeEventListener("TWEENKV",tweenHandler);			this.dispatchEvent(new Event("ClickKV",true));
			TweenLite.to(this,1,{scaleX:1.2,scaleY:1.2,alpha:0,onComplete:finishAnimaiton});					}
		
		public function tweenHandler(e:Event)
		{
			this.removeEventListener(MouseEvent.CLICK,clickHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
			this.removeEventListener("TWEENKV",tweenHandler);
			this.dispatchEvent(new Event("ClickKV",true));
			TweenLite.to(this,1,{scaleX:1.2,scaleY:1.2,alpha:0,onComplete:finishAnimaiton});
		}				public function finishAnimaiton()		{			this.dispatchEvent(new Event("clearKV",true));		}				public function removeHandler(e:Event):void		{			trace("removeKV");			this.removeEventListener("ON_RESIZE",resizeHandler);			this.removeEventListener(Event.REMOVED_FROM_STAGE,removeHandler);		}				public function scale()		{			//this.width = stage.stageWidth;			this.x = stage.stageWidth/2;			//this.height = stage.stageHeight;			this.y = stage.stageHeight/2;		}	}	}