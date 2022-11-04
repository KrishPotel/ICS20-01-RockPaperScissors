int choice;
int compchoice;
int win, tie, lost;
class Button{
  
  //Defining basic class varibles 
  //(making them public so they can be acessed outside of the class)
  public int x;
  public int y;
  public int h;
  public int w;
  
  //bool for the status of the button
  public boolean clicked;
  
  private PImage icon;
  private boolean hasIcon;
  
  //Consturcter for the class allowing to define the parameters for the button
  Button(int PosX, int PosY, int Width,int Height){
    x=PosX;
    y=PosY;
    w=Width;
    h=Height;
  }
  
  //makes a rect with the parameters of the button
  void debug(){
    rect(x, y, w, h);
  }
  
  //Checks if the mouse is withen the bounds of the button
  //run inside of the mousePressed or mouseClicked funcation
  void run(int i){
    if(clicked){
       clicked = false;
    }
    if(mouseX > x && mouseY > y && mouseX < x+w && mouseY < y+h){
      choice  = i;
      clicked = true;
    } 
  }
  
  void addIcon(PImage I){
    image(I, x, y, w, h);
    icon = I;
    hasIcon=true;
  }
  
  void placeIcon(){
    image(icon, x, y, w, h);
  }
}

enum winStatus{ 
  win,
  lost,
  tie,
  play
}

winStatus winStat = winStatus.play;

Button rockButton = new Button(350, 200, 100, 100);
Button paperButton = new Button(200, 200, 100, 100);
Button scissorsButton = new Button(50, 200, 100, 100);
Button PlayAgain = new Button(150, 300, 200, 100);


int pChoiceX = 50;
int pChoiceY = 100;

int compChoiceX = 250;
int compChoiceY = 100;

PImage rock, paper, scissors;
int r = 251;
int g = 235;
int b = 4;

void play(){
  int rand = int(random(1, 4));
  if(rand == 1){
    compchoice = 1;
    image(rock, compChoiceX, compChoiceY, 200, 200);
    if(compchoice == choice){
      tie+=1;
      winStat = winStatus.tie;
    }
    if(choice == 2){
      lost+=1;
      winStat = winStatus.lost;
    }
    if(choice == 3){
      win+=1;
      winStat = winStatus.win;
    }
  }
  else if(rand == 2){
    compchoice = 2;
    image(paper, compChoiceX, compChoiceY, 200, 200);
    if(compchoice == choice){
      tie+=1;
      winStat = winStatus.tie;
    }
    if(choice == 3){
      lost+=1;
      winStat = winStatus.lost;
    }
    if(choice == 1){
      win+=1;
      winStat = winStatus.win;
    }
  }
  else if(rand == 3){
    compchoice = 3;
    image(scissors, compChoiceX, compChoiceY, 200, 200);
    if(compchoice == choice){
      tie+=1;
      winStat = winStatus.tie;
    }
    if(choice == 1){
      lost+=1;
      winStat = winStatus.lost;
    }
    if(choice == 2){
      win+=1;
      winStat = winStatus.win;
    }
  }
}

void setup(){
  //init the screen 500x by 500y
  background(r,g,b);
  size(500,500);
  textSize(50);
  //rockButton.debug();
  //paperButton.debug();
  //scissorsButton.debug();
  
  rock=loadImage("rock.png");
  paper=loadImage("paper.png");
  scissors = loadImage("scissors.png");
  rockButton.addIcon(rock);
  paperButton.addIcon(paper);
  scissorsButton.addIcon(scissors);
}

void draw(){
  
  
  if(winStat == winStatus.play){
    background(r,g,b);
    rockButton.placeIcon();
    paperButton.placeIcon();
    scissorsButton.placeIcon();
  }
  if(winStat == winStatus.tie){
    textSize(50);
    text("TIE", 200, 50);
    PlayAgain.debug();
  }
  if(winStat == winStatus.win){
    textSize(50);
    text("WIN", 200, 50);
    PlayAgain.debug();
  }
  if(winStat == winStatus.lost){
    textSize(50);
    text("LOST", 200, 50);
    PlayAgain.debug();
  }
  
  textSize(25);
  text("Wins" + ": "+ win, 50, 450);
  text("Ties" + ": "+ tie, 200, 450);
  text("Lost" + ": "+ lost, 350, 450);

}

void mousePressed(){
  if(winStat == winStatus.play){
    rockButton.run(1);
    paperButton.run(2);
    scissorsButton.run(3);
    if(choice == 1){
      background(r, g, b);
      image(rock, pChoiceX, pChoiceY, 200, 200);
      play();
  
    }
    else if(choice == 2){
      background(r, g, b);
      image(paper, pChoiceX, pChoiceY, 200, 200);
      play();
    }
    else if(choice == 3){
      background(r, g, b);
      image(scissors, pChoiceX, pChoiceY, 200, 200);
      play();
    }
  }
  else{
    PlayAgain.run(4);
    if(choice == 4){
      winStat=winStatus.play;
    }
  }
}
