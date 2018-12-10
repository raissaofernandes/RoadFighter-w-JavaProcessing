public class CarroE extends Carro {

  public CarroE(PImage i, float x, float y) {
    super.img = i; 
    super.x = x;
    super.y = y;
  }

  public void pontos() {
    super.pontos += 1000;
  }



  public void acelerar() {
    super.y += 5; // tava em 4 
    tratarBordas();
  }
}
