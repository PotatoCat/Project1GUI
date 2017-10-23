class Gui{
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
  Boolean includeUnitTests = false;
  String sliderName = "";
  boolean resized = false; // temporary will remove when we get user Input for resize working
  boolean cropped = false; // temporary will remove when we get user Input for resize working
  
  
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
    if(includeUnitTests) {runUnitTestsBTN.display(width-350, height-100);}
  
    // slider label
    fill(255);
    noStroke();
    textAlign(LEFT);
    textSize(20);
    text(sliderName, width-484, height-250);
    
    // instructions and other labels
    displayText();
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
 }
 
 public void toggleUnitTests(Boolean tf){
   includeUnitTests = tf;
 }
  
  void isOver(){   
    //turns save function prompt on
    if (savebutton.mouseOver()) {
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
      sliderName = "";//"Blur"; to be Added
    }
    else if(edgedetection.mouseOver()){
      interactive.changemode(4);
      sliderName = "";
    }
    else if(sharpen.mouseOver()){
      interactive.changemode(5);
      sliderName = "";//"Sharpen"; to be Added
    }
    else if(clearFilters.mouseOver()) {
      interactive.changemode(0);
      sliderName = "";
    }    
    // resizes image
    else if (resizeBTN.mouseOver()) {
        float originalWidth = interactive.imgOriginalReset.width;
        if (!resized) {
          interactive.resizeByWidth(originalWidth*0.5);
          resized = true;
        } else {
          interactive.resizeByWidth(originalWidth);
          resized = false;
        }
    }    
    else if(cropBTN.mouseOver()) {
        if (!cropped) {
          interactive.cropImg(interactive.imgWidth*0.3,interactive.imgWidth*0.3,interactive.imgWidth*0.5, interactive.imgHeight*0.5);
          cropped = true;
        } 
    }    
    else if(resetBTN.mouseOver()) {
      interactive.resetImg();
      cropped = false;
    } 
    else if (includeUnitTests && runUnitTestsBTN.mouseOver()) {
      unitTest.runUnitTests();
    }
  }
}