Cenario cenario = new Cenario(); //Criando o cenario para ser usado posteriormente
CarroV carrinho; //Carro controlado pelo jogador
ArrayList<Carro> carros = new ArrayList<Carro>(); //ArrayList para os carros amarelos
ArrayList<Carro> especiais = new ArrayList<Carro>(); //ArrayList para os carros coloridos (especiais) 
PFont fonte; 
float posy = -50; 
int life = 3;
PImage lateral, lateral2, hearts, menu;
int fase, pontos, quadro, record;

//Autores: Raissa Ohana Fernandes e Rafael Araújo dos Santos
//Projeto referente a disciplina de POO, para a nota do 4ºbimestre

void setup() {

  size(615, 600);
  fase = -1; 

  fonte = createFont("pixel.TTF", 28);
  textFont(fonte); //Fonte utilizada para todos os textos que aparecem no jogo

  lateral = loadImage("lateral.png"); // Elementos de tela 
  lateral2 = loadImage("lateral2.png");
  hearts = loadImage("3hearts.png");
  menu = loadImage("mainmenu2.png"); 

  carrinho = new CarroV(loadImage("car1teste.png"), 300, 500 ); //Atribuindo a imagem do carro do jogador
}

void draw() {
  quadro++; //Variável para armazenar a quantidade de quadros e ser usada posteriormente 

  cenario.cena(); // Adicionando os elementos do cenário
  cenario.pista();
  cenario.acelerar(); 
  cenario.des(lateral, lateral2, hearts);

  if (life == 3) {    //Testes para "remover" os corações referente a quantidade de vida do jogador
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

  for (int i = carros.size() - 1; i >= 0; i--) { //for usado para desenhar e criar a ideia de movimento dos carros amarelos 
    Carro car = carros.get(i);   
    car.desenhar();   
    car.acelerar();
  }

  for (int i = especiais.size() - 1; i >= 0; i--) { //for usado para desenhar e criar a ideia de movimento dos carros coloridos (especiais) 
    Carro carE = especiais.get(i);   
    carE.desenhar();   
    carE.acelerar();
  } 

  carrinho.desenhar(); //Colocando na tela o carrinho do jogador 

  if (quadro > 60) { //Testes utilizados para que todos os carros (à parte, o do jogador) apareçam na tela 
    quadro = 0;
    if (random(1) > 0.1 && fase == 0) { //Essa carro é o carro amarelo, que terá 90% de chance de aparecer, caso a fase 0 esteja acontecendo...
      carros.add(new CarroA(loadImage("car2teste.png"), random(100, 450 -30), posy));
    } 
    if (random(1) > 0.9 && fase == 0) { //E esse é o if para os carros especiais, que possui apenas 10% de chance de aparecer, caso também esteja na fase 0 do jogo 
      especiais.add(new CarroE(loadImage("car2teste2.png"), random(100, 450 -30), posy));
    }
  }


  for (int i = carros.size() - 1; i >= 0; i--) {
    Carro c = carros.get(i);
    if (c.colidiu(carrinho.x, carrinho.y)) {//Teste de colisão entre o carrinho amarelo e o vermelho 
      carros.remove(i); //Removendo do Array o carro que colidiu 
      life--; //Diminuindo a quantidade de vidas do jogador 
      if (life < 0) { 
        fase = 1; //Caso as vidas cheguem a 0, a tela de Game Over é mostrada
      }
    }
    if (c.y >= 540 && c.y <= 543 && fase == 0) {
      pontos += 100; //Caso o carro vermelho ultrapasse o amarelo, é atribuido mais 100 pontos na pontuação do jogador
    }
  } 

  for (int i = especiais.size() - 1; i >= 0; i--) { 
    Carro cE = especiais.get(i);
    if (cE.colidiu(carrinho.x, carrinho.y)) { //Teste de colisão entre o carrinho vermelho e o carro especial 
      especiais.remove(i); //Removendo do Array o carro que colidiu 
      pontos += 1000; //Caso o carro vermelho colida com o especial, é atribuido mais 1000 pontos na pontuação do jogador
    }
  }

  if (fase == 1) { //A fase 1 é a nossa tela de Game Over
    textSize(60);
    background(0);
    text("GAME OVER", 80, 250);
    textSize(15);
    text("PONTOS: ", 250, 350);
    text(pontos, 340, 350);
    text("***CLIQUE PARA RECOMEÇAR***", 140, 500);
  }

  if (fase == -1) { //A fase -1 é a nossa tela de apresentação com o nome do jogo e etc 
    image(menu, 0, 0);
  }

  if (fase == 0) { //A fase 0 é a fase em que o jogo está rodando
    textSize(20);
    fill(255);
    text("Road", 485, 80);
    text("Fighter", 510, 115);

    text("Pontos", 500, 300);
    text(pontos, 505, 350);

    text("Vidas", 510, 450); 
    // text(life, 500, 500);
  }
} 
void mousePressed() {
  if ( fase == 1 ) { //Caso esteja na tela de Game Over e o jogador clicar em algum lugar na tela, o jogo começa novamente
    fase = 0; 
    life = 3;
    carros.clear(); //Limpando o Array dos carros 
    pontos = 0; //Zerando a pontuação
  }
  if ( fase == -1 ) { //Caso esteja na tela de menu e o jogador clicar em algum lugar na tela, o jogo começa 
    fase = 0;
  }
} 

void keyPressed() { 
  if (keyCode == 37 ) {
    carrinho.mover(carrinho.getX() - 10);
  } else if (keyCode == 39) {
    carrinho.mover(carrinho.getX() + 10);
  } //Ambos são os controles do carrinho vermelho, que é o carro do jogador
}
