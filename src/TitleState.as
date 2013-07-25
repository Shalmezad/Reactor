package  
{
	import org.flixel.*;
	public class TitleState extends FlxState
	{
		private var guiStuff:FlxGroup;
		private var walls:Walls;
		private var molecules:FlxGroup;
		
		public function TitleState() 
		{
			//add the walls.
			walls = new Walls();
			add(walls);
			
			//add some guistuff.
			guiStuff = new FlxGroup();
			guiStuff.add(new FlxText(80, 30, 200, "Reactor"));
			guiStuff.add(new FlxText(60, 50, 200, "By: Shalmezad"));
			guiStuff.add(new FlxButton(80, 75, "Start", startGame));
			add(guiStuff);
			//guiStuff.setAll("immovable", true);
			guiStuff.setAll("elasticity", 1);
			
			molecules = new FlxGroup();
			for (var a:int = 0; a < 10; a++){
				molecules.add(new Molecule(Math.random() * 300 + 10, Math.random() * 220 + 10, Math.random() * 4 + 2));
			}
			add(molecules);
			
			
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(molecules, walls);
			FlxG.collide(molecules, guiStuff);
			FlxG.collide(guiStuff, walls);
			FlxG.collide(molecules, molecules);
			FlxG.collide(guiStuff, guiStuff);
		}
		
		public function startGame() : void
		{
			//reset the gui
			GUI.energy = 3000;
			GUI.level = 1;
			GUI.score = 0;
			FlxG.switchState(new GameState(1));
		}
	}

}