import static javax.swing.JOptionPane.*;
import javax.swing.*;

public class Gui{
  public slider Slider;
  HoverButton greyscale;
  HoverButton contrast;
  HoverButton blur;
  HoverButton sharpen;
  HoverButton edgedetection;
  HoverButton clearFilters;
  HoverButton savebutton;
  HoverButton newFileBTN;
  HoverButton resizeBTN;
  HoverButton cropBTN;
  HoverButton resetBTN;
  HoverButton runUnitTestsBTN;
  HoverButton tintRed;
  HoverButton tintGreen;
  HoverButton tintBlue;
  HoverButton history;
  HoverButton button1;
  HoverButton button2;
  HoverButton button3;
  HoverButton button4;
  HoverButton button5;
  boolean button1show;
  boolean button2show;
  boolean button3show;
  boolean button4show;
  boolean button5show;
  Boolean includeUnitTests = false;
  String sliderName = "";
  boolean cropMode = false; // is the user trying to make a crop selection?
  int mouseXi, mouseYi; // initial mouse position for crop
  int mouseXf, mouseYf; // final mouse position for crop
  float [] cropSelectionInputs;
  boolean validCropSelection;
  public String alertText;
  
  
  Gui(){
    Slider = new slider(width-280, height-200, width*0.3, 30);
    greyscale = new HoverButton(width-100, 0, 100, 50, "Greyscale");
    contrast = new HoverButton(width-200, 0, 100, 50, "Contrast");
    blur = new HoverButton(width-300, 0, 100, 50, "Blur");
    sharpen = new HoverButton(width-400, 0, 100, 50, "Sharpen");
    edgedetection = new HoverButton(width-600, 0, 200, 50, "Edge Detection");
    clearFilters = new HoverButton(width-750, 0, 150, 50, "Clear Filters");
    savebutton = new HoverButton(0, 0, 100, 50, "Save");
    newFileBTN = new HoverButton(0, 0, 150, 50, "New File");
    resizeBTN = new HoverButton(0,0, 150, 50, "Resize");
    cropBTN = new HoverButton(0,0, 150, 50, "Crop");
    resetBTN = new HoverButton(0,0, 130, 50, "Reset");
    runUnitTestsBTN = new HoverButton(0,0, 200, 50, "Run Unit Tests");
    //history = new HoverButton(width-850, 0,100,50, "History");
    
    //tintRed = new HoverButton(0,0, 150,50, "Red");
    //tintGreen = new HoverButton(0,0, 150,50, "Green");
    //tintBlue = new HoverButton(0,0, 150,50, "Blue");
    
    mouseXi = 0; mouseYi = 0; mouseXf = 0; mouseYf = 0;
    cropSelectionInputs = new float[4];
    validCropSelection = false;
    alertText = "";
    
    //History buttons
    button1 = new HoverButton(width - 550, height - 175, 100, 50, "Image 1");
    button2 = new HoverButton(width - 450, height - 175, 100, 50, "Image 2");
    button3 = new HoverButton(width - 350, height - 175, 100, 50, "Image 3");
    button4 = new HoverButton(width - 250, height - 175, 100, 50, "Image 4");
    button5 = new HoverButton(width - 150, height - 175, 100, 50, "Image 5");
  }
  
  void display() {
    // added these parameters so that when window is resized, the x and y positions will update with the new width and height of the window - Anna
    if(sliderName != "") {Slider.display(width-280, height-200);}
    greyscale.display(width-100, 0);
    contrast.display(width-200,0);
    blur.display(width-300, 0);
    sharpen.display(width-400, 0);
    edgedetection.display(width-600, 0);
    clearFilters.display(width-750,0);    
    savebutton.display();
    newFileBTN.display(100,0);
    resizeBTN.display(width-350, 320);
    cropBTN.display(width-350, 380);
    resetBTN.display(width-140, height-100);
    
    //tintRed.display(0, height-50);
    //tintGreen.display(150, height-50);
    //tintBlue.display(300, height-50);
    
    //history.display(width-850, 0);
    if(button1show){
      button1.display(width - 550, height - 175);
    }
    if(button2show){
      button2.display(width - 450, height - 175);
    }
    if(button3show){
      button3.display(width - 350, height - 175);
    }
    if(button4show){
      button4.display(width - 250, height - 175);
    }
    if(button5show){
      button5.display(width - 150, height - 175);
    }
    if(includeUnitTests) {runUnitTestsBTN.display(width-350, height-100);}
  
    // slider label
    fill(255);
    noStroke();
    textAlign(LEFT);
    textSize(20);
    text(sliderName, width-484, height-250);
    
    // instructions and other labels
    displayText();
    
    // crop selection box
    showCropSelection();
  }
  
  void update() {
    Slider.update();
  }
 
 // displays instructions and lables
 void displayText(){
    fill(255);
    noStroke();
  
    // Image Dimension Title
    textAlign(LEFT);
    textSize(30);
    //text("Image Dimensions", width-200, height*.15);
  
    // Instructions
    text("Instructions", width-350, 160);
    textSize(16);
    text("Use Buttons Above to apply filters", width-350, 200);
    text("Use Resize Button to resize", width-350, 240);
    text("Use Slider to Adjust Filter if Applicable", width-350, 280);
    text(alertText, width - 350, 450);
 }
 
 public void toggleUnitTests(Boolean tf){
   includeUnitTests = tf;
 }
  
  void isOver(){
    alertText = "";
    if(savebutton.mouseOver() || newFileBTN.mouseOver() || greyscale.mouseOver() || contrast.mouseOver() 
    || blur.mouseOver() || edgedetection.mouseOver() || sharpen.mouseOver() || clearFilters.mouseOver() ||
    resizeBTN.mouseOver() || cropBTN.mouseOver() || resetBTN.mouseOver() || runUnitTestsBTN.mouseOver()){
      button1show = false;
      button2show = false;
      button3show = false;
      button4show = false;
      button5show = false;
    }
    //if(history.mouseOver()){
    //  //array is a dummy array please replace with array of images
    //  int[] array = new int[]{0,1,2,3,4};
    //  for(int i = 0; i <= array.length; i += 1){
    //    if(i == 1){
    //      button1show = true;
    //    }
    //    if(i == 2){
    //      button2show = true;
    //    }
    //    if(i == 3){
    //      button3show = true;
    //    }
    //    if(i == 4){
    //      button4show = true;
    //    }
    //    if(i == 5){
    //      button5show = true;
    //    }
    //  }
    //}

    //These are the History buttons put in your image calls from the array here
    if(button1show && button1.mouseOver()){
    }
    else if(button2show && button2.mouseOver()){
    }
    else if(button3show && button3.mouseOver()){
    }
    else if(button4show && button4.mouseOver()){
    }
    else if(button5show && button5.mouseOver()){
    }
   
    //turns save function prompt on
    else if (savebutton.mouseOver()) {
      saveFunction.flip();
    } 
    else if (newFileBTN.mouseOver()) {
      selectInput("Select a file to process:", "fileSelected");
    } 
    // sets filters
    else if(greyscale.mouseOver()){
      interactive.changemode(1);
      sliderName = "";
    }
    else if(contrast.mouseOver()){
      interactive.changemode(2);
      sliderName = "Contrast";
    }
    else if(blur.mouseOver()){
      interactive.changemode(3);
      sliderName = "Blur";
    }
    else if(edgedetection.mouseOver()){
      interactive.changemode(4);
      sliderName = "";
    }
    else if(sharpen.mouseOver()){
      interactive.changemode(5);
      sliderName = "Sharpen";
    }
    else if(clearFilters.mouseOver()) {
      interactive.changemode(0);
      sliderName = "";
    }    
    // resizes image
    else if (resizeBTN.mouseOver()) {
      showResizeInput();
    }    
    else if(cropBTN.mouseOver()) {
        if(!cropMode){
          cropMode = true;
        }
        else{
          setCropSelectionInputs();
          if(validCropSelection) interactive.cropImg(cropSelectionInputs[0], cropSelectionInputs[1],cropSelectionInputs[2],cropSelectionInputs[3]);
          cropMode = false;
          validCropSelection = false;
          mouseXi = 0; mouseYi = 0; mouseXf = 0; mouseYf = 0;
        }
    }    
    else if(resetBTN.mouseOver()) {
      interactive.resetImg();
      interactive.changemode(0);
      sliderName = "";
      cropMode = false;
      mouseXi = 0; mouseYi = 0; mouseXf = 0; mouseYf = 0;
    } 
    else if (includeUnitTests && runUnitTestsBTN.mouseOver()) {
      unitTest.runUnitTests();
    }
  }
  
  
  void showResizeInput(){
    String[] resizeOptions = {"Resize By Width (Fixed Aspect Ratio)", "Resize By Height (Fixed Aspect Ratio)", "Resize Manually"};
    
    JFrame frame = new JFrame("Resize Options");
    String resizeOptionChoice = (String) JOptionPane.showInputDialog(frame,
      "How would you like to resize the image?",
      "Resize Options",
      JOptionPane.QUESTION_MESSAGE,
      null,
      resizeOptions,
      resizeOptions[0]);
      
      // take input for width, height relative to option selected
      if(resizeOptionChoice != null){
        String resizeType = "";
        if (resizeOptionChoice == resizeOptions[0]) // if resizeByWidth
          resizeType = "Width";
        else if (resizeOptionChoice == resizeOptions[1]) // else if resizeByHeight
          resizeType = "Height";
        else if (resizeOptionChoice == resizeOptions[2]) // else if resizeManual
          resizeType = "Manual";
        
        String resizeQuery = resizeType;
        if (resizeType == "Manual") {resizeQuery = "Width";}
         
        String input = showInputDialog("Enter new " + resizeQuery);
        float resizeParameter1 = parseFloat(input == null? "" : input, MIN_INT);      
        if (input == null)  showMessageDialog(null, "You didn't enter anything!", "Alert", ERROR_MESSAGE);
        else if (resizeParameter1 == MIN_INT || resizeParameter1 <= 0)  showMessageDialog(null, "Entry needs to be a number greater than 0", "Alert", ERROR_MESSAGE);
        else showMessageDialog(null, "New " + resizeQuery + " " + resizeParameter1 + " has been registered.", "Info", INFORMATION_MESSAGE);
        
        // if resizing manually take a second input for height
        if(resizeType == "Manual"){
          String input2 = showInputDialog("Enter new Height");
          float resizeParameter2 = parseFloat(input == null? "" : input2, MIN_INT);
           
          if (input2 == null)  showMessageDialog(null, "You didn't enter anything!", "Alert", ERROR_MESSAGE);
          else if (resizeParameter2 == MIN_INT || resizeParameter2 <= 0)  showMessageDialog(null, "Entry needs to be a number greater than 0", "Alert", ERROR_MESSAGE);
          else showMessageDialog(null, "New Height " + resizeParameter2 + " has been registered.", "Info", INFORMATION_MESSAGE);
        
          if(resizeParameter1 > 0 && resizeParameter2 > 0){interactive.resizeManual(resizeParameter1, resizeParameter2);}
        }
        
        // else resize by selected width or height
        if(resizeParameter1 > 0) {
          if(resizeType == "Width") { interactive.resizeByWidth(resizeParameter1); }
          else if(resizeType == "Height") { interactive.resizeByHeight(resizeParameter1);}      
        }
    }
  }
  
  void showCropSelection(){
    if(cropMode){      
      noFill();
      stroke(0);
      strokeWeight(5);
      rectMode(CORNERS);
      if(!(mouseXi == 0 && mouseYi == 0 && mouseXf == 0 && mouseYf == 0)){
        rect(mouseXi, mouseYi, mouseXf, mouseYf);
      }
      strokeWeight(1);
      
      textSize(12);
      text("Click and Drag to make crop selection", width - 350, 450);
      text("When finished, click crop again", width - 350, 470);
      
    }
    
  }
  
  void cropMousePressed(){
    if(cropMode && ! cropBTN.mouseOver()){
      mouseXi = mouseX;
      mouseYi = mouseY;
    }
  }
  
  void cropMouseDragged(){
    if(cropMode  && ! cropBTN.mouseOver()){
      mouseXf = mouseX;
      mouseYf = mouseY;
    }
  }
  
  void setCropSelectionInputs(){
    float topLeftX, topLeftY, bottomRightX, bottomRightY = 0;
    
    if(mouseXi < mouseXf) topLeftX = mouseXi;
    else topLeftX = mouseXf;
    
    if(mouseYi < mouseYf) topLeftY = mouseYi;
    else topLeftY = mouseYf;
    
    bottomRightX = topLeftX + abs(mouseXf - mouseXi);
    bottomRightY = topLeftY + abs(mouseYf - mouseYi);
    
    // check if top left corner of rectangle selection is in the image
    // check if the bottom right corner of the rectangle selection is in the iamge
    if(topLeftX > interactive.x && topLeftY > interactive.y && topLeftX < interactive.x + interactive.imgWidth &&
       topLeftY < interactive.y + interactive.imgHeight && bottomRightX > interactive.x && bottomRightY > interactive.y &&
       bottomRightX < interactive.x + interactive.imgWidth && bottomRightY < interactive.y + interactive.imgHeight){
         validCropSelection = true;
       }

    if(validCropSelection){  
      cropSelectionInputs[0] = topLeftX - interactive.x;
      cropSelectionInputs[1] = topLeftY - interactive.y;
      cropSelectionInputs[2] = abs(mouseXf - mouseXi);
      cropSelectionInputs[3] = abs(mouseYf - mouseYi);      
    }
    else{ alertText = "Invalid Crop Selection";}
  }

}


 