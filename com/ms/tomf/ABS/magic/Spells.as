package com.ms.tomf.ABS.magic
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.ms.tomf.Objects.Player;
	
	public class Spells extends MovieClip
	{
		private var spell:Object = new Object;
		private var activeSpell:Object = new Object;
		
		public function Spells(spell:int)
		{
			activeSpell.spell = spell;
			activeSpell.dir = Player.state.dir;
			
			if(activeSpell.spell == 2)
			{activeSpell.barrier = true;}
			
			trace(activeSpell.spell);
			this.addEventListener(Event.ENTER_FRAME, checkActive);
			
		}
	
		private function checkActive(e:Event)
		{
			
			if(activeSpell.barrier == true)
			{
			
				activeSpell.barrier = false;
			
			spell.barrier = new Barrier(activeSpell.dir);
			this.addChild(spell.barrier);
			}
		}
	}
}		