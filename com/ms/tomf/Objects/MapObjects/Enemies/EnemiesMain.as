package com.ms.tomf.Objects.MapObjects.Enemies
{
	import flash.display.MovieClip;
	
	public class EnemiesMain extends MovieClip
	{
<<<<<<< HEAD
		public static var enemies:Object = new Object;
		private var enemyArchive:Object = new Object;
=======
>>>>>>> 5dd6319085dd829744133daedd74a0e080d54ef9
		
		public function EnemiesMain()
		{
			addSetup(true);
		}
	
		private function setUp():void
		{
<<<<<<< HEAD
			enemyArchive.worm1 = new Array(3000,200);
			enemyArchive.worm2 = new Array(1200,200);
			enemyArchive.worm3 = new Array(4225,200);
			enemyArchive.worm4 = new Array(6000,200);
			enemyArchive.worm5 = new Array(11000,200);
			enemyArchive.worm6 = new Array(12250,200);
		
=======
			
>>>>>>> 5dd6319085dd829744133daedd74a0e080d54ef9
		}
	
		public function addSetup(clean:Boolean):void
		{
<<<<<<< HEAD
=======
			var enemies:Object = new Object;
			var enemyArchive:Object = new Object;
			
			enemyArchive.worm1 = new Array(3000,200,true,16);
			enemyArchive.worm2 = new Array(1200,200,true,20);
			enemyArchive.worm3 = new Array(4225,200,false,18);
			enemyArchive.worm4 = new Array(6000,200,false,22);
			enemyArchive.worm5 = new Array(11000,200,false,25);
			enemyArchive.worm6 = new Array(12250,200,false,23);
			
>>>>>>> 5dd6319085dd829744133daedd74a0e080d54ef9
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
<<<<<<< HEAD
		}	
	}
=======
		
			trace(enemies);
		}
	}	
>>>>>>> 5dd6319085dd829744133daedd74a0e080d54ef9
}