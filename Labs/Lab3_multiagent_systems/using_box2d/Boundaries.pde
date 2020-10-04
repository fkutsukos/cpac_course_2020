class Boundaries{
    float w;
    float h;
    Body[] bodies;
    Box2DProcessing  box2d;
    Boundaries(Box2DProcessing  box2d, float w, float h){
        this.box2d = box2d;
        this.w=w;
        this.h=h;
        BodyDef[] bds=new BodyDef[4]; //left, rigth, top, bottom
        PolygonShape[] pss=new PolygonShape[4];
        this.bodies= new Body[4];
        for(int i=0; i<4; i++){
          bds[i]=new BodyDef();
          pss[i]=new PolygonShape();
          bds[i].type= BodyType.STATIC;
          if(i<2){
            pss[i].setAsBox(this.box2d.scalarPixelsToWorld(5),box2d.scalarPixelsToWorld(h));           
            bds[i].position.set(this.box2d.coordPixelsToWorld(i*this.w, this.h/2));
          }
          else{
            pss[i].setAsBox(this.box2d.scalarPixelsToWorld(w),box2d.scalarPixelsToWorld(5));   
            bds[i].position.set(this.box2d.coordPixelsToWorld(this.w/2, this.h*(i-2)));
            
          }
          this.bodies[i] = this.box2d.createBody(bds[i]);
          this.bodies[i].createFixture(pss[i], 1);
          this.bodies[i].setUserData(null);

        }
    }
    void draw(){
      fill(255);
        stroke(0);
        rectMode(CENTER);        
      for (int i=0; i<4; i++){
        Vec2 pos=this.box2d.getBodyPixelCoord(this.bodies[i]); 
        if(i<2)        rect(pos.x, pos.y, 5, this.h);
        else           rect(pos.x, pos.y, this.w, 5);
        
      }    
    }
}
