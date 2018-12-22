//ベクトルなしでは始まらない。ただしユークリッドベクトル。
PVector location; //位置
PVector velocity; //速度

void setup() {
  size(300, 300);
  location = new PVector(100, 100);
  velocity = new PVector(1, 3.3);
}

void draw() {
  background(255);
  
  //新しい位置 = 現在位置に速度を適用
  location.add(velocity);
  //キャンパスの端にきたら跳ね返る
  if((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }
  //位置の描写
  stroke(0);
  fill(175);
  ellipse(location.x, location.y, 16, 16);
  
}

class Pvector {
  float x, y;
  Pvector(float _x, float _y) {
    x   = _x;
    y = _y;
  }
  
  //ベクトル加算(別のベクトルを加算する)
  void add(PVector v){
      x = x + v.x;
      y = y + v.y;
  }
}
