public class DialogueThread extends Thread {
  
  String dialogue = "";
  
  public DialogueThread(String _dialogue) {
    dialogue = _dialogue;
  }
  
  void run() {
    String[] dialogueArray = dialogue.split("");
    ArrayList<String> finalDialogue = new ArrayList<String>();
    while(finalDialogue.size() != dialogueArray.length) {
      finalDialogue.add(dialogueArray[finalDialogue.size()]);
      CharSequence[] cs = finalDialogue.toArray(new CharSequence[finalDialogue.size()]);
      println(String.join("", cs));
      currentDialogue = String.join("", cs);
      try {
        Thread.sleep(50);
      }
      catch(InterruptedException e) {
        System.out.println("got interrupted!");
      }
    }
    println("Finished");
    dialogueFinished = true;
  }
}
