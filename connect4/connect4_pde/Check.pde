class Check {


  void check() {

    //horizontal check
    for (a=0; a < 7; a++) {
      for (b = 0; b<7; b++) {
        int Check = (grid[b][a]) + (grid[b+1][a]) + (grid[b+2][a]) + (grid[b+3][a]);
        if (Check == 20 || Check == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
    //vertical check
    for (a=0; a < 7; a++) {
      for (b = 0; b<8; b++) {
        int Check = (grid[b][a]) + (grid[b][a+1]) + (grid[b][a+2]) + (grid[b][a+3]);
        if (Check == 20 || Check == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
    // diagonal check
    for (int a =0; a < 8-4; a++) {
      for (int b=0; b < 8-4; b++) {
        int tCheck = (grid[b][a]) + (grid[b+1][a+1]) + (grid[b+2][a+2]) + (grid[b+3][a+3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }

    for (int a=0; a < 8-4; a++) {
      for (int b=3; b < 8; b++) {
        int tCheck = (grid[b][a]) + (grid[b-1][a+1]) + (grid[b-2][a+2]) + (grid[b-3][a+3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }

    for (int a=0; a < 8-4; a++) {
      for (int b=0; b < 8-4; b++) {
        int tCheck = (grid[b][a]) + (grid[b+1][a+1]) + (grid[b+2][a+2]) + (grid[b+3][a+3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
    for (int a=6; a < 8; a++) {
      for (int b=0; b < 8-4; b++) {
        int tCheck = (grid[b][a]) + (grid[b+1][a-1]) + (grid[b+2][a-2]) + (grid[b+3][a-3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
    for (int a =3; a < 8; a++) {
      for (int b=3; b < 8; b++) {
        int tCheck = (grid[b][a]) + (grid[b-1][a-1]) + (grid[b-2][a-2]) + (grid[b-3][a-3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
  }
}

