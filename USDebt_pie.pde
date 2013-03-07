ArrayList<Country> countries = new ArrayList();
float masterLastAngle = 0;
float totalHoldings = 0; 
float count = 0;

PFont f;
PFont ff;

void setup() {
  size(1100, 700);
  f = createFont("Abel-Regular", 32);
  ff = createFont("Abel-Regular", 20);
  textFont(f);
  textFont(ff);
  textAlign(CENTER, CENTER);
  smooth();
  Country d = new Country();
  loadData("usaDebt.csv");
  noLoop();  // Run once and stop
}

void draw() {
  //background(218, 220, 229);
  background(255);
  for (Country de:countries) {
    de.lastAngle = masterLastAngle;
    de.totalHoldings = totalHoldings;
    de.count= count;
    de.render();
    masterLastAngle += de.shareOfTotal;
    count++;
  }
  println(totalHoldings);
  textSize(32);
  text("US Debt", width/2, height/2-275);
  text("2012", width/2, height/2+250);
  textSize(20);
  text("Major foreign holders of treasury securities (in billions of dollars)", width/2, height/2-242);
}

void loadData(String url) {
  Table t = loadTable(url);
  t.removeTitleRow();
  for (int i = 0; i < 39; i++) {
    Country d = new Country();
    d.countryName = t.getString(i, "Debt Holders");
    d.holdings = t.getFloat(i, "Jul 2012");
    totalHoldings = totalHoldings + d.holdings;
    println(d.countryName);
    println(d.holdings);
    countries.add(d);
  }
}

