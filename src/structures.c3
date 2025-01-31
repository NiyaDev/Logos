
module logos;
import raylib5::rl;
import raygui::rg;


struct DropdownBox {
  Rectangle rect;

  String str;
  int chosen;
  bool edit;
}

<* Draw Dropdown box while updating it's state *>
fn bool DropdownBox.draw(&self) {
  if (rg::guiDropdownBox(self.rect, self.str, &self.chosen, self.edit)) {
    self.edit = !self.edit;
    return true;
  } else {
    return false;
  }
}


struct ScrollPanel {
  Rectangle rect;
  Rectangle content;

  String text;
  Vector2 scroll;
  Rectangle view;
}
<* Draw Scroll panel *>
fn void ScrollPanel.draw(&self) {
  char* str;
  if (self.text != "") { str = (char*)self.text; }
  rg::guiScrollPanel(self.rect, str, self.content, &self.scroll, &self.view);
}


struct Label {
  Rectangle rect;
  String text;
}
<* Draw label *>
fn void Label.draw(&self) {
  rg::guiLabel(self.rect, self.text);
}


struct Toggle {
  Rectangle rect;

  String text;
  bool active;
}
<* Draw/Update toggle *>
fn bool Toggle.draw(&self) {
  return rg::guiToggle(self.rect, self.text, &self.active);
}

