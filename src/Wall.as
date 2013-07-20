package  
{
	
	import org.flixel.*;
	
	public class Wall extends FlxSprite
	{
		public function Wall(x:int, y:int, width:int, height:int) {
			this.x = x;
			this.y = y;
			makeGraphic(width, height, 0xffaaaaaa);
			this.immovable = true;
		}
	}
		

}