public class HoverButton{
  
  private float x, y, w, h;
  private final String label;
  private color highlightColor = #8BD9FF;
  private color buttonFillColor = color(0,0,0,255*0.75);
  
  public HoverButton(float x, float y, float w, float h, String label){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }
  
  boolean mouseOver(){
    if(x < mouseX && (x+w) > mouseX && y < mouseY && (y+h) > mouseY)
      return true;
    return false;
  }
  
  void display(){
    // Rectangle
    fill(0,0,0,255*0.75);
    stroke(255);
    if(mouseOver()) stroke(highlightColor);
    rectMode(CORNER);
    rect(x,y,w,h);
    
    // Text Label
    fill(255);
    noStroke();
    textAlign(CENTER);
    textSize(20);
    if(mouseOver()) fill(highlightColor);
    text(label, x+w/2, y+h/2+7);  
  }
  
  void display(float xPos, float yPos){
    x = xPos;
    y = yPos;
    
    // Rectangle
    fill(buttonFillColor);
    stroke(255);
    if(mouseOver()) stroke(highlightColor);
    rectMode(CORNER);
    rect(x,y,w,h);
    
    // Text Label
    fill(255);
    noStroke();
    textAlign(CENTER);
    textSize(20);
    if(mouseOver()) fill(highlightColor);
    text(label, x+w/2, y+h/2+7);  
  }
}