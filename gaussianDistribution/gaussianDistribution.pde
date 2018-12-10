//正規分布

import java.util.Random;
//乱数ジェネレーターのようなものを作成
Random generator;

void setup() {
  size(640, 360);
  background(0);
  generator = new Random();
}

//draw()が実行されるたびに正規分布を使ってランダム値を生成
void draw() {
  //平均0、標準偏差1
  float num = (float) generator.nextGaussian(); //nextGaussianはdouble値を返すのでfloatに変換
  //平均320, 標準偏差60に変換
  float sd = 60;
  float mean = 320;
  float x = sd * num + mean; //標準偏差を乗算し、平均を加算
  
  noStroke();
  fill(255, 10);
  ellipse(x, 180, 5, 5);
  
}
