//ランダム値(random関数の値)の分布を確認する

int[] randomCounts;

void setup() {
  size(640, 240);
  randomCounts = new int[20];
}

void draw() {
  background(255);
  
  //ランダム値を選び、カウンターをインクリメント
  int index = int(random(randomCounts.length));
  randomCounts[index] ++;
  
  //グラフ表示
  stroke(0);
  fill(175);
  int w = width / randomCounts.length;
  for(int x = 0; x < randomCounts.length; x ++) {
    rect(x*w, height - randomCounts[x], w-1, randomCounts[x]);
  }
}
