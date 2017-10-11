class button {
  int r;
  int x;
  int y;
  int w;
  int h;
  String text;
  boolean checked=false;
  
  button(int x, int y, int w, int h, String text){
    rectMode(CENTER);
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.text = text;
  }
  
  void display(){
    fill(255);
    rect(this.x,this.y, this.w, this.h); 
    fill(0);
    text(this.text, this.x - textWidth(this.text)/2 , this.y+5);
  }
  
  boolean check(){
    return (mouseX < this.x+(this.w/2) && mouseX > this.x-(this.w/2)) && (mouseY < this.y+(this.h/2) && mouseY > this.y-(this.h/2));
  }
}