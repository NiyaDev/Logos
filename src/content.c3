
module logos;
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

  ((Object*)self.value).@each(; String key, TypedValue val) {
    io::printfn("%s", key);
  }

  return output;
}
