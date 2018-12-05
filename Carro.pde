public abstract class Carro implements iFace {

  PImage img; 
  float x, y; 
  int pontos; 

  public boolean colidiu(float x1, float y1) {
    if (x >= x1 - 30 && x + img.width <= x1 + 70 && y >= y1 - 30 && y <= y1 + 50  ) {
      return true;
    } else {
      return false;
    }
  }
  
   abstract void pontos();

  public void desenhar() {
    img.resize(40, 0);
    image(img, x, y);
  }

  abstract void acelerar();

  public void tratarBordas() {
    if (y < -600) {
      y = random(100, 550);
    }
  }
}
