String[] listArduinosNames;

void inicio() {
    println("ok");

  background(0);
 // listArduinosNames = Serial.list();
   println(Serial.list());
 // if (listArduinosNames.length < 4) {
    //noLoop();
   // println("Error No aRduino Connected");
  //} else {

    //String portName = Serial.list()[0]; //<>//
    //serial = new Serial(this, portName, 9600);
   if(bUseSerial){
     String portName = Serial.list()[0];
     serial = new Serial(this, portName, 9600);
   }
   
   //inicio las imagennes
    camara = new Capture(this, ancho_camara, alto_camara); 
    //inicio los textos

    texto  = createFont("Georgia", 16);
    textFont(texto);

    //inicio los objetos
    zona = new Zonas [zonas_x][zonas_y];
    for ( int i = 0; i < zonas_x; i++ ) {
      for ( int j = 0; j < zonas_y; j++ ) {
        zona[i][j] = new Zonas(i, j);
      }
    }

    //Control del cambio del mouse
    cambiando=false;
    inicio_x=0;
    inicio_y=0;
    fin_x=0;
    fin_y=0;
    m = millis();

    ultimo_cambio = m;

    camara.start();
    
 // }
}