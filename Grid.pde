class Grid {

  PImage img;  
  int columns = 10;
  int rows = 10;
  int bufferWidth;
  int bufferHeight;

  public Grid(PImage img, int columns, int rows) {
    this.columns = columns;
    this.rows = rows;
    this.img = img;
    bufferWidth = getBufferWidth();
    bufferHeight = getBufferHeight();
  }


  int[][][] horizontalGrid() {
    int[][][] arr = new int[columns][rows][bufferWidth];
    int x_index = 0;
    int y_index = 0;
    for (int y = 0; y < bufferHeight*rows; y += bufferHeight) {
      for (int x = 0; x < bufferWidth*columns; x += bufferWidth) {
        for (int i = 0; i < bufferWidth; i++) {
          int pos = y * img.width + (x + i); 
          arr[x_index][y_index][i] = (int) red(img.pixels[pos]); 
          //img.pixels[pos] = color(255, 0, 0);
        }
        stroke(255, 0, 0);
        line(x, y, x + bufferWidth, y);
        x_index++;
      }
      x_index = 0;
      y_index++;
    }
    return arr;
  }

  int[][][] verticalGrid() {
    int[][][] arr = new int[columns][rows][bufferHeight];
    int x_index = 0;
    int y_index = 0;
    for (int y = 0; y < bufferHeight*rows; y += bufferHeight) {
      for (int x = 0; x < bufferWidth*columns; x += bufferWidth) {
        for (int i = 0; i < bufferHeight; i++) {
          int pos = (y + i) * img.width + x;
          arr[x_index][y_index][i] = (int) red(img.pixels[pos]);
          //img.pixels[pos] = color(255, 0, 0);
        }
        stroke(255, 0, 0);
        line(x, y, x, y + bufferHeight);
        x_index++;
      }
      x_index = 0;
      y_index++;
    }
    return arr;
  }

  int getBufferWidth() {
    return width/columns;
  }

  int getBufferHeight() {
    return height/rows;
  }

  int getColumns() {
    return columns;
  }

  int getRows() {
    return rows;
  }

  PImage getImg() {
    return img;
  }
}
