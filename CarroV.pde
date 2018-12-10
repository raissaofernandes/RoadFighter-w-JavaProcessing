public class CarroV {

  PImage img;
  public float x; 
  public float y;
  final int LARGURA = 30; 

  public CarroV(PImage img, float x, float y) {  //Construtor do carro do jogador, especificando o x, y e a imagem que será atribuída na classe principal 
    this.x = x; //Usamos this. porque CarroV não extende a classe Carro, diferente das classes CarroA e CarroE
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
