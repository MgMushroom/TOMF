package com.ms.tomf.Objects.MapObjects.Enemies
{
	import com.ms.tomf.Objects.Map;
	import com.ms.tomf.Objects.Player;
	import com.ms.tomf.Screens.InGame.InGame;
	import com.ms.tomf.Screens.InGame.UserInt;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	public class Worm extends MovieClip
	{
	public static var leftPointWorm:Point; 
	public static var rightPointWorm:Point;
	public static var upPointWorm:Point;
	public static var downPointWorm:Point;
	
		public function Worm()
		{
			this.y = 800;
			this.x = 1500;
			this.addEventListener(Event.ENTER_FRAME, collision)
			setPoints();
			
		}
		private function setPoints():void
		{
			leftPointWorm = new Point(0, 67);
			rightPointWorm = new Point(200.60,67)
			upPointWorm = new Point(100.30, 0)
			downPointWorm = new Point(100.30, 134)
		}
	
		private function collision(E:Event)//Collision and checking if worm is close enough of player
		{
			if(this.hitTestObject(InGame.inGameContent.player))
			{Player.attributes.health -= 100;}
			
			//if (InGame.inGameContent.player.x -InGame.inGameContent.map.x >= (this.x - 600) )	

	
			if(this.hitTestObject(InGame.inGameContent.player))
			{Player.attributes.health -= 0;} 
			
			if ((InGame.inGameContent.player.x - InGame.inGameContent.map.x >= this.x - 600 && (InGame.inGameContent.player.x - InGame.inGameContent.map.x <= this.x )))
			{
				this.x -= 8;
			}
			if ((InGame.inGameContent.player.x - InGame.inGameContent.map.x >= this.x - 600 && (InGame.inGameContent.player.x - InGame.inGameContent.map.x <= this.x + 700)))
			{	
				this.x += 4;
			}		
		}
	}
}