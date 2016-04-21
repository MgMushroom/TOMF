package com.ms.tomf.Objects.MapObjects.Enemies
{
	import com.ms.tomf.Adjustments.groundAdjustment;
	import com.ms.tomf.Objects.Map;
	import com.ms.tomf.Objects.Player;
	import com.ms.tomf.Screens.InGame.InGame;
	import com.ms.tomf.Screens.InGame.Physics;
	import com.ms.tomf.Screens.InGame.UserInt;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Worm extends MovieClip
	{
	public static var wormMove:Boolean = true;
	public static var leftPointWorm:Point; 
	public static var rightPointWorm:Point;
	public static var upPointWorm:Point;
	public static var downPointWorm:Point;
	public static var bumpPointsWorm:Object = new Object;
	public static var wormSpeed = 8;
	public var sprite:Sprite = new Sprite;
		public function Worm()
		{
			
			this.y = 300;
			this.x = 2000;
			
			setPoints();
			
		}
		private function setPoints():void
		{
			leftPointWorm = new Point(-100.30, 67);
			rightPointWorm = new Point(100.60, 67)
			upPointWorm = new Point(0, 0)
			downPointWorm = new Point(0, 134)
			bumpPointsWorm.up = false;
			bumpPointsWorm.down = false;
			bumpPointsWorm.left = false;
			bumpPointsWorm.right = false;
			this.addEventListener(Event.ENTER_FRAME, collision)
			this.addEventListener(Event.ENTER_FRAME, speedWorm)
			addChild(sprite)
			sprite.x = rightPointWorm.x;
			sprite.y = rightPointWorm.y;
			sprite.graphics.beginFill(0xFF0000);
			sprite.graphics.drawRect(0,0,5,5);
			sprite.graphics.endFill();
			
		}
	
		private function speedWorm(E:Event)
		{
			this.y += 3;
			
		}
		private function collision(E:Event)//Collision and checking if worm is close enough of player
		{
			trace(this.y + "\n " + Worm.bumpPointsWorm.right);
			if(InGame.inGameContent.groundAdj.hitTestPoint(Map.mapContent.worm.x + Worm.upPointWorm.x, Map.mapContent.worm.y + Worm.upPointWorm.y, true))
			{
				Worm.bumpPointsWorm.right = true;
				
			} 
				else 
			{
				Worm.bumpPointsWorm.right = false;
			}
			if(Worm.bumpPointsWorm.right == true)
			{
				this.y -= 5;
			}

			/*if ((InGame.inGameContent.player.x - InGame.inGameContent.map.x >= this.x - 600 && (InGame.inGameContent.player.x - InGame.inGameContent.map.x <= this.x )))
			{
				
			}*/
			

			
			
			if(this.hitTestObject(InGame.inGameContent.player))
			{Player.attributes.health -= 0;} 
		
			if ((InGame.inGameContent.player.x - InGame.inGameContent.map.x >= this.x - 700 && (InGame.inGameContent.player.x - InGame.inGameContent.map.x <= this.x - 300 )))
			{ 
				wormMove = false;
				if((InGame.inGameContent.player.x - InGame.inGameContent.map.x >= this.x && (InGame.inGameContent.player.x - InGame.inGameContent.map.x <= this.x -200)))
				{
					this.x += wormSpeed;
				}
				
				this.x -= wormSpeed;
				//this.scaleX = -1;
			}
			 
			
			if ((InGame.inGameContent.player.x - InGame.inGameContent.map.x >= this.x ) && (InGame.inGameContent.player.x - InGame.inGameContent.map.x <= this.x + 800))

			if ((InGame.inGameContent.player.x - InGame.inGameContent.map.x >= this.x - 600 && (InGame.inGameContent.player.x - InGame.inGameContent.map.x <= this.x + 700)))

			{	
				wormMove = false;
				if((InGame.inGameContent.player.x - InGame.inGameContent.map.x >= this.x && (InGame.inGameContent.player.x - InGame.inGameContent.map.x <= this.x + 200 )))
				{
					this.x -= wormSpeed;
				}
				this.x += wormSpeed;
				//this.scaleX = 1;
			}		
		}
	}
}