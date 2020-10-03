ParticleSystem ps;
int Nparticles=1000;
PImage img;
void setup(){
  size(1280,720, P2D);
  PVector origin=new PVector(0.75*width, height);
  ps=new ParticleSystem(origin);
  for(int p=0; p<Nparticles; p++){
    ps.addParticle();
  }
  img=loadImage("texture.png");
  background(0);
}

void draw(){
  blendMode(ADD);
  background(0);
  PVector wind= new PVector(map(mouseX, 0, width, -.2, .2),0);
    
  ps.action(wind);
}
