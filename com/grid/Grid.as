﻿package com.grid {

		private var sd:Send = new Send();
			sd.getAllCookies(3);
			sd.addEventListener("GotAllFriendEvent",setGr);
		
		public function setGr(e:Event):void
		{
			var jsonStr = sd.getAllCookieJson();
			var obj = JSON.parse(jsonStr);
			trace(obj.cookies[0].fb_name)
			trace(obj.cookies[0].cookie1[0])
		}
			timerS.removeEventListener(TimerEvent.TIMER,timerSHandler);
			TweenLite.killTweensOf(this);