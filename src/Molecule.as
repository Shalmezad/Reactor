package  
{
	import org.flixel.FlxSprite;
	public class Molecule extends FlxSprite
	{
		
		[Embed(source = "../assets/molecules/2.png")] 
		private	var M_2:Class;
 
		public function Molecule() 
		{
			loadGraphic(M_2);
			this.color = 0xFF00FF;
		}
		
		override public function update():void
		{
			this.angle += 5;
		}
		
		
	}

}