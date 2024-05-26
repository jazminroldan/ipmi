// Roldan Jazmin
// Comision 1

import processing.sound.*;
SoundFile sonido;

PImage logo, fondo1, fondo2, fondo3, fondo4;
PFont fuente;
String estado, intro;
int segundos, tam, py, transp = 0, velocidad1 = 5; 
float posicion1 = -width, posicion2 = -width, velocidad2 = 3; 
boolean restartBoton = false;

void setup() {
  size(640, 480);
  
  sonido = new SoundFile(this, "stopening.mp3");
  sonido.play();
 
  py = height;
  logo = loadImage("stlogo.jpeg");
  fondo1 = loadImage("1.png");
  fondo2 = loadImage("2.png");
  fondo3 = loadImage("3.png");
  fondo4 = loadImage("4.png");
  fuente = loadFont("Arial.vlw");
  imageMode(CENTER);
  textFont(fuente, 30);
  intro = "CAST CHARACTERS \n\nMillie Bobby Brown \nFinn Wolfhard \nGaten Matarazzo \nCaleb McLaughlin \nCharlie Heaton \nWinona Ryder";
  estado ="titulo";
  tam=100;
}

void draw() {
  background(0);

if (estado.equals("logo")) {
    fill(255);
    imageMode(CENTER);
    image(logo, width/2, height/2, tam, tam);
    tam = tam + 1;


} else if (estado.equals("segunda")) {
    imageMode(CORNER); 
    image(fondo1, 0, 0, width, height);
    fill(255, transp); 
    text("A Netflix Original Series", 105, 230);
    if (transp < 255) { 
      transp += velocidad1;
    }


} else if (estado.equals("tercera")) {
    image(fondo2, 0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Three Seasons", posicion1, 230);
    if (posicion1 < width/2) { 
      posicion1 += velocidad2;
    } else {
      posicion1 = width/2;
    }


} else if (estado.equals("cuarta")) {
    image(fondo3, 0, 0, 640, 480);
    fill(255);
    textAlign(CENTER, CENTER);
    text(intro, 100, py, 440, 400);
    if (py > 100) {
      py--;
    }


} else if (estado.equals("quinta")) {
    image(fondo4, 0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Create By \nThe Duffer Brothers", posicion2, 230);
    if (posicion2 < width/2) { 
      posicion2 += velocidad2;
    } else {
      posicion2 = width/2;
    }


} else if (estado.equals("sexta")) {
    background(0); // Fondo negro
  background(0); // Fondo negro
    
    // Dibuja el botón de reinicio
    fill(255, 0, 0); // Rojo
    rectMode(CENTER);
    rect(width/2, height/2, 150, 50);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Restart", width/2, height/2);
    
    // Verifica si se hizo clic en el botón
    if (restartBoton) {
      restartSketch();
      restartBoton = false; 
    }
}
   
  if (frameCount%60 == 0) {
    segundos++;
  }
    if (segundos<7) {
    estado = "logo";
  } else if (segundos>=7 && segundos<= 12) {
    estado = "segunda";
  } else if (segundos > 12 && segundos <18) {
    estado = "tercera";
  } else if (segundos >= 18 && segundos<= 25) {
    estado = "cuarta";
  } else if (segundos > 25 && segundos <32) {
    estado = "quinta";
  } else if (segundos > 32 && segundos <35) {
    estado = "sexta";
  }
}
void mouseClicked() {
  if (estado.equals("sexta") && mouseX > width/2 - 75 && mouseX < width/2 + 75 && mouseY > height/2 - 25 && mouseY < height/2 + 25) {
    restartBoton= true; 
  }
}
void restartSketch() {
  segundos = 0; 
  estado = "logo"; 
  tam = 100; 
  transp = 0; 
  posicion1 = -width; 
  posicion2 = -width; 
  py = height; 
  velocidad1 = 5; 
  velocidad2 = 3; 
}
