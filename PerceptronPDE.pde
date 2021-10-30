Punto[] Puntos = new Punto[1000];
Neurona Cerebro;
float m = 0.5;
float b =0;

float Tam;

void setup(){
  size(600,600);
  for(int i = 0; i<Puntos.length; i++)
    Puntos[i] = new Punto(random(0,width)-width/2,
                          random(0, height)-height/2);
     Tam = width/2;
     
     Cerebro = new Neurona(2,.05);
     println(frameCount);
}

void draw(){
  background(200);
  Ejes();
  strokeWeight(1);
  line(width/2-width/m,0,width/2+width/m,height);
  
  for(int i = 0 ; i<Puntos.length ; i++){
    Puntos[i].x = random(0, width)-width/2;
    Puntos[i].y = random(0,height)-height/2;
  }
  
  
  for(Punto p : Puntos) {
    p.Tipo = int(Cerebro.Clasificar(p.x/Tam,p.y/Tam));
    p.Pintar();
  }
  
  float x = random(0,width)-width/2;
  float y = random(0,height)-height/2;
  Cerebro.Entrenamiento(x,y,y<m*x+b ? 1 : -1);
  
  delay(100);
  
}

void Ejes(){
    strokeWeight(2);
    line(width/2,0,width/2,height);
    line(0,height/2,width,height/2);
  }
