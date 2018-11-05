public class Enemy extends CharacterController {
  public float directionChangeInterval = 1;
  public float nextChangeTime = 0;
  public String state = "wander";
  
  public void Start() {
    objColor = color(255, 0, 0);
    speed = 5;
    super.Start();
  }
  
  public void Update() {
    
    if (position.dist(player.position) < 200) {
      state = "follow";
    }
    if (position.dist(player.position) > 300) {
      state = "wander";
    }
    
    int movementX = 0;
    int movementY = 0;
    switch (state) {
      case "wander":
        speed = 5;
        for (int i = 0; i < 2; i++) {
          int random = int(random(0, 3));
          if (random == 1) {
            if (i == 0)
              movementX = -1;
            else if (i == 1)
              movementY = -1;
          }
          else if (random == 2) {
            if (i == 0)
              movementX = 1;
            else if (i == 1)
              movementY = 1;
          }
          else {
            if (i == 0)
              movementX = 0;
            else if (i == 1)
              movementY = 0;
          }
        }
        if (scaledTime > nextChangeTime) {
          movement = new PVector(movementX, movementY);
          nextChangeTime = scaledTime + (directionChangeInterval * 1000);
          println(movement);
        }
        break;
        
      case "follow":
        speed = 10;
        movement = new PVector((int)player.position.x - (int)position.x, (int)player.position.y - (int)position.y);
        break;
    }
    
    fill(objColor);
    super.Update();
  }
  
  public Enemy() {
    super();
  }
  
  public Enemy(PVector _initialPosition) {
    super();
    position = _initialPosition;
  }
}
