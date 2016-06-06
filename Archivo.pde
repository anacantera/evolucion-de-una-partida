void save_estado(String archi) {
  String archivo ="data/datos"+archi+".txt"; 
  String datos = "";
  println("GRABANDO....banca");
  for ( int i = 0; i < zonas_x; i++ ) {
    for ( int j = 0; j < zonas_y; j++ ) {
      /*datos += " zona_x:"+ i +"_y:"+ j + "__X: " + zona[i][j].x ;
      datos += " zona_x:"+ i +"_y:"+ j + "__Y: " + zona[i][j].y ;
      datos += " zona_x:"+ i +"_y:"+ j + "__FinX: " + zona[i][j].fin_x ;
      datos += " zona_x:"+ i +"_y:"+ j + "__FinY: " + zona[i][j].fin_y ; 
      datos += " zona_x:"+ i +"_y:"+ j + "__TamX: " + zona[i][j].tam_x ;
      datos += " zona_x:"+ i +"_y:"+ j + "__TamY: " + zona[i][j].tam_y ;
      datos += " zona_x:"+ i +"_y:"+ j + "__R: " + zona[i][j].r ;
      datos += " zona_x:"+ i +"_y:"+ j + "__G: " + zona[i][j].g ;
      datos += " zona_x:"+ i +"_y:"+ j + "__B: " + zona[i][j].b ;*/
      datos += " zona_x:"+ i +"_y:"+ j 
      + "__X: " + zona[i][j].x 
      + " __Y: " + zona[i][j].y
      + " __FinX: " + zona[i][j].fin_x
      + " __FinY: " + zona[i][j].fin_y 
      + " __TamX: " + zona[i][j].tam_x
      + " __TamY: " + zona[i][j].tam_y
      + " __R: " + zona[i][j].r
      + " __G: " + zona[i][j].g
      + " __B: " + zona[i][j].b;
    }
  }
  String[] list = split(datos, ' ');
  saveStrings(archivo, list);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  rect(-5, 250, 1000, 2);
  
  println("Termino");
}///save



void load_estado(String archi) {
  String lines[] = loadStrings("data/datos"+archi+".txt");

  int indice=1;
  for (int x=0; x<zonas_x; x++) {
    for (int y=0; y<zonas_y; y++) {
      zona[x][y].x = int(lines[indice+1]);

      zona[x][y].y = int(lines[indice+3]);
      zona[x][y].fin_x = int(lines[indice+5]);
      zona[x][y].fin_y = int(lines[indice+7]);
      zona[x][y].tam_x = int(lines[indice+9]);
      zona[x][y].tam_y = int(lines[indice+11]); 
      zona[x][y].r = int(lines[indice+13]); 
      zona[x][y].g = int(lines[indice+15]); 
      zona[x][y].b = int(lines[indice+17]); 
      indice+=18;
    }
  }

  fill(0, 255, 0);
  stroke(0, 255, 0);
  rect(-5, 250, 1000, 2);
}