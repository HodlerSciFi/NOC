//ステップサイズ(特定方向へのオブジェクトの移動距離)の生成に正規分布を使用するランダムウォーク
//

import java.util.Random;
//乱数ジェネレーター
Random generator;

Walker w;

void setup() {
  size(640, 360);
  background(255);
  generator = new Random();
  w = new Walker();
}

void draw() { 
  w.display();
  w.step();
}

//欲しい標準偏差と平均値を引数に正規分布の値を生成
float gaussianValue(float sd, float mean) {
  //平均0, 標準偏差1の正規分布の値を生成 
  float num = (float)generator.nextGaussian();
  //標準偏差を乗算し、平均を加算して任意の正規分布の値を得る
  float val = sd * num + mean;
  
  return val;
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
    //移動距離
    float addX = gaussianValue(1, 0);
    float addY = gaussianValue(1, 0);
      x += addX;
      y += addY;
  }
}
