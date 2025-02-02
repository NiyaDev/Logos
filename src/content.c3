
module logos;
import std::io;
import std::collections;
import yaml;
import raylib5::rl;
import raygui::rg;


struct Content {
  String series_name;
  String game_name;

  DropdownBox section_box;

  ScrollPanel backpanel;
  List(<ContentBox>) content_boxes;

  //* Monster data
  Generation monster_gen;
  bool[] monster_collection;

  ScrollPanel monsterdex_scrollpanel;
  bool monsterdex_is_open;
  float monsterdex_offset;
  float monsterdex_length;
}
<* Create content from Yaml file *>
fn Content! Yaml.create_content(&self) {
  Content output;

  //* Get game series
  TypedValue! series = self.get("series");
  if (catch series) return ContentFault.MISSING_ELEMENT?;
  output.series_name = series.v_string;

  //* Get game name
  TypedValue! game = self.get("game");
  if (catch game) return ContentFault.MISSING_ELEMENT?;
  output.game_name = game.v_string;

  //* If a certain series has special elements
  switch (output.series_name) {
    case "Pokemon":
      output.monster_gen = output.game_name.gen();
      output.monster_collection = init_collection(output.monster_gen)!!;
      output.monsterdex_is_open = false;
      output.monsterdex_offset  = (float)screen_height - 50;
      output.monsterdex_length  = (float)output.monster_gen.total * 30;
  }

  //* Grab main content object
  TypedValue! content = self.get("content");
  if (catch content) return ContentFault.MISSING_ELEMENT?;

  //* create section Dropdown
  output.section_box = {.rect = {20,20,350,30}, .str = content.convert_keys_to_string()};

  //* Backpanel
  output.backpanel = {
    .rect = {10, 60, 370, 620},
    .content = {0, 0, 345, 595},
  };

  //* Iterate through objects to populate
  ((yaml::Object*)content.value).@each(; String key, TypedValue val) {
    float height; 
    ContentBox box;
    //* Sections
    //io::printfn("%s",key);
    ((yaml::Object*)val.value).@each(; String key_2, TypedValue val_2) {
      //* Secondary Header / First level tag
      io::printfn("\t%s",key_2);
      if (val_2.type == OBJECT || val_2.type == ARRAY) {
        usz length = val_2.size()!!;

        ContentItems lb;
        lb.type = LABEL;
        lb.label = {.rect = {20, 70 + height, 200, 20}, .text = key_2};
        box.content_items.push(lb);
        height += 20;
      }
      //* if ()
    };
    output.content_boxes.push(box);
  };

  return output;
}
<* Updates content *>
fn void Content.update(&self) {
  switch (self.series_name) {
    case "Pokemon":
      if ( self.monsterdex_is_open && self.monsterdex_offset > 0) self.monsterdex_offset -= 20;
      if (!self.monsterdex_is_open && self.monsterdex_offset < (float)screen_height - 50) self.monsterdex_offset += 20;
  }
}
<* Draws content *>
fn void Content.draw(&self) {
  switch (self.series_name) {
    case "Pokemon":
      Rectangle scroll_rect = {20, 20 + self.monsterdex_offset, 350, (float)screen_height - 40};
      Rectangle button_rect = {350, 20 + self.monsterdex_offset, 20, 20};

      //* Scroll panel
      rg::guiScrollPanel(scroll_rect, "Pokedex", {0,0,335, self.monsterdex_length + 5}, &self.monsterdex_scrollpanel.scroll, &self.monsterdex_scrollpanel.view);
      
      //* Control button
      if (self.monsterdex_is_open) {
        if (rg::guiButton(button_rect, "\\/")) { self.monsterdex_is_open = !self.monsterdex_is_open; }
      } else {
        if (rg::guiButton(button_rect, "/\\")) { self.monsterdex_is_open = !self.monsterdex_is_open; }
      }

      //* Draw checkboxes
      if (self.monsterdex_is_open) {
        for (int i; i < self.monster_gen.total+1; i++) {
          float scroll_y = (30 * ((float)i - 1) + 50 + self.monsterdex_scrollpanel.scroll.y);

          if (scroll_y > 40 && scroll_y < (float)screen_height - 40) {
            String tx = string::format("%s\0", Monsters.from_ordinal(i), allocator: allocator::heap());
            if (rg::guiCheckBox({40, scroll_y + self.monsterdex_offset, 20, 20}, tx, &self.monster_collection[i]));
            tx.free();
          }
        }
      }
  }

  self.backpanel.draw();

  //* Draw content
  for (int i; i < self.content_boxes[self.section_box.chosen].content_items.len(); i++) {
    ContentItems ci = self.content_boxes[self.section_box.chosen].content_items[i];
    switch (ci.type) {
      case LABEL: ci.label.draw();
      case TOGGLE: ci.toggle.draw();
      case MONSTERUI: //ci.monster.draw();
    }
  }

  //* Draw dropdown box
  self.section_box.draw();
}

struct ContentBox {
  List(<ContentItems>) content_items;
}

struct ContentItems {
  ContentType type;

  union {
    Toggle toggle;
    Label label;
    MonsterUI monster;
  }
}
enum ContentType {
  TOGGLE,
  LABEL,
  MONSTERUI,
}

fault ContentFault {
  MISSING_ELEMENT,
}

/*
struct Content {
  ScrollPanel backpanel;

  List(<ContentItems>) content;
}

<**>
fn Content TypedValue.to_content(&self) {
  Content output;

  ((yaml::Object*)self.value).@each(; String key, TypedValue val) {
    //* Dropdown options
    io::printfn("%s", key);
    ((yaml::Object*)val.value).@each(; String key_2, TypedValue val_2) {
      //* Sections
      io::printfn("\t%s",key_2);
      ((yaml::Object*)val_2.value).@each(; String key_3, TypedValue val_3) {
        //* Secondary Header / First level tag
        io::printfn("\t\t%s",key_3);
        if (val_3.type == OBJECT || val_3.type == ARRAY) {
          usz length = val_3.size()!!;
        }
        //if ()
      };
    };
  };

  return output;
}
*/

