public class CarroV {

  PImage img;
  public float x; 
  public float y;
  final int LARGURA = 30; 

  public CarroV(PImage img, float x, float y) {
    this.x = x;
    this.y = y;
    this.img = img;
  }

  public float getX() {
    return this.x;
  }

  public void mover(float novoX) { //Esse método foi utilizado para não permitir que o carro vermelho saia do limite da pista
    if (!(novoX <= 100 || novoX >= 435 - LARGURA/2)) {
      this.x = novoX;
    }
  }

  public void desenhar() {
    img.resize(40, 0);
    image(img, x, y);
  }
}
