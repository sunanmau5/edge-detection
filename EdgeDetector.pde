class EdgeDetector {
  private int TOLERANCE = 20;

  EdgeDetector(int TOLERANCE) {
    this.TOLERANCE = TOLERANCE;
  }

  private int[] calculateAvg(int middle, int[] pixelValues) {
    int sumP = 0;
    int sumF = 0;
    int dividerP = 0;
    int dividerF = 0;
    int avgP = 0;
    int avgF = 0;

    //calculates the starting avg-values
    for (int j = 0; j < middle; j++) {
      if (pixelValues[j] != 0) {
        sumP += pixelValues[j];
        dividerP++;
        avgP = sumP/dividerP;
      }
    }

    for (int j = middle; j < pixelValues.length; j++) {
      if (pixelValues[j] != 0) {
        sumF += pixelValues[j];
        dividerF++;
        avgF = sumF/dividerF;
      }
    }
    return new int[]{avgP, avgF};
  }

  private int calculateDistance(int avgP, int avgF) {
    return avgP > avgF ? avgP-avgF : avgF-avgP;
  }

  int getEdge(int[] pixelValues) {
    int greatestDiff = 0;
    int index = 0;
    int START = 1;
    for (int i = START; i < pixelValues.length - 1; i++) {
      int[] values = calculateAvg(i, pixelValues);
      int distance = calculateDistance(values[0], values[1]);
      if (distance > greatestDiff) {
        greatestDiff = distance;
        index = i;
      }
    }
    if (greatestDiff > TOLERANCE) {
      return index;
    } else {
      return -1;
    }
  }

  int[][] getEdges(int[][][] iterationLines) {
    int[][] foundEdges = new int[iterationLines.length][iterationLines[0].length];

    for (int i = 0; i < iterationLines.length; i++) {
      for (int j = 0; j < iterationLines[i].length; j++) {
        foundEdges[i][j] = getEdge(iterationLines[i][j]);
      }
    }
    return foundEdges;
  }
}
