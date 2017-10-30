//import org.junit.Test;
//import static org.junit.Assert.*;

public class UnitTest{
  PImage unitTestImg = loadImage("dogHappy.jpg");
  PImage unitTestImgReset = unitTestImg.copy();
  IImage testIImage;
  
  public void testResizeByWidth(float w){
    // original width and height
    float w0 = float(unitTestImg.width);
    float h0 = float(unitTestImg.height);  
    float ratio = w0/h0;
    float testHeight = w/ratio;
    resizeByWidth(w);
    float newHeight = unitTestImg.height;
    //Assert.assertEquals(testHeight, newHeight, 0.0001);
    assert int(testHeight) == int(newHeight) : "newHeight must equal " + int(testHeight) + ", but newHeight = " + int(newHeight);
  }
  
  public void testResizeByHeight(float h){
    // original width and height
    float w0 = float(unitTestImg.width);
    float h0 = float(unitTestImg.height);
    
    float ratio = w0/h0;
    float testWidth = h * ratio;
    resizeByHeight(h);
    float newWidth = unitTestImg.width;
    assert int(testWidth) == int(newWidth) : "newWidth must equal " + int(testWidth) + ", but newWidth = " + int(newWidth);
  }
  
  public void testResizeImg(float w, float h){
    // original width and height
    resizeImg(w,h);
    float newWidth = unitTestImg.width;
    float newHeight = unitTestImg.height;
    assert int(w) == int(newWidth) : "newWidth must equal " + int(w) + ", but newWidth = " + int(newWidth);
    assert int(h) == int(newHeight) : "newHeight must equal " + int(h) + ", but newHeight = " + int(newHeight);
  }
  
  void testFileSelected(File selection) {
    if (selection == null) {
      println("Window was closed or the user hit cancel.");
    } else {
      println("User selected " + selection.getAbsolutePath());
      assert selection.getAbsolutePath() != null: "Selection is null";
      unitTestImg = loadImage(selection.getAbsolutePath());
      assert unitTestImg != null : "unitTestImg is null in fileSelected";
      testIImage = new IImage(0, 50, img);//move this line of code elsewhere if necessarry, supposed to create an IImage based on the new PImage
      assert testIImage != null: "testIImage is null in fileSelected";
      unitTestImgReset = unitTestImg.copy();
    }
  }
  
  public void runUnitTests(){
    //selectInput("Select a file to process:", "testFileSelected"); not working currently need to debug
    testResizeByWidth(400);
    testResizeByHeight(400);    
    print("Unit tests completed with no errors");
  }
  
  // Methods being Tested
  public void resizeByWidth(float w) {
    float ratio = (float(unitTestImg.width)/float(unitTestImg.height));
    unitTestImg = unitTestImgReset.copy();
    unitTestImg.resize(int(w), int(w/ratio));
  }
  
  public void resizeByHeight(float h) {
    float ratio = (float(unitTestImg.width)/float(unitTestImg.height));
    unitTestImg = unitTestImgReset.copy();
    unitTestImg.resize(int(h*ratio), int(h));
  }
  
  // just resize
  public void resizeImg(float w, float h){
    unitTestImg = unitTestImgReset.copy();
    unitTestImg.resize(int(w), int(h));
  }
}