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
    //マウスの方向に移動する傾向が50%のウォーカー
    //現在のウォーカーの座標とマウスの座標の差(方向)
    int dx = x - mouseX;
    int dy = y - mouseY;
    //移動距離
    int addX = 0;
    int addY = 0;
    
    if(dx <= 0 && dy >= 0) { //マウスが右上
      addX = 1;
      addY  = -1;
    }else if(dx <= 0 && dy < 0) { //マウスが右下
      addX = 1;
      addY = 1;
    }else if(dx > 0 && dy >= 0){ //マウスが左上
      addX = -1;
      addY = -1;
    }else if (dx > 0 && dy < 0) { //マウスが左下
      addX = -1;
      addY = 1;
    }
    float r = random(1);
    //50%の確率でマウスの方向へ、それ以外の場合はてきとう
    if (r < 0.5) {
      x += addX;
      y += addY;
    }else if(r < 0.6) {
      x --;
    }else if(r < 0.8) {
      y ++;
    }else {
      y --;
    }
  }
}
