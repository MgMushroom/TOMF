package com.ms.tomf.Screens.InGame.UIweapons
{
	import flash.display.MovieClip;
	import com.ms.tomf.Screens.InGame.Controls;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class weaponMenuMelee extends MovieClip
	{
		private var stopper:Object = new Object;
		//private var snd:Sound = new Sound(new URLRequest("sound.mp3")); 
		public static var frame:Object = new Object;
	
		public function weaponMenuMelee()
		{
			gotoAndStop("sword1");
				
				stopper.c = true;
				stopper.v = true;
				this.addEventListener(Event.ENTER_FRAME, works);
		}	
		
		private function works(E:Event):void
		{
			if(Controls.keyboard.v)
			{stopper.v = false;}
				
			if(Controls.keyboard.v == false  && stopper.v == false)
			{nextFrame();/* snd.play();*/ stopper.v = true;}
				
			if(Controls.keyboard.c)
			{stopper.c = false;}
				
			if(Controls.keyboard.c == false && stopper.c == false)
			{prevFrame();/* snd.play();*/ stopper.c = true;}
		
		}
	}
}