﻿package com.object {		import flash.display.MovieClip;	import flash.events.Event;		public class CookieFace extends MovieClip {				public var thisNum:Number;				public function CookieFace() {			this.addEventListener(Event.ADDED_TO_STAGE,loadInit);					}						public function loadInit(e:Event):void		{			this.removeEventListener(Event.ADDED_TO_STAGE,loadInit);			stop();			//trace("frame:" + this.totalFrames)			var num = Math.round(Math.random()*this.totalFrames);			this.gotoAndStop(num);		}	}	}