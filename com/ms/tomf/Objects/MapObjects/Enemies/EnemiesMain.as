package com.ms.tomf.Objects.MapObjects.Enemies
{
	import flash.display.MovieClip;
	
	public class EnemiesMain extends MovieClip
	{
		public static var enemies:Object = new Object;
		private var enemyArchive:Object = new Object;
		
		public function EnemiesMain()
		{
			setUp()
			addSetup();
		}
	
		private function setUp():void
		{
			enemyArchive.worm1 = new Array(3000,200);
			enemyArchive.worm2 = new Array(1200,200);
			enemyArchive.worm3 = new Array(4225,200);
			enemyArchive.worm4 = new Array(6000,200);
			enemyArchive.worm5 = new Array(11000,200);
			enemyArchive.worm6 = new Array(12250,200);
		
		}
	
		private function addSetup():void
		{
			for(var i:int = 0;i<10;i++)
			{
				if(i==1)
				{
					enemies.worm = new Worm(enemyArchive.worm1);
					this.addChild(enemies.worm);
				}
			
				if(i==2)
				{
					enemies.worm = new Worm(enemyArchive.worm2);
					this.addChild(enemies.worm);
				}
			
				if(i==3)
				{
					enemies.worm = new Worm(enemyArchive.worm3);
					this.addChild(enemies.worm);
				}
				
				if(i==4)
				{
					enemies.worm = new Worm(enemyArchive.worm4);
					this.addChild(enemies.worm);
				}
			
				if(i==5)
				{
					enemies.worm = new Worm(enemyArchive.worm5);
					this.addChild(enemies.worm);
				}
			
				if(i==6)
				{
					enemies.worm = new Worm(enemyArchive.worm6);
					this.addChild(enemies.worm);
				}
			}
		}	
	}
}