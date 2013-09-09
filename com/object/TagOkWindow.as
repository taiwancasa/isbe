package com.object {		import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;
			public class TagOkWindow extends MovieClip {						public function TagOkWindow() {			this.addEventListener(Event.ADDED_TO_STAGE,loadInit);		}				public function loadInit(e:Event):void		{						scale();			this.removeEventListener(Event.ADDED_TO_STAGE,loadInit);			this.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
			
			againBtn.addEventListener(MouseEvent.CLICK,againHandler);
			closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
						this.addEventListener("ON_RESIZE",resizeHandler);		}
		
		
		
		public function againHandler(e:MouseEvent)
		{
				this.dispatchEvent(new Event("TagAgainEvent",true));
		}
		
		public function closeHandler(e:MouseEvent)
		{
				this.dispatchEvent(new Event("TagCloseEvent",true));
		}				private function removeHandler(e:Event):void		{
			
			this.removeEventListener("ON_RESIZE",resizeHandler);			this.removeEventListener(Event.REMOVED_FROM_STAGE,removeHandler);					}				public function resizeHandler(e:Event):void		{			scale();		}				public function scale():void		{			this.x = stage.stageWidth/2;			this.y = stage.stageHeight/2;					}	}	}