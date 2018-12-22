//ウォーカーオブジェクトにPVector導入
//ウォーカー自身と、次の位置への方向とステップサイズ（速度）をベクトルで表現
Walker w; //ウォーカーオブジェクト
PVector velocity; //ウォーカーの次の位置を決めるための速度（次の位置への方向とステップサイズ）
float xoff, yoff;  //パーリンノイズのためのオフセット値、drawごとに変化する

void setup() {
  size(640, 360);
  background(255);
  w = new Walker(width/2, height/2);
  xoff = 0;
  yoff = 1000;
  velocity = new PVector(mapNoise(xoff, -1, 1), mapNoise(yoff, -1, 1));
}

void draw() {
  w.step(velocity);
  w.display();
  
  xoff += 0.01;
  yoff += 0.01;
  velocity.x = mapNoise(xoff, -1, 1);
  velocity.y = mapNoise(yoff, -1, 1);
}

class Walker {
  PVector v;

  Walker(float _x, float _y) {
    v = new PVector(_x, _y);
  }
  //オブジェクト自身の表示
  void display() {
    stroke(0);
    point(v.x, v.y);
  }
  //オブジェクトを動かす
  void step(PVector velocity) {
    //次の位置=現在位置+速度ベクトル
    v.add(velocity);
  }
}

//パーリンノイズのマッピング関数
float mapNoise(float t, float mapMin, float mapMax) {
  float n = noise(t);
  //マッピングしたい値、現在の値の範囲(最小値、最大値)、使いたい範囲
  float x = map(n, 0, 1, mapMin, mapMax);
  return x;
}
