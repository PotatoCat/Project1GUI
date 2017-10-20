class Gui{
  public slider Slider;
  HoverButton greyscale;
  HoverButton contrast;
  HoverButton blur;
  HoverButton sharpen;
  HoverButton edgedetection;
  HoverButton reset;
  String sliderName = "";
  
  
  Gui(){
    Slider = new slider(width-350, height-200, 700, 50);
    greyscale = new HoverButton(width-100, 0, 100, 50, "Greyscale");
    contrast = new HoverButton(width-200, 0, 100, 50, "Contrast");
    blur = new HoverButton(width-300, 0, 100, 50, "Blur");
    sharpen = new HoverButton(width-400, 0, 100, 50, "Sharpen");
    edgedetection = new HoverButton(width-600, 0, 200, 50, "Edge Detection");
    reset = new HoverButton(width-700, 0, 100, 50, "Reset");
  }
  
  void display() {
    Slider.display();
    greyscale.display();
    contrast.display();
    blur.display();
    sharpen.display();
    edgedetection.display();
    reset.display();
    text(sliderName, width - 650, height - 275);
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
    else if(reset.mouseOver()) {
      interactive.changemode(0);
      sliderName = "";
    }
  }
}