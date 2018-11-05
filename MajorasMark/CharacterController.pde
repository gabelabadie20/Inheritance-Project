public class CharacterController extends Transform {
  public float speed = 10;
  public PVector movement = new PVector(0, 0);
  
   public void Start() {
     
   }
   
   public void Update() {
     Translate(new PVector(movement.x, movement.y).normalize().mult(speed).mult(timeScale));
     super.Update();
   }
   
   public CharacterController() {
     super();
     position = new PVector(width / 2, height / 2);
     scale = new PVector(50, 50);
   }
}
