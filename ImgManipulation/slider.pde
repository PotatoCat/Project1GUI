class slider {
  float sliderWidth, sliderHeight; //slider lengths
  float sliderX, sliderY; //slider locations
  float buttonloc, newloc; //button location on slider
  float sliderMin, sliderMax; //edge values of slider
  boolean over; //is mouse over sliderbutton
  boolean locked; //is mouse over sliderbutton and held
  float ratio;

  slider(float xp, float yp, int sw, int sh){
    sliderWidth = sw;
    sliderHeight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    sliderX = xp;
    sliderY = yp-sliderHeight/2;
    buttonloc = sliderX;
    newloc = buttonloc;
    sliderMin = int(sliderX - sliderWidth/2 + sliderHeight/2);
    sliderMax = int(sliderX + sliderWidth/2 - sliderHeight/2);
  }
  
  void update(){
    if(overEvent()){
      over = true;
    }else{
      over = false;
    }
    if(mousePressed && over){
      locked = true;
    }
    if(!mousePressed){
      locked = false;
    }
    if(locked){
      newloc = constrain(mouseX, sliderMin, sliderMax);
    }
    if(abs(newloc - buttonloc) > 1){
      buttonloc = buttonloc + (newloc-buttonloc);
    }
    interactive.getSliderValue((buttonloc - sliderMin)/(sliderMax-sliderMin));
  }
  
  void display(){
    rectMode(CENTER);
    noStroke();
    fill(200);
    rect(sliderX, sliderY, sliderWidth-2, sliderHeight);
    if(over || locked){
      fill(0,0,0);
    }else{
      fill(102,102,102);
    }
    rect(buttonloc, sliderY, sliderHeight, sliderHeight);
  }
  
  float getPos(){
    return((buttonloc - sliderMin)/(sliderMax-sliderMin));
  }
  
  boolean overEvent(){
    if(mouseX > buttonloc - sliderHeight/2 && mouseX < buttonloc + sliderHeight/2 && mouseY > sliderY-sliderHeight/2 && mouseY < sliderY + sliderHeight/2){
      return true;
    }else{
      return false;
    }
  }
}