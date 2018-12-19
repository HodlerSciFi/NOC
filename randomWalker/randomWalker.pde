//グローバル変数
Walker w; //ウォーカーオブジェクト
float xoff, yoff;  //パーリンノイズのためのオフセット値、drawごとに変化する

void setup() {
  size(640, 360);
  w = new Walker();
  xoff = 0;
  yoff = 1000;
  background(255);
}

void draw() {
  w.step(xoff, yoff);
  w.display();
  xoff += 0.01;
  yoff += 0.01;
}
class Walker {
  float x;
  float y;
  
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
  void step(float xoff, float yoff) {
    //ステップサイズをパーリンノイズで決める
    //移動距離
    float addX = mapNoise(xoff, -2, 2);
    float addY = mapNoise(yoff, -2, 2);    
    x += addX;
    y += addY;
  }
  
  //パーリンノイズのマッピング関数
float mapNoise(float t, float mapMin, float mapMax) {
  float n = noise(t);
  //マッピングしたい値、現在の値の範囲(最小値、最大値)、使いたい範囲
  float x = map(n, 0, 1, mapMin, mapMax);
  return x;
}
}
