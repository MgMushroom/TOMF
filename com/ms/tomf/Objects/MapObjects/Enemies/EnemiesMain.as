package com.ms.tomf.Objects.MapObjects.Enemies
{
	import flash.display.MovieClip;
	
	public class EnemiesMain extends MovieClip
	{
		public static var enemies:Object = new Object;
		
		public function EnemiesMain()
		{
			setUp()
			addSetup();
		}
	
		private function setUp():void
		{
			enemies.worm = new Worm;
		}
	
		private function addSetup():void
		{
			this.addChild(enemies.worm);
		}	
	}
}