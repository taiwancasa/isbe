﻿package com.object {

			isTwoFr = isTwoFriend;
			btn0.addEventListener(MouseEvent.CLICK,btn0Handler);
			
			btn4.addEventListener(MouseEvent.CLICK,btn4Handler);
			btn5.addEventListener(MouseEvent.CLICK,btn5Handler);
		public function btn0Handler(e:MouseEvent):void
		{
			trace("clickFB")
			ExternalInterface.call("fbPublish");
		}
		{
			getURL("index.html")
		}
			getURL("login.aspx");
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
		}