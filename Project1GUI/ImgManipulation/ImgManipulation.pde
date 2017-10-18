PImage img;
IImage interactive;
HoverButton savebutton;
Save saveFunction;

// Added by Anna
UnitTest unitTest;
HoverButton resizeBTN;
PImage temp;
boolean resized = false;
float originalWidth;
  
void setup() {
  selectInput("Select a file to process:", "fileSelected");
  surface.setResizable(true);
  savebutton = new HoverButton(0,0,100,50,"Save");
  saveFunction = new Save();
  
  // Added by Anna
  size(1366, 768);
  background(50);
  unitTest = new UnitTest();
  resizeBTN = new HoverButton(0,0,150,50, "Resize");
}

void draw() {
  background(50);
  if(img != null){
    //image(img,-1,49);
    if(interactive.currentMode == 0){ 
      temp = interactive.imgOriginal;
    }
    else{
      temp = interactive.imgNew;
    }
    if(interactive.imgNew != null && interactive.imgNew.width != interactive.imgWidth){ resizeByWidth(interactive.imgNew,interactive.imgWidth); }
    interactive.display(100, height/2-(temp.height/2));
    setLabels(temp, 100, height/2-(temp.height/2));
    resizeBTN.display(width-280, height/2);
    //surface.setSize(interactive.imgWidth, interactive.imgHeight+50);
  }
  
  if(interactive != null)
    interactive.changeFilter();//allows for editing of the picture
  
  //display save button
  savebutton.display();
  saveFunction.prompt();
  
}

void mouseClicked(){
  //turns save function prompt on
  if(savebutton.mouseOver()){
    saveFunction.flip();
  }
  
  // code from imgResize, will reorganize into a method later
  if(resizeBTN.mouseOver()){
    if(!resized){
      resizeByWidth(interactive.imgOriginal,originalWidth*0.5);
      if(interactive.imgNew != null){resizeByWidth(interactive.imgNew,originalWidth*0.5);}
      interactive.imgWidth = interactive.imgOriginal.width;
      interactive.imgHeight = interactive.imgOriginal.height;
      //resizeByWidth(interactive.imgNew,400);
      resized = true;
      unitTest.runUnitTests();
    }
    else{
      resizeByWidth(interactive.imgOriginal,originalWidth);
      if(interactive.imgNew != null){resizeByWidth(interactive.imgNew,originalWidth);}
      interactive.imgWidth = interactive.imgOriginal.width;
      interactive.imgHeight = interactive.imgOriginal.height;
      resized = false;
    }
  }
}

void keyPressed(){
  //type file destination for save function
  saveFunction.type();
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    img = loadImage(selection.getAbsolutePath());
    interactive = new IImage(0, 50, img);//move this line of code elsewhere if necessarry, supposed to create an IImage based on the new PImage
    originalWidth = img.width;
  }
}


// code from imgResize, will organize into a separate class/method later
void setLabels(PImage img, int imgXPos, int imgYPos){
  
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
  text("Press 0 for the original image", width-300, 200);
  text("Press 1-5 for various filters", width-300, 240);
  text("Press Resize button to toggle size", width-300, 280);
  
  // Height and Width subLabels
  textAlign(LEFT);
  textSize(15);
  text(("H: " + img.height + " W: " + img.width), imgXPos,imgYPos + img.height + 15);
}

public void resizeByWidth(PImage img, float w){
  float ratio = (float(img.width)/float(img.height));
  img.resize(int(w), int(w/ratio));
}

void resizeByHeight(PImage img, float h){
  float ratio = (float(img.width)/float(img.height));
  img.resize(int(h*ratio), int(h));
}