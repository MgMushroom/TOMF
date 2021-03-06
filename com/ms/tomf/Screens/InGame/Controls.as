package com.ms.tomf.Screens.InGame
{
	import com.ms.tomf.Objects.Player;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class Controls extends MovieClip
	{
		public static var mouse:Object = new Object;
		public static var keyboard:Object = new Object;
		
		public function Controls()
		{
			trace("ADDED CONTROLS");
			
			keyData();
			
			this.addEventListener(Event.ENTER_FRAME, checkKeys);
		}
		
		private function mouseData():void
		{
		
		}
		
		private function keyData():void
		{
			keyboard.space = false;
			keyboard.shift = false;
			keyboard.w = false;
			keyboard.a = false;
			keyboard.d = false;
			keyboard.s = false;
			keyboard.q = false;
			keyboard.e = false;
		
		}
	
		private function checkKeys(e:Event):void
		{
			if(Player.state.dead == true)
			{stage.removeEventListener(KeyboardEvent.KEY_DOWN, checkKeyDown);}
			else{stage.addEventListener(KeyboardEvent.KEY_DOWN, checkKeyDown);}
			
			if(Player.state.dead == true)
			{stage.removeEventListener(KeyboardEvent.KEY_DOWN, checkKeyUp);}
			else{stage.addEventListener(KeyboardEvent.KEY_UP, checkKeyUp);}
		
			if(Player.state.dead == true)
			{stage.removeEventListener(MouseEvent.MOUSE_MOVE, checkDirection);}
			else{stage.addEventListener(MouseEvent.MOUSE_MOVE, checkDirection);}
			
		}
		private function checkDirection(e:MouseEvent):void
		{
			mouse.x = mouse.dirX;
			mouse.y = mouse.dirY;
			
			mouse.dirX = stage.mouseX;
			mouse.dirY = stage.mouseY;
		}
		private function checkKeyDown(e:KeyboardEvent):void
		{
			if(e.keyCode == 32){keyboard.space = true;}
			if(e.keyCode == 16){keyboard.shift = true;}
			if(e.keyCode == 87){keyboard.w = true;}
			if(e.keyCode == 65){keyboard.a = true;}
			if(e.keyCode == 68){keyboard.d = true;}
			if(e.keyCode == 83){keyboard.s = true;}
			if(e.keyCode == 81){keyboard.q = true;}
			if(e.keyCode == 69){keyboard.e = true;}
			if(e.keyCode == 67){keyboard.c = true;}
			if(e.keyCode == 86){keyboard.v = true;}
			if(e.keyCode == 49){keyboard.one = true;}
			if(e.keyCode == 50){keyboard.two = true;}
			if(e.keyCode == 51){keyboard.three = true;}
		}
		
		private function checkKeyUp(e:KeyboardEvent):void
		{
			if(e.keyCode == 32){keyboard.space = false;}
			if(e.keyCode == 16){keyboard.shift = false;}
			if(e.keyCode == 87){keyboard.w = false;}
			if(e.keyCode == 65){keyboard.a = false;}
			if(e.keyCode == 68){keyboard.d = false;}
			if(e.keyCode == 83){keyboard.s = false;}
			if(e.keyCode == 81){keyboard.q = false;}
			if(e.keyCode == 69){keyboard.e = false;}
			if(e.keyCode == 67){keyboard.c = false;}
			if(e.keyCode == 86){keyboard.v = false;}
			if(e.keyCode == 49){keyboard.one = false;}
			if(e.keyCode == 50){keyboard.two = false;}
			if(e.keyCode == 51){keyboard.three = false;}
		}
	}
}