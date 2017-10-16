public class HoverButton{
  
  private float x, y, w, h;
  private final String label;
  
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
    fill(50,50,50,25);
    stroke(255);
    rectMode(CORNER);
    rect(x,y,w,h);
    
    fill(255);
    noStroke();
    textAlign(CENTER);
    textSize(20);
    if(mouseOver()) fill(#8BD9FF);
    text(label, x+w/2, y+h/2+7);  
  }
  
    void display(float xPos, float yPos){
    x = xPos;
    y = yPos;
    fill(50,50,50,25);
    stroke(255);
    rectMode(CORNER);
    rect(x,y,w,h);
    
    fill(255);
    noStroke();
    textAlign(CENTER);
    textSize(20);
    if(mouseOver()) fill(#8BD9FF);
    text(label, x+w/2, y+h/2+7);  
  }
}