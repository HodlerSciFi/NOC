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
    //Walkerがある方向に進む確率はそれぞれ等しい
    int stepx = int(random(3)) - 1; //-1, 0, 1いずれかを生成
    int stepy = int(random(3)) - 1;
    x += stepx;
    y += stepy;
  }
}
