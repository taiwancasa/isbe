﻿package com.object {
		private var nowSlideNum:Number = 1;
		
			
			judgeArrowBtnShow();
			setCookieManPart();
			
			
			if(nowSlideNum >1 )
			{
				nowSlideNum--;
				TweenLite.killTweensOf(partMenu);
				var pos = -(nowSlideNum-1)*270-330;
				TweenLite.to(partMenu,1,{x:pos,ease:Elastic.easeOut});
				
			}
			
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
			judgeArrowBtnShow();
		
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
		
		
			
		
			TweenLite.killTweensOf(partMenu);
			nowSlideNum = 1;
			judgeArrowBtnShow();
			TweenLite.to(partMenu,1,{x:maskBox.x,ease:Elastic.easeOut});