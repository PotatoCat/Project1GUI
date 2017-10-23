//import org.junit.Test;
//import static org.junit.Assert.*;

public class UnitTest{
  PImage unitTestImg = loadImage("dogHappy.jpg");
  IImage test;
  
  public void testResizeByWidth(PImage img, float w){
    // original width and height
    float w0 = float(img.width);
    float h0 = float(img.height);
    
    float ratio = w0/h0;
    float testHeight = w/ratio;
    resizeByWidth(img, w);
    float newHeight = img.height;
    //Assert.assertEquals(testHeight, newHeight, 0.0001);
    assert int(testHeight) == int(newHeight) : "testHeight must equal " + int(testHeight) + ", but newHeight = " + int(newHeight);
  }
  
  public void testIImageContructor(){
    
  }
  

  public void testFileSelected(File selection) {
    if (selection == null) {
      println("Window was closed or the user hit cancel.");
    } else {
      println("User selected " + selection.getAbsolutePath());
      assert selection.getAbsolutePath() != null: "Selection is null";
      img = loadImage(selection.getAbsolutePath());
      assert img != null : "img is null";
      interactive = new IImage(0, 50, img);//move this line of code elsewhere if necessarry, supposed to create an IImage based on the new PImage
      assert interactive != null: "interactive is null";
    }
  }
  
  public void runUnitTests(){
    testResizeByWidth(unitTestImg, 400);
  }
  
  // Methods being Tested
  public void resizeByWidth(PImage img, float w) {
  float ratio = (float(img.width)/float(img.height));
  img.resize(int(w), int(w/ratio));
}
}