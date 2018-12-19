float count;
void setup() {
  size(300, 300);
  background(0);
  count = 0;
}

void draw() {
  loadPixels();
  float xoff = 0;
  for (int x = 0; x < width; x ++) {
    float yoff = 0;
    for (int y = 0; y < height; y ++) {
      float b = map(noise(xoff, yoff, count), 0, 1, 0, 255);
      pixels[x + y * height] = color(10, 20, b);
      yoff += 0.03;
    }
  }
  xoff += 0.01;
  count += 0.01;
  updatePixels();
}
