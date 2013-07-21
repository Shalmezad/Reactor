package  
{
	import org.flixel.*;
	public class Atom extends FlxSprite
	{
		[Embed(source = "../assets/atom.png")] 
		private	var G_ATOM:Class;
		
		private var time:int;
		
		public function Atom() 
		{
			x = Math.random() * 300 + 10;
			y = Math.random() * 220 + 10;
			
			time = 0;
			
			this.velocity.x = (20 + Math.random() * 60);
			this.velocity.y = (20 + Math.random() * 60);
			if (Math.random() * 2 >= 1) {
				this.velocity.x *= -1;
			}
			if (Math.random() * 2 >= 1) {
				this.velocity.y *= -1;
			}
			
			this.elasticity = 1;
			loadGraphic(G_ATOM);
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
			time++;
			if (time > 5 * 30 && alive) {
				kill();
				GUI.energy += GUI.ATOM_GAIN;
				GUI.score += GUI.ATOM_GAIN;
			}
			if (!this.onScreen()) {
				kill();
			}
		}
		
	}

}