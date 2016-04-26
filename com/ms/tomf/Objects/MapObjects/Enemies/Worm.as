package com.ms.tomf.Objects.MapObjects.Enemies
{
	import com.ms.tomf.Objects.Map;
	import com.ms.tomf.Objects.Player;
	import com.ms.tomf.Screens.InGame.InGame;
	import com.ms.tomf.Screens.InGame.Physics;
	import com.ms.tomf.ABS.Projectiles.ABSprojectiles;
	
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
		
		public function Worm(params:Array)
		{
			setUpPoints();
			setUpProps();
			doHealthBar();
			
			gotoAndStop("worm");
			
			this.x = params[0];
			this.y = params[1];
			
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
		
			/*for(var i:int = 0; i < 4; i++)
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
			}*/
		
		}
		
		private function setUpProps():void
		{
			wormProp.speed = 10;
			wormProp.damage = 50;
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
<<<<<<< HEAD
			
			if(this.hitTestObject(ABSprojectiles.weapons.spear))
			{wormProp.health -= 2.5;}
			
			if(this.hitTestObject(EnemiesMain.enemies.worm))
			{this.x += 5;}
			
=======
			
			
			
>>>>>>> origin/master
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
			
			var playerDistanceY:int =(InGame.inGameContent.player.y - InGame.inGameContent.map.y);
			var wormDistanceY:int = (this.y - InGame.inGameContent.map.y);
			
			var summaryDis:int = playerDistance - wormDistance;
			var summaryDisY:int = playerDistanceY - wormDistanceY;
			
			
			
			if(summaryDis > 0)
			{wormProp.hitDir = "left";}
			else if(summaryDis < 0)
			{wormProp.hitDir = "right";}
				
			wormProp.wormY = wormDistance;
			
<<<<<<< HEAD
=======
			wormProp.wormY = wormDistance;
			
>>>>>>> origin/master
			
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
			
<<<<<<< HEAD
			trace(summaryDisY);
			if(summaryDis < 100 && summaryDis > -100  && summaryDisY > -150 && summaryDisY < 0)
			{
				
				var hitChance:int = Math.random()* 10;
				
				if(hitChance == 5)
				{hit();}
				hitChance = 0;
				
			}
			else
			{gotoAndStop("worm");}
		
		}
	
		private function hit():void
		{
			
			Player.attributes.health -= wormProp.damage;
			
			if(wormProp.hitDir == "right")
			{gotoAndStop("wormHit");
				
			}
			
			if(wormProp.hitDir == "left")
			{gotoAndStop("wormHit");
				//this.scaleX = 1;
			}
			
			
		}
	
		private function doHealthBar():void
		{
			wormProp.health = 100;
			wormProp.healthBar = new Sprite;
			
			wormProp.healthBar.graphics.beginFill(0xFF0000);
			wormProp.healthBar.graphics.drawRect(0,0,50,10);
			wormProp.healthBar.graphics.endFill();
			
			
			this.addChild(wormProp.healthBar);
			this.addEventListener(Event.ENTER_FRAME, checkBar);
		
		}
	
		private function checkBar(e:Event):void
		{
			wormProp.healthBar.y = -80;
			wormProp.healthBar.width = wormProp.health / 2;
			if(wormProp.health == 0)
			{remove();}
		}
	
		private function remove():void
		{
			wormProp.damage = 0;
			if(this.parent) this.parent.removeChild(this);
=======
>>>>>>> origin/master
		}
	}
}