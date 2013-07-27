package  
{
	import org.flixel.*;
	import mochi.as3.*;
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
			var title:FlxText = new FlxText(200, 30, 200, "Reactor");
			title.setFormat(null, 20, 0xffffff, "center");
			title.x = 160 - title.width / 2;
			guiStuff.add(title);
			var author:FlxText = new FlxText(80, 60, 200, "By: Shalmezad");
			author.setFormat(null, 8, 0xffffff, "center");
			author.x = 160 - author.width / 2;
			guiStuff.add(author);
			var startBtn:FlxButton = new FlxButton(80, 75, "Start", startGame);
			startBtn.x = 160 - startBtn.width / 2;
			guiStuff.add(startBtn);
			add(guiStuff);
			guiStuff.setAll("immovable", true);
			
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
			MochiEvents.startPlay();
			//reset the gui
			GUI.energy = 3000;
			GUI.level = 1;
			GUI.score = 0;
			FlxG.switchState(new GameState(1));
		}
	}

}