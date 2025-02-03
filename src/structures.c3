
module logos;
import std::io;
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
<* Frees structure *>
fn void DropdownBox.free(&self) {
  self.str.free();
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
<* Frees structure *>
fn void ScrollPanel.free(&self) {
  self.text.free();
}


struct Label {
  Rectangle rect;
  String text;
}
<* Draw label *>
fn void Label.draw(&self, Vector2 offset = {0,0}) {
  Rectangle rect_off = self.rect;
  rect_off.x += offset.x;
  rect_off.y += offset.y;
  rg::guiLabel(rect_off, self.text);
}
<* Frees structure *>
fn void Label.free(&self) {
  self.text.free();
}
<* Calculates whether rect is winthin input *>
fn bool Label.within_rect(&self, Vector2 offset, Rectangle rect) {
  Rectangle rect_off = self.rect;
  rect_off.x += offset.x;
  rect_off.y += offset.y;
  return ((rect_off.x+rect_off.width > rect.x) && (rect_off.x < rect.x+rect.width) && (rect_off.y > rect.y) && (rect_off.y+rect_off.height < rect.y+rect.height));
}


struct Toggle {
  Rectangle rect;

  String text;
  bool active;
}
<* Draw/Update toggle *>
fn bool Toggle.draw(&self, Vector2 offset = {0,0}) {
  Rectangle rect_off = self.rect;
  rect_off.x += offset.x;
  rect_off.y += offset.y;
  if (rg::guiCheckBox(rect_off, self.text, &self.active)) {
    self.active = !self.active;
  }
  return self.active;
}
<* Frees structure *>
fn void Toggle.free(&self) {
  self.text.free();
}
<* Calculates whether rect is winthin input *>
fn bool Toggle.within_rect(&self, Vector2 offset, Rectangle rect) {
  Rectangle rect_off = self.rect;
  rect_off.x += offset.x;
  rect_off.y += offset.y;
  return ((rect_off.x+rect_off.width+((float)self.text.len*5) > rect.x) && (rect_off.x < rect.x+rect.width) && (rect_off.y > rect.y) && (rect_off.y+rect_off.height < rect.y+rect.height));
}

