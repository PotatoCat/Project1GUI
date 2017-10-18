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
  

  
  public void runUnitTests(){
    testResizeByWidth(unitTestImg, 400);
  }
}