
module logos;
import std::io;
import raylib5::rl;
import raygui::rg;
import yaml;
import logos::monsters;


uint screen_height = 720;
uint screen_width  = 390;

String last_screen_text = "Please drag a compatible .yml file onto this window";

Yaml* yml;
String series_name;
String game_name;

DropdownBox ddb;

Monsterdex monsterdex;

fn int main(String[] args) {
	
	rl::setTraceLogLevel(rl::TraceLogLevel.NONE);
	rl::initWindow(screen_width, screen_height, "Logos - Gameplay progress tracker");
	rl::setTargetFPS(60);
	rg::guiLoadStyle("resources/jungle/style_jungle.rgs");

	monsterdex = monsters::init_dex();

	while (!rl::windowShouldClose()) {
		//* Wait until a file gets dragged in
		if (rl::isFileDropped()) {
			FilePathList list = rl::loadDroppedFiles();
			if (list.count > 1) {
				last_screen_text = "Dropped too many files";
				rl::unloadDroppedFiles(list);
				continue;
			}

			if (yml != null) { free(yml); }

			String filename = ((ZString)list.paths[0]).str_view().copy();
			rl::unloadDroppedFiles(list);
				
			load_yaml(filename);
		}

		//* If theres no current file, draw text
		if (yml == null) {
			rl::beginDrawing();
				rl::clearBackground({49,68,54,255});
				rg::guiLabel({10, 10, (float)screen_width-20, 50}, last_screen_text);
			rl::endDrawing();
			
			continue;
		}

		//* Update monsterdex if needed
		switch (series_name) {
			case "Pokemon":
				monsterdex.update();
		}

		rl::beginDrawing();
			rl::clearBackground({49,68,54,255});

			ddb.draw();
	
			//* Draw monsterdex if needed
			switch (series_name) {
				case "Pokemon":
					monsterdex.draw();
			}
		rl::endDrawing();
	}

	rl::closeWindow();
	return 0;
}
