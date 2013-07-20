package  
{
	import org.flixel.*;
	public class Walls extends FlxGroup
	{
		
		public function Walls(width:int = 320, height:int = 240) 
		{
			add(new Wall(0, 0, width, 10));
			add(new Wall(0, 0, 10, height));
			add(new Wall(0, height - 10, width, 10));
			add(new Wall(width - 10, 0, 10, height));
		}
		

	}

	
}