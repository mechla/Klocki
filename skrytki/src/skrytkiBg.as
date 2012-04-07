package
{
	import flash.display.MovieClip;
	
	public class skrytkiBg extends MovieClip
	{
		private var _bg:MovieClip;
		public function skrytkiBg(width:Number,depth:Number,height:Number)
		{
			super();
			width = width*.7;
			height = height*.7;
			depth = depth*.7;
			
			
			_bg =  new MovieClip();
			_bg.graphics.beginFill(0xffffff,.7);
//			_bg.graphics.moveTo(-500,-500);
//			_bg.graphics.moveTo(-500,500);
//			_bg.graphics.moveTo(500,500);
//			_bg.graphics.moveTo(500,-500);
//			_bg.graphics.moveTo(-500,-500);
			_bg.graphics.moveTo(0,-height);
			
			_bg.graphics.lineTo(0,-500);
			_bg.graphics.lineTo(-500,-500);
			_bg.graphics.lineTo(-500,500);
			_bg.graphics.lineTo(500,500);
			_bg.graphics.lineTo(500,-500);
			_bg.graphics.lineTo(1,-500);
			_bg.graphics.lineTo(1,-height);
			
			_bg.graphics.lineTo(width,-height)
			_bg.graphics.lineTo(width,0);
			_bg.graphics.lineTo(-(2.3*depth)+width,depth);
			_bg.graphics.lineTo(-(2.3*depth),depth);
			_bg.graphics.lineTo(-(2.3*depth),-height+depth);
			_bg.graphics.lineTo(0,-height);
			_bg.graphics.endFill();
			addChild(_bg);
		}

		public function get bg():MovieClip
		{
			return _bg;
		}

		public function set bg(value:MovieClip):void
		{
			_bg = value;
		}

	}
}