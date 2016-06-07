void mouseDragged() {

  if (cambiando==true) {
    fin_x=mouseX;
    fin_y=mouseY;

    if (fin_x>ancho_camara-1) {
      fin_x=ancho_camara-1;
    }

    if (fin_y>alto_camara-1) {
      fin_y=alto_camara-1;
    }
  }
}
void mouseReleased() {
  println("Solto");
  if (cambiando==true) {
    println("Solto2");
    cambiando=false;
    fin_x=mouseX;
    fin_y=mouseY;

    if (fin_x>ancho_camara-1) {
      fin_x=ancho_camara-1;
    }

    if (fin_y>alto_camara-1) {
      fin_y=alto_camara-1;
    }

    int aux=0;
    if (inicio_x>fin_x) {
      aux=fin_x;
      fin_x=inicio_x;
      inicio_x=aux;
    }

    if (inicio_y>fin_y) {
      aux=fin_y;
      fin_y=inicio_y;
      inicio_y=aux;
    }
    ///calulos que todos..
    //espacio es x
    int indice_x =int( (fin_x - inicio_x)/zonas_x);
    int indice_y = int((fin_y - inicio_y)/zonas_y);
    for ( int i = 0; i < zonas_x; i++ ) {
      for ( int j = 0; j < zonas_y; j++ ) {
        zona[i][j].nueva_medida(indice_x, indice_y, inicio_x, inicio_y );
      }
    }//j
  }//i
}
void mousePressed() {
  if ((mouseX<ancho_camara)&&(mouseY<alto_camara)) {
    cambiando=true;
    inicio_x=mouseX;
    inicio_y=mouseY;
    fin_x=mouseX;
    fin_y=mouseY;
  }
}