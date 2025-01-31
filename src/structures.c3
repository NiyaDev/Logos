
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
fn void DropdownBox.draw(&self) {
  if (rg::guiDropdownBox(self.rect, self.str, &self.chosen, self.edit)) {
    self.edit = !self.edit;
  }
}

