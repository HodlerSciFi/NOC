//移動オブジェクト
//運動のすべてのロジックをクラスの中にカプセル化していく

Mover mover;

void setup() {
  size(300, 400);
  mover = new Mover();
}

void draw() {
  mover.update();
  mover.checkEdges();
  mover.display();
}

class Mover {
  PVector location;  //位置
  PVector velocity;  //速度
  
  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2));
  }
  //Moverを動かす
  void update() {
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
