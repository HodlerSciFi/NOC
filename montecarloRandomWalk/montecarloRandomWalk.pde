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
    //Walkerがある方向に進む確率はそれぞれ等しい
    float stepsize = montecarlo();
    float stepx = random(-stepsize, stepsize);
    float stepy = random(-stepsize, stepsize);
    x += stepx;
    y += stepy;
  }
  
  //選ばれる値と値が選ばれる確率を指数関数的にマップする
  float montecarlo() {
    while (true) { //使用するランダム値が見つかるまでずっとこれを実行
      float r1 = random(0, 10); //ランダム値を選択 (選ばれる値)
      float probability = sq(r1); //値が選ばれる確率をその値の二乗にする
      float r2 = random(0, 10); //2つ目のランダム値を選択 (r1の判定値)
      
      if(r2 < probability) { //使用するかどうかを判定。使用すると判定されれば終了。
        return r1;
      }
    }
  }
}
