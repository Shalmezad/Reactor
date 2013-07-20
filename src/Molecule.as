package  
{
	import org.flixel.FlxSprite;
	public class Molecule extends FlxSprite
	{
		
		[Embed(source = "../assets/molecules/2.png")] 
		private	var M_2:Class;
		[Embed(source = "../assets/molecules/3.png")] 
		private	var M_3:Class;
 
		public function Molecule() 
		{
			x = Math.random() * 300 + 10;
			y = Math.random() * 220 + 10;
			this.velocity.x = -100 + Math.random() * 200;
			this.velocity.y = -100 + Math.random() * 200;
			this.elasticity = 1;
			switch((int)(Math.random() * 2)) {
				case 0:
					loadGraphic(M_2);
					break;
				case 1:
					loadGraphic(M_3);
					break;
			}
			switch((int)(Math.random() * 6)) {
				case 0:
					this.color = 0xFF00FF;
					break;
				case 1:
					this.color = 0xFFFF00;
					break;
				case 2:
					this.color = 0x00FFFF;
					break;
				case 3:
					this.color = 0xFF0000;
					break;
				case 4:
					this.color = 0x00FF00;
					break;
				case 5:
					this.color = 0x0000FF;
					break;
			}
			
		}
		
		override public function update():void
		{
			this.angle += 5;
		}
		
		
	}

}