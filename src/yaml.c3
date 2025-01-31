
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

	switch (series_name) {
		case "Pokemon":
			switch (game_name) {
				case "Red/Blue/Yellow": 		   monsters::init(Generation.GEN_1)!!;
				case "Gold/Silver/Crystal":    monsters::init(Generation.GEN_2)!!;
				case "Ruby/Sapphire/Emerald":  monsters::init(Generation.GEN_3)!!;
				case "Fire Red/Leaf Green":    monsters::init(Generation.GEN_3)!!;
				case "Diamond/Pearl/Platinum": monsters::init(Generation.GEN_4)!!;
				case "Heart Gold/Soul Silver": monsters::init(Generation.GEN_4)!!;
				case "Black/White":            monsters::init(Generation.GEN_5)!!;
				case "Black 2/White 2":        monsters::init(Generation.GEN_5)!!;
				default: io::printfn("Pokemon game name unknown");
			}
	}

  TypedValue! content = yml.get("content");
  if (catch content) {
    last_screen_text = "Dropped file is incompatible [CONTENT_ERROR]";
    free(yml);
    return;
  }

	ddb = {
		.rect = {20, 20, 350, 30},
		.str  = content.convert_keys_to_string(),
	}; 

  
}
