class Button {
  float x, y, w, h;
  color col;
  String text;
  boolean isHovered;

  public Button(float x, float y, float w, float h, color col, String text) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.col = col;
    this.text = text;
  }

  boolean isPressed() {
    return mousePressed &&
      mouseX > x && mouseX < x + w &&
      mouseY > y && mouseY < y + h;
  }

  boolean isHovered() {
    return mouseX > x && mouseX < x + w &&
      mouseY > y && mouseY < y + h;
  }

  void bDraw() {
    if (isHovered()) {
      fill(lerpColor(col, color(255), 0.2));
    } else {
      fill(col);
    }
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, x + w/2, y + h/2);
    noFill();
  }
}

class  ProgressBar {
  float x, y, w, h, set, max;
  color colMax, colEmpty;

  ProgressBar(float x, float y, float w, float h, float set, float max, color colEmpty, color colMax) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.set = set;
    this.max = max;
    this.colMax = colMax;
    this.colEmpty = colEmpty;
  }

  void editBar(float amount)
  {
    set = constrain(set + amount, 0, max);
  }

  void bDraw() {
    fill(colEmpty);
    rect(x, y, w, h);

    float percent = set / max;
    fill(colMax);
    rect(x, y, w * percent, h);
    noFill();
    
    stroke(0);
    rect(x, y, w, h);
    noStroke();
  }
}

class Route {
  public boolean isActive;
  float x, y, w, h;
  color col;
  HashMap<String, Button> buttons = new HashMap<>();
  HashMap<String, ProgressBar> progressbars = new HashMap<>();

  Route(float x, float y, float w, float h, color col, boolean isActive) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.col = col;
    this.isActive = isActive;
  }

  //Buttons

  void addButton(String name, Button b) {
    buttons.put(name, b);
  }

  Button getB(String name) {
    return buttons.get(name);
  }
  
  //ProgressBars

  ProgressBar getP(String name) {
    return progressbars.get(name);
  }

  void addBar(String name, ProgressBar p) {
    progressbars.put(name, p);
  }

  void draw() {
    if (isActive) {
      fill(col);
      rect(x, y, w, h);
      for (Button b : buttons.values()) {
        b.bDraw();
      }
      for (ProgressBar p : progressbars.values()) {
        p.bDraw();
      }
    } else {
      background(255);
    }
  }
}
