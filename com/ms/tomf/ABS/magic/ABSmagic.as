package com.ms.tomf.ABS.magic
{
	import flash.display.MovieClip;
	import flash.events.*;
	import com.ms.tomf.Screens.InGame.Controls;
	import com.ms.tomf.Screens.InGame.UserInt;
	
	public class ABSmagic extends MovieClip
	{
		public function ABSmagic()
		{
			this.addEventListener(Event.ENTER_FRAME, checkMagic);
		}
	
		private function checkMagic(e:Event):void
		{
			setUp();
			if(UserInt.frame.magic)
			{doMagic();}
		}
	
		private function setUp():void
		{
			
		}
	
		private function doMagic():void
		{
			
		}
	}
}