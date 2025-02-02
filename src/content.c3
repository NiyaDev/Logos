
module logos;
import std::io;
import std::collections;
import yaml;


struct Content {
  ScrollPanel backpanel;

  List(<ContentItems>) content;
}

union ContentItems {
  Toggle toggle;
  Label label;
  MonsterUI monster;
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
        usz length = val_3.size()!!;
        if ()
      };
    };
  };

  return output;
}
