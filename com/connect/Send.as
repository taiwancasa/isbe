﻿package com.connect {
		private static var _jsonStr:String = new String();
		private static var _jsonAllCookieStr:String = new String();
		
		public function getJson():String
		{
			return _jsonStr;
		}
		
		public function setJson(str:String)
		{
			_jsonStr = str;
		}
		
		
		public function getAllCookieJson():String
		{
			return _jsonAllCookieStr;
		}
		
		public function setAllCookieJson(str:String)
		{
			_jsonAllCookieStr = str;
		}
		
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		public function getAllCookies(num)
		{
			var str = "num=" + num; 
			var vars:URLVariables = new URLVariables();
			vars.decode(str);
			var req:URLRequest = new URLRequest();
			req.data = vars;
			req.method = URLRequestMethod.GET;
			req.url = "api/getCookies.ashx";
			var ldr:URLLoader = new URLLoader();
			ldr.addEventListener(Event.COMPLETE,allCookiesDataHandler);
			ldr.dataFormat = URLLoaderDataFormat.TEXT;
			ldr.load(req);
		}
		
		public function allCookiesDataHandler(e:Event)
		{
			var str = e.target.data;
			var str2 = str.replace('cookies','\"cookies\"').split( '\"[' ).join( '[' ).split( ']\"' ).join( ']' );
			trace("  " + str2);
			this.setAllCookieJson(str2);
			this.dispatchEvent(new Event("GotAllFriendEvent",true));
		}
		
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		public function SendTwoFriendNewRelation(u1:String,u2:String,btnType:Number):void
		{

			
			//api/choice.ashx?user1=1&user2=2&choice=1
			var str = "user1="+u1+"&user2="+u2+"&choice="+btnType;
			
				//vars.pushed1   = str.toString();
			trace("STR sendtwo:" + str)
			var vars: URLVariables = new URLVariables();
			vars.decode(str.toString());
		
			
			var req: URLRequest = new URLRequest();
				req.data        = vars;
				req.method      = URLRequestMethod.GET;
				//var ss = encodeURIComponent("pushed1="+str)
				req.url         = "api/choice.ashx" ;
			
			//trace("vars:" + vars +"," + encodeURIComponent(vars.toString())+",dec:" + decodeURIComponent(vars.toString()) )
				
			var ldr:URLLoader = new URLLoader();	
				ldr.addEventListener(Event.COMPLETE, handleServerTwoFrRelationFeedBack);
				ldr.dataFormat = URLLoaderDataFormat.TEXT;
				
				ldr.load(req);
				
				//trace("fr_data:" + vars.pushed1);
				//trace("str:"+ encodeURIComponent(vars.toString()))
				
				try{
					ldr.load(req);
				}
				catch (error:Error) {
					trace("Unable to load URL" + error);
				}

		}
		
		
	
		
		public function handleServerTwoFrRelationFeedBack(event:Event):void{
			trace("gotTwo:" + event.target.data);
			
			
			
			//setJson(event.target.data.toString());
			//trace("this.getJSON:" + this.getJson());
			this.dispatchEvent(new Event("GotTwoFriendRelation",true));
			
			//	var variables:URLVariables = new URLVariables(event.target.data);
				//var msg = variables.msg;
				/*trace(event +",msg:"+ msg )
				if(msg=="true"){
					trace("Done!");
				} else{
					trace("Error: "+msg);
				}*/
			}
			
		//----------------------------------------------------------------------------------------------------------------------------------------
		public function sendTwoFrStr(str):void
		{

			var vars: URLVariables = new URLVariables();
			
				//vars.pushed1   = str.toString();
			vars.decode("pushed1="+str.toString());
			trace("decode:" + vars.pushed1)
			
			var req: URLRequest = new URLRequest();
				req.data        = vars;
				req.method      = URLRequestMethod.GET;
				//var ss = encodeURIComponent("pushed1="+str)
				req.url         = "api/getFriends.ashx?" ;
			
			trace("vars:" + vars +"," + encodeURIComponent(vars.toString())+",dec:" + decodeURIComponent(vars.toString()) )
				
			var ldr:URLLoader = new URLLoader();	
				ldr.addEventListener(Event.COMPLETE, handleServerTwoFrResponse);
				ldr.dataFormat = URLLoaderDataFormat.TEXT;
				
				ldr.load(req);
				
				//trace("fr_data:" + vars.pushed1);
				//trace("str:"+ encodeURIComponent(vars.toString()))
				
				try{
					ldr.load(req);
				}
				catch (error:Error) {
					trace("Unable to load URL" + error);
				}

		}
		
		
	
		
		public function handleServerTwoFrResponse(event:Event):void{
			trace("inTwoHandler:" + event.target.data);
			
			//{user:[{"fb1Name":"xxx","fb2Name":"Kzzz"}]}
			
			setJson(event.target.data.toString());
			trace("this.getJSON:" + this.getJson());
			this.dispatchEvent(new Event("GotTwoFriend",true));
			
			//	var variables:URLVariables = new URLVariables(event.target.data);
				//var msg = variables.msg;
				/*trace(event +",msg:"+ msg )
				if(msg=="true"){
					trace("Done!");
				} else{
					trace("Error: "+msg);
				}*/
			}
			var BV = ExternalInterface.call("getUserBrowser");
			obj.user_browser = BV;
			trace("sd:" + str)

		
		
		
		public function handleServerResponse(e:Event)
		{
			
		}