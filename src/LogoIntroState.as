package  
{
	import org.flixel.*;
	public class LogoIntroState extends FlxState
	{
		
		private var tick:int = 0;
		private var logo:FlxText;
		
		public function LogoIntroState() 
		{
			logo = new FlxText(50, 80, 320, "Shalmezad");
			logo.alpha = 0;
			logo.setFormat(null, 22);
			add(logo);
		}
		
		override public function update():void
		{
			tick++;
			if (tick < 100) {
				logo.alpha = tick/100;
			}
			else if (tick < 200) {
				logo.alpha = (200 - tick)/100;
			}
			else {
				FlxG.switchState(new GITDIntroState());
			}
		}
	}

}