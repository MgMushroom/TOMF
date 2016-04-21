package com.ms.tomf.Screens.InGame
{
	import com.ms.tomf.ABS.Projectiles.ABSprojectiles;
	import com.ms.tomf.ABS.magic.ABSmagic;
	import com.ms.tomf.ABS.melee.ABSmelee;
	import com.ms.tomf.Adjustments.groundAdjustment;
	import com.ms.tomf.Objects.Map;
	import com.ms.tomf.Objects.MapObjects.Enemies.Worm;
	import com.ms.tomf.Objects.MenuItems.PlayButton;
	import com.ms.tomf.Objects.Player;
	import com.ms.tomf.Screens.Menus.InGameMenu;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class InGame extends MovieClip
	{
		private var minion:Sprite = new Sprite;
		public static var inGameContent:Object = new Object;
		
		
		public function InGame()
		{
			trace("INGAME ACTIVED");
			
			if(PlayButton.changeScreenKEY == "GAME")
			{}
			
			defineInGameContent();
			addInGameContent();
		}
			
		private function defineInGameContent():void
		{
			inGameContent.physics = new Physics;
			inGameContent.controls = new Controls;
			inGameContent.map = new Map;
			inGameContent.player = new Player;
			inGameContent.absProj = new ABSprojectiles;
			inGameContent.absMelee = new ABSmelee;
			inGameContent.absMagic = new ABSmagic;
			inGameContent.ui = new UserInt;
			inGameContent.inGameMenu = new InGameMenu;
			inGameContent.groundAdj = new groundAdjustment;
			//inGameContent.Worm = new Worm;
			
		}
		
		private function addInGameContent():void
		{
			this.addChild(inGameContent.physics);
			this.addChild(inGameContent.controls);
			this.addChild(inGameContent.map);
			this.addChild(inGameContent.groundAdj);
			this.addChild(inGameContent.player);
			this.addChild(inGameContent.absProj);
			this.addChild(inGameContent.absMelee);
			this.addChild(inGameContent.absMagic);
			this.addChild(inGameContent.ui);
			this.addChild(inGameContent.inGameMenu);
			//this.addChild(inGameContent.Worm);
		}
	}
}