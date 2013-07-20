package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var molecules:FlxGroup;
		private var walls:Walls;
		public function GameState() 
		{
			add(new FlxText(100, 100, 200, "TESTING"));
			molecules = new FlxGroup();
			molecules.add(new Molecule());
			add(molecules);
			walls = new Walls();
			add(walls);
		}
		
		override public function update() {
			super.update();
			FlxG.collide(molecules, walls);
		}
	}

}