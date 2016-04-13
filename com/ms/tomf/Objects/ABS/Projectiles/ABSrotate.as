package com.ms.tomf.Objects.ABS.Projectiles
{
	import com.ms.tomf.Screens.InGame.Controls;
	import com.ms.tomf.Screens.InGame.InGame;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ABSrotate extends MovieClip
	{
		
		public static var rotationABS:Number;
		
		public function ABSrotate()
		{
			this.x = InGame.inGameContent.player.x + InGame.inGameContent.player.width *0.5;
			this.y = InGame.inGameContent.player.y + InGame.inGameContent.player.height *0.5;
			
			this.addEventListener(Event.ENTER_FRAME,check);
			
		}
	
		private function check(e:Event):void
		{
			//calculate these values, which we will use to determine the angle we need to rotate to
			var yDifference:Number =  Controls.mouse.y - y;
			var xDifference:Number =  Controls.mouse.x - x;
			//this constant will convert our angle from radians to degrees
			var radiansToDegrees:Number = 180/Math.PI;
			//this final line uses trigonometry to calculate the rotation
			rotation = Math.atan2(yDifference, xDifference) * radiansToDegrees;
			rotationABS = this.rotation;
		}
	}
}