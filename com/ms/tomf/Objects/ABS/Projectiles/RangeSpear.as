package com.ms.tomf.Objects.ABS.Projectiles
{
	import com.ms.tomf.Objects.Player;
	import com.ms.tomf.Objects.MapObjects.Ground;
	import com.ms.tomf.Screens.InGame.Controls;
	import com.ms.tomf.Screens.InGame.InGame;
	import com.ms.tomf.Screens.InGame.Physics;
	import com.ms.tomf.Objects.Map;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class RangeSpear extends MovieClip
	{	
		private var spear:Object = new Object;
		
		public function RangeSpear(playerDirection:String,power:int)
		{
			Controls.keyboard.space = false;
			
			spear.fly = false;
			spear.dir = playerDirection;
			this.visible = true;
			
			if(spear.dir  == "right"){spear.speed = 15 + power/2;
				this.x = InGame.inGameContent.player.x + 150;}
			if(spear.dir  == "left"){spear.speed = -15 - power/2;
				this.x = InGame.inGameContent.player.x - 50;}
			
			this.y = InGame.inGameContent.player.y + 45;
			
			spear.startX = this.x 
			
			points(); 
			animation();
			
			this.addEventListener(Event.ENTER_FRAME, fly);
		}
		private function animation():void
		{
			if(spear.dir  == "right")
			{gotoAndStop("spearRight");}
			if(spear.dir  == "left")
			{gotoAndStop("spearLeft");}
			
			spear.know = InGame.inGameContent.player.x - InGame.inGameContent.map.x;
		}
		private function fly(e:Event):void
		{
			
			this.y -= Physics.movement.speedY;
			this.x -= Physics.movement.speedX;
			
			
			if(spear.dir == "right")
			{
				this.x += spear.speed;
				
				if ( this.x > spear.startX + 600)
				{
					remove()
				}
			}
			
			if(spear.dir == "left")
			{
				this.x += spear.speed;
				
				if ( this.x < spear.startX - 1200)
				{
					remove()
				}
			}
			
			if(Map.mapContent.ground.hitTestPoint(this.x + spear.leftPoint.x, this.y + spear.leftPoint.y, true))
			{spear.speed = 0} 
			if(Map.mapContent.ground.hitTestPoint(this.x + spear.rightPoint.x, this.y + spear.rightPoint.y, true))
			{spear.speed = 0} 
		}
		
		private function points():void
		{
			spear.leftPoint = new Point(-157.50, -6);
			spear.rightPoint = new Point(-130, -6);
		}
		
		private function remove():void
		{
			if (this.parent) this.parent.removeChild(this);
			
		}
		
	}
}