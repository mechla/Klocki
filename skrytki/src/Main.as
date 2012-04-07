package
{
  import flash.display.BitmapData;
  import flash.display.DisplayObject;
  import flash.display.MovieClip;
  import flash.display.Shape;
  import flash.display.Sprite;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import flash.filters.ColorMatrixFilter;
  import flash.geom.Point;
  import flash.geom.Rectangle;
  
//  import mx.core.mx_internal;
  
  [SWF(width="528", height="450", frameRate=24, backgroundColor=0xffffff)]
  
  public final class Main extends Sprite
  {
    //MEBLE
    private var _plasma:plasma =  new plasma();
    private var _pralka:pralka =  new pralka()
    private var _fotel:fotel = new fotel();
    private var _lampa:lampa = new lampa();
    private var _lampa2:lampa2 = new lampa2();
    private var _sofa:sofa = new sofa();
    private var _szafa:szafa = new szafa();
    private var _narty:narty =  new narty();
    private var _opony:opony = new opony();
    private var _rower:rower = new rower();
    private var _stol:stol =  new stol();
    private var _laptop:laptop =  new laptop();
    private var _pudlo:pudlo = new pudlo();
    private var _krzeslo:krzeslo = new krzeslo();
    private var _plasma2:plasma2 =  new plasma2();
    private var _szafa2:szafa2 = new szafa2();  
    
    private var _meble:MovieClip =  new MovieClip();
    private var _meble_array:Array =  new Array(); 
    private var _meble_container:MovieClip =  new MovieClip();
	private var _mask:MovieClip;
    
    //SKRYTKI
    private var _skrytki:MovieClip = new MovieClip();
    private var orange:MovieClip =  new skrytka(122,105/3,150,0xEA5628);
    private var blue:MovieClip =  new skrytka(122,105/3,300,0x1F388A);
    private var yellow:MovieClip =  new skrytka(122,152/3,300,0xFFCC00);
    private var green:MovieClip =  new skrytka(122,244/3,300,0x9FC301);
    private var red:MovieClip =  new skrytka(122,347/3,300,0x990000);
	
	private var orangeBg:MovieClip =  new skrytkiBg(122,105/3,150);
	private var blueBg:MovieClip =  new skrytkiBg(122,105/3,300);
	private var yellowBg:MovieClip =  new skrytkiBg(122,152/3,300);
	private var greenBg:MovieClip =  new skrytkiBg(122,244/3,300);
	private var redBg:MovieClip =  new skrytkiBg(122,347/3,300);
    
    //TEXTY
    private var orange_text:orangeText =  new orangeText();
    private var blue_text:blueText = new blueText();
    private var yellow_text:yellowText =  new yellowText();
    private var green_text:greenText =  new greenText();
    private var red_text:redText = new redText();
    
    private var info_text:infoText =  new  infoText();
    private var wymien_text:wymienText =  new wymienText();
    private var opis_text:opisText =  new opisText(); 
    
    //MANIPULATION
    private var _current_box:MovieClip = new MovieClip();
    private var _position:Number = 0;    
    private var _bg:Sprite = new Sprite();
    private var _target:Object;
    private var _target_point:Point = new Point();
    
    private var mebleonstage:Boolean = false;
    
    private var _mebelPosition:Number;
    private var _block:Boolean = false;  //false mozna stawic mebel
    
    private var _maxXRight:Number = 350;
    private var _maxXLeft:Number = 77;
    //KOSZ
    private var _trash:kosz =  new kosz();
    private var  _trashOver:Boolean = false;
    private var _trashText:trashText =  new trashText();
	private var _showTrashText:Boolean = true;
    
    //
    private var _skrytkiOver:Boolean = false;
    private var _hitTestObject:int = 0;
    private var _skrytka_bg:MovieClip =  new MovieClip();
	private var _skrytkiArray:Array  = new Array();
	private var _skrytkiBgArray:Array  = new Array();
	private var _current_box_bg:MovieClip;
    
    public function Main()
    {
      stage.align = StageAlign.TOP_LEFT;
      //       stage.scaleMode = StageScaleMode.SCALE;
      
      drawBg();
      drawBoxes();
      addEventListener(Event.ENTER_FRAME, onEnterFrame);
      _trashText.x = stage.stageWidth - 50;
      _trashText.y = 10;
      
    }
    
    private function  onEnterFrame(e:Event):void{
      if(mouseX>455 && mouseX<520 && mouseY >20 && mouseY<80){
		  if(_showTrashText){
        if(!_trashText.stage)addChild(_trashText);}
        _trashOver =  true;
      }else{
        if(_trashText.stage)removeChild(_trashText);
        _trashOver = false;}
    }
    
    
    private function mouseDown(e:MouseEvent):void{
		_showTrashText =false;
      if(_trashOver){
        _meble_container.removeChild(_target as DisplayObject);
        _meble_array.splice(_meble_array.indexOf(_target),1);
        
        
      }else{
        if(!_block){
          _target = e.target;
          _target_point.x = e.target.x - mouseX;
          _target_point.y = e.target.y -mouseY;      
          
          stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
          stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
        }
      }
      
    }
    private function onMove(e:MouseEvent):void{
      
      _hitTestObject = 0;
      _target.x = mouseX+_target_point.x;
      _target.y =  mouseY+_target_point.y;
      
      _meble_array.sortOn("y",Array.CASEINSENSITIVE|Array.NUMERIC);
      
      for(var i:int = 0; i<_meble_array.length;i++){       
        if(_target.mc.hitTestObject(_meble_array[i].mc)){
          _meble_container.setChildIndex(_meble_array[i],i);
          if(_target!=_meble_array[i]&&_target.x<360&&_target.x>50){
            if(hitTest(_meble_array[i])){_hitTestObject = 1;}
          }
        }
      }
      if(hitTestBG(_current_box)){trace('TRUE');}//_hitTestObject = 1;}
//      else{_target.alpha = .4} 
      
      if(_hitTestObject==1){_target.alpha = .4;
        _block = true;
      }else{
        _target.alpha = 1;
        _block = false;}
      
     
    }
    private function hitTest(object:Object):Boolean{
      var rect1:Rectangle;
      var bmpData1:BitmapData;
      
      rect1 = object.clip.getBounds(this);
      bmpData1 = new BitmapData(rect1.width, rect1.height, true, 0);
      bmpData1.draw(object.clip);
      
      var rect2:Rectangle;
      var bmpData2:BitmapData;
      rect2 = _target.clip.getBounds(this);
      bmpData2 = new BitmapData(rect2.width, rect2.height, true, 0);
      bmpData2.draw(_target.clip);
      
      var p1:Point = new Point(object.x,object.y);
      var p2:Point =  new Point(_target.x, _target.y);
      
      addChild(_target.clip);
      addChild(object.clip);
      if(bmpData1.hitTest(p1,255, bmpData2, p2, 255 ))
      {
        removeChild(object.clip);
        removeChild(_target.clip);
        _block = true;
        return true; //hit true
      }
      else
      {
        removeChild(object.clip);
        removeChild(_target.clip);
        _block = false;
        return false;
      }
      
    }
    private function hitTestBG(object:Object):Boolean{
		addChild(_target.clip);
		addChild(_current_box_bg);
		
      var rect1:Rectangle;
      var bmpData1:BitmapData;
      
      rect1 = _current_box_bg.bg.getBounds(this);
	  trace(rect1);
      bmpData1 = new BitmapData(rect1.width, rect1.height, true, 0);
      bmpData1.draw(_current_box_bg.bg);
      
      var rect2:Rectangle;
      var bmpData2:BitmapData;
      rect2 = _target.clip.getBounds(this);
      bmpData2 = new BitmapData(rect2.width, rect2.height, true, 0);
      bmpData2.draw(_target.clip);
      
      var p1:Point = new Point(object.x,object.y);
      var p2:Point =  new Point(_target.x, _target.y);
      
      
      if(bmpData1.hitTest(p1,255, bmpData2, p2, 255 ))
      {
        removeChild(_current_box_bg);
        removeChild(_target.clip);
        _block = true;
        return true; //hit true
      }
      else
      {
        removeChild(_current_box_bg);
        removeChild(_target.clip);
        _block = false;
        return false;
      }
      
    }
    private function onUp(e:MouseEvent):void{
		_showTrashText =true;
      if(_trashOver){
        _meble_container.removeChild(_target as DisplayObject);
        _meble_array.splice(_meble_array.indexOf(_target),1);
        
      }else{
        if(!_block){
          stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
          stage.removeEventListener(MouseEvent.MOUSE_UP, onUp);        
        }
      }
    }
    private function checkBoxBound(mc:DisplayObject):Boolean{
      if(mc.x > 275+_current_box.leftx && 
        mc.x < 275+_current_box.rightx && 
        mc.y < 205+_current_box.bottomy && 
        mc.y > 205+_current_box.topy) {
        return true;
      }
      else{
        return false;
      }      
    }
    private function drawBg():void{
      _bg.graphics.beginFill(0xffffff,1);
      _bg.graphics.drawRect(0,0,500,500);
      _bg.graphics.endFill();
//      _bg.graphics.lineStyle(1,0x00000);
//      _bg.graphics.moveTo(0,0);
//      _bg.graphics.lineTo(0,stage.stageHeight-1);
//      _bg.graphics.lineTo(stage.stageWidth-1,stage.stageHeight-1);
//      _bg.graphics.lineTo(stage.stageWidth-1,0);
//      _bg.graphics.lineTo(0,0);
//      _bg.graphics.endFill();
      addChild(_bg);
    }
    private function drawBoxes():void{
      
      addChild(orange);      
      addChild(blue);
      addChild(yellow);
      addChild(green);
      addChild(red);
 
	  orange.name = 'orange';
      blue.name = 'blue';
      yellow.name = 'yellow';
      green.name ='green';
      red.name = 'red';
      
      orange.x = 70;
      blue.x = 240;
      yellow.x =90;
      green.x = 280;
      red.x = 450;
      
      orange.y = 200-105*.2/3;
      blue.y = 230-105*.2/3-2;
      yellow.y =410-152*.2/3-12;
      green.y = 410-244*.2/3-8;
      red.y = 300-347*.2/3-17;
      
      orange.addChild(orange_text);
      blue.addChild(blue_text);
      yellow.addChild(yellow_text);
      green.addChild(green_text);
      red.addChild(red_text);
      
      orange_text.x = 28;
      blue_text.x = 28;
      yellow_text.x =28;
      green_text.x = 28;
      red_text.x = 28;
      
      orange_text.y = -120;
      blue_text.y = -230;
      yellow_text.y = -230;
      green_text.y = -230;
      red_text.y = -230;
      
      orange_text.scaleX = orange_text.scaleY = 1.5;
      blue_text.scaleX = blue_text.scaleY = 1.5;
      yellow_text.scaleX = yellow_text.scaleY = 1.5;
      green_text.scaleX = green_text.scaleY =1.5;
      red_text.scaleX = red_text.scaleY = 1.5;
      
      orange.scaleX = orange.scaleY = .4;
      blue.scaleX = blue.scaleY = .4;
      yellow.scaleX = yellow.scaleY = .4;
      green.scaleX = green.scaleY = .4;
      red.scaleX = red.scaleY = .4;
      
      orange.mouseChildren = false;
      blue.mouseChildren = false;
      yellow.mouseChildren =  false;
      green.mouseChildren = false;
      red.mouseChildren =  false;
      
      orange.addEventListener(MouseEvent.CLICK,boxClicked);
      blue.addEventListener(MouseEvent.CLICK,boxClicked);
      yellow.addEventListener(MouseEvent.CLICK,boxClicked);
      green.addEventListener(MouseEvent.CLICK,boxClicked);
      red.addEventListener(MouseEvent.CLICK,boxClicked);
      
      info_text.y = 40;
      info_text.x = stage.stageWidth/2;
      info_text.scaleX = info_text.scaleY = 1;
      addChild(info_text);
      
    }
    private function boxClicked(e:MouseEvent):void{
//      
//      var matrix:Array = new Array();
//      matrix = matrix.concat([0, 0, 0, 0, 0]); // red
//      matrix = matrix.concat([0, 0, 0, 0, 0]); // green
//      matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
//      matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
//      var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
//      var filters:Array = new Array();
//      var null_filters:Array = new Array();
//      filters.push(filter);
//      
//      orange.room.filters = filters;
//      blue.room.filters = filters;
//      yellow.room.filters = filters;
//      green.room.filters = filters;
//      red.room.filters = filters;
//      
      
      if(info_text.stage)removeChild(info_text);
      orange.scaleX = orange.scaleY = .1;
      blue.scaleX = blue.scaleY = .1;
      yellow.scaleX = yellow.scaleY = .1;
      green.scaleX = green.scaleY = .1;
      red.scaleX = red.scaleY = .1;
      orange.x = 20;
      blue.x = 45;
      yellow.x =75;
      green.x = 110;
      red.x = 150;
      orange.buttonMode = true;
      blue.buttonMode = true;
      yellow.buttonMode = true;
      green.buttonMode = true;
      red.buttonMode = true;
      orange.y = 60-105*.2/3;
      blue.y = 60-105*.2/3;
      yellow.y =63-152*.2/3;
      green.y = 67-244*.2/3;
      red.y = 71-347*.2/3;
     
      
      _current_box = e.target as MovieClip;
      _current_box.buttonMode = false;
      if(_current_box.name == 'orange') _current_box_bg = orangeBg;
      else if(_current_box.name == 'blue')_current_box_bg =blueBg;
      else if(_current_box.name == 'yellow') _current_box_bg = yellowBg;
      else if(_current_box.name == 'green') _current_box_bg = greenBg;
      else if(_current_box.name == 'red') _current_box_bg = redBg;
      else{
      }
//	  _mask = new MovieClip();
//	  if(_mask.stage)removeChild(_mask);
//	  _mask = _current_box_bg;
////	  addChild(_mask);
//	  _meble_container.mask = _mask;
//	  addChild(_current_box_bg);
//	  _current_box_bg.mouseEnabled = false;
	  orangeBg.x=stage.stageWidth/2;
	  orangeBg.y=stage.stageHeight/2+50;
	  blueBg.x=stage.stageWidth/2;
	  blueBg.y=stage.stageHeight/2+50;
	  yellowBg.x=stage.stageWidth/2;
	  yellowBg.y=stage.stageHeight/2+50;
	  greenBg.x=stage.stageWidth/2;
	  greenBg.y=stage.stageHeight/2+50;
	  redBg.x=stage.stageWidth/2;
	  redBg.y=stage.stageHeight/2+50;
//	  addChild(redBg);
      _current_box.x=stage.stageWidth/2;
      _current_box.y=stage.stageHeight/2+50;
      _current_box.scaleX = _current_box.scaleY = 1;
      if(!mebleonstage){       
        
        addMeble();
        setMebleMask();
        _trash.x = stage.stageWidth -30;
        _trash.y = 30;
        _trash.buttonMode =  true;
        addChild(_trash);       
        addChild(_meble_container);
//        wymien_text.buttonMode =  true;   
//        addChild(wymien_text);
        _skrytkiOver=true;
      }
	  
    }
    private function onChangeClick(e:MouseEvent):void{
    }
    private function setMebleMask():void{
      var mask:Shape = new Shape();
      mask.graphics.beginFill(0x00000,1);
      mask.graphics.drawRect(50,stage.stageHeight-200, stage.stageWidth-100,200);
      mask.graphics.endFill();
      addChild(mask);
      _meble.mask = mask;
      _meble.y=stage.stageHeight-50;
      _meble.x = 50;
      mebleonstage = true;
      var nextBtn:next =  new next();
      var prevBtn:next = new next();
      nextBtn.rotation = 180;
      nextBtn.x = stage.stageWidth -25;
      prevBtn.x = 25;
      nextBtn.y =  stage.stageHeight -60;
      prevBtn.y =  stage.stageHeight -60;
      addChild(prevBtn);
      addChild(nextBtn);
      prevBtn.addEventListener(MouseEvent.CLICK, prevClicked);
      nextBtn.addEventListener(MouseEvent.CLICK, nextClicked);
      prevBtn.buttonMode = true;
      nextBtn.buttonMode = true;
    }
    private function nextClicked(e:MouseEvent):void{
      
      if(_meble.x> -9*(stage.stageWidth-100)/6)
        _meble.x = _meble.x - (stage.stageWidth-100)/6;
      
    }
    private function prevClicked(e:MouseEvent):void{
      if(_meble.x<0)
        _meble.x = _meble.x + (stage.stageWidth-100)/6;
    }
    private function addMebel(mc:MovieClip,scale:Number,posX:Number,posY:Number,name:String,size:String = '100x100x100',textY:Number = 0):void{
      mc.scaleX =  mc.scaleY = scale*2.;
      mc.x = _mebelPosition+40+posX;
      mc.buttonMode = true;
      
      mc.y = posY;
      mc.addEventListener(MouseEvent.CLICK,function onClick(e:MouseEvent):void{mebelCliked(name)});
      _meble.addChild(mc); 
      mc.buttonMode = true;
      var textmc:text_field =  new text_field();     
      textmc.text.text = size;
      _meble.addChild(textmc);
      textmc.x = _mebelPosition+40;
      textmc.y = 20;
      textmc.scaleX =  textmc.scaleY = 1;
      _mebelPosition = _mebelPosition + (stage.stageWidth-100)/6;
    }
    private function addMeble():void{
      _mebelPosition =0;
      //scale,x,y
      addMebel(_plasma, .3, -22,   10,'plasma','70x50x20'); 
      
      addMebel(_pralka, .3, -20,    3,'pralka','70x70x50');
      addMebel(_fotel,  .3, -25,    0,'fotel','50x50x120');
      addMebel(_lampa,  .2, -10,   10,'lampa','30x30x150');
      
      addMebel(_sofa,   .2, -40,  -13,'sofa','70x90x280');
      addMebel(_szafa,  .2, -20,   5,'szafa','80x120x200');
      
      addMebel(_narty,  .2, -13,    7,'narty','20x20x160');
      addMebel(_opony,  .3, -17,    0,'opony','50x50x100');
      addMebel(_rower,  .2, -25,   -5,'rower','30x150x120');
      addMebel(_plasma2,.3, -20,    -3,'plasma2','70x50x20'); 
      addMebel(_laptop, .4,  -18,    2,'laptop','30x30x10');
      addMebel(_pudlo,  .3,  -16,    2,'pudlo','50x50x50');
      addMebel(_krzeslo,.25, -13,    5,'krzeslo','50x50x130');
      addMebel(_stol,   .25, -28,    5,'stol', '80x80x70');
      addMebel(_szafa2, .2, -25,   0, 'szafa2','80x120x200');
      addMebel(_lampa2, .2, -23,     -13,'lampa2','30x30x150');
      addChild(_meble);
      opis_text.x = 0;
      opis_text.y = stage.stageHeight;
      opis_text.scaleX = opis_text.scaleY = 1;
      addChild(opis_text);  
    }
    
    private function mebelCliked(name:String):void{
      var mc:Mebel = new Mebel(name);
      _meble_container.addChild(mc);
      _meble_array.push(mc);
      mc.mouseChildren = false;
      mc.alpha = 1;
      mc.x = mouseX;
      mc.y = mouseY;        
      mc.addEventListener(MouseEvent.MOUSE_DOWN,mouseDown);
      _target = mc;
      _target_point.x = mc.x - mouseX;
      _target_point.y = mc.y -mouseY;      
      
      stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
      stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
    }
    
  }
}