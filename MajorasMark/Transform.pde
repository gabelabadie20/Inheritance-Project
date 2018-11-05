public class Transform extends BaseObject {
  
  public PVector position;
  public PVector scale;
  public PVector velocity;
  public color objColor;
  
  public Transform() {
   position = new PVector(0, 0);
   scale = new PVector(1, 1);
   velocity = new PVector(0, 0);
   objColor = color(0, 0, 0);
   Start();
  }
  
  public Transform(PVector _position, PVector _scale, PVector _velocity, color _objColor) {
   position = _position;
   scale = _scale;
   velocity = _velocity;
   objColor = _objColor;
   Start();
  }
  
  public void Start() {}
  
  public void Update() {    
    display();
  }
  
  public void display() {
   rect(position.x, position.y, scale.x, scale.y); 
  }
  
  public void Translate(PVector _translation) {
    position.add(_translation);
  }
}
