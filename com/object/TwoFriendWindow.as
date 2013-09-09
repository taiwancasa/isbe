package com.object {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import com.greensock.*; 
	import com.greensock.easing.*;
	import flash.events.MouseEvent;
	import flash.events.EventDispatcher;
	import flash.display.MovieClip;
	import com.data.FBData;
	import flash.events.ProgressEvent;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.display.LoaderInfo;
	import flash.external.ExternalInterface;
	import flash.net.navigateToURL;
	import com.connect.Send;
	
	
	public class TwoFriendWindow extends MovieClip {
		
			private var fd:FBData = new FBData();
		public var frObj1:Object = new Object();
		public var frObj2:Object = new Object();
		private var sd:Send = new Send();
		public function TwoFriendWindow() {
			this.addEventListener(Event.ADDED_TO_STAGE,loadInit);
		}
		
		private function loadInit(e:Event)
		{
			scale();
			this.addEventListener("ON_RESIZE",resizeHandler);
			if(fd.getFB_id()== fd.fr1_id)
			{
				d1_txt.text = fd.fr1
				d2_txt.text = fd.fr2
				d3_txt.text = fd.fr1;
				d4_txt.text = fd.fr2;
				
			}else{
				d1_txt.text = fd.fr2;
				d2_txt.text = fd.fr1;
				d3_txt.text = fd.fr2;
				d4_txt.text = fd.fr1;
			
				
			}
			
			loadFBURL(fd.fr1_id)
			loadFBURL(fd.fr2_id)
			
			setTwoBtn();
			
		}
		
		public function getURL(url)
		{
			var linkStr = url;
			var urr:URLRequest = new URLRequest(linkStr);
			navigateToURL(urr,'_self');
		}
		

		private function setTwoBtn()
		{
			yesBtn.addEventListener(MouseEvent.CLICK,yesBtnHandler);
			noBtn.addEventListener(MouseEvent.CLICK,noBtnHandler);
		}
		
		private function yesBtnHandler(e)
		{
			yesBtn.scaleX = yesBtn.scaleY = .9;
			yesBtn.removeEventListener(MouseEvent.CLICK,yesBtnHandler);
			noBtn.removeEventListener(MouseEvent.CLICK,noBtnHandler);
			trace("pressYES")
			sd.addEventListener("GotTwoFriendRelation",finishThisPage);
			if(fd.getFB_id()== fd.fr1_id)
			{
				ExternalInterface.call("ReplyToFBAndTagsFriends",fd.fr2_id,fd.fr2);
				sd.SendTwoFriendNewRelation(fd.fr1_id,fd.fr2_id,1);
			}else{
				ExternalInterface.call("ReplyToFBAndTagsFriends",fd.fr1_id,fd.fr1);
				sd.SendTwoFriendNewRelation(fd.fr2_id,fd.fr1_id,1);
			}
			
		
		}
		
		
		
		private function finishThisPage(e:Event)
		{
			ExternalInterface.call("alertStr","發佈成功！");
			sd.removeEventListener("GotTwoFriendRelation",finishThisPage);
			TweenLite.to(this,1,{alpha:0 , delay:.5 , onComplete : backToIndex});
		}
		
		private function noBtnHandler(e)
		{
			trace("pressNO----------------------!!!")
			noBtn.scaleX = noBtn.scaleY = .9;
			noBtn.removeEventListener(MouseEvent.CLICK,noBtnHandler);
			yesBtn.removeEventListener(MouseEvent.CLICK,yesBtnHandler);
			
			trace("pressNO----------------------------------------------------------------!!!")
			sd.addEventListener("GotTwoFriendRelation",goBack);
			if(fd.getFB_id()== fd.fr1_id)
			{
				
				sd.SendTwoFriendNewRelation(fd.fr1_id,fd.fr2_id,2);
			}else{
				
				sd.SendTwoFriendNewRelation(fd.fr2_id,fd.fr1_id,2);
			}
			
			
			
		}
		
		public function goBack(e:Event)
		{
			TweenLite.to(this,1,{alpha:0 , delay:.5 , onComplete : backToIndex});
		}
		
		
		
		
		private function backToIndex()
		{
			getURL("single.html");
		}
		
		public function resultTwoFriendPic(str)
		{
			trace("r:" + str);
			if(frObj1.pic_big == null)
			{
				
				frObj1 = JSON.parse(str);
			}else{
				
				frObj2 = JSON.parse(str);
				
				if(fd.getFB_id() == frObj1.uid)
				{
					loadImage(frObj1.pic_big, pic1);
					loadImage(frObj2.pic_big, pic2);
				}
				else
				{
					loadImage(frObj2.pic_big, pic1);
					loadImage(frObj1.pic_big, pic2);
				}
			}
			
			
		}
		
		public function loadFBURL(fb_id):void
		{
			//var str = "https://graph.facebook.com/"+ fb_id +"/picture"
			//loadImage(str,holder);
			trace("start")
			trace("fpic:" + ExternalInterface.call("GetFriendBigPicLink",fb_id));
			ExternalInterface.addCallback("resultTwoFriendPic",resultTwoFriendPic);
		}

		
		function loadImage(clip:String, holder:MovieClip):void
		{
			//removeChildren(holder);


			var imageLoader:Loader = new Loader();
			var imageURL:String = clip
			var imageURLReq:URLRequest = new URLRequest(imageURL);
			
			holder.addChild(imageLoader);
			trace("loading "+imageURL);
			 
			imageLoader.load(imageURLReq);
			imageLoader.contentLoaderInfo.addEventListener(Event.INIT, imageLoaded);
			imageLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, imageProgress);
		}
		 
		
		
		function imageProgress (evt:ProgressEvent):void
		{
		//trace(Math.round((evt.bytesLoaded / evt.bytesTotal)*100));
		}
		 
		function imageLoaded(evt:Event):void
		{
		//var targetLoader:Loader = Loader(evt.target.loader);
		//trace("complete");
			//var mc = Loader(evt.currentTarget);
			
			
			var loader : Loader = (evt.currentTarget as LoaderInfo).loader;
			loader.parent.width = loader.parent.height = 85;
		}
		
		
		
		
		
		
		
		
		private function resizeHandler(e:Event):void
		{
			scale();
		}
		
		private function clickHandler(e:MouseEvent):void
		{
			
			
		}
		
		
		
		public function removeHandler(e:Event):void
		{
			
			this.removeEventListener("ON_RESIZE",resizeHandler);
			this.removeEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
		}
		
		public function scale()
		{
			//this.width = stage.stageWidth;
			this.x = stage.stageWidth/2;
			//this.height = stage.stageHeight;
			this.y = stage.stageHeight/2;
		}
	}
	
}
