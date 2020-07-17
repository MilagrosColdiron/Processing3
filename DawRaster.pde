public class DrawRaster {

  color [] value = new color [100000];

  float  [] xP = new float  [100000];
  float  [] yP = new float  [100000];
  float  [] vP = new float  [100000];

  int count = 0;

  public void scanImage() {

    //int step = 8;

    for ( int y = 0; y < height; y+=1 ) {
      for ( int x = 0; x < width; x+=1 ) {

        color c = get( x, y);
      }
    }
  }


  public void computeRasterLoc( int step ) {

    int countY = 1;

    for ( int y = 0; y < (height-step); y+=step ) {

      countY++;

      for ( int x = 0; x < (width-(step/2)); x+=step ) {

        int m = countY%2;
        //println(m);

        //float xC = (x*step)+(((m*(step*(step/2))) ));
        float xC = x +((m*step)/2);
        float yC = y;

        color c = get( (int)xC, (int)yC );
        xP[this.count] = xC;
        yP[this.count] = yC;
        vP[this.count] = brightness(c);

        value[this.count] = c;

        this.count++;
      }
    }
  }



  public void drawRaster( int step, int drawmode, int stepline, float lineWeigth_  ) {

    fill( 0, 0, 0 );
    strokeWeight(1);

    if ( drawmode == 2 ) { 
      fill(#000000); 
      noStroke();
    } else { 
      noFill(); 
      strokeWeight(lineWeigth_);
    }


    for ( int c = 0; c < this.count; c+=1 ) { // 

      float sw = (256-brightness(value[c]))/step;

      //stepline = int(sw) / 8;

      if ( drawmode == 2 ) {

        drawDot( 8, sw, (int)this.xP[c], (int)this.yP[c] ); // 0 - 90
      } else
      {
        for ( int i = 0; i < sw; i+= stepline) {

          drawDot( 8, i, (int)this.xP[c], (int)this.yP[c] ); // 0 - 90
        }
      }
    }
  }




  //..........................
  public void drawDot( float size, float val, float xP, float yP ) {

    float P = (val/256)*100;

    float D = (90.0/100.0)*P;

    float bulge = D;// 1 - 32
    val = size;

    float r = random(0, 0.1);
    //bulge = bulge + r;

    //println(D);



    //fill(#000000);
    beginShape();
    vertex(xP, yP-val);
    vertex(xP+(bulge), yP-(bulge));
    vertex(xP+val, yP);
    vertex(xP+(bulge), yP+(bulge));
    vertex(xP, yP+val);
    vertex(xP-(bulge), yP+(bulge));
    vertex(xP-val, yP);
    vertex(xP-(bulge), yP-(bulge));
    endShape(CLOSE);
  }
}
