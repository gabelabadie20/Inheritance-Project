public class Projectile extends CharacterController {
  public PVector target;
  
  public float angle = 0;
  
  public Projectile() {
    super();
    position = new PVector(player.position.x, player.position.y);
    scale = new PVector(25, 25);
    target = new PVector(mouseX, mouseY);
    speed = 20;
    angle = atan2(ConvertY(target.y - position.y), ConvertX(target.x - position.x));
  }
  
  public void Start() {
    super.Start();
  }
  
  public void Update() {
    super.Update();
    movement = new PVector(cos(angle), sin(angle));
  }
}
