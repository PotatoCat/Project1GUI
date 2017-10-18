class Save{
boolean wasSaveClicked;
String fileDest;

  Save(){
    wasSaveClicked = false;
    fileDest = "";
  }
  
  void prompt(){
    if(wasSaveClicked){
      textAlign(BASELINE);
      rectMode(CENTER);
      //create file dest text box
      fill(255);
      rect(int(width/2), int(height/2), width, 200);
      fill(0);
      String prompt = "Please type out a file destination to save to e.g. 'C:\\Pictures\\myPhoto.jpg'";
      text(prompt, (int(width)-textWidth(prompt))/2, int(height/2) - 30);
      text(fileDest, (int(width)-textWidth(fileDest))/2, int(height/2));
    }
  }
  
  void flip(){
    wasSaveClicked = true;
  }
  
  void type(){
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
}