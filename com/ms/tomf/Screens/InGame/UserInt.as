package com.ms.tomf.Screens.InGame
{
	import com.ms.tomf.ABS.Projectiles.ABSprojectiles;
	import com.ms.tomf.Objects.Map;
	import com.ms.tomf.Objects.MapObjects.Enemies.Worm;
	import com.ms.tomf.Objects.Player;
	import com.ms.tomf.Screens.InGame.Controls;
	import com.ms.tomf.Screens.InGame.UIweapons.*;
	import com.ms.tomf.Screens.InGame.InGame;
	import com.ms.tomf.Screens.InGame.UIweapons.weaponMenuMagic;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class UserInt extends MovieClip
	{
		private var bars:Object = new Object;
		private var textF:TextField = new TextField;
		private var stopper:Object = new Object;
		private var difUI:Object = new Object;
		private var snd:Sound = new Sound(new URLRequest("sound.mp3")); 
		public static var frame:Object = new Object;
		
		public function UserInt()
		{
			gotoAndStop("spear");
			stopper.one = true;
			stopper.two = true;
			stopper.three = true;
			
			addBars();
			uiContent();
			this.addEventListener(Event.ENTER_FRAME, showPlayerParams);
		}
		
		private function uiContent():void
		{
			difUI.spearMenu = new weaponMenuSpear;
			difUI.swordMenu = new weaponMenuMelee;
			difUI.magicMenu = new weaponMenuMagic; 
			
			this.addChild(difUI.spearMenu);
			this.addChild(difUI.swordMenu);
			this.addChild(difUI.magicMenu);
			
			difUI.spearMenu.visible = false;
			difUI.swordMenu.visible = false;
			difUI.magicMenu.visible = false;
		
		}
		
		public function addBars():void
		{
			

			
			textF.background = true;
			textF.backgroundColor = 0xFF0000;
			//this.addChild(textF);
			

				

			bars.health = new Sprite;
			//bars.health.graphics.lineStyle(3,0x000000);
			bars.health.graphics.beginFill(0xFF0000);
			bars.health.graphics.drawRect(0,0,200,18);
			bars.health.graphics.endFill();
			bars.health.x = 30.5;
			bars.health.y = 35.3;
		
			bars.stamina = new Sprite;
			//bars.stamina.graphics.lineStyle(3,0x000000);
			bars.stamina.graphics.beginFill(0xFFFF00);
			bars.stamina.graphics.drawRect(0,0,1,18);
			bars.stamina.graphics.endFill();
			bars.stamina.x = 30.5;
			bars.stamina.y = 82.3;
		
			this.addChild(bars.health);
			this.addChild(bars.stamina);
		
		}
	
		public function showPlayerParams(e:Event):void
		{
			
			if(currentLabel == "spear")
			{frame.spear = true;}else{frame.spear = false;}
			
			if(currentLabel == "melee")
			{frame.melee = true;}else{frame.melee = false;}
			
			if(currentLabel == "magic")
			{frame.magic = true;}else{frame.magic = false;}
			
			if(Controls.keyboard.one)
			{stopper.one = false;}
			if(Controls.keyboard.two)
			{stopper.two = false;}
			if(Controls.keyboard.three)
			{stopper.three = false;}
			
			/*if(Controls.keyboard.one == false  && stopper.one == false)
			{gotoAndStop("spear"); snd.play(); stopper.one = true; this.addChild(difUI.spearMenu); this.removeChild(difUI.swordMenu); this.removeChild(difUI.magicMenu);}
			
			if(Controls.keyboard.two == false  && stopper.two == false)
			{gotoAndStop("melee"); snd.play(); stopper.two = true; this.addChild(difUI.swordMenu); this.removeChild(difUI.spearMenu); this.removeChild(difUI.magicMenu);}
			
			if(Controls.keyboard.three == false  && stopper.three == false)
			{gotoAndStop("magic"); snd.play(); stopper.three = true; this.addChild(difUI.magicMenu); this.removeChild(difUI.swordMenu); this.removeChild(difUI.spearMenu);}*/
		
			if(Controls.keyboard.one == false  && stopper.one == false)
			{gotoAndStop("spear"); snd.play(); stopper.one = true; difUI.spearMenu.visible = true; difUI.swordMenu.visible = false; difUI.magicMenu.visible = false;}
			
			if(Controls.keyboard.two == false  && stopper.two == false)
			{gotoAndStop("melee"); snd.play(); stopper.two = true; difUI.swordMenu.visible = true; difUI.spearMenu.visible = false; difUI.magicMenu.visible = false;}
			
			if(Controls.keyboard.three == false  && stopper.three == false)
			{gotoAndStop("magic"); snd.play(); stopper.three = true; difUI.magicMenu.visible = true; difUI.spearMenu.visible = false; difUI.swordMenu.visible = false;}
			
			
			if(Controls.keyboard.q)
			{stopper.q = false;}
			
			if(Controls.keyboard.q == false && stopper.q == false)
			{prevFrame(); snd.play(); stopper.q = true;}
			
			bars.health.width = Player.attributes.health * 2;
			bars.stamina.width = ABSprojectiles.weapons.projectile.power * 4;
		}
	}
}