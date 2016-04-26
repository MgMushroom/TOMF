package com.ms.tomf.System.SaveSpots
{
	import com.ms.tomf.Objects.Map;
	import com.ms.tomf.Objects.Player;
	import com.ms.tomf.Objects.MapObjects.Enemies.EnemiesMain;
	import com.ms.tomf.Screens.InGame.InGame;
	import com.ms.tomf.Screens.InGame.Physics;
	import com.ms.tomf.Objects.MapObjects.Enemies.EnemiesMain;
	
	import flash.display.MovieClip;
	
	public class Start extends MovieClip
	{
		public static var enemyArchiveData:Object = new Object;
		
		public function Start()
		{
		 ("THIS IS SAVE CLASS");	
		}
		
		public function startUp():void
		{
			
			Player.attributes.health = 100;
			Player.attributes.stamina = 100;
			Player.state.dead = false;
		
			Physics.movement.scrollY = 0;
			Physics.movement.scrollX = 0;
			
			enemyStartUp();
		
		}
	
		private function enemyStartUp():void
		{
			enemyArchiveData.worm1 = new Array (2000,400);
			enemyArchiveData.worm2 = new Array (2000,400);
			
		}
	}
}