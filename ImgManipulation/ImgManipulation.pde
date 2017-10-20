PImage img; //<>// //<>// //<>// //<>//
public IImage interactive;
HoverButton savebutton;
Save saveFunction;
Gui gui;

// Added by Anna
UnitTest unitTest;
HoverButton resizeBTN;
float originalWidth;
boolean resized = false;

void setup() {
  selectInput("Select a file to process:", "fileSelected");
  surface.setResizable(true);
  savebutton = new HoverButton(0, 0, 100, 50, "Save");
  saveFunction = new Save();
  gui = new Gui();

  // Added by Anna
  size(1366, 768);
  background(50);
  unitTest = new UnitTest();
  resizeBTN = new HoverButton(0, 0, 150, 50, "Resize");
}

void draw() {
  background(50);
  //assert interactive != null : "interactive is null in draw";
  if (img != null && interactive != null) {
    //image(img,-1,49);
    interactive.display(100, height/2-(interactive.imgHeight/2));
    //setLabels(temp, 100, height/2-(temp.height/2));
    resizeBTN.display(width-280, height/2);
    //surface.setSize(interactive.imgWidth, interactive.imgHeight+50);
    gui.update();
  }

  if (interactive != null)
    interactive.changeFilter();//allows for editing of the picture

  //display save button
  savebutton.display();
  saveFunction.prompt();
  gui.display();
  
}

void mouseClicked() {
  gui.isOver();
  //turns save function prompt on
  if (savebutton.mouseOver()) {
    saveFunction.flip();
  }
  
    if (resizeBTN.mouseOver()) {
      originalWidth = interactive.imgOriginalReset.width;
      if (!resized) {
        interactive.resizeByWidth(originalWidth*0.5);
        resized = true;
      } else {
        interactive.resizeByWidth(originalWidth);
        resized = false;
      }
    }
}

void keyPressed() {
  //type file destination for save function
  saveFunction.type();
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    assert selection.getAbsolutePath() != null: 
    "Selection is null";
    img = loadImage(selection.getAbsolutePath());
  assert img != null : 
    "img is null";
    interactive = new IImage(0, 50, img);//move this line of code elsewhere if necessarry, supposed to create an IImage based on the new PImage
    originalWidth = img.width;
    delay(1000);
  assert interactive != null: 
    "interactive is null";
  }
}