﻿package com.grid {	import flash.display.MovieClip;	import flash.events.Event;	import com.object.CookieMan;	import com.greensock.*;	import com.greensock.easing.*;	import flash.utils.Timer;	import flash.events.TimerEvent;	import com.connect.Send;
		public class Grid extends MovieClip{						private var timer:Timer = new Timer(5000);		private var timerS:Timer = new Timer(2000);		private var basicTotalNumber:Number = new Number(60);		private var totalNumber:Number = new Number(); 				private var widNum:Number = new Number();		private var heiNum:Number = new Number();		private var gridUnit:Number = new Number();		private var ary:GridAry;		private var cookie:CookieMan;
		private var sd:Send = new Send();
		
		private var allCookieObj:Object = new Object();		public function Grid() {						this.addEventListener(Event.ADDED_TO_STAGE , loadInit);		}				private function loadInit(e:Event):void		{
			sd.getAllCookies(120);
			sd.addEventListener("GotAllCookieEvent",setGr);
			//		
					}
		
		public function setGr(e:Event):void
		{
			var jsonStr = sd.getAllCookieJson();
			allCookieObj = JSON.parse(jsonStr);
			//trace(obj.cookies[0].fb_name);
			//trace(obj.cookies[0].cookie1[0]);
				this.removeEventListener(Event.ADDED_TO_STAGE , loadInit);
			timerS.addEventListener(TimerEvent.TIMER,timerSHandler);
			this.addEventListener("ON_RESIZE",resizeHandler);
			timerS.start();
		}				private function resizeHandler(e:Event):void		{			scale();		}				private function timerHandler(e:TimerEvent):void		{			scale();		}		private function timerSHandler(e:TimerEvent):void		{			timerS.removeEventListener(TimerEvent.TIMER,timerSHandler);			scale();		}		public function scale():void		{			this.totalNumber = this.basicTotalNumber + Math.round(Math.random()*40)-20			TweenLite.killTweensOf(this);			timer.removeEventListener(TimerEvent.TIMER,timerHandler);			timer.addEventListener(TimerEvent.TIMER,timerHandler);			timer.start();			count();			this.y = 0;			TweenLite.to(this, 10, {y:-300});					}				public function getGridUnit():Number		{			return this.gridUnit;		}				public function remove()		{
			timerS.removeEventListener(TimerEvent.TIMER,timerSHandler);			timer.removeEventListener(TimerEvent.TIMER,timerHandler);
			TweenLite.killTweensOf(this);			TweenLite.to(this, 2, {y:-300,alpha:0,onComplete:finishHandler});		}				private function finishHandler():void		{			parent.removeChild(this);			this.removeEventListener("ON_RESIZE",resizeHandler);		}				private function count():void		{			var wid = stage.stageWidth;			var hei = stage.stageHeight;			var grid:Number = wid * hei;			this.gridUnit = Math.ceil(Math.sqrt(grid / this.totalNumber));			this.widNum = Math.floor(wid/this.gridUnit);			this.heiNum = Math.floor(hei/this.gridUnit)+4;						while (this.numChildren)			{				this.removeChildAt (0);			}						ary = new GridAry();			//			for(var a=0;a<heiNum;a++)			{				var tmp:Array = new Array(); 				for(var b=0;b<widNum;b++)				{					tmp.push(0);					cookie = new CookieMan();					cookie.unit = this.gridUnit;					cookie.x = b*(this.gridUnit+50);					cookie.y = a*(this.gridUnit+50);					setCookieData(b+a*widNum,cookie);					this.addChild(cookie);				}				ary.push(tmp);				tmp = null;			}					}		
		//設定cookie內容的值
		private function setCookieData(nowNum:Number,coo:CookieMan):void
		{
			
			coo.fb_name = allCookieObj.cookies[nowNum].fb_name;
			//trace( nowNum+":"+coo.fb_name);
		}				private function makeCookie()		{			for(var a=0;a<heiNum;a++)			{								for(var b=0;b<widNum;b++)				{					ary[a][b] = 1;				}															}		}			}	}