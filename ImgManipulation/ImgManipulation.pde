PImage img;
IImage interactive;
String fileDest;
button save;
boolean wasSaveClicked;

// Added by Anna
UnitTest unitTest;
HoverButton resizeBTN;
PImage temp;
boolean resized = false;
float originalWidth;
  
void setup() {
  selectInput("Select a file to process:", "fileSelected");
  surface.setResizable(true);
  save = new button(50,25,100,50,"save");
  wasSaveClicked = false;
  fileDest = "";
  
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
  save.display();
  if(wasSaveClicked){
    //create file dest text box
    fill(255);
    rect(int(width/2), int(height/2), width, 200);
    fill(0);
    String prompt = "Please type out a file destination to save to e.g. 'C:\\Pictures\\myPhoto.jpg'";
    text(prompt, (int(width)-textWidth(prompt))/2, int(height/2) - 15);
    text(fileDest, (int(width)-textWidth(fileDest))/2, int(height/2));
  }
  
}

void mousePressed(){
  if(save.check()){
    wasSaveClicked = true;
  }
}

void mouseClicked(){
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
  if(wasSaveClicked){
    if(keyCode == BACKSPACE){
      if(fileDest.length()>0){
        fileDest = fileDest.substring(0, fileDest.length()-1);
      }
    } else if (keyCode == DELETE){
      fileDest = "";
    } else if (keyCode == ENTER && interactive.currentMode != 0){
      interactive.imgNew.save(fileDest);
      wasSaveClicked = false;
    } else if (keyCode == ENTER && interactive.currentMode == 0){
      interactive.imgOriginal.save(fileDest);
      wasSaveClicked = false;
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      fileDest = fileDest + key;
    }
  }
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