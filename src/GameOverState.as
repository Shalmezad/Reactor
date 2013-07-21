package  
{
	import org.flixel.*;
	public class GameOverState extends FlxState
	{
		private var tick:int;
		public function GameOverState() 
		{
			add(new FlxText(20, 20, 200, "GAME OVER"));
			add(new FlxText(20, 30, 200, "Final score: " + GUI.score.toString()));
			tick = 0;
		}
		override public function update():void
		{
			tick++;
			if (tick >= 30 * 5) {
				FlxG.switchState(new TitleState());
			}
		}
		
	}

}