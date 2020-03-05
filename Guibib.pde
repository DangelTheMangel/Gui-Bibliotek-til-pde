Knap minKnap =  new Knap(10, 10, 50, 50);
Slider[] instances =  new Slider[1]; 
void setup() {
  size(500, 500);
  noStroke(); 
  
  // init them: (xPos, yPos, width, height)
  instances[0] = new Slider(100, 10, 40, 20);
}

void draw() {
  
  clear();
  background(200);
  minKnap.tegnknap();
  minKnap.setTekst("Knap");
  minKnap.klik();
  for (Slider t : instances) {
    t.run();
  }
}

void mousePressed() {

  //lock if clicked
  for (Slider t : instances)
  {
    if (t.isOver())
      t.lock = true;
  }
}

void mouseReleased() {

  //unlock
  for (Slider t : instances)
  {
    t.lock = false;
  }
}

class Knap {

  //variabler
  float positionX, positionY, sizeX, sizeY;

  Knap(int a, int b, int c, int d ) {
    positionX = a;
    positionY = b;
    sizeX = c;
    sizeY = d;
  }
  void klik() {
    if (mousePressed &&
      mouseX > positionX &&
      mouseX < positionX + sizeX &&
      mouseY > positionY &&
      mouseY < positionY + sizeY) {
      println("bruh");
    }
  }

  void setTekst(String tekst) {
    fill(0);
    text(tekst, positionX +(sizeX/8), positionY + (sizeY/2));
  }

  void tegnknap() {
    fill(255);
    rect(positionX, positionY, sizeX, sizeY);
  }
}

class Slider {
  //class vars
  float x;
  float y;
  float w, h;
  float initialY;
  boolean lock = false;

  //constructors

  //default
  Slider () {
  }

  Slider (float _x, float _y, float _w, float _h) {

    x=_x;
    y=_y;
    initialY = y;
    w=_w;
    h=_h;
  }


  void run() {

    // bad practice have all stuff done in one method...
    float lowerY = height - h - initialY;

    // map value to change color..
    float value = map(y, initialY, lowerY, 120, 255);

    // map value to display
    float value2 = map(value, 120, 255, 100, 0);

    //set color as it changes
    color c = color(value);
    fill(c);

    // draw base line
    rect(x, initialY, 4, lowerY);

    // draw knob
    fill(200);
    rect(x, y, w, h);

    // display text
    fill(0);
    text(int(value2) +"%", x+5, y+15);

    //get mouseInput and map it
    float my = constrain(mouseY, initialY, height - h - initialY );
    if (lock) y = my;
  }

  // is mouse ove knob?
  boolean isOver()
  {
    return (x+w >= mouseX) && (mouseX >= x) && (y+h >= mouseY) && (mouseY >= y);
  }
}
