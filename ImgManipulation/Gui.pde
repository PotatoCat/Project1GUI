class Gui{
  public slider Slider;
  HoverButton greyscale;
  HoverButton contrast;
  HoverButton blur;
  HoverButton sharpen;
  HoverButton edgedetection;
  HoverButton clearFilters;
  HoverButton savebutton;
  HoverButton resizeBTN;
  String sliderName = "";
  boolean resized = false; // temporary will remove when we get user Input for resize working
  
  
  Gui(){
    Slider = new slider(width-280, height-200, width*0.3, 30);
    greyscale = new HoverButton(width-100, 0, 100, 50, "Greyscale");
    contrast = new HoverButton(width-200, 0, 100, 50, "Contrast");
    blur = new HoverButton(width-300, 0, 100, 50, "Blur");
    sharpen = new HoverButton(width-400, 0, 100, 50, "Sharpen");
    edgedetection = new HoverButton(width-600, 0, 200, 50, "Edge Detection");
    clearFilters = new HoverButton(width-750, 0, 150, 50, "Clear Filters");
    savebutton = new HoverButton(0, 0, 100, 50, "Save");
    resizeBTN = new HoverButton(0, 0, 150, 50, "Resize");
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
    resizeBTN.display(width-280, height/2);
  
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
    textAlign(CENTER);
    textSize(30);
    //text("Image Dimensions", width-200, height*.15);
  
    // Instructions
    text("Instructions", width-200, height*.15);
    textSize(16);
    textAlign(LEFT);
    text("Use Buttons Above to apply filters", width-300, 200);
    text("Use Resize Button to resize", width-300, 240);
    text("Use Slider to Adjust Filter if Applicable", width-300, 280);
 }
  
  void isOver(){   
    //turns save function prompt on
    if (savebutton.mouseOver()) {
      saveFunction.flip();
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
  }
}