package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(width = "640", height = "480", backgroundColor = "#000000")]
	public class Main extends Sprite
	{
		//used by mochiads to verify authenticity
		var _mochiads_game_id:String = "45eafdcfa21c112c";
		
		public function Main():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			MochiBot.track(this, "b6d3436b");
			addChild(new Game(this));
		}
	}
}