package  
{
	import org.flixel.*;
	public class Atom extends FlxSprite
	{
		[Embed(source = "../assets/atom.png")] 
		private	var G_ATOM:Class;
		
		private var time:int;
		private var speed:Number;
		private var direction:Number;
		
		public function Atom() 
		{
			x = Math.random() * 300 + 10;
			y = Math.random() * 220 + 10;
			
			time = 0;
			
			//use speed/direction to determine velocity x/y.
			speed = Math.random() * 80 + 20;
			setDirection(Math.random() * Math.PI * 2);
			
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
		
		public function setDirection(dir:Number) {
			direction = dir;
			this.velocity.x = (Math.cos(direction) * speed);
			this.velocity.y = (Math.sin(direction) * speed);
		}
		
		public function setDirectionWithVariance(dir:Number, vari:Number) {
			direction = dir + (Math.random() * vari * 2 - vari);
			this.velocity.x = (Math.cos(direction) * speed);
			this.velocity.y = (Math.sin(direction) * speed);
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