package com.object {		import flash.display.MovieClip;	import flash.events.Event;	import com.greensock.*;	import com.greensock.easing.*;	import com.data.FBFriend;	import flash.events.MouseEvent;	import com.connect.Send;	import com.data.FBData;
			public class FriendWindow extends MovieClip {				private var ff:FBFriend = new FBFriend();		private var allFW:MovieClip = new MovieClip();		private var obj:Object = new Object(); 		private var sd:Send = new Send();				private var twoObj:Object = new Object();						var min:Number = 0;		var max:Number;		var offset:Number = 0;				var ckboxAry:Array = new Array();		
		var isOpenEvent:Boolean  = new Boolean();								public function FriendWindow() {			this.addEventListener(Event.ADDED_TO_STAGE,loadInit);		}				public function loadInit(e:Event):void		{						this.removeEventListener(Event.ADDED_TO_STAGE,loadInit);			this.addEventListener("ON_RESIZE",resizeHandler);			this.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);			scale();			loadData();
			isOpenEvent = false;					}												function startScroll():void		{			max = scrollBg.height - scrollBtn.height;			scrollBtn.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);		}				function onMouseDownHandler(event:MouseEvent):void		{			offset = mouseY - MovieClip(event.target).y;			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);		}				function onMouseUpHandler(event:MouseEvent):void		{			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);		}				function detecting():void		{			scrollBtn.y = mouseY - offset;						if(scrollBtn.y <= min + scrollBg.y)			{				scrollBtn.y = min + scrollBg.y;							}else if(scrollBtn.y >= max + scrollBg.y)			{				scrollBtn.y = max + scrollBg.y;			}		}				function onMouseMoveHandler(event:MouseEvent):void		{			detecting();			var percent:Number = (scrollBtn.y - scrollBg.y) / max;
			trace("per:" + percent )			var pos:Number = allFW.height - fMask.height;			allFW.y = Math.round(pos * - percent) +  scrollBg.y;			event.updateAfterEvent();		}																								private function setFW()		{			this.addChild(this.allFW);			allFW.mask = fMask;			allFW.x = fMask.x;			allFW.y = fMask.y;			for(var a=0;a<obj.friend.length;a++)			{				var mc:OneFriendData = new OneFriendData();				allFW.addChild(mc);				mc.setData(obj.friend[a].uid , obj.friend[a].name , obj.friend[a].pic_big);
				mc.name = "fch" + a;				mc.x = 175 * (a%3);				mc.y = 100 * Math.floor(a/3);				mc.addEventListener("SELECT_CHECKBOX",seHandler);
				mc.addEventListener("NO_SELECT_CHECKBOX",noHandler);			}									twoObj = {fr:[{f_id:null,f_name:null},{f_id:null,f_name:null}]}			startScroll();		}				private function saveBtnHandler(e:MouseEvent)		{			trace("saveBtnPress")
			TweenLite.to(saveBtn,.3,{scaleX:.8,scaleY:.8})
			TweenLite.to(saveBtn,.4,{scaleX:1,scaleY:1,delay:.35})			saveBtn.removeEventListener(MouseEvent.CLICK,saveBtnHandler);
			isOpenEvent = false;			sd.pushFriend(twoObj.fr[0].f_id,twoObj.fr[0].f_name,twoObj.fr[1].f_id,twoObj.fr[1].f_name);			sd.addEventListener("TAGOK",tagOkHandler);		}				public function tagOkHandler(e:Event)		{			sd.removeEventListener("TAGOK",tagOkHandler);			this.dispatchEvent(new Event("FinishFrWindow",true));		}						private function noHandler(e:MyEvent)
		{
			
		}						private function seHandler(e:MyEvent)		{			trace("bbb"+e.param.fb_name);
						var ob:Object = e.param;			if(twoObj.fr[0].f_id == null)			{
								twoObj.fr[0].f_id = ob.fb_id;				twoObj.fr[0].f_name = ob.fb_name;
				twoObj.fr[0].ta = ob.ta;			}else if(twoObj.fr[1].f_id == null){				twoObj.fr[1].f_id = ob.fb_id;				twoObj.fr[1].f_name = ob.fb_name;
				twoObj.fr[1].ta = ob.ta;				judgeEvent();			}else{
				var st = twoObj.fr[0].ta;
				MovieClip(allFW.getChildByName(st)).myCheckBox.selected = false;
				twoObj.fr[0].f_id = twoObj.fr[1].f_id;
				twoObj.fr[0].f_name = twoObj.fr[1].f_name;
				twoObj.fr[0].ta = twoObj.fr[1].ta;
				twoObj.fr[1].f_id = ob.fb_id;
				twoObj.fr[1].f_name = ob.fb_name;
				twoObj.fr[1].ta = ob.ta;
				judgeEvent();
			}			trace("twoObj:" + twoObj.fr[0].f_name +","+twoObj.fr[1].f_name)		}		
		private function judgeEvent()
 		{
			if(isOpenEvent == false)
			{
					saveBtn.addEventListener(MouseEvent.CLICK,saveBtnHandler);
				isOpenEvent = true;
			}			
		}
				private function loadData()		{
			var fd:FBData = new FBData();
			var num = fd.getFB_friend_count();
			ff.range = num;			ff.getFriendData();			ff.addEventListener("OnCompleteLoadInitFF",FFHandler);		}				private function FFHandler(e:Event):void		{			//trace("g:" + ff.obj.aaaa);			//trace("g2:" + ff.obj.friend[2].uid)			//trace("------------------------:" + ff.jsonStr);						/*			data:{"friend":[{"uid":"27215833","name":"Kai-Yun Pang","pic_big":"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/1118079_27215833_1561257691_n.jpg"},			*/			var str:String = ff.jsonStr;			obj = JSON.parse(str);			setFW();			//trace("obj:" + obj.friend[1].uid)			//trace("ffOBJ:" + ff.jsonStr);			//var obj = JSON.parse(ff.jsonStr);			//trace("2:" + obj.friend[1].uid);			/*			for(var a in ff.obj)			{				trace(a + ":" + ff.obj[a]);			}			trace("------------------ok:" + ff.obj.friend[0].uid);*/		}				public function resizeHandler(e:Event):void		{			scale();		}				public function removeHandler(e:Event):void		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);			this.removeEventListener(Event.REMOVED_FROM_STAGE,removeHandler);		}				public function scale():void		{			this.x = stage.stageWidth/2;			this.y = stage.stageHeight/2;		}			}	}