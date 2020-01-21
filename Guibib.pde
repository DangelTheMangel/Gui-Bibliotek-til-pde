Knap minKnap =  new Knap(10, 10, 50, 50);

void setup() {
  size(500, 500);

  minKnap.tegnknap();
    minKnap.setTekst("Knap");
}

void draw() {

  minKnap.klik();
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
    text(tekst, positionX +(sizeX/8) , positionY + (sizeY/2));
  }
  
  void tegnknap() {
    fill(255);
    rect(positionX, positionY, sizeX, sizeY);
  }
}
