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
    //0, 1, 2, 3のいずれか
    int choice = int(random(4));
    
    switch(choice) {
      case 0:
        x ++;  //前
        break;
      case 1:
        x --;  //後ろ
        break;
      case 2:
        y ++;  //右
        break;
      case 3:
        y --;  //左
        break;
    } 
  }
}
