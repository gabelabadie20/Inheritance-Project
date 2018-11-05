public class Bomb extends Projectile {
  
  public float delay;
  public float startTime;
  
  public Bomb() {
    super();
    delay = 1;
    startTime = scaledTime;
  }
  
  public void Start() {
    super.Start();
  }
  
  public void Update() {
    super.Update();
    if (scaledTime < startTime + (delay * 1000)) {
      movement = new PVector(cos(angle), sin(angle));
    }
    else if (scaledTime < startTime + (delay * 1000) + (0.25 * 1000)) {
      movement = new PVector(0, 0);
      scale = new PVector(250, 250);
    }
    else {
      scale = new PVector(0, 0);
    }
  }
}
