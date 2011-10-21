package
{
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.net.FileReference;
  import flash.net.FileReferenceList;
  import flash.net.URLRequest;
  import flash.net.navigateToURL;
  
  public class MakeYourCard extends Sprite
  {
    private var fileRefList:FileReferenceList = new FileReferenceList();
    public function MakeYourCard()
    {
      fileRefList.addEventListener(Event.SELECT, selectHandler);
      fileRefList.browse();
    }
    
    private function selectHandler(event:Event):void
    {
      var request:URLRequest = new URLRequest("http:www.mechla.com/upload/");
      var file:FileReference;
      var files:FileReferenceList = FileReferenceList(event.target);
      var selectedFileArray:Array = files.fileList;
      for (var i:uint = 0; i < selectedFileArray.length; i++)
      {
        file = FileReference(selectedFileArray[i]);
        file.addEventListener(Event.COMPLETE, completeHandler);
        try
        {
          file.upload(request);
        }
        catch (error:Error)
        {
          trace("Unable to upload files.");
        }
      }
    }
    private function completeHandler(event:Event):void
    {
      trace("uploaded");
    }
  }
}