
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
  DropdownBox version_sel;
  String[] versions;
  bool version_enabled;

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
  output.section_box = {
    .rect = {20,20,350,30},
    .str = content.convert_keys_to_string(),
  };

  //* Check if version tag exists and create dropdown for it
  TypedValue! version = self.get("versions");
  if (try version) {
    output.version_enabled = true;
    output.version_sel = {
      .rect = {110,55,150,30},
      .str = version.convert_array_to_string()!!,
    };
    output.versions = output.version_sel.str.split("\n");
  }

  //* Backpanel
  Rectangle backpanel_rect = {10, 60, 370, 620};
  if (output.version_enabled) {
    backpanel_rect.y += 30;
    backpanel_rect.height -= 30;
  }
  output.backpanel = {
    .rect = backpanel_rect,
    .content = {0, 0, 345, 0},
  };

  //* Iterate through objects to populate
  float height_total;
  ((yaml::Object*)content.value).@each(; String key, TypedValue val) {
    float height;
    if (output.version_enabled) height += 30;
    ContentBox box;
    //* Sections
    ((yaml::Object*)val.value).@each(; String key_2, TypedValue val_2) {
      //* Secondary Header / First level tag
      if (val_2.type == OBJECT || val_2.type == ARRAY) {
        usz length = val_2.size()!!;
        
        ContentItems lb; 
        switch (true) {
          case key_2.contains("toggle"):
            lb.type = TOGGLE;
            lb.toggle = {.rect = {20, 70 + height, 20, 20}, .text = val_2.v_string};
          default:
            lb.type = LABEL;
            lb.label = {.rect = {20, 70 + height, 200, 20}, .text = key_2}; 
        }
        box.content_items.push(lb);
        height += 20;

        ((yaml::Object*)val_2.value).@each(; String key_3, TypedValue val_3) {
          ContentItems lb2;
          switch (true) {
            case key_3.contains("toggle"):
              lb2.type = TOGGLE;
              lb2.toggle = {.rect = {20+20, 70 + height, 20, 20}, .text = val_3.v_string};
            default:
              lb2.type = LABEL;
              lb2.label = {.rect = {20+20, 70 + height, 200, 20}, .text = key_3}; 
          }
          box.content_items.push(lb2);
          height += 25;
          
          if (val_3.type == OBJECT || val_3.type == ARRAY) {
            ((yaml::Object*)val_3.value).@each(; String key_4, TypedValue val_4) {
              ContentItems lb3;
              if (output.check_if_version(key_4) && !output.check_version(key_4)) {
                
              }
              switch (true) {
                case key_4.contains("toggle"):
                  lb3.type = TOGGLE;
                  lb3.toggle = {.rect = {20+40, 70 + height, 20, 20}, .text = val_4.v_string};
                default:
                  lb3.type = LABEL;
                  lb3.label = {.rect = {20+40, 70 + height, 200, 20}, .text = key_4}; 
              }
              box.content_items.push(lb3);
              height += 25;

              if (val_4.type == OBJECT || val_4.type == ARRAY) {
                ((yaml::Object*)val_4.value).@each(; String key_5, TypedValue val_5) {
                  ContentItems lb4;
                  switch (true) {
                    case key_5.contains("toggle"):
                      lb4.type = TOGGLE;
                      lb4.toggle = {.rect = {20+60, 70 + height, 20, 20}, .text = val_5.v_string};
                    default:
                      lb4.type = LABEL;
                      lb4.label = {.rect = {20+60, 70 + height, 200, 20}, .text = key_5}; 
                  }
                  box.content_items.push(lb4);
                  height += 25;
                };
              }
            };
          }
        };
      }
      //* if ()
    };
    box.height = height; 
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
  //* Draw content scroll panel
  self.backpanel.draw();

  //* Draw content
  for (int i; i < self.content_boxes[self.section_box.chosen].content_items.len(); i++) {
    ContentItems ci = self.content_boxes[self.section_box.chosen].content_items[i];
    switch (ci.type) {
      case LABEL:
        if (ci.label.within_rect(self.backpanel.scroll, self.backpanel.rect)) ci.label.draw(self.backpanel.scroll);
      case TOGGLE:
        if (ci.toggle.within_rect(self.backpanel.scroll, self.backpanel.rect)) ci.toggle.draw(self.backpanel.scroll);
      case MONSTERUI: //ci.monster.draw();
    }
  }

  //* Draw version box if applicable
  if (self.version_enabled) self.version_sel.draw(); 

  //* Draw dropdown box
  if (self.section_box.draw()) {
    self.backpanel.content = {0,0,345,self.content_boxes[self.section_box.chosen].height};
  }

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
}
<* Frees all string and lists in prep for new content *>
fn void Content.reset(&self) {
  self.series_name.free();
  self.game_name.free();
  self.section_box.free();
  self.version_sel.free();
  self.backpanel.free();
  self.content_boxes.free();
  free(self.monster_collection);
  self.monsterdex_scrollpanel.free();
}
<* Checks if tag is a version *>
fn bool Content.check_if_version(&self, String str) {
  for (int i; i < self.versions.len; i++) {
    if (self.versions[i] == str) return true;
  }
  return false;
}
<* Checks if tag is current version *>
fn bool Content.check_version(&self, String str) {
  return (self.versions[self.version_sel.chosen] == str);
}

struct ContentBox {
  List(<ContentItems>) content_items;
  float height;
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

