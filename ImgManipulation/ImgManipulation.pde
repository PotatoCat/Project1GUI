PImage img; //<>// //<>// //<>// //<>//
public IImage interactive;
Save saveFunction;
Gui gui;
public UnitTest unitTest;

void setup() {
  selectInput("Select a file to process:", "fileSelected");
  surface.setResizable(true);
  saveFunction = new Save();
  gui = new Gui();
  size(1366, 768);
  background(50);
  
  unitTest = new UnitTest();
  gui.toggleUnitTests(true);
}

void draw() {
  background(50);
  if (img != null && interactive != null) {
    //image(img,-1,49);
    interactive.display(100, height/2-(interactive.imgHeight/2));  //<>//
    //surface.setSize(interactive.imgWidth, interactive.imgHeight+50);
    gui.update(); //<>//
  }
  if (interactive != null)
    interactive.changeFilter();//allows for editing of the picture
    
  gui.display();
  saveFunction.prompt();
}

void mouseClicked() {
  gui.isOver();
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
    img = loadImage(selection.getAbsolutePath());
    interactive = new IImage(0, 50, img);//move this line of code elsewhere if necessarry, supposed to create an IImage based on the new PImage
  }
}