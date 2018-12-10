public abstract class Carro implements iFace {

  PImage img; 
  float x, y; 
  int pontos; 

  public boolean colidiu(float x1, float y1) { //Teste de colisão dos carros 
    if (x >= x1 - 30 && x + img.width <= x1 + 70 && y >= y1 - 30 && y <= y1 + 50  ) {
      return true;
    } else {
      return false;
    }
  }

  public void desenhar() {
    img.resize(40, 0);
    image(img, x, y);
  }

  abstract void acelerar(); //Método abstrato, suas especificações ficam nas classes que extendem Carro 

  public void tratarBordas() { //Método usado para que os carros sempre fiquem percorrendo a tela 
    if (y < -600) {
      y = random(100, 550);
    }
  }
}
