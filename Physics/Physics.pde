class Vector2 {
  double x;
  double y;
  
  Vector2(double _x, double _y) {
    x = _x;
    y = _y;
  }
  
  void add(Vector2 _other) {
    x += _other.x;
    y += _other.y;
  }
  
  void divide(double _scalar) {
    x /= _scalar;
    y /= _scalar;
  }
  
  Vector2 normalized() {
   Vector2 result = new Vector2(x, y);
   result.divide(Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2)));
   return result;
  }
}

class Quaternion {
  
}

class Transform {
  Vector2 position = new Vector2(0, 0);
  Quaternion rotation = new Quaternion();
}

class GameObject {
  //Transform
  Transform transform;
  
  //Rigidbody
  Vector2 velocity;
  
  public GameObject() {
    transform = new Transform();
    velocity = new Vector2(0, 0);
  }
  
  public void Destroy() {
    
  }
}

void setup() {
  Object obj = new Object();
  
}

void draw() {
  
}
