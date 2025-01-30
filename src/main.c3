
module logos;
import std::io;
import raylib5::rl;
import raygui::rg;
import yaml;
import logos::monsters;


String series_name;
String game_name;

uint screen_height;
uint screen_width;

fn int main(String[] args) {
	
	rl::setTraceLogLevel(rl::TraceLogLevel.NONE);
	rl::initWindow(390,720, "Test");
	rl::setWindowState(rl::FLAG_WINDOW_RESIZABLE);
	rl::setTargetFPS(60);
	rg::guiLoadStyle("resources/jungle/style_jungle.rgs");


	Yaml yml = yaml::parse_file("resources/test.yml")!!;

	TypedValue series = yml.get("series")!!;
	series_name = series.v_string;

	TypedValue game = yml.get("game")!!;
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

	//* Pokemon variables
	bool pokedex_open = false;
	Vector2 pokedex_scroll;
	Rectangle pokedex_rect;
	float pokedex_offset = 0; 
	float length = (float)monsters::current_gen.total * 30;

	while (!rl::windowShouldClose()) {
		screen_height = rl::getScreenHeight();
		screen_width  = rl::getScreenWidth();

		switch (series_name) {
			case "Pokemon":
				if (pokedex_open && pokedex_offset > 0) pokedex_offset -= 20;
				if (!pokedex_open && pokedex_offset < (float)screen_height - 50) pokedex_offset += 20;
		}

		rl::beginDrawing();
			rl::clearBackground({49,68,54,255});
	
			switch (series_name) {
				case "Pokemon":
					//* Pokedex
					rg::guiScrollPanel({20,20+pokedex_offset,350,(float)screen_height - 40}, "Pokedex", {0,0,335,length + 5}, &pokedex_scroll, &pokedex_rect);
					if (pokedex_open) {
						if (rg::guiButton({350,20+pokedex_offset,20,20}, "\\/")) { pokedex_open = !pokedex_open; }
					} else {
						if (rg::guiButton({350,20+pokedex_offset,20,20}, "/\\")) { pokedex_open = !pokedex_open; }
					}
					
					if (pokedex_open) {
						for (int i = 1; i < monsters::current_gen.total+1; i++) {
							float scroll_y = (30 * ((float)i-1) + 50 + pokedex_scroll.y);
							if (scroll_y > 40 && scroll_y < (float)screen_height - 40) {
								String tx = string::tformat("%s\0",monsters::Monsters.from_ordinal(i));
								if (rg::guiCheckBox({40,scroll_y+pokedex_offset,20,20},tx,&monsters::monsters_collected[i])) {}
								tx.free();
							}
						}
					}
			}
		rl::endDrawing();
	}

	rl::closeWindow();
	return 0;
}
