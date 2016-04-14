package com.ms.tomf.Objects.ABS.Projectiles
{
	import com.ms.tomf.Objects.Map;
	import com.ms.tomf.Objects.Player;
	import com.ms.tomf.Objects.MapObjects.Ground;
	import com.ms.tomf.Screens.InGame.Controls;
	import com.ms.tomf.Screens.InGame.InGame;
	import com.ms.tomf.Screens.InGame.Physics;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class RangeSpear extends MovieClip
	{	
		private var spear:Object = new Object;
		private var snd:Sound = new Sound(new URLRequest("spear.mp3"));
		
		public function RangeSpear(playerDirection:String,power:int,rotation:Number)
		{
			Controls.keyboard.space = false;
			snd.play();
			spear.fly = false;
			spear.dir = playerDirection;
			spear.yVel = 0; 
			spear.xVel = 0; 
			spear.rotationInRadians = 0;
			spear.rotation = rotation;
			
			this.rotation = spear.rotation
			this.spear.rotationInRadians = spear.rotation * Math.PI / 180;
			
			
			
			trace(this.rotation);
			
			if(spear.dir  == "right"){spear.speed = 30 + power/2;
				this.x = InGame.inGameContent.player.x + 40;}
			if(spear.dir  == "left"){spear.speed = 30 + power/2;
				this.x = InGame.inGameContent.player.x + 40;}
			
			this.y = InGame.inGameContent.player.y + 45;
			
			spear.startX = this.x 
			
			points(); 
			animation();
			
			this.addEventListener(Event.ENTER_FRAME, fly);
		}
		
	private function animation():void
		{		
			spear.know = InGame.inGameContent.player.x - InGame.inGameContent.map.x;
		}
		private function fly(e:Event):void
		{
			spear.xVel = Math.cos(spear.rotationInRadians) * spear.speed; //uses the cosine to get the xVel from the speed and rotation
			spear.yVel = Math.sin(spear.rotationInRadians) * spear.speed; //uses the sine to get the yVel
			
			x += spear.xVel; //updates the position
			y += spear.yVel;
			
			x -= Physics.movement.speedX
			y -= Physics.movement.speedY
			
			if(x+y>5000 || x+y<-5000)
			{remove();}
			
			/*if(Map.mapContent.ground.hitTestPoint(this.x + spear.leftPoint.x, this.y + spear.leftPoint.y, true))
			{spear.speed = 0} 
			if(Map.mapContent.ground.hitTestPoint(this.x + spear.rightPoint.x, this.y + spear.rightPoint.y, true))
			{spear.speed = 0}*/
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