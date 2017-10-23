class Gui{
  public slider Slider;
  HoverButton greyscale;
  HoverButton contrast;
  HoverButton blur;
  HoverButton sharpen;
  HoverButton edgedetection;
  HoverButton clearFilters;
  String sliderName = "";
  
  
  Gui(){
    Slider = new slider(width-280, height-200, width*0.3, 30);
    greyscale = new HoverButton(width-100, 0, 100, 50, "Greyscale");
    contrast = new HoverButton(width-200, 0, 100, 50, "Contrast");
    blur = new HoverButton(width-300, 0, 100, 50, "Blur");
    sharpen = new HoverButton(width-400, 0, 100, 50, "Sharpen");
    edgedetection = new HoverButton(width-600, 0, 200, 50, "Edge Detection");
    clearFilters = new HoverButton(width-750, 0, 150, 50, "Clear Filters");
  }
  
  void display() {
    // added these parameters so that when window is resized, the x and y positions will update with the new width and height of the window
    if(sliderName != "") {Slider.display(width-280, height-200);}
    greyscale.display(width-100, 0);
    contrast.display(width-200,0);
    blur.display(width-300, 0);
    sharpen.display(width-400, 0);
    edgedetection.display(width-600, 0);
    clearFilters.display(width-750,0);    
    fill(255);
    noStroke();
    textAlign(LEFT);
    textSize(20);
    text(sliderName, width-484, height-250);
  }
  
  void update() {
    Slider.update();
  }
  
  void isOver(){
    
    if(greyscale.mouseOver()){
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
  }
}