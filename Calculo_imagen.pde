void calculo_imagen() {
  hay_cambios = false;
  cuantos_cambios = 0;

  int aux_r=0;
  int aux_g=0;
  int aux_b=0;

  camara.loadPixels();
  int p = 0;

  for ( int i = 0; i < zonas_x; i++ ) {
    for ( int j = 0; j < zonas_y; j++ ) {
      int contador = 0; 
      for ( int x = zona[i][j].x; x < zona[i][j].fin_x; x++ ) {
        for ( int y = zona[i][j].y; y < zona[i][j].fin_y; y++ ) {
          p = y * camara.width + x;
          aux_r += camara.pixels[p] >> 16 & 0xFF;//red(camara.get(x, y));
          aux_g += camara.pixels[p] >> 8 & 0xFF;//green(camara.get(x, y));
          aux_b += camara.pixels[p] & 0xFF;//blue(camara.get(x, y));
          contador++;
        }//for y
      }//for x
      if (contador>0) {        
        aux_r = aux_r/contador;
        aux_g = aux_g/contador;
        aux_b = aux_b/contador;
        zona[i][j].update(aux_r, aux_g, aux_b);
      }
    }//j
  }//i
  //ahora ver si hay cambios: grabar en archivo y decirle a arduino  
  if (hay_cambios) {
    save_estado("1");
  }
}


void calculo_imagen_inicial() {
  int aux_r=0;
  int aux_g=0;
  int aux_b=0;

  camara.loadPixels();
  int p = 0;


  for ( int i = 0; i < zonas_x; i++ ) {
    for ( int j = 0; j < zonas_y; j++ ) {
      int contador = 0; 
      for ( int x = zona[i][j].x; x < zona[i][j].fin_x; x++ ) {
        for ( int y = zona[i][j].y; y < zona[i][j].fin_y; y++ ) {
          //aux_r += red(camara.get(x, y));
          //aux_g += green(camara.get(x, y));
          //aux_b += blue(camara.get(x, y));
          p = y * camara.width + x;
          aux_r += camara.pixels[p] >> 16 & 0xFF;//red(camara.get(x, y));
          aux_g += camara.pixels[p] >> 8 & 0xFF;//green(camara.get(x, y));
          aux_b += camara.pixels[p] & 0xFF;//blue(camara.get(x, y));
          contador++;
        }//for y
      }//for x
      if (contador>0) {

        aux_r = aux_r/contador;
        aux_g = aux_g/contador;
        aux_b = aux_b/contador;
        zona[i][j].r = aux_r;
        zona[i][j].g = aux_g;
        zona[i][j].b = aux_b;
      }
    }//j
  }//i
}