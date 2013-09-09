package com.data {		import flash.external.ExternalInterface;	import flash.events.Event;	import flash.events.EventDispatcher;	public class FBData extends EventDispatcher{		private static var _fb_id:String = new String();		private static var _fb_name:String = new String();		private static var _fb_friend_count:Number = new Number();		public var str:String = new String();		private static var self_loverDes:String = new String();				private static var cookie1:Array = new Array();		private static var cookie2:Array = new Array();		private static var cookie3:Array = new Array();		private static var cookie4:Array = new Array();				private static var _friend1:String = new String();	
		private static var _friend2:String = new String();	
		
		private static var _friend1_id:String = new String();	
		private static var _friend2_id:String = new String();	
						//		public function FBData() {			//ExternalInterface.call("GetTotalFriendNum");			//ExternalInterface.addCallback("setFBData",setFBData);		}				public function setFBData(json):void		{			//var ss = JSON.stringify(json);			this.str = json;						var obj = JSON.parse(json);						this.setFB_id(obj.uid);			this.setFB_name(obj.name);			this.setFB_friend_count(Number(obj.friend_count));			dispatchEvent(new Event("gotFBData",true))		}				//-----------------------------------------		
		public function set fr1(str:String)
		{
			_friend1 = str;
		}
		public function set fr2(str:String)
		{
			_friend2 = str;
		}
		public function get fr1():String
		{
			return _friend1;
		}
		public function get fr2():String
		{
			return _friend2;
		}
		
		
		public function set fr1_id(str:String)
		{
			_friend1_id = str;
		}
		public function set fr2_id(str:String)
		{
			_friend2_id = str;
		}
		public function get fr1_id():String
		{
			return _friend1_id;
		}
		public function get fr2_id():String
		{
			return _friend2_id;
		}
		
		
		
				public function getFB_id():String		{			return _fb_id;		}				public function getFB_name():String		{			return _fb_name;		}				public function getFB_friend_count():Number		{			return _fb_friend_count;		}				public function getSelf_loveDes():String		{			return self_loverDes;		}		public function getCookie1():Array		{			return cookie1;		}		public function getCookie2():Array		{			return cookie2;		}		public function getCookie3():Array		{			return cookie3;		}		public function getCookie4():Array		{			return cookie4;		}		//-----------------------------------------				public function setFB_id(id:String):void		{			_fb_id = id;		}				public function setFB_name(name:String):void		{			_fb_name = name;		}				public function setFB_friend_count(num):void		{			_fb_friend_count = num;		}		public function setSelf_loveDes(str:String):void		{			self_loverDes = str;		}				public function setCookie1(ary:Array):void		{			cookie1 = ary;		}		public function setCookie2(ary:Array):void		{			cookie2 = ary;		}		public function setCookie3(ary:Array):void		{			cookie3 = ary;		}		public function setCookie4(ary:Array):void		{			cookie4 = ary;		}					}	}