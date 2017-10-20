ArrayList<Branch> tree;   // A list to keep track of all the lines

float treeAngle = PI/4;
float multiplier = 0.5;
int num = 1;

void setup() {
  size(1280, 720);
  smooth();
  tree = new ArrayList<Branch>();
}

void keyPressed() {
  if (key==' ')
    num++;
}

void draw() {
  treeAngle = map(mouseX, 0, width, 0, PI/2);
  multiplier = map(mouseY,0,height,0,0.9);

  background(255);
  tree = new ArrayList<Branch>();
  PVector start = new PVector(width/2, height);
  float len = 200;
  tree.add(new Branch(start, len, 0));

  strokeWeight(2);
  for (int i=0; i<num; i++) {
    generate();
  }
  for (Branch t : tree) {
    t.display();
  }
}

void generate() {
  ArrayList<Branch> next = tree;
  int size = next.size();
  for (int i=0; i<size; i++) {
    // Get the parameters from previous
    PVector start = tree.get(i).nextStart();                 
    float len = tree.get(i).nextLen();
    float angleA = tree.get(i).nextAngleA();
    float angleB = tree.get(i).nextAngleB();

    next.add(new Branch(start, len, angleA));
    next.add(new Branch(start, len, angleB));
  }
  tree = next;
}