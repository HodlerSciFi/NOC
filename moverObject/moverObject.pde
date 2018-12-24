//移動オブジェクト
//運動のすべてのロジックをクラスの中にカプセル化していく
//マウスに向かう加速度を導入
//マウスに向かってMoverの群が加速する

Mover[] movers = new Mover[20]; //オブジェクトの配列

void setup() {
  size(600, 300);
  for(int i = 0; i < movers.length; i ++) {
    movers[i] = new Mover(); //配列内の各オブジェクトを初期化
  }
}

void draw() {
  for(int i = 0; i < movers.length; i ++) { //配列内のすべてのオブジェクトに対して関数を呼び出し
  movers[i].update();
  movers[i].checkEdges();
  movers[i].display();
  }
}

class Mover {
  PVector location;  //位置
  PVector velocity;  //速度: 位置の変化の割合
  PVector acceleration; //加速度: 速度の変化の割合
  float topspeed; //速度の大きさを制限
  

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);  
    topspeed = 4;
  }
  
  //Moverを動かす
  void update() {
    //加速度の計算アルゴリズム
    PVector mouse = new PVector(mouseX, mouseY);  //マウスの位置ベクトル
    PVector dir = PVector.sub(mouse, location); ////マウスを指すベクトル(大きさと方向)を求める
    float dirMagnitude = dir.mag();  //正規化する前に大きさだけ取得
    dir.normalize(); //正規化(大きさは1にして後で自由にスケーリングする)
    dir.div(dirMagnitude); //マウスに近づくほど加速度が大きくなるようスケーリング
    
    acceleration = dir; //スケーリングしたマウス方向ベクトルを加速度として設定
    velocity.add(acceleration);  //速度は加速度によって変化し、topspeedによって制限される
    velocity.limit(topspeed);
    location.add(velocity);
  }
  //Moverを表示
  void display() {
    stroke(0);
    fill(255);
    ellipse(location.x, location.y,6, 6);
  }
  //キャンパスの端に来た時の動作
  //反対側に回りこませる
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
  //パーリンノイズのマッピング関数
  float mapNoise(float t, float mapMin, float mapMax) {
    float n = noise(t);
    //マッピングしたい値、現在の値の範囲(最小値、最大値)、使いたい範囲
    float x = map(n, 0, 1, mapMin, mapMax);
    return x;
  }
}
