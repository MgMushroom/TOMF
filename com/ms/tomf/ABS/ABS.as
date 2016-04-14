package com.ms.tomf.ABS
{
	import flash.display.MovieClip;
	import com.ms.tomf.ABS.Projectiles.ABSprojectiles;
	
	public class ABS extends MovieClip
	{
		private var absContent:Object;
		
		public function ABS()
		{
			setContent();
			addContent();
		}
		
		private function setContent():void
		{
			absContent.ABSproj = new ABSprojectiles;
		}
		
		private function addContent():void
		{
			this.addChild(absContent.ABSproj);
		}
	}
}