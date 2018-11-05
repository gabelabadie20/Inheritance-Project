public abstract class Item {
  public String name;
  public int cost;
  
  public Item(String _name, int _cost) {
    name = _name;
    cost = _cost;
  }
  
  public abstract void Use();
}
