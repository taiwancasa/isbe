package com.object {		import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;	import com.greensock.*;	import com.greensock.easing.*;	import com.data.FBData;			public class CreateCookieWindow extends MovieClip {				private var fd:FBData;		private var cman:CookieManInWindow;						private  var _part1:Number = new Number();		private  var _part2:Number = new Number();		private  var _part3:Number = new Number();		private  var _part4:Number = new Number();
		private var nowSlideNum:Number = 1;				private var body:CookieBody;		private var acc:CookieAcc;		private var hand:CookieHand;		private var face:CookieFace;
						var partMenu:MovieClip;				private var nowTag:Number = new Number(1);				public function CreateCookieWindow() {						this.addEventListener(Event.ADDED_TO_STAGE,loadInit);
								}						public function loadInit(e:Event):void		{			fd = new FBData();			loadName();			cman = new CookieManInWindow();			this.addChild(cman);			cman.x = -230;			cman.y = -20;						setTag();			setPartMenuBtn();			setClickPart(1);			setNextStep();			this.addEventListener("ON_RESIZE",resizeHandler);			this.removeEventListener(Event.ADDED_TO_STAGE,loadInit);			scale();
			judgeArrowBtnShow();
			setCookieManPart();		}				private function setNextStep()		{			btn.addEventListener(MouseEvent.CLICK,clickNextStep);		}						private function clickNextStep(e:Event):void		{			saveData();			this.dispatchEvent(new Event("OpenFriendWindow",true));		}				public function saveData():void		{			fd.setSelf_loveDes(des_txt.text);			var ary1:Array = [_part1,1,1];			var ary2:Array = [_part2,1,1];			var ary3:Array = [_part3,1,1];			var ary4:Array = [_part4,1,1];			fd.setCookie1(ary1);			fd.setCookie2(ary2);			fd.setCookie3(ary3);			fd.setCookie4(ary4);		}				private function setPartMenuBtn()		{			partMenu = new MovieClip();			this.addChild(partMenu);						partMenu.x = maskBox.x;			partMenu.y = maskBox.y;						partMenu.mask = maskBox;						//			body = new CookieBody();			acc = new CookieAcc();			hand = new CookieHand();			face = new CookieFace();			//			prevBtn.addEventListener(MouseEvent.CLICK,prevHandler);			nextBtn.addEventListener(MouseEvent.CLICK,nextHandler);			//			
			
					}						private function prevHandler(e:MouseEvent):void		{			var num = partMenu.x;			num += 270;
			if(nowSlideNum >1 )
			{
				nowSlideNum--;
				TweenLite.killTweensOf(partMenu);
				var pos = -(nowSlideNum-1)*270-330;
				TweenLite.to(partMenu,1,{x:pos,ease:Elastic.easeOut});
				
			}			judgeArrowBtnShow();					}						private function nextHandler(e:MouseEvent):void		{			var num = partMenu.x;
						num -= 270;
			//trace(num)
			//trace(maskBox.width - partMenu.width + maskBox.x )
			//if(partMenu.x>=maskBox.width - partMenu.width + maskBox.x - 25 )
			if(nowSlideNum<4)			
			{
				nowSlideNum++;
				TweenLite.killTweensOf(partMenu);
				var pos = -(nowSlideNum-1)*270-330;
				TweenLite.to(partMenu,1,{x:pos,ease:Elastic.easeOut});
				
			}			
			judgeArrowBtnShow();								}
		
		private function judgeArrowBtnShow()
		{
			prevBtn.visible = true;
			nextBtn.visible = true;
			
			if(nowSlideNum==1)
			{
				prevBtn.visible = false;
			}
			if(nowSlideNum==4)
			{
				nextBtn.visible = false;
			}
		}
		
						private function setClickPart(num)		{			menuBtn(num);		}						private function menuBtn(num)		{			while (partMenu.numChildren > 0) {    			partMenu.removeChildAt(0);			}			//			for(var a=1;a<=12;a++)			{												var mc;				switch(num)				{					case 1:						mc = new CookieBody();						break;					case 2:						mc = new CookieFace();						break;					case 3:						mc = new CookieHand();						break;					case 4:						mc = new CookieAcc();						break;				}								partMenu.addChild(mc);				mc.gotoAndStop(a);				mc.scaleX = mc.scaleY = .3;				mc.x = a*90 - 50;				mc.y = 32;				mc.thisNum = a;				mc.addEventListener(MouseEvent.CLICK,partClickHandler);				if(num == 4)				{					mc.y = 60;				}			}		}						private function partClickHandler(e:MouseEvent):void		{			var num = e.currentTarget.thisNum;			this["_part"+nowTag] = num;			cman.changePart(_part1,_part2,_part3,_part4);		}				private function setTag()		{			tag2.gotoAndStop(2);			tag3.gotoAndStop(2);			tag4.gotoAndStop(2);			//			tag2.dy_txt.text = "表情";			tag3.dy_txt.text = "手腳";			tag4.dy_txt.text = "配件";			//			tag1.addEventListener(MouseEvent.CLICK,tag1Handler);			tag2.addEventListener(MouseEvent.CLICK,tag2Handler);			tag3.addEventListener(MouseEvent.CLICK,tag3Handler);			tag4.addEventListener(MouseEvent.CLICK,tag4Handler);					}						private function tag1Handler(e:Event):void		{			btnPress(1);		}				private function tag2Handler(e:Event):void		{			btnPress(2);		}		private function tag3Handler(e:Event):void		{			btnPress(3);		}		private function tag4Handler(e:Event):void		{			btnPress(4);		}												private function btnPress(num)		{			var tag;			for(var a=1;a<=4;a++)			{				tag = this["tag"+a];				tag.gotoAndStop(2);			}			this["tag"+num].gotoAndStop(1);			nowTag = num;			setClickPart(num);
			
		
			TweenLite.killTweensOf(partMenu);
			nowSlideNum = 1;
			judgeArrowBtnShow();
			TweenLite.to(partMenu,1,{x:maskBox.x,ease:Elastic.easeOut});		}				public function loadName()		{			name_txt.text = fd.getFB_name();		}						public function setPart1(num:Number):void		{			_part1 = num;			setCookieManPart();		}		public function setPart2(num:Number):void		{			_part2 = num;			setCookieManPart();		}		public function setPart3(num:Number):void		{			_part3 = num;			setCookieManPart();		}		public function setPart4(num:Number):void		{			_part4 = num;			setCookieManPart();		}				public function setCookieManPart()		{			cman.changePart(_part1,_part2,_part3,_part4);		}						public function getPart1():Number		{			return _part1;		}		public function getPart2():Number		{			return _part2;		}		public function getPart3():Number		{			return _part3;		}		public function getPart4():Number		{			return _part4;		}										public function resizeHandler(e:Event):void		{			scale();		}				public function scale():void		{			this.x = stage.stageWidth/2;			this.y = stage.stageHeight/2;		}	}	}