public class CarroE extends Carro {

  public CarroE(PImage i, float x, float y) {  //Construtor do carro especial, especificando o x, y e a imagem que será atribuída na classe principal 
    super.img = i;  //Usamos super. porque CarroE extende isso da classe Carro
    super.x = x;
    super.y = y;
  }

  public void acelerar() {
    super.y += 5;
    tratarBordas();
  }
}
