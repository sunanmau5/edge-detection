class Line {
  int startX;
  int startY;
  int endX;
  int endY;

  Line(int startX, int startY, int endX, int endY) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
  }

  @Override
    public String toString() {
    return "Line{" + "startX=" + startX + ", startY=" + startY + ", endX=" + endX + ", endY=" + endY + '}';
  }

  int calculateGradient() {
    if (endX - startX == 0) {
      return 0;
    }
    int gradient = (endY - startY) / (endX - startX);
    return gradient;
  }
}
