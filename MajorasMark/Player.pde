public class Player extends CharacterController {
  
  float angle;
  
  public float maxHealth;
  public float health;
  public float healthRegen;
  public float maxMana;
  public float mana;
  public float range;
  public float attackDamage = 61;
  public float attackSpeed = 0.638;
  public float armor = 28;
  public float magicResist = 30;
  //public float moveSpeed = 335;
  
  public void Start() {
    super.Start();
  }
   
  public void Update() {
    fill(objColor);
    super.Update();
    movement = new PVector(cos(angle), sin(angle));
    if (position.dist(new PVector(targetPosition.x, targetPosition.y)) < 10) {
      movement = new PVector(0, 0);
    }
     
    //fill (0, 255, 0);
    //rect(targetPosition.x, targetPosition.y, 25, 25);
  }
   
  public Player() {
    super();
  }
}
