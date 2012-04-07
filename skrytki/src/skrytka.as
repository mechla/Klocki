package
{
  import flash.display.MovieClip;
  import flash.display.Shape;
  import flash.geom.Point;
  
  public class skrytka extends MovieClip
  {
    private var _net_size:Number = 10;
    //    private var _name:String =  'none';
    
    private var _room:MovieClip;
    private var _bg:MovieClip;
    public function skrytka(width:Number,depth:Number,height:Number,color:uint)
    {
      this.buttonMode = true;
      
      width = width*.7;
      height = height*.7;
      depth = depth*.7;
      
      
      _bg =  new MovieClip();
      _bg.graphics.beginFill(0xffffff,0);
      _bg.graphics.moveTo(0,-height);
      _bg.graphics.lineTo(width,-height)
      _bg.graphics.lineTo(width,0);
      _bg.graphics.lineTo(-(2.3*depth)+width,depth);
      _bg.graphics.lineTo(-(2.3*depth),depth);
      _bg.graphics.lineTo(-(2.3*depth),-height+depth);
      _bg.graphics.lineTo(0,-height);
      _bg.graphics.endFill();
      
      room = new MovieClip();
      room.graphics.lineStyle(1, color, 1);
      room.graphics.moveTo(0,0);
      room.graphics.lineTo(0,-height);
      room.graphics.lineTo(width,-height);
      room.graphics.lineTo(width,0);
      
      room.graphics.moveTo(0,-height);
      room.graphics.lineTo(-(2.3*depth),-height+depth);
      room.graphics.lineTo(-(2.3*depth),depth);
      room.graphics.lineTo(0,0);
      
      room.graphics.moveTo(-(2.3*depth),depth);
      room.graphics.lineTo(-(2.3*depth)+width,depth);
      room.graphics.lineTo(width,0);
      
      room.graphics.lineStyle(1, color, .2);
      var net_point:Point =  new Point(0,0);
      for(var i:int = 0;i<8;i++){
        room.graphics.moveTo(net_point.x+_net_size,net_point.y);
        room.graphics.lineTo(net_point.x+_net_size -2.3*depth,net_point.y+depth);
        net_point =  new Point (net_point.x+_net_size, net_point.y)
        
        
      }
      net_point =  new Point(0,0);
      for(i = 0;i<21;i++){
        if(net_point.y<depth){
          room.graphics.moveTo(net_point.x,net_point.y);
          room.graphics.lineTo(net_point.x+width,net_point.y);
          net_point =  new Point (net_point.x-2.3*_net_size/2, net_point.y+_net_size/2)
        }
        
        
      }
//      addChild(_bg);
      addChild(room);
	  room.addChild(_bg);
    }
    
//    public function addBg():void{
//		addChild(_bg);
//	}
//    public function removeBg():void{
//		removeChild(_bg);
//	}
    public function get room():MovieClip
    {
      return _room;
    }
    
    public function set room(value:MovieClip):void
    {
      _room = value;
    }
    
    public function get bg():MovieClip
    {
      return _bg;
    }
    
    
    
    
    
    
  }
}