package  
{
	import org.flixel.*;
	public class TitleState extends FlxState
	{
		
		public function TitleState() 
		{
			add(new FlxText(30, 30, 200, "Reactor"));
			add(new FlxText(30, 50, 200, "By: Shalmezad"));
			add(new FlxText(30, 75, 200, "Click to start."));
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justReleased()) {
				//reset the gui
				GUI.energy = 3000;
				GUI.level = 1;
				GUI.score = 0;
				FlxG.switchState(new GameState(1));
			}
		}
	}

}