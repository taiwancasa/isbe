﻿package com.object {
	
			
			againBtn.addEventListener(MouseEvent.CLICK,againHandler);
			closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
			
		
		
		
		public function againHandler(e:MouseEvent)
		{
				this.dispatchEvent(new Event("TagAgainEvent",true));
		}
		
		public function closeHandler(e:MouseEvent)
		{
				this.dispatchEvent(new Event("TagCloseEvent",true));
		}
			
			this.removeEventListener("ON_RESIZE",resizeHandler);