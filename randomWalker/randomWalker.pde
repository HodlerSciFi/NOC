//グローバル変数
Walker w;

void setup() {
  size(640, 360);
  w = new Walker();
  background(255);
}

void draw() {
  w.step();
  w.display();
}
class Walker {
  int x;
  int y;
  
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  //オブジェクト自身の表示
  void display() {
    stroke(0);
    point(x, y);
  }
  
  //オブジェクトを動かす
  void step() {
    //Walkerがある方向に進む確率->右、下に進む傾向
    int stepx = int (random(4)) - 1; //-1, 0, 1, 2いずれかを生成
    int stepy = int (random(-1, 3)) - 1; //-2, -1, 0, 1いずれか
    x += stepx;
    y += stepy;
  }
}
