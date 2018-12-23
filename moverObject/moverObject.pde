//移動オブジェクト
//運動のすべてのロジックをクラスの中にカプセル化していく

Mover mover;

void setup() {
  size(600, 300);
  mover = new Mover();
}

void draw() {
  mover.update();
  mover.checkEdges();
  mover.display();
}

class Mover {
  PVector location;  //位置
  PVector velocity;  //速度: 位置の変化の割合
  PVector acceleration; //加速度: 速度の変化の割合
  float topspeed; //速度の大きさを制限
  float toff; //加速度の大きさを決めるオフセット値(パーリンノイズ用)

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);  
    topspeed = 10;
    toff = 0.001;
  }
  //Moverを動かす
  void update() {
    //完全にランダムな加速度
    acceleration = PVector.random2D();  //ランダムな方向を指す長さ1のPVectorを返す
    //正規化（長さ1）されてる加速度をスケーリングする
    //acceleration.mult(3); //定数値にスケーリング
    //acceleration.mult(random(5)); //ランダム値にスケーリング
    acceleration.mult(mapNoise(toff, 0, 3));

    velocity.add(acceleration);  //速度は加速度によって変化し、topspeedによって制限される
    velocity.limit(topspeed);
    location.add(velocity);
    toff += 0.001;
  }
  //Moverを表示
  void display() {
    stroke(0);
    fill(255);
    ellipse(location.x, location.y, 3, 3);
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
