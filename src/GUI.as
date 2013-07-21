package  
{
	import org.flixel.*;
	public class GUI extends FlxGroup
	{
		public static const CLICK_COST:int = 200;
		public static const ATOM_DRAIN:int = 100;
		public static const ATOM_GAIN:int = 100;
		
		public static var energy:int = 3000;
		public static var level:int = 1;
		public static var score:int = 0;
		
		private var energyText:FlxText;
		private var levelText:FlxText;
		private var scoreText:FlxText;
		
		
		
		
		public function GUI() 
		{
			energyText = new FlxText(12, 12, 200, "ENERGY: 3000");
			add(energyText);
			levelText = new FlxText(110, 12, 200, "LEVEL: 1");
			add(levelText);
			scoreText = new FlxText(175, 12, 200, "SCORE: 0");
			add(scoreText);
		}
		override public function update():void
		{
			energyText.text = "ENERGY: " + energy.toString();
			levelText.text = "LEVEL: " + level.toString();
			scoreText.text = "SCORE: " + score.toString();
		}
		
	}

}