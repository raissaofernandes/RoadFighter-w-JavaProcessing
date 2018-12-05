Cenario cenario = new Cenario(); 
CarroV carrinho; 
ArrayList<Carro> carros = new ArrayList<Carro>();
ArrayList<Carro> especiais = new ArrayList<Carro>();
PFont fonte; 
float posy = -50; 
int life = 3;
PImage lateral, lateral2, hearts, menu;
int fase, pontos, quadro;


void setup() {

  size(615, 600);
  fase = -1; // A FASE -1 É PRA SER O MENU, A FASE 0 É PRA SER ENQUANTO ESTÁ JOGANDO

  fonte = createFont("pixel.TTF", 28);
  textFont(fonte);

  lateral = loadImage("lateral.png");
  lateral2 = loadImage("lateral2.png");
  hearts = loadImage("3hearts.png");
  menu = loadImage("mainmenu2.png");

  carrinho = new CarroV(loadImage("car1teste.png"), 300, 500 ); //CARRO DO JOGADOR
}

void draw() {
  quadro++; 

  cenario.cena(); // adicionando os elementos do cenário 
  cenario.pista();
  cenario.acelerar();
  cenario.des(lateral, lateral2, hearts);

  if (life == 3) {
    hearts = loadImage("3hearts.png");
  }

  if (life == 2) {
    hearts = loadImage("2hearts.png");
  }

  if (life == 1) {
    hearts = loadImage("1heart.png");
  }

  if (life == 0) {
    hearts = loadImage("0heart.png");
  }

  for (int i = carros.size() - 1; i >= 0; i--) {
    Carro car = carros.get(i);   
    car.desenhar();   
    car.acelerar();
  } // carro amarelo
  
   for (int i = especiais.size() - 1; i >= 0; i--) {
    Carro carE = especiais.get(i);   
    carE.desenhar();   
    carE.acelerar();
  } // carro especial 

  carrinho.desenhar();

  if (quadro > 60) {
    quadro = 0;
    if (random(1) > 0.1 && fase == 0) {
      carros.add(new CarroA(loadImage("car2teste.png"), random(100, 450 -30), posy));
    } 
    if (random(1) > 0.9 && fase == 0) {
      especiais.add(new CarroE(loadImage("car2teste2.png"), random(100, 450 -30), posy));
    }
  }


  for (int i = carros.size() - 1; i >= 0; i--) {
    Carro c = carros.get(i);
    if (c.colidiu(carrinho.x, carrinho.y)) {
      carros.remove(i);
      life--;
      if (life < 0) { // SE AS VIDAS ACABAREM MUDAR PARA FASE 1 (game over)
        fase = 1;
      }
    }
    if (c.y >= 540 && c.y <= 543 && fase == 0) {
      pontos += 100; // chamar o atributo super.pontuacao();
    }
  } 

  /////////////////////////////////////////////////////////////////////////////////////////////////////// CARRO AMARELO FIM

  for (int i = especiais.size() - 1; i >= 0; i--) {
    Carro cE = especiais.get(i);
    if (cE.colidiu(carrinho.x, carrinho.y)) {
      especiais.remove(i);
      pontos += 1000;
    }
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////// CARRO ESPECIAL FIM
  


  if (fase == 1) { // A FASE 1 REPRESENTA A TELA DE GAME OVER
    textSize(60);
    background(0);
    text("GAME OVER", 80, 250);
    textSize(15);
    text("PONTOS: ", 250, 350);
    text(pontos, 340, 350);
    text("***CLIQUE PARA RECOMEÇAR***", 140, 500);
  }

  if (fase == -1) {
    image(menu, 0, 0);
  }

  if (fase == 0) {
    textSize(20);
    fill(255);
    text("Road", 485, 80);
    text("Fighter", 510, 115);

    text("Pontos", 500, 300);
    text(pontos, 505, 350);

    text("Vidas", 510, 450); 
    // text(life, 500, 500);
  }
} //FIM DO DRAW

void mousePressed() { // TELA DE GAME OVER, SE CLICAR RECOMEÇA O JOGO
  if ( fase == 1 ) {
    fase = 0; 
    life = 3;
    carros.clear();
    pontos = 0;
  }
  if ( fase == -1 ) {
    fase = 0;
  }
} 

void keyPressed() { 
  if (keyCode == 37 ) {
    carrinho.mover(carrinho.getX() - 10);
  } else if (keyCode == 39) {
    carrinho.mover(carrinho.getX() + 10);
  }
  //keyCode 32
}
