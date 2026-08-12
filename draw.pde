Route ui;
Route ui2;

void setup()
{
  ui = new Route(300, 300, 100, 100, 0, true);
  ui2 = new Route(300, 300, 100, 100, 0, true);
  ui.addButton("test", new Button(100, 100, 60, 60, color(100, 0, 0), "add" ));
  ui.addButton("test2", new Button(200, 100, 60, 60, color(100, 0, 0), "remove" ));

  ui2.addButton("Visible", new Button(300, 100, 60, 60, color(100, 0, 0), "UIACTIVE" ));


  ui.addBar("Test", new ProgressBar(200, 200, 200, 60, 20, 300, color(230), color(255, 0, 0)));

  size(600, 600);
  background(255);
}

void draw()
{
  ui.draw();
  ui2.draw();
  noFill();
}

void mousePressed()
{
  if (ui2.isActive && ui2.getB("Visible").isPressed()) {
    ui.isActive = !ui.isActive ;
  }
  if (ui.getB("test").isPressed()) {
    ui.getP("Test").editBar(50);
  }
  if (ui.getB("test2").isPressed()) {
    ui.getP("Test").editBar(-50);
  }
  if (ui.getP("Test").set == 0) {
    exit();
  }
}
