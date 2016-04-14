package com.ms.tomf.Objects.ABS.Projectiles
{
	import com.ms.tomf.Objects.Player;
	import com.ms.tomf.Objects.ABS.Projectiles.RangeSpear;
	import com.ms.tomf.Objects.ABS.Projectiles.ABSrotate;
	import com.ms.tomf.Screens.InGame.Controls;
	import com.ms.tomf.Screens.InGame.InGame;
	
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class ABS extends MovieClip
	{
		public static var weapons:Object = new Object;
		private var helpers:Object = new Object;
	
		public function ABS()
		{
			
			
			setWeaponsContent();
			addWeaponsContent();
			
		}
	
		private function setWeaponsContent():void
		{
			weapons.projectile = new Object;
			helpers.absRotate = new ABSrotate;
				helpers.absRotate.visible = false;
		}
		
		private function addWeaponsContent():void
		{
			this.addChild(helpers.absRotate);
			
			this.addEventListener(Event.ENTER_FRAME, projectiles);
		}
	
		private function projectiles(e:Event):void
		{
			
			lauch();
			
		}
	
		private function lauch():void
		{
			
			var player:Player = InGame.inGameContent.player;
			
			if(Controls.keyboard.space == true)
			{
				weapons.projectile.lauch = true;
				weapons.projectile.power++;
				helpers.absRotate.visible = true;
				
				if(weapons.projectile.power > 50)
				{weapons.projectile.power = 50;}
			}
			
			if(Controls.keyboard.space == false && weapons.projectile.lauch == true)
			{
				weapons.spear = new RangeSpear(Player.state.dir, weapons.projectile.power, ABSrotate.rotationABS);
				this.addChild(weapons.spear);
				
				helpers.absRotate.visible = false;
				weapons.projectile.power = 0;
				weapons.projectile.lauch = false;
			}
		}
	}
}