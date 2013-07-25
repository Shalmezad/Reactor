package  
{
	import org.flixel.*;
	public class TitleState extends FlxState
	{
		
		public function TitleState() 
		{
			add(new FlxText(30, 30, 200, "Reactor"));
			add(new FlxText(30, 50, 200, "By: Shalmezad"));
			add(new FlxButton(30, 75, "Start", startGame));
		}
		
		override public function update():void
		{
			super.update();
			//if (FlxG.mouse.justReleased()) {
			//	startGame();
			//}
		}
		
		public function startGame() {
			//reset the gui
			GUI.energy = 3000;
			GUI.level = 1;
			GUI.score = 0;
			FlxG.switchState(new GameState(1));
		}
	}

}