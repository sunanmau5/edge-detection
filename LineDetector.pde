import java.util.ArrayList;

class LineDetector {

  private int bufferHeight;
  private int bufferWidth;

  LineDetector(int bufferWidth, int bufferHeight) {
    this.bufferHeight = bufferHeight;
    this.bufferWidth = bufferWidth;
  }

  ArrayList<Line> findLines(int[][] horizontal, int[][] vertical) {
    ArrayList<Line> foundLines = new ArrayList<Line>();
    for (int y = 0; y < vertical[0].length - 1; y++) {
      for (int x = 0; x < vertical.length - 1; x++) {
        int startX = 0;
        int startY = 0;
        int endX = 0;
        int endY = 0;
        final int UPP = horizontal[x][y];
        final int LFT = vertical[x][y];
        final int BTM = horizontal[x][y + 1];
        final int RGT = vertical[x + 1][y];

        if (UPP != -1) {
          startX = bufferWidth * x + UPP;
          startY = bufferHeight * y;
        }
        if (LFT != -1) {
          if (startX == 0 && startY == 0) {
            startX = bufferWidth * x;
            startY = bufferHeight * y + LFT;
          } else {
            endX = bufferWidth * x;
            endY = bufferHeight * y + LFT;
          }
        }
        if (BTM != -1) {
          if (startX == 0 && startY == 0) {
            startX = bufferWidth * x + BTM;
            startY = bufferHeight * (y + 1);
          } else {
            endX = bufferWidth * x + BTM;
            endY = bufferHeight * (y + 1);
          }
        }
        if (RGT != -1) {
          endX = bufferWidth * (x + 1);
          endY = bufferHeight * y + RGT;
        }
        if ((startX == 0 && startY == 0) || (endX == 0 && endY == 0)) {
        } else {
          Line line = new Line(startX, startY, endX, endY);
          foundLines.add(line);
        }
      }
    }
    return foundLines;
  }

  void ausgabe(int[][] arr) {
    for (int i = 0; i < arr[0].length; i++) {
      for (int j = 0; j < arr.length; j++) {
        System.out.printf("%2d ", arr[j][i]);
      }
      println();
    }
  }
}
