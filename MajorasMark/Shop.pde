public class Shop extends NPC {
  
  public Item[] items;
  
  public void Debug() {
    if (!debug)
      return;
   
    fill(0, 0, 255, 122);
    ellipse(position.x + (scale.x / 2), position.y + (scale.y / 2), scale.x + (radius * 2), scale.y + (radius * 2));
  }
   
  public void Start() {
    super.Start();
    objColor = color(255, 255, 0);
  }
   
  public void Update() {
    super.Update();
  }
   
  public void Interact() {
    super.Interact();
    activeUI = "dialogue";
    DialogueThread dThread = new DialogueThread(startingDialogue);
    dThread.start();
  }
  
  public void Interact(String _dialogue) {
    super.Interact();
    DialogueThread dThread = new DialogueThread(_dialogue);
    dThread.start();
  }
  
  public Shop() {
    super();
  }
   
  public Shop(String _name, PVector _initialPosition, String _dialogue, Item[] _items) {
    super(_name, _initialPosition, _dialogue);
    items = _items;
  }
}
