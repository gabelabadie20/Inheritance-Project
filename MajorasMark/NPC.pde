public class NPC extends CharacterController implements Interactable {
  
  public String name;
  public String startingDialogue;
  public ArrayList<String> dialogue;
  
  public void Debug() {
    if (!debug)
      return;
   
    fill(0, 0, 255, 122);
    ellipse(position.x + (scale.x / 2), position.y + (scale.y / 2), scale.x + (radius * 2), scale.y + (radius * 2));
  }
   
  public void Start() {
    objColor = color(0, 0, 255);
    super.Start();
  }
   
  public void Update() {
    fill(objColor);
    Debug();
    super.Update();
  }
   
  public void Interact() {
    isInteracting = true;
    dialogueFinished = false;
    println(dialogue);
  }
   
  public NPC() {
    super();
  }
   
  public NPC(String _name, PVector _initialPosition, String _dialogue) {
    super();
    name = _name;
    position = _initialPosition;
    startingDialogue = _dialogue;
  }
}
