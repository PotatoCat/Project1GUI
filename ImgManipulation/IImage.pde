class IImage {//Interactive Image
  float x;
  float y;
  PImage imgOriginal;
  PImage imgNew;

  color c;
  float red;
  float green;
  float blue;

  int index;
  int imgWidth;
  int imgHeight;
  int currentMode = 0;
  boolean firstLoop = true; //used to draw the initial image once so that unspecified keys do not reset the image

  IImage(int x, int y, PImage img) {
    println("constructing " + currentMode);
    this.x = x;
    this.y = y;
    assert img != null: "img is null in Iimage constructor";
    imgOriginal = img.copy();
    imgWidth = img.width;
    imgHeight = img.height;
  }

  IImage(PImage img) {
    this.x = 0;
    this.y = 0;
    imgOriginal = img.copy();
    imgWidth = img.width;
    imgHeight = img.height;
    imgWidth = img.width;
    imgHeight = img.height;
  }

  void display() {
    if(currentMode == 0)
      image(imgOriginal, x, y);
    else
      image(imgNew, x, y);
  }

  void display(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    if(currentMode == 0)
      image(imgOriginal, x, y);
    else
      image(imgNew, x, y);
  }

//------------------------------------------------------------------------------------
//Filters
  void changeFilter() {
    if (firstLoop) {
      image(imgOriginal, x, y);
      firstLoop = false;
    }
    if (key == '1' && currentMode != 1) {
      currentMode = 1;
      imgNew = createImage(imgWidth, imgHeight, ARGB);
      greyscale();
      image(imgNew, x, y);
    }
    if (key == '2' && currentMode != 2) {
      currentMode = 2;
      imgNew = createImage(imgWidth, imgHeight, ARGB);
      contrast();
      image(imgNew, x, y);
    }
    if (key == '3' && currentMode != 3) {
      currentMode = 3;
      imgNew = createImage(imgWidth, imgHeight, ARGB);
      blur();
      image(imgNew, x, y);
    }
    if (key == '4' && currentMode != 4) {
      currentMode = 4;
      imgNew = createImage(imgWidth, imgHeight, ARGB);
      edgeDetection();
      image(imgNew, x, y);
    }
    if (key == '5' && currentMode != 5) {
      currentMode = 5;
      imgNew = createImage(imgWidth, imgHeight, ARGB);
      sharpen();
      image(imgNew, x, y);
    }
    if (key == '0' && currentMode != 0) {
      currentMode = 0;
      image(imgOriginal, x, y);
    }
  }

  private void greyscale() {//private method to perform the greyscale function on an image
    loadPixels();
    float grey;
    for (int i = 0; i < imgHeight; i++) {
      for (int j = 0; j < imgWidth; j++) {
        index = i + j*imgHeight;
        c = imgOriginal.pixels[index];
        red = red(c);
        green = green(c);
        blue = blue(c);
        grey = (red + green + blue) / 3;
        c = color(grey, grey, grey);
        imgNew.pixels[index] = c;
      }
    }
    updatePixels();
  }

  private void contrast() {
    loadPixels();
    for (int i = 0; i < imgHeight; i++) {
      for (int j = 0; j < imgWidth; j++) {
        index = i + j*imgHeight;
        c = imgOriginal.pixels[index];
        red = contrastHelp(red(c));
        green = contrastHelp(green(c));
        blue = contrastHelp(blue(c));
        c = color(red, green, blue);
        imgNew.pixels[index] = c;
      }
    }
    updatePixels();
  }

  private float contrastHelp(float rgb) {
    if (rgb >= 128) {//128-225
      if (rgb >= 192) {//192-225
        if (rgb >= 224) {//224-255
          //change nothing
        } else {//192-223
          rgb+=10;
        }
      } else {//128-191
        rgb+=20;
      }
    } else {//0-127
      if (rgb < 64) {//0-63
        if (rgb < 32) {//0-31
          //change nothing
        } else {//31-63
          rgb-=10;
        }
      } else {//63-127
        rgb-=20;
      }
    }
    return rgb;
  }

  private void blur() {
    float[][] blurKernel = {{.0625, .125, .0625}, {.125, .25, .125}, {.0625, .125, .0625}};
    useKernel(blurKernel, imgNew);
  }

  private void edgeDetection() {
    float[][] edgeVert = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};
    float[][] edgeHor = {{1, 0, -1}, {2, 0, -2}, {1, 0, -1}};
    color c1, c2;
    PImage imgBuffer = createImage(imgWidth, imgHeight, ARGB);
    useKernel(edgeVert, imgBuffer);
    useKernel(edgeHor, imgNew);
    for (int i = 0; i < imgWidth; i++) {
      for (int j = 0; j < imgHeight; j++) {
        index = i + j*imgWidth;
        c1 = imgBuffer.pixels[index];
        c2 = imgNew.pixels[index];
        red = sqrt(pow(red(c1), 2) + pow(red(c2), 2));
        green = sqrt(pow(green(c1), 2) + pow(green(c2), 2));
        blue = sqrt(pow(blue(c1), 2) + pow(blue(c2), 2));
        red = constrain(abs(red), 0, 255);
        green = constrain(abs(green), 0, 255);
        blue = constrain(abs(blue), 0, 255);
        c = color(red, green, blue);
        imgNew.pixels[index] = c;
      }
    }
  }

  private void sharpen() {
    float[][] sharpen = {{0, -1, 0}, {-1, 5, -1}, {0, -1, 0}};
    useKernel(sharpen, imgNew);
  }

  private void useKernel(float[][] kernel, PImage img) {
    loadPixels();
    for (int i = 0; i < imgWidth; i++) {
      for (int j = 0; j < imgHeight; j++) {
        index = i + j*imgWidth;
        c = imgOriginal.pixels[index];
        red = 0;
        green = 0;
        blue = 0;
        for (int x = -1*kernel.length/2; x <= kernel.length/2; x++) {
          for (int y = -1*kernel.length/2; y <= kernel.length/2; y++) {
            if (index + (x + y*imgWidth) >= 0 && index + (x + y*imgWidth) < imgOriginal.pixels.length) {
              red += red(imgOriginal.pixels[index + (x + y*imgWidth)]) * kernel [x+1][y+1];
              green += green(imgOriginal.pixels[index + (x + y*imgWidth)]) * kernel [x+1][y+1];
              blue += blue(imgOriginal.pixels[index + (x + y*imgWidth)]) * kernel [x+1][y+1];
            }
          }
        }
        red = constrain(abs(red), 0, 255);
        green = constrain(abs(green), 0, 255);
        blue = constrain(abs(blue), 0, 255);
        c = color(red, green, blue);
        img.pixels[index] = c;
      }
    }
    updatePixels();
  }
}