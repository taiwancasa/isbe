﻿package com.object {
			this.addEventListener("TWEENKV",tweenHandler);
			this.removeEventListener("TWEENKV",tweenHandler);
			TweenLite.to(this,1,{scaleX:1.2,scaleY:1.2,alpha:0,onComplete:finishAnimaiton});
		
		public function tweenHandler(e:Event)
		{
			this.removeEventListener(MouseEvent.CLICK,clickHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
			this.removeEventListener("TWEENKV",tweenHandler);
			this.dispatchEvent(new Event("ClickKV",true));
			TweenLite.to(this,1,{scaleX:1.2,scaleY:1.2,alpha:0,onComplete:finishAnimaiton});
		}