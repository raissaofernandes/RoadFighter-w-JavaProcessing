public class CarroA extends Carro {

  public CarroA(PImage i, float x, float y) {
    super.img = i; 
    super.x = x;
    super.y = y;
  }

  public void pontos() {
    super.pontos += 100;
  }

  public void acelerar() {
    super.y += 5; // tava em 4 
    tratarBordas();
  }
}
