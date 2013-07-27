package  
{
	import org.flixel.*;
	import mochi.as3.*;
	public class GameOverState extends FlxState
	{
		private var tick:int;
		public function GameOverState() 
		{
			add(new FlxText(20, 20, 200, "GAME OVER"));
			add(new FlxText(20, 30, 200, "Final score: " + GUI.score.toString()));
			tick = 0;
			MochiEvents.endPlay();
			var o:Object = { n: [3, 11, 10, 15, 14, 8, 9, 15, 2, 10, 10, 13, 15, 9, 1, 15], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
			var boardID:String = o.f(0,"");
			MochiScores.showLeaderboard({boardID: boardID, score: GUI.score, onClose: closeGame});
		}
		override public function update():void
		{
			super.update();
			//tick++;
			//if (tick >= 30 * 5) {
			//	FlxG.switchState(new TitleState());
			//}
		}
		public function closeGame():void
		{
			FlxG.switchState(new TitleState());
		}
	}

}