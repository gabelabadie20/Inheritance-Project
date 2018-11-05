public class TimeBoostItem extends Item {
  public int bonusTime = 0;
  public TimeBoostItem(String _name, int _cost, int _bonusTime) {
    super(_name, _cost);
    bonusTime = _bonusTime;
  }
  
  public void Use() {
    remainingTime += bonusTime;
  }
}
