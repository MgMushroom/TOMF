package com.ms.tomf.Adjustments
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.ms.tomf.Screens.InGame.Physics;
	import com.ms.tomf.Screens.InGame.InGame;
	
	
	public class groundAdjustment extends MovieClip
	{
		
		public function groundAdjustment()
		{
			this.addEventListener(Event.ENTER_FRAME, check)
		}
		private function check(E:Event):void
		{
			
			this.x = InGame.inGameContent.map.x;
			this.y = InGame.inGameContent.map.y;
		}
	}
}