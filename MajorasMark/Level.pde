public class Level {
  public Transform[] objects;
  public Enemy[] enemies;
  public NPC[] npcs;
  
  public Level(Transform[] _objects, Enemy[] _enemies, NPC[] _npcs) {
    objects = _objects;
    enemies = _enemies;
    npcs = _npcs;
  }
  
  public void Load() {
    for(int i = 0; i < objects.length; i++) {
      objects[i].display();
    }
  }
}
