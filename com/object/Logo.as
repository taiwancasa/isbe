﻿package com.object {
	import flash.events.MouseEvent;
	
		var ul:URL = new URL();
			
		
			logo1.addEventListener(MouseEvent.CLICK,logo1Handler);
			logo2.addEventListener(MouseEvent.CLICK,logo2Handler);
			logo3.addEventListener(MouseEvent.CLICK,logo3Handler);
			
			
		
		
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
		}