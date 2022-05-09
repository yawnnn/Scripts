// Run with Processing
// https://processing.org/
// Create pretty screensavers/desktop wallpapers

int r;
int n = 256;
int m = 2;
int MAX = 256;

float inc = TWO_PI / n;

float x, y;
float nx, ny;

// Ones that looked better
int[] to_save = {2, 3, 4, 5, 6, 7, 8, 9,
                11, 15, 16, 17, 
                21, 22, 24, 25, 26, 28, 29, 
                31, 32, 33, 36, 37, 
                41, 42, 43, 44, 49, 
                50, 51, 52, 54, 55, 57, 58, 
                62, 63, 64, 65, 67, 
                70, 71, 73, 76, 
                83, 84, 85, 86, 87, 88, 89, 
                90, 94, 95, 97}; 

boolean [] bto_save = new boolean[MAX];

void setup() {
  size(1920, 1080);
  noFill();
  
  r = min(width, height)/2;
  
  if (MAX == 100) {
    for (int i = 0; i < to_save.length; i++) {
      bto_save[to_save[i] - 2] = true;
    }
  }
}

void draw() {
  background(0);
  stroke(random(10, 255), random(1, 255), random(10, 255));
  strokeWeight(2);
  translate(width/2, height/2);
  
  circle(0, 0, r * 2);
  
  strokeWeight(1);
  
  for (int i = 0; i < n; i += 1) {
    x = r * cos(inc * i);
    y = r * sin(inc * i);
    
    nx = r * cos(inc * ((i * m) % n));
    ny = r * sin(inc * ((i * m) % n));
    
    line(x, y, nx, ny);
  }
  
  frameRate(2);
  if (bto_save[m - 2]) {
    // Uncomment to save
    //save("cardioid_p8_" + m + ".png");
  }

  m++;
  if (m > MAX) {
    noLoop();
  }
}
