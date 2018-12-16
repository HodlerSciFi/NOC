//正規分布->ドットを使ってペイントスプラッター

import java.util.Random;
//乱数ジェネレーター
Random generator;

void setup() {
  size(640, 360);
  background(0);
  generator = new Random();
}

//draw()が実行されるたびに正規分布を使ってx, y座標をランダム値で生成
void draw() { 
  //x座標の平均パレットの中央, 標準偏差60
  float x = gaussianValue(60, width/2); 
  //y座標の平均はパレットの中央, 標準偏差40
  float y = gaussianValue(40, height/2);
  //ドットのサイズも正規分布に従って変化させる
  float dotSize = gaussianValue(10, 5);
  
  noStroke();
  fill(255, 10);
  ellipse(x, y, dotSize, dotSize);
}

//欲しい標準偏差と平均値を引数に正規分布の値を生成
float gaussianValue(float sd, float mean) {
  //平均0, 標準偏差1の正規分布の値を生成 
  float num = (float)generator.nextGaussian();
  //標準偏差を乗算し、平均を加算して任意の正規分布の値を得る
  float val = sd * num + mean;
  
  return val;
}
