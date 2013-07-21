package  
{
	import org.flixel.FlxSprite;
	public class Molecule extends FlxSprite
	{
		
		[Embed(source = "../assets/molecules/2.png")] 
		private	var M_2:Class;
		[Embed(source = "../assets/molecules/3.png")] 
		private	var M_3:Class;
		[Embed(source = "../assets/molecules/4.png")] 
		private	var M_4:Class;
		[Embed(source = "../assets/molecules/5.png")] 
		private	var M_5:Class;
 
		public var atoms:int;
		public static const MAXATOMS:int = 5;
		
		public function Molecule(xPos:int, yPos:int, size:int=2, color:int = 0) 
		{
			x = xPos;
			y = yPos;
			atoms = size;
			
			this.velocity.x = (20 + Math.random() * 60);
			this.velocity.y = (20 + Math.random() * 60);
			if (Math.random() * 2 >= 1) {
				this.velocity.x *= -1;
			}
			if (Math.random() * 2 >= 1) {
				this.velocity.y *= -1;
			}
			
			this.elasticity = 1;
			switch(size-2) {
				case 0:
					loadGraphic(M_2);
					break;
				case 1:
					loadGraphic(M_3);
					break;
				case 2:
					loadGraphic(M_4);
					break;
				case 3:
					loadGraphic(M_5);
					break;
				default:
					loadGraphic(M_2);
					break;
					
			}
			if(color == 0){
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
			else {
				this.color = color;
			}
			
		}
		
		override public function update():void
		{
			this.angle += 5;
			if (!this.onScreen()) {
				kill();
			}
		}
		
		
	}

}