package
{
  import flash.display.BitmapData;
  import flash.display.MovieClip;
  import flash.geom.Point;
  import flash.geom.Rectangle;
  
  public class Mebel extends MovieClip
  {
    private var _addedToArray:Boolean = false;
    private var _mc:MovieClip;
    private var _name:String;
    private var _clip:MovieClip;
    private var _rect:Rectangle;
    private var _bmpData:BitmapData;
    

    
    public function Mebel(name:String)
    {
      super();
      _clip =  new MovieClip();
     _name = name;
      switch (name)
      {
       
        case 'plasma':
          _mc = new plasma();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,0);
          _clip.graphics.lineTo(82,0);
          _clip.graphics.lineTo(82,4);
          _clip.graphics.lineTo(0,4);
          _clip.graphics.lineTo(0,0);
          _clip.graphics.endFill();
          addMebelOnStage(_mc); 
          break;
        case 'plasma2':
          _mc = new plasma2();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,25);
          _clip.graphics.lineTo(0,26);
          _clip.graphics.lineTo(61,2);
          _clip.graphics.lineTo(61,0);
          _clip.graphics.lineTo(0,25);
          _clip.graphics.endFill();
         
          addMebelOnStage(_mc);        
          break;
        
        case 'pralka':
          _mc    =  new pralka();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,14);
          _clip.graphics.lineTo(45,14);
          _clip.graphics.lineTo(68,3);
          _clip.graphics.lineTo(29,3);
          _clip.graphics.lineTo(0,14);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);        
          break;
        
        case 'fotel':
          _mc =  new fotel();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.drawEllipse(3,0,60,13);
         
          addMebelOnStage(_mc);    
          break;
        
        case 'lampa2':
          _mc =  new lampa2();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(11,35);
          _clip.graphics.lineTo(76,4);
          _clip.graphics.lineTo(76,1);
          _clip.graphics.lineTo(11,34);
          _clip.graphics.lineTo(11,35);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);     
          break;
        case 'lampa':
          _mc =  new lampa();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.drawEllipse(0,0,35,11);          
          _clip.graphics.endFill();
          addMebelOnStage(_mc);     
          break;
        case 'narty':
          _mc =  new narty();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,0);
          _clip.graphics.lineTo(37,0);
          _clip.graphics.lineTo(37,1);
          _clip.graphics.lineTo(0,1);
          _clip.graphics.lineTo(0,0);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);     
          break;
        
        case 'sofa':
          _mc =  new sofa();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(2,56);
          _clip.graphics.lineTo(70,56);
          _clip.graphics.lineTo(173,9);
          _clip.graphics.lineTo(101,9);
          _clip.graphics.lineTo(2,56);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);       
          break; 
        
        case 'szafa':
          _mc =  new szafa();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,11);
          _clip.graphics.lineTo(80,11);
          _clip.graphics.lineTo(103,0);
          _clip.graphics.lineTo(51,0);
          _clip.graphics.lineTo(0,11);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);     
          break;
        case 'szafa2':
          _mc =  new szafa2();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,23);
          _clip.graphics.lineTo(61,23);
          _clip.graphics.lineTo(113,0);
          _clip.graphics.lineTo(56,0);
          _clip.graphics.lineTo(0,23);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);     
          break;
        case 'opony':
          _mc =  new opony();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.drawEllipse(0,0,52,18);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);  
          break;
        case 'rower':
          _mc =  new rower();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,38);
          _clip.graphics.lineTo(76,0);
          _clip.graphics.lineTo(76,3);
          _clip.graphics.lineTo(0,44);
          _clip.graphics.lineTo(0,38);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);     
          break;
        case 'laptop':
          _mc =  new laptop();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,8);
          _clip.graphics.lineTo(34,8);
          _clip.graphics.lineTo(50,0);
          _clip.graphics.lineTo(20,0);
          _clip.graphics.lineTo(0,8);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);       
          break;
        case 'pudlo':
          _mc =  new pudlo();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,10);
          _clip.graphics.lineTo(36,10);
          _clip.graphics.lineTo(59,0);
          _clip.graphics.lineTo(22,0);
          _clip.graphics.lineTo(0,10);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);        
          break;
        case 'krzeslo':
          _mc =  new krzeslo();
          _clip.graphics.beginFill(0x00ff00,1);
          _clip.graphics.moveTo(0,9);
          _clip.graphics.lineTo(27,9);
          _clip.graphics.lineTo(45,1);
          _clip.graphics.lineTo(20,1);
          _clip.graphics.lineTo(0,9);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);
          break;
        case 'stol':
          _mc =  new stol();
          _clip.graphics.beginFill(0x00ff00,1);
//          _clip.graphics.moveTo(0,18);
          _clip.graphics.drawRect(0,18,1,1);
          
//          _clip.graphics.lineTo(80,21);
          _clip.graphics.drawRect(80,20,1,1);
//          _clip.graphics.lineTo(116,1);
          _clip.graphics.drawRect(116,1,1,1);
//          _clip.graphics.lineTo(38,1);
          _clip.graphics.drawRect(38,1,1,1);
//          _clip.graphics.lineTo(0,18);
          _clip.graphics.endFill();
          addMebelOnStage(_mc);
          break;
        default:
          trace('nie ma takiej nazwy');          
      }
    }
    public function addMebelOnStage(mc:MovieClip):void{
      this.addChild(mc);
//      this.addChild(_clip);
    }

    public function get addedToArray():Boolean
    {
      return _addedToArray;
    }

    public function set addedToArray(value:Boolean):void
    {
      _addedToArray = value;
    }

    public function get mc():MovieClip
    {
      return _mc;
    }

    public function getName():String{
      return name;
    }

    public function get clip():MovieClip
    {
      return _clip;
    }

    public function set clip(value:MovieClip):void
    {
      _clip = value;
    }

    public function get bmpData():BitmapData
    {
      return _bmpData;
    }

    public function set bmpData(value:BitmapData):void
    {
      _bmpData = value;
    }



   


  }
}