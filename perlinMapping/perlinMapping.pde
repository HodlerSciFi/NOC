//パーリンノイズのマッピング
//パーリンノイズnoise()の範囲は0-1なので、map()で任意の範囲にマッピングする
float tx = 3;
float ty = 20;
float r = 100;
float g = 200;
float b = 300;

void setup() {
  size(300, 300);
  background(255);
}

void draw() {
  float x = mapNoise(tx, 0, width);
  float y = mapNoise(ty, 0, height);
  noStroke();
  fill(mapNoise(r, 0, 255),mapNoise(g, 0, 255), mapNoise(b, 0, 255),  20);
  ellipse(x, y, 16, 16);
  println(x, y);
  tx += 0.02;
  ty += 0.02;
  r += 0.01;
  g += 0.01;
  b += 0.01;
}

//パーリンノイズのマッピング関数
float mapNoise(float t, float mapMin, float mapMax) {
  float n = noise(t);
  //マッピングしたい値、現在の値の範囲(最小値、最大値)、使いたい範囲
  float x = map(n, 0, 1, mapMin, mapMax);
  return x;
}

void mouseClicked(){
  save("draw.png");
}
