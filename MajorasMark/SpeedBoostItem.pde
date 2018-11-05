public class SpeedBoostItem extends Item {
  public float bonusSpeed = 0;
  public SpeedBoostItem(String _name, int _cost, float _bonusSpeed) {
    super(_name, _cost);
    bonusSpeed = _bonusSpeed;
  }
  
  public void Use() {
    player.speed += bonusSpeed;
  }
}
