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
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);  //等加速度
    topspeed = 10;
  }
  //Moverを動かす
  void update() {
    velocity.add(acceleration);  //速度は加速度によって変化し、topspeedによって制限される
    velocity.limit(topspeed);
    location.add(velocity);
  }
  //Moverを表示
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
  //キャンパスの端に来た時の動作
  //反対側に回りこませる
  void checkEdges() {
    if(location.x > width) {
      location.x = 0;
    }else if (location.x < 0) {
      location.x = width;
    }
    
    if(location.y > height) {
      location.y = 0;
    }else if (location.y < 0) {
      location.y = height;
    }
    
  }
}
