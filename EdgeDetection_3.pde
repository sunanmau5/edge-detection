PImage ori, withoutHolds, greyscale, img;
Grid grid;
ArrayList<Line> foundLines;
EdgeDetector detector;
HoldEliminator eliminator;

int[][][] horizontalIteration, verticalIteration;
int[][] horizontalEdges, verticalEdges;
int page;

void setup() {
  size(814, 546);
  ori = loadImage("wall.jpg");
  eliminator = new HoldEliminator(ori, 30);
  withoutHolds = eliminator.ignoreHolds();
  greyscale = withoutHolds.copy();
  greyscale.filter(GRAY);
  grid = new  Grid(greyscale, 101, 68);
  detector = new EdgeDetector(10);

  page = 0;
}

void draw() {
  if (page == 0) {
    image(ori, 0, 0);
    text("Source", 10, 25);
  } else if (page == 1) {
    image(withoutHolds, 0, 0);
    text("Without holds", 10, 25);
  } else if (page == 2) {
    image(greyscale, 0, 0);
    text("Greyscale", 10, 25);
  } else if (page == 3) {
    image(greyscale, 0, 0);

    //slices the image into iteration-groups
    horizontalIteration = grid.horizontalGrid();
    verticalIteration = grid.verticalGrid();

    //detects edges within iteration-group
    horizontalEdges = detector.getEdges(horizontalIteration);
    verticalEdges = detector.getEdges(verticalIteration);
    text("With grid", 10, 25);
  } else if (page == 4) {
    img = grid.getImg();

    LineDetector lineDetector =
      new LineDetector(grid.getBufferWidth(), grid.getBufferHeight());
    foundLines = lineDetector.findLines(horizontalEdges, verticalEdges);
    image(img, 0, 0);
    for (Line l : foundLines) {
      stroke(0, 255, 0);
      line(l.startX, l.startY, l.endX, l.endY);
    }
    text("Edge Detection", 10, 25);
  }
}

void mouseClicked() {
  if (page == 4) {
    page = 0;
  } else {
    page++;
  }
}
