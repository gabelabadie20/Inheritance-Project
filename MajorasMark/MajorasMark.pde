import java.util.Arrays;

public Level currentLevel = new Level(
new Transform[] {
  
},
new Enemy[] {
  new Enemy(new PVector(500, 500))
},
new NPC[] {
  new Shop("David", new PVector(width/2, height/2), "Welcome to my shop!", new Item[] {
    new SpeedBoostItem("Sugar", 100, 1),
    new SpeedBoostItem("Deluxe Sugar", 200, 2.5),
    new TimeBoostItem("Stopwatch", 100, 5000),
    new TimeBoostItem("Deluxe Stopwatch", 200, 10000)
  })
});

public ArrayList<Projectile> projectiles = new ArrayList<Projectile>();

public float timeScale;
public float scaledTime = 0;
public float lastTime = 0;
public float remainingTime = 1000 * 60;
public Player player = new Player();
public NPC currentNPC;

public int gold = 0;

public PImage dialogueBox;

public String activeUI = "none";
public String currentDialogue = "";

public boolean isInteracting = false;
public boolean dialogueFinished = true;

public float nextQ;
public float qCooldown = 9;
public float nextW;
public float wCooldown = 14;
public boolean wIsActive = false;
public float nextE;
public float eCooldown = 22;
public float nextR;
public float rCooldown = 110;

PMatrix2D cameraMatrix = new PMatrix2D();

public PVector targetPosition = new PVector(player.position.x, player.position.y);

void setup() {
  size(1920, 1080, P2D);
  timeScale = 1;
  /*player.Start();
  
  for (int i = 0; i < currentLevel.enemies.length; i++) {
    currentLevel.enemies[i].Start();
  }
  for (int i = 0; i < currentLevel.npcs.length; i++) {
    currentLevel.npcs[i].Start();
  }*/
}

void draw() {
  background(color(255, 255, 255));
  noStroke();
  camera(cameraMatrix, player.position.x + (player.scale.x / 2), player.position.y + (player.scale.y / 2), 0, 1, 1);
  //timeScale = constrain(new PVector(player.movement.x, player.movement.y).normalize().mag() + 0.1, 0.0, 1.0);
  timeScale = 1;
  player.Update();
  currentLevel.Load();
  UpdateEnemies();
  UpdateNPCs();
  UpdateTime();
  UpdateAbilities();
  UpdateUI();
  if (activeUI != "none")
    player.movement = new PVector(0, 0);
} 

PMatrix2D camera(PMatrix2D _cameraMatrix, float _tx, float _ty, float _angle, float _zoomW, float _zoomH) {
  _cameraMatrix.set(1, 0, width / 2.0, 0, 1, height / 2.0);
  _cameraMatrix.rotate(-_angle);
  _cameraMatrix.scale(_zoomW, _zoomH);
  _cameraMatrix.translate(-_tx, -_ty);
  
  setMatrix(_cameraMatrix);
  return _cameraMatrix;
}

float ConvertX(float _position) {
  return _position + player.position.x + (player.scale.x / 2) - (width / 2.0);
}

float ConvertY(float _position) {
  return _position + player.position.y + (player.scale.y / 2) - (height / 2.0);
}

void UpdateEnemies() {
  for (int i = 0; i < currentLevel.enemies.length; i++) {
    currentLevel.enemies[i].Update();
  }
}

void UpdateNPCs() {
  for (int i = 0; i < currentLevel.npcs.length; i++) {
    currentLevel.npcs[i].Update();
  }
}

void UpdateTime() {
  scaledTime += (millis() - lastTime) * timeScale;
  remainingTime -= (millis() - lastTime) * timeScale;
  lastTime = millis();
  fill(0);
  textSize(50);
  //text(remainingTime / 1000, ConvertX(0), ConvertY(50));
}

void UpdateAbilities() {
  for(int i = 0; i < projectiles.size(); i++) {
    projectiles.get(i).Update();
  }
}

void UpdateUI() {
  switch(activeUI) {
    case "dialogue":
      ShowDialogue();
      break;
    
    case "shop":
      ShowDialogue();
      ShowShop();
      break;
    
    default:
      fill(100);
      rect(ConvertX((width / 2) - 12.5 - 215), ConvertY(height - 200), 100, 100);
      rect(ConvertX((width / 2) - 12.5 - 105), ConvertY(height - 200), 100, 100); 
      rect(ConvertX((width / 2) - 12.5 + 5), ConvertY(height - 200), 100, 100);
      rect(ConvertX((width / 2) - 12.5 + 115), ConvertY(height - 200), 100, 100);
      
      fill(0);
      textSize(75);
      text("Q", ConvertX((width / 2) - 12.5 - 215 + 20), ConvertY(height - 200 + 75));
      text("W", ConvertX((width / 2) - 12.5 - 105 + 20), ConvertY(height - 200 + 75));
      text("E", ConvertX((width / 2) - 12.5 + 5 + 30), ConvertY(height - 200 + 75));
      text("R", ConvertX((width / 2) - 12.5 + 115 + 25), ConvertY(height - 200 + 75));
      
      fill(0, 0, 255, 122);   
      rect(ConvertX((width / 2) - 12.5 - 215), ConvertY(height - 200), 100, (100 * constrain((float)((nextQ - scaledTime) / (qCooldown * 1000)), 0.0, 1.0)));
      rect(ConvertX((width / 2) - 12.5 - 105), ConvertY(height - 200), 100, (100 * constrain((float)((nextW - scaledTime) / (wCooldown * 1000)), 0.0, 1.0))); 
      rect(ConvertX((width / 2) - 12.5 + 5), ConvertY(height - 200), 100, (100 * constrain((float)((nextE - scaledTime) / (eCooldown * 1000)), 0.0, 1.0)));
      rect(ConvertX((width / 2) - 12.5 + 115), ConvertY(height - 200), 100, (100 * constrain((float)((nextR - scaledTime) / (rCooldown * 1000)), 0.0, 1.0)));
      
      fill(2, 171, 16);
      rect(ConvertX((width / 2)/* - 12.5 - 215*/), ConvertY(height - 100), (500 * constrain((float)((nextQ - scaledTime) / (qCooldown * 1000)), 0.0, 1.0)), 100);
      break;
      
  }
  textAlign(RIGHT, BOTTOM);
  fill(0);
  textSize(50);
  text("$" + gold, ConvertX(width), ConvertY(height));
  textAlign(LEFT, BASELINE);
}

void ShowDialogue() {
  fill(0);
  rect(ConvertX(0), ConvertY(height) - (height / 5.0), width, height/5.0);
  textSize(50);
  fill(255);
  text (currentDialogue, ConvertX(10), ConvertY(height - (height / 5.0) + (50)));
}

void ShowShop() {
  fill(0);
  rect(ConvertX(0), ConvertY(0), width, height * (4.0/5.0));fill(255);
  textSize(100);
  textAlign(CENTER);
  text(currentNPC.name + "'s Shop", ConvertX((width / 2.0)), ConvertY(150)); 
  textAlign(LEFT);
  for(int i = 0; i < ((Shop)currentNPC).items.length; i++) {
    Item currentItem = ((Shop)currentNPC).items[i];
    fill(255);
    textSize(50);
    text(currentItem.name + " - $" + currentItem.cost, ConvertX(75), ConvertY(300 + (150 * i))); 
  }
}

void keyPressed() {
  /*if (keyCode == UP) {
    player.movement.add(new PVector(0, -1));
  }
  if (keyCode == DOWN) {
    player.movement.add(new PVector(0, 1));
  }
  if (keyCode == LEFT) {
    player.movement.add(new PVector(-1, 0));
  }
  if (keyCode == RIGHT) {
    player.movement.add(new PVector(1, 0));
  }*/
  
  if (key == 'q') {
    if (scaledTime > nextQ) {
      Projectile newProjectile = new Projectile();
      projectiles.add(newProjectile);
      nextQ = scaledTime + (qCooldown * 1000);
    }
  }
  
  if (key == 'w') {
    if (scaledTime > nextW) {
      Bomb newProjectile = new Bomb();
      projectiles.add(newProjectile);
      nextW = scaledTime + (wCooldown * 1000);
    }
  }
  
  if (key == 'e') {
    if (scaledTime > nextE) {
      float angle = atan2(ConvertY(mouseY - player.position.y), ConvertX(mouseX - player.position.x));
      PVector offset = new PVector(cos(angle), sin(angle)).mult(400);
      player.position.add(offset);
      targetPosition.add(offset);
      nextE = scaledTime + (eCooldown * 1000);
    }
  }
  
  if (key == 'r') {
    if (scaledTime > nextR) {
      nextR = scaledTime + (rCooldown * 1000);
    }
  }
  
  if (key == 'f') {
    if (!isInteracting) {
      for (int i = 0; i < currentLevel.npcs.length; i++) {
        if(player.position.dist(currentLevel.npcs[i].position) < 140) {
          currentNPC = currentLevel.npcs[i];
          currentNPC.Interact();
        }
      }
    }
    else if (dialogueFinished) {
      activeUI = "shop";
      ShowShop();
    }
  }
  
  //Backspace
  if (key == 8) {
    activeUI = "none";
    currentDialogue = "";
    isInteracting = false;
  }
}

void keyReleased() {
  /*if (keyCode == UP) {
    player.movement.sub(new PVector(0, -1));
  }
  if (keyCode == DOWN) {
    player.movement.sub(new PVector(0, 1));
  }
  if (keyCode == LEFT) {
    player.movement.sub(new PVector(-1, 0));
  }
  if (keyCode == RIGHT) {
    player.movement.sub(new PVector(1, 0));
  }*/
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    player.angle = atan2(ConvertY(mouseY - player.position.y), ConvertX(mouseX - player.position.x));
    targetPosition = new PVector(ConvertX(mouseX), ConvertY(mouseY));
  }
  
  if (activeUI == "shop") {
    for(int i = 0; i < ((Shop)currentNPC).items.length; i++) {
      if (mouseY < 300 + (150 * i) && mouseY > 300 + (150 * i) - 50) {
        Item currentItem = ((Shop)currentNPC).items[i];
        currentItem.Use();
        ((Shop)currentNPC).Interact("Thank you for your purchase! That'll be $" + currentItem.cost);
        fill(122);
        textSize(50);
        text(currentItem.name + " - $" + currentItem.cost, ConvertX(75), ConvertY(300 + (150 * i))); 
        println(i);
      }
    }
  }
}
