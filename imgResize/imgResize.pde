PImage testImg;
String imageFileName = "dogHappy.jpg";
Button applyBTN;

void setup(){
  surface.setResizable(true);
  size(1366, 768);
  background(50);
  testImg = loadImage(imageFileName);
  
  applyBTN = new Button(0,0,150,50, "Apply");
  //surface.setSize(1377, 760);
}

void draw(){
  background(#B42323);
  image(testImg, 100, height/2-(testImg.height/2)); 
  setLabels(testImg, 100, height/2-(testImg.height/2));
  applyBTN.display(width-250, height/2);
}

void setLabels(PImage img, int imgXPos, int imgYPos){
  
  fill(255);
  noStroke();
  
  // Image Dimension Title
  textAlign(CENTER);
  textSize(30);
  text("Image Dimensions", width-200, height*.15);
  
  // Height and Width subLabels
  textAlign(LEFT);
  textSize(15);
  text(("H: " + img.height + " W: " + img.width), imgXPos,imgYPos + img.height + 15);
}

void resizeByWidth(PImage img, float w){
  float ratio = (float(img.width)/float(img.height));
  img.resize(int(w), int(w/ratio));
}

void resizeByHeight(PImage img, float h){
  float ratio = (float(img.width)/float(img.height));
  img.resize(int(h*ratio), int(h));
}

void mousePressed(){
  if(applyBTN.mouseOver()){
    if(testImg.height > 400) 
      resizeByWidth(testImg,400);
    else
      resizeByWidth(testImg,750);
    }
}