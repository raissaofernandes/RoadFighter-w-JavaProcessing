public class CarroA extends Carro {

  public CarroA(PImage i, float x, float y) {
    super.img = i; //Usamos super. porque CarroA extende isso da classe Carro
    super.x = x;
    super.y = y;
  }

  public void acelerar() {
    super.y += 5; 
    tratarBordas();
  }
}
