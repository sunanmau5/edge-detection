class HoldEliminator {
  
  PImage withoutHolds;
  PImage original;
  PImage empty;
  int tolerance;

  HoldEliminator(PImage original, int tolerance) {
    this.original = original;
    empty = createImage(original.width, original.height, RGB);
    this.tolerance = tolerance;
  }

  PImage ignoreHolds() {
    for (int i = 0; i < original.width*original.height; i++) {
      final int R = (int)red(original.pixels[i]);
      final int G = (int)green(original.pixels[i]);
      final int B = (int)blue(original.pixels[i]);
      if (isHoldPixel(R, G, B)) {
        empty.pixels[i] = color(0, 0, 0);
      } else {
        empty.pixels[i] = color(R, G, B);
      }
    }
    return empty;
  }

  boolean isHoldPixel(int r, int g, int b) {
    return r > (g+b)/2 + tolerance || g > (r+b)/2 + tolerance || b > (r+g)/2 + tolerance;
  }
}   
