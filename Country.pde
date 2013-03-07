class Country {
  String countryName;
  float holdings;
  float shareOfTotal;
  float diameter;
  //float[] angles = { 500, 20, 100 };
  float lastAngle = 0;
  float count = 0;
  float totalHoldings = 0;

  color[] mycolors = {
    color(255, 114, 255), color(0, 255, 134), color(102, 255, 255), 
    color(153, 102, 255), color(240, 60, 134), color(127, 174, 204), 
    color(42, 98, 150), color(32, 34, 122), color(202, 219, 54), 
    color(159, 193, 203), color(200, 255, 134), color(22, 198, 106), 
    color(255, 204, 51), color(0, 164, 150), color(33, 31, 31), 
    color(203, 90, 27), color(159, 193, 203), color(226, 19, 14), color(83, 88, 121), 
    color(167, 249, 247), color(250, 185, 252), color(237, 64, 54), 
    color(127, 174, 204), color(44, 45, 9), color(255, 160, 113), 
    color(210, 255, 113), color(114, 59, 13), color(255, 113, 168), 
    color(146, 133, 23), color(246, 255, 54), color(161, 14, 229), 
    color(203, 90, 27), color(177, 255, 54), color(83, 84, 73), color(243, 255, 0), 
    color(249, 217, 135), color(255, 170, 59), color(149, 239, 249), 
    color(70, 117, 249)
  };

  Country() {
  }

  void render() {
    int a = 15;
    shareOfTotal = holdings / totalHoldings;
    shareOfTotal = map(shareOfTotal, 0, 1, 0, 360);
    println(shareOfTotal);
    diameter = min(width, height) * .50;
    //count = map(count, 0, 39, 0, 255);
    fill((count));
    color myColor = mycolors[(int)count];
    //color myColor = mycolors[(int) random(mycolors.length)];
    noStroke();
    fill(myColor);
    arc(width/2, height/2, diameter, diameter, radians(lastAngle), radians(lastAngle+shareOfTotal));
    println(countryName + " drawing from " + lastAngle +", drawing to " + (lastAngle+shareOfTotal) +", drawing at color " + count);
    fill(255);
    //fill(218, 220, 229);
    ellipse(width/2, height/2, 280, 280);

    fill(33, 33, 31);
  }
}

