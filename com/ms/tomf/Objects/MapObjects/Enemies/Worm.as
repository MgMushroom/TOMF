package com.ms.tomf.Objects.MapObjects.Enemies
{
	import com.ms.tomf.Screens.InGame.Physics;
	import com.ms.tomf.Objects.Map;
	import com.ms.tomf.Screens.InGame.InGame;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Worm extends MovieClip
	{
		private var leftPointWorm:Point; 
		private var rightPointWorm:Point;
		private var upPointWorm:Point;
		private var downPointWorm:Point;
		
		private var wormProp:Object = new Object;
		private var testSprite:Sprite = new Sprite;
		
		public function Worm()
		{
			setUpPoints();
			setUpProps();
			
			this.x = 1000;
			this.y = 400;
			this.addEventListener(Event.ENTER_FRAME, movement);
			this.addEventListener(Event.ENTER_FRAME, collision);
			this.addEventListener(Event.ENTER_FRAME, playerDec);
		}
	
		private function setUpPoints():void
		{
			leftPointWorm = new Point(-100.30, 0);
			rightPointWorm = new Point(100.30, 0)
			upPointWorm = new Point(0, -67)
			downPointWorm = new Point(0, 50)
		
			for(var i:int = 0; i < 4; i++)
			{
				if(i == 0)
				{
					testingSprite(leftPointWorm.x,leftPointWorm.y);
				}
				if(i == 1)
				{
					testingSprite(rightPointWorm.x,rightPointWorm.y);
				}
				if(i == 2)
				{
					testingSprite(upPointWorm.x,upPointWorm.y);
				}
				if(i == 3)
				{
					testingSprite(downPointWorm.x,downPointWorm.y);
				}
			}
		
		}
		
		private function setUpProps():void
		{
			wormProp.speed = 5;
		}
		
		private function testingSprite(xS:Number, yS:Number):void
		{
			this.testSprite = new Sprite;
			testSprite.x = xS;
			testSprite.y = yS;
			testSprite.graphics.beginFill(0xFF0000);
			testSprite.graphics.drawRect(0,0,5,5);
			testSprite.graphics.endFill();
			this.addChild(testSprite);
		}
			
		private function movement(e:Event):void
		{
			
			this.y += 5;
			this.x -= Physics.movement.speedX;
			this.y -= Physics.movement.speedY;
		}
	
		private function collision(e:Event):void
		{
			if(Map.mapContent.ground.hitTestPoint(this.x + downPointWorm.x, this.y + downPointWorm.y, true))
				{this.y -= 5;	wormProp.wormDown = true;}
			else{wormProp.wormDown = false;}
			if(Map.mapContent.ground.hitTestPoint(this.x + upPointWorm.x, this.y + upPointWorm.y, true))
			{this.y += 20;	wormProp.wormUp = true;}
			else{wormProp.wormUp = false;}
			if(Map.mapContent.ground.hitTestPoint(this.x + rightPointWorm.x, this.y + rightPointWorm.y, true))
			{this.y -= 50; wormProp.wormRight = true;}
			else{wormProp.wormRight = false;}
			if(Map.mapContent.ground.hitTestPoint(this.x + leftPointWorm.x, this.y + leftPointWorm.y, true))
			{this.y -= 50;	wormProp.wormLeftown = true;}
			else{wormProp.wormLeft = false;}
			
			
			
			if(Map.mapContent.ground.hitTestObject(this))
			{wormProp.inBounds = true;}
			else{wormProp.inBounds = false;}
		
			if(wormProp.inBounds == false)
			{this.y -= 400;}
		}
	
		private function playerDec(e:Event):void
		{
			
			var playerDistance:int =(InGame.inGameContent.player.x - InGame.inGameContent.map.x);
			var wormDistance:int = (this.x - InGame.inGameContent.map.x);
			var summaryDis:int = playerDistance - wormDistance;
			
			wormProp.wormY = wormDistance;
			
			
			if(summaryDis < 700 && summaryDis > 100)
			{
				this.x += wormProp.speed;
				this.scaleX = 1;
			}
			
			if(summaryDis > -700 && summaryDis < -100)
			{
				this.x -= wormProp.speed;
				this.scaleX = -1;
			}
			
		}
	}
}