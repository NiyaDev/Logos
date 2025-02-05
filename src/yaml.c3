
module logos;
import std::io;
import yaml;


<* Converts the keys in TypedValue to a single string seperated by '\n' *>
fn String TypedValue.convert_keys_to_string(&self) {
  String output;
  int count;
  ((Object*)self.value).@each(; String key, TypedValue val) {
		output = output.concat(key);
		count++;
		if (count < ((Object*)self.value).len()) {
			output = output.concat("\n");
		}
	};
  return output;
}
<* Converts the members of the input array into a single string seperated by '\n' *>
fn String! TypedValue.convert_array_to_string(&self) {
  if (self.type != ARRAY) return "";

  String output;
  for (int i; i < self.size()!!; i++) {
    // TODO: Error out if array members aren't strings
    switch (self.get_array(i)!!.type) {
      case STRING:
        output = output.concat(self.get_array(i)!!.v_string); 
      case INT:
        output = output.concat(string::format("%d",self.get_array(i)!!.v_int, allocator: allocator::heap()));
      default:
    } 
    if (i < self.size()!! - 1) output = output.concat("\n");
  }
  return output;
}
<* Loads data from yaml *>
fn void load_yaml(String filename) {
	Yaml! temp = yaml::parse_file(filename);
	if (catch temp) {
	  last_screen_text = "Failed to read file. Are you sure it's the right one?";
	  return;
	}
  yml = mem::new(Yaml);
  *yml = temp;

  TypedValue! series = yml.get("series");
  if (catch series) {
    last_screen_text = "Dropped file is incompatible [SERIES_ERROR]";
    free(yml);
    return;
  }
	series_name = series.v_string;

	TypedValue! game = yml.get("game");
  if (catch game) {
    last_screen_text = "Dropped file is incompatible [GAME_ERROR]";
    free(yml);
    return;
  }
	game_name = game.v_string;

  TypedValue! content = yml.get("content");
  if (catch content) {
    last_screen_text = "Dropped file is incompatible [CONTENT_ERROR]";
    free(yml);
    return;
  }

	ddb.str = content.convert_keys_to_string();
}
