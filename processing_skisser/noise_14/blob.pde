class blob {

  float x, y;
  int maxX, maxY, minX, minY;
  float rot, rotNoiseX, rotNoiseY;
  float noise1, noise2, noise3;
  float r_noise, g_noise, b_noise;
  float r_noise_step, g_noise_step, b_noise_step;
  float r_c, g_c, b_c;
  float eSize;

  blob(float n1, float n2, float n3) {
    minX = -50;
    maxX = width+50;
    minY = -50;
    maxY = height+50;
    x = random(width);
    y = random(height);

    eSize = 0;
    //  rot = random(TWO_PI);
    noise1 = n1;
    noise2 = n2;
    noise3 = n3;

    r_noise = 0;
    g_noise = 2;
    b_noise = 1;

    r_noise_step = 0.01;
    g_noise_step = 0.02;
    b_noise_step = 0.015;
  }

  void update() {
    //translate(150, 150);
    //  background(120,90,90);

    r_noise += r_noise_step;
    g_noise += g_noise_step;
    b_noise += b_noise_step;

    r_c = 8*noise(r_noise)*64;
    g_c = 8*noise(g_noise)*64;
    b_c = 8*noise(b_noise)*64;

    rotNoiseX = noise(noise1);
    rotNoiseY = noise(noise2);
    eSize = noise(noise3)*100;
    // println("rotNoise = "+rotNoise);
    stroke(r_c, g_c, b_c);
    fill(r_c, g_c, b_c, 110);

    x += (noise(noise1)-.5)*25;
    y += (noise(noise2)-.5)*25;

    y = (y<minY) ? maxY : (y>maxY) ? minY : y;
    // x = (x + width) % width;
    x = (x<minX) ? maxX : (x>maxX) ? minX : x;

    ellipse(x, y, eSize, eSize);

    noise1 += .1;
    noise2 += .13;
    noise3 += 1.0/20.0;
  }
}
