
module logos;
import std::io;
import raylib5::rl;
import raygui::rg;
import yaml;

enum Monsters : int (int gen) {
  MISSINGNO = 0,
  BULBASAUR = 1,
  IVYSAUR = 1,
  VENUSAUR = 1,
  CHARMANDER = 1,
  CHARMELEON = 1,
  CHARIZARD = 1,
  SQUIRTLE = 1,
  WARTORTLE = 1,
  BLASTOISE = 1,
  CATERPIE = 1,
  METAPOD = 1,
  BUTTERFREE = 1,
  WEEDLE = 1,
  KAKUNA = 1,
  BEEDRILL = 1,
  PIDGEY = 1,
  PIDGEOTTO = 1,
  PIDGEOT = 1,
  RATTATA = 1,
  RATICATE = 1,
  SPEAROW = 1,
  FEAROW = 1,
  EKANS = 1,
  ARBOK = 1,
  PIKACHU = 1,
  RAICHU = 1,
  SANDSHREW = 1,
  SANDSLASH = 1,
  NIDORANF = 1,
  NIDORINA = 1,
  NIDOQUEEN = 1,
  NIDORANM = 1,
  NIDORINO = 1,
  NIDOKING = 1,
  CLEFAIRY = 1,
  CLEFABLE = 1,
  VULPIX = 1,
  NINETALES = 1,
  JIGGLYPUFF = 1,
  WIGGLYTUFF = 1,
  ZUBAT = 1,
  GOLBAT = 1,
  ODDISH = 1,
  GLOOM = 1,
  VILEPLUME = 1,
  PARAS = 1,
  PARASECT = 1,
  VENONAT = 1,
  VENOMOTH = 1,
  DIGLETT = 1,
  DUGTRIO = 1,
  MEOWTH = 1,
  PERSIAN = 1,
  PSYDUCK = 1,
  GOLDUCK = 1,
  MANKEY = 1,
  PRIMEAPE = 1,
  GROWLITHE = 1,
  ARCANINE = 1,
  POLIWAG = 1,
  POLIWHIRL = 1,
  POLIWRATH = 1,
  ABRA = 1,
  KADABRA = 1,
  ALAKAZAM = 1,
  MACHOP = 1,
  MACHOKE = 1,
  MACHAMP = 1,
  BELLSPROUT = 1,
  WEEPINBELL = 1,
  VICTREEBEL = 1,
  TENTACOOL = 1,
  TENTACRUEL = 1,
  GEODUDE = 1,
  GRAVELER = 1,
  GOLEM = 1,
  PONYTA = 1,
  RAPIDASH = 1,
  SLOWPOKE = 1,
  SLOWBRO = 1,
  MAGNEMITE = 1,
  MAGNETON = 1,
  FARFETCHD = 1,
  DODUO = 1,
  DODRIO = 1,
  SEEL = 1,
  DEWGONG = 1,
  GRIMER = 1,
  MUK = 1,
  SHELLDER = 1,
  CLOYSTER = 1,
  GASTLY = 1,
  HAUNTER = 1,
  GENGAR = 1,
  ONIX = 1,
  DROWZEE = 1,
  HYPNO = 1,
  KRABBY = 1,
  KINGLER = 1,
  VOLTORB = 1,
  ELECTRODE = 1,
  EXEGGCUTE = 1,
  EXEGGUTOR = 1,
  CUBONE = 1,
  MAROWAK = 1,
  HITMONLEE = 1,
  HITMONCHAN = 1,
  LICKITUNG = 1,
  KOFFING = 1,
  WEEZING = 1,
  RHYHORN = 1,
  RHYDON = 1,
  CHANSEY = 1,
  TANGELA = 1,
  KANGASKHAN = 1,
  HORSEA = 1,
  SEADRA = 1,
  GOLDEEN = 1,
  SEAKING = 1,
  STARYU = 1,
  STARMIE = 1,
  MRMIME = 1,
  SCYTHER = 1,
  JYNX = 1,
  ELECTABUZZ = 1,
  MAGMAR = 1,
  PINSIR = 1,
  TAUROS = 1,
  MAGIKARP = 1,
  GYARADOS = 1,
  LAPRAS = 1,
  DITTO = 1,
  EEVEE = 1,
  VAPOREON = 1,
  JOLTEON = 1,
  FLAREON = 1,
  PORYGON = 1,
  OMANYTE = 1,
  OMASTAR = 1,
  KABUTO = 1,
  KABUTOPS = 1,
  AERODACTYL = 1,
  SNORLAX = 1,
  ARTICUNO = 1,
  ZAPDOS = 1,
  MOLTRES = 1,
  DRATINI = 1,
  DRAGONAIR = 1,
  DRAGONITE = 1,
  MEWTWO = 1,
  MEW = 1,

  CHIKORITA = 2,
  BAYLEEF = 2,
  MEGANIUM = 2,
  CYNDAQUIL = 2,
  QUILAVA = 2,
  TYPHLOSION = 2,
  TOTODILE = 2,
  CROCONAW = 2,
  FERALIGATR = 2,
  SENTRET = 2,
  FURRET = 2,
  HOOTHOOT = 2,
  NOCTOWL = 2,
  LEDYBA = 2,
  LEDIAN = 2,
  SPINARAK = 2,
  ARIADOS = 2,
  CROBAT = 2,
  CHINCHOU = 2,
  LANTURN = 2,
  PICHU = 2,
  CLEFFA = 2,
  IGGLYBUFF = 2,
  TOGEPI = 2,
  TOGETIC = 2,
  NATU = 2,
  XATU = 2,
  MAREEP = 2,
  FLAAFFY = 2,
  AMPHAROS = 2,
  BELLOSSOM = 2,
  MARILL = 2,
  AZUMARILL = 2,
  SUDOWOODO = 2,
  POLITOED = 2,
  HOPPIP = 2,
  SKIPLOOM = 2,
  JUMPLUFF = 2,
  AIPOM = 2,
  SUNKERN = 2,
  SUNFLORA = 2,
  YANMA = 2,
  WOOPER = 2,
  QUAGSIRE = 2,
  ESPEON = 2,
  UMBREON = 2,
  MURKROW = 2,
  SLOWKING = 2,
  MISDREAVUS = 2,
  UNOWN = 2,
  WOBBUFFET = 2,
  GIRAFARIG = 2,
  PINECO = 2,
  FORRETRESS = 2,
  DUNSPARCE = 2,
  GLIGAR = 2,
  STEELIX = 2,
  SNUBBULL = 2,
  GRANBULL = 2,
  QWILFISH = 2,
  SCIZOR = 2,
  SHUCKLE = 2,
  HERACROSS = 2,
  SNEASEL = 2,
  TEDDIURSA = 2,
  URSARING = 2,
  SLUGMA = 2,
  MAGCARGO = 2,
  SWINUB = 2,
  PILOSWINE = 2,
  CORSOLA = 2,
  REMORAID = 2,
  OCTILLERY = 2,
  DELIBIRD = 2,
  MANTINE = 2,
  SKARMORY = 2,
  HOUNDOUR = 2,
  HOUNDOOM = 2,
  KINGDRA = 2,
  PHANPY = 2,
  DONPHAN = 2,
  PORYGON2 = 2,
  STANTLER = 2,
  SMEARGLE = 2,
  TYROGUE = 2,
  HITMONTOP = 2,
  SMOOCHUM = 2,
  ELEKID = 2,
  MAGBY = 2,
  MILTANK = 2,
  BLISSEY = 2,
  RAIKOU = 2,
  ENTEI = 2,
  SUICUNE = 2,
  LARVITAR = 2,
  PUPITAR = 2,
  TYRANITAR = 2,
  LUGIA = 2,
  HOOH = 2,
  CELEBI = 2,

  TREECKO = 3,
  GROVYLE = 3,
  SCEPTILE = 3,
  TORCHIC = 3,
  COMBUSKEN = 3,
  BLAZIKEN = 3,
  MUDKIP = 3,
  MARSHTOMP = 3,
  SWAMPERT = 3,
  POOCHYENA = 3,
  MIGHTYENA = 3,
  ZIGZAGOON = 3,
  LINOONE = 3,
  WURMPLE = 3,
  SILCOON = 3,
  BEAUTIFLY = 3,
  CASCOON = 3,
  DUSTOX = 3,
  LOTAD = 3,
  LOMBRE = 3,
  LUDICOLO = 3,
  SEEDOT = 3,
  NUZLEAF = 3,
  SHIFTRY = 3,
  TAILLOW = 3,
  SWELLOW = 3,
  WINGULL = 3,
  PELIPPER = 3,
  RALTS = 3,
  KIRLIA = 3,
  GARDEVOIR = 3,
  SURSKIT = 3,
  MASQUERAIN = 3,
  SHROOMISH = 3,
  BRELOOM = 3,
  SLAKOTH = 3,
  VIGOROTH = 3,
  SLAKING = 3,
  NINCADA = 3,
  NINJASK = 3,
  SHEDINJA = 3,
  WHISMUR = 3,
  LOUDRED = 3,
  EXPLOUD = 3,
  MAKUHITA = 3,
  HARIYAMA = 3,
  AZURILL = 3,
  NOSEPASS = 3,
  SKITTY = 3,
  DELCATTY = 3,
  SABLEYE = 3,
  MAWILE = 3,
  ARON = 3,
  LAIRON = 3,
  AGGRON = 3,
  MEDITITE = 3,
  MEDICHAM = 3,
  ELECTRIKE = 3,
  MANECTRIC = 3,
  PLUSLE = 3,
  MINUN = 3,
  VOLBEAT = 3,
  ILLUMISE = 3,
  ROSELIA = 3,
  GULPIN = 3,
  SWALOT = 3,
  CARVANHA = 3,
  SHARPEDO = 3,
  WAILMER = 3,
  WAILORD = 3,
  NUMEL = 3,
  CAMERUPT = 3,
  TORKOAL = 3,
  SPOINK = 3,
  GRUMPIG = 3,
  SPINDA = 3,
  TRAPINCH = 3,
  VIBRAVA = 3,
  FLYGON = 3,
  CACNEA = 3,
  CACTURNE = 3,
  SWABLU = 3,
  ALTARIA = 3,
  ZANGOOSE = 3,
  SEVIPER = 3,
  LUNATONE = 3,
  SOLROCK = 3,
  BARBOACH = 3,
  WHISCASH = 3,
  CORPHISH = 3,
  CRAWDAUNT = 3,
  BALTOY = 3,
  CLAYDOL = 3,
  LILEEP = 3,
  CRADILY = 3,
  ANORITH = 3,
  ARMALDO = 3,
  FEEBAS = 3,
  MILOTIC = 3,
  CASTFORM = 3,
  KECLEON = 3,
  SHUPPET = 3,
  BANETTE = 3,
  DUSKULL = 3,
  DUSCLOPS = 3,
  TROPIUS = 3,
  CHIMECHO = 3,
  ABSOL = 3,
  WYNAUT = 3,
  SNORUNT = 3,
  GLALIE = 3,
  SPHEAL = 3,
  SEALEO = 3,
  WALREIN = 3,
  CLAMPERL = 3,
  HUNTAIL = 3,
  GOREBYSS = 3,
  RELICANTH = 3,
  LUVDISC = 3,
  BAGON = 3,
  SHELGON = 3,
  SALAMENCE = 3,
  BELDUM = 3,
  METANG = 3,
  METAGROSS = 3,
  REGIROCK = 3,
  REGICE = 3,
  REGISTEEL = 3,
  LATIAS = 3,
  LATIOS = 3,
  KYOGRE = 3,
  GROUDON = 3,
  RAYQUAZA = 3,
  JIRACHI = 3,
  DEOXYS = 3,

  TURTWIG = 4,
  GROTLE = 4,
  TORTERRA = 4,
  CHIMCHAR = 4,
  MONFERNO = 4,
  INFERNAPE = 4,
  PIPLUP = 4,
  PRINPLUP = 4,
  EMPOLEON = 4,
  STARLY = 4,
  STARAVIA = 4,
  STARAPTOR = 4,
  BIDOOF = 4,
  BIBAREL = 4,
  KRICKETOT = 4,
  KRICKETUNE = 4,
  SHINX = 4,
  LUXIO = 4,
  LUXRAY = 4,
  BUDEW = 4,
  ROSERADE = 4,
  CRANIDOS = 4,
  RAMPARDOS = 4,
  SHIELDON = 4,
  BASTIODON = 4,
  BURMY = 4,
  WORMADAM = 4,
  MOTHIM = 4,
  COMBEE = 4,
  VESPIQUEN = 4,
  PACHIRISU = 4,
  BUIZEL = 4,
  FLOATZEL = 4,
  CHERUBI = 4,
  CHERRIM = 4,
  SHELLOS = 4,
  GASTRODON = 4,
  AMBIPOM = 4,
  DRIFLOON = 4,
  DRIFBLIM = 4,
  BUNEARY = 4,
  LOPUNNY = 4,
  MISMAGIUS = 4,
  HONCHKROW = 4,
  GLAMEOW = 4,
  PURUGLY = 4,
  CHINGLING = 4,
  STUNKY = 4,
  SKUNTANK = 4,
  BRONZOR = 4,
  BRONZONG = 4,
  BONSLY = 4,
  MIMEJR = 4,
  HAPPINY = 4,
  CHATOT = 4,
  SPIRITOMB = 4,
  GIBLE = 4,
  GABITE = 4,
  GARCHOMP = 4,
  MUNCHLAX = 4,
  RIOLU = 4,
  LUCARIO = 4,
  HIPPOPOTAS = 4,
  HIPPOWDON = 4,
  SKORUPI = 4,
  DRAPION = 4,
  CROAGUNK = 4,
  TOXICROAK = 4,
  CARNIVINE = 4,
  FINNEON = 4,
  LUMINEON = 4,
  MANTYKE = 4,
  SNOVER = 4,
  ABOMASNOW = 4,
  WEAVILE = 4,
  MAGNEZONE = 4,
  LICKILICKY = 4,
  RHYPERIOR = 4,
  TANGROWTH = 4,
  ELECTIVIRE = 4,
  MAGMORTAR = 4,
  TOGEKISS = 4,
  YANMEGA = 4,
  LEAFEON = 4,
  GLACEON = 4,
  GLISCOR = 4,
  MAMOSWINE = 4,
  PORYGONZ = 4,
  GALLADE = 4,
  PROBOPASS = 4,
  DUSKNOIR = 4,
  FROSLASS = 4,
  ROTOM = 4,
  UXIE = 4,
  MESPRIT = 4,
  AZELF = 4,
  DIALGA = 4,
  PALKIA = 4,
  HEATRAN = 4,
  REGIGIGAS = 4,
  GIRATINA = 4,
  CRESSELIA = 4,
  PHIONE = 4,
  MANAPHY = 4,
  DARKRAI = 4,
  SHAYMIN = 4,
  ARCEUS = 4,

  VICTINI = 5,
  SNIVY = 5,
  SERVINE = 5,
  SERPERIOR = 5,
  TEPIG = 5,
  PIGNITE = 5,
  EMBOAR = 5,
  OSHAWOTT = 5,
  DEWOTT = 5,
  SAMUROTT = 5,
  PATRAT = 5,
  WATCHOG = 5,
  LILLIPUP = 5,
  HERDIER = 5,
  STOUTLAND = 5,
  PURRLOIN = 5,
  LIEPARD = 5,
  PANSAGE = 5,
  SIMISAGE = 5,
  PANSEAR = 5,
  SIMISEAR = 5,
  PANPOUR = 5,
  SIMIPOUR = 5,
  MUNNA = 5,
  MUSHARNA = 5,
  PIDOVE = 5,
  TRANQUILL = 5,
  UNFEZANT = 5,
  BLITZLE = 5,
  ZEBSTRIKA = 5,
  ROGGENROLA = 5,
  BOLDORE = 5,
  GIGALITH = 5,
  WOOBAT = 5,
  SWOOBAT = 5,
  DRILBUR = 5,
  EXCADRILL = 5,
  AUDINO = 5,
  TIMBURR = 5,
  GURDURR = 5,
  CONKELDURR = 5,
  TYMPOLE = 5,
  PALPITOAD = 5,
  SEISMITOAD = 5,
  THROH = 5,
  SAWK = 5,
  SEWADDLE = 5,
  SWADLOON = 5,
  LEAVANNY = 5,
  VENIPEDE = 5,
  WHIRLIPEDE = 5,
  SCOLIPEDE = 5,
  COTTONEE = 5,
  WHIMSICOTT = 5,
  PETILIL = 5,
  LILLIGANT = 5,
  BASCULIN = 5,
  SANDILE = 5,
  KROKOROK = 5,
  KROOKODILE = 5,
  DARUMAKA = 5,
  DARMANITAN = 5,
  MARACTUS = 5,
  DWEBBLE = 5,
  CRUSTLE = 5,
  SCRAGGY = 5,
  SCRAFTY = 5,
  SIGILYPH = 5,
  YAMASK = 5,
  COFAGRIGUS = 5,
  TIRTOUGA = 5,
  CARRACOSTA = 5,
  ARCHEN = 5,
  ARCHEOPS = 5,
  TRUBBISH = 5,
  GARBODOR = 5,
  ZORUA = 5,
  ZOROARK = 5,
  MINCCINO = 5,
  CINCCINO = 5,
  GOTHITA = 5,
  GOTHORITA = 5,
  GOTHITELLE = 5,
  SOLOSIS = 5,
  DUOSION = 5,
  REUNICLUS = 5,
  DUCKLETT = 5,
  SWANNA = 5,
  VANILLITE = 5,
  VANILLISH = 5,
  VANILLUXE = 5,
  DEERLING = 5,
  SAWSBUCK = 5,
  EMOLGA = 5,
  KARRABLAST = 5,
  ESCAVALIER = 5,
  FOONGUS = 5,
  AMOONGUSS = 5,
  FRILLISH = 5,
  JELLICENT = 5,
  ALOMOMOLA = 5,
  JOLTIK = 5,
  GALVANTULA = 5,
  FERROSEED = 5,
  FERROTHORN = 5,
  KLINK = 5,
  KLANG = 5,
  KLINKLANG = 5,
  TYNAMO = 5,
  EELEKTRIK = 5,
  EELEKTROSS = 5,
  ELGYEM = 5,
  BEHEEYEM = 5,
  LITWICK = 5,
  LAMPENT = 5,
  CHANDELURE = 5,
  AXEW = 5,
  FRAXURE = 5,
  HAXORUS = 5,
  CUBCHOO = 5,
  BEARTIC = 5,
  CRYOGONAL = 5,
  SHELMET = 5,
  ACCELGOR = 5,
  STUNFISK = 5,
  MIENFOO = 5,
  MIENSHAO = 5,
  DRUDDIGON = 5,
  GOLETT = 5,
  GOLURK = 5,
  PAWNIARD = 5,
  BISHARP = 5,
  BOUFFALANT = 5,
  RUFFLET = 5,
  BRAVIARY = 5,
  VULLABY = 5,
  MANDIBUZZ = 5,
  HEATMOR = 5,
  DURANT = 5,
  DEINO = 5,
  ZWEILOUS = 5,
  HYDREIGON = 5,
  LARVESTA = 5,
  VOLCARONA = 5,
  COBALION = 5,
  TERRAKION = 5,
  VIRIZION = 5,
  TORNADUS = 5,
  THUNDURUS = 5,
  RESHIRAM = 5,
  ZEKROM = 5,
  LANDORUS = 5,
  KYUREM = 5,
  KELDEO = 5,
  MELOETTA = 5,
  GENESECT = 5,
}
<**>
fn Monsters String.to_monster(&self) {
  String self_upper = self.new_ascii_to_upper();

  for (int i; i < Monsters.len; i++) {
    String comp = string::format("%s",Monsters.from_ordinal(i), allocator: allocator::heap());
    io::printfn("%s == %s = %b",comp, self_upper, comp == self_upper);
    if (comp == self_upper) {
      comp.free();
      self_upper.free();
      return Monsters.from_ordinal(i);
    }
    comp.free();
  }
  self_upper.free();
  return MISSINGNO;
}
<**>
fn String Monsters.to_string(self) {
  return string::format("%s\0", self, allocator: allocator::heap());
}


enum Generation : int (int total) {
  GEN_1 = 151,
  GEN_2 = 251,
  GEN_3 = 386,
  GEN_4 = 493,
  GEN_5 = 649, 
}

Generation current_gen;
bool[] monsters_collected;

<* Converts a game name as a string to a generation *>
fn Generation String.gen(self) {
  switch (self) {
    case "Red/Blue/Yellow": 		   return GEN_1;
		case "Gold/Silver/Crystal":    return GEN_2;
		case "Ruby/Sapphire/Emerald":  return GEN_3;
		case "Fire Red/Leaf Green":    return GEN_3;
		case "Diamond/Pearl/Platinum": return GEN_4;
		case "Heart Gold/Soul Silver": return GEN_4;
		case "Black/White":            return GEN_5;
		case "Black 2/White 2":        return GEN_5;
		default:
		  io::printfn("Pokemon game name unknown");
		  return GEN_1;
  }
}
<* Initializes monsters collected *>
fn bool[]! init_collection(Generation gen) {
  bool[] output = mem::new_array(bool, (gen.total + (usz)1));
  
  switch (gen) {
    case GEN_1:
      output[Monsters.MEW.ordinal] = true;
    case GEN_2:
      output[Monsters.BULBASAUR.ordinal] = true;
      output[Monsters.IVYSAUR.ordinal] = true;
      output[Monsters.VENUSAUR.ordinal] = true;
      output[Monsters.CHARMANDER.ordinal] = true;
      output[Monsters.CHARMELEON.ordinal] = true;
      output[Monsters.CHARIZARD.ordinal] = true;
      output[Monsters.SQUIRTLE.ordinal] = true;
      output[Monsters.WARTORTLE.ordinal] = true;
      output[Monsters.BLASTOISE.ordinal] = true;
      output[Monsters.OMANYTE.ordinal] = true;
      output[Monsters.OMASTAR.ordinal] = true;
      output[Monsters.KABUTO.ordinal] = true;
      output[Monsters.KABUTOPS.ordinal] = true;
      output[Monsters.ARTICUNO.ordinal] = true;
      output[Monsters.ZAPDOS.ordinal] = true;
      output[Monsters.MOLTRES.ordinal] = true;
      output[Monsters.MEWTWO.ordinal] = true;
      output[Monsters.MEW.ordinal] = true;
      output[Monsters.CELEBI.ordinal] = true;
    default:
  }
  
  return output;
}
<* Initializes monsters collected *>
fn void! init_gen(String game_name) {
  Generation generation = game_name.gen();

  current_gen = generation;
  monsters_collected = mem::new_array(bool, (generation.total + (usz)1));

  switch (generation) {
    case GEN_1:
      monsters_collected[151] = true;
    case GEN_2:
      monsters_collected[1] = true;
      monsters_collected[2] = true;
      monsters_collected[3] = true;
      monsters_collected[4] = true;
      monsters_collected[5] = true;
      monsters_collected[6] = true;
      monsters_collected[7] = true;
      monsters_collected[8] = true;
      monsters_collected[9] = true;
      monsters_collected[138] = true;
      monsters_collected[139] = true;
      monsters_collected[140] = true;
      monsters_collected[141] = true;
      monsters_collected[144] = true;
      monsters_collected[145] = true;
      monsters_collected[146] = true;
      monsters_collected[150] = true;
      monsters_collected[151] = true;
      monsters_collected[251] = true;
    default:
  }
}


struct Monsterdex {
  Rectangle rect;

  bool is_open;
  Vector2 scroll;
  float offset;
  float length;
}

<* Creates a new Mosterdex struct *>
fn Monsterdex init_dex() {
  Monsterdex md;

  md.is_open = false;
  md.scroll = {0,0};
  md.offset = (float)logos::screen_height - 50;
  md.length = (float)current_gen.total * 30;

  return md;
}
<* Draws Monsterdex to screen *>
fn void Monsterdex.draw(&self) {
  Rectangle scroll_rect = {20,20 + self.offset, 350, (float)logos::screen_height - 40};
  Rectangle button_rect = {350, 20 + self.offset, 20, 20};

  //* Draw scroll panel
  rg::guiScrollPanel(scroll_rect, "Pokedex", {0, 0, 335, self.length + 5}, &self.scroll, &self.rect);

  //* Draw and logic for expand/shrink box
  if (self.is_open) {
    if (rg::guiButton(button_rect, "\\/")) { self.is_open = !self.is_open; }
  } else {
    if (rg::guiButton(button_rect, "/\\")) { self.is_open = !self.is_open; }
  }

  //* Draw a checkbox for each monster
  if (self.is_open) {
    for (int i; i < current_gen.total+1; i++) {
      float scroll_y = (30 * ((float)i - 1) + 50 + self.scroll.y);

      if (scroll_y > 40 && scroll_y < (float)logos::screen_height - 40) {
        String tx = string::format("%s\0", Monsters.from_ordinal(i), allocator: allocator::heap());
        if (rg::guiCheckBox({40, scroll_y + self.offset, 20, 20}, tx, &monsters_collected[i])) {}
        tx.free();
      }
    }
  }
}
<* Updates Monsterdex *>
fn void Monsterdex.update(&self) {
  if ( self.is_open && self.offset > 0) self.offset -= 20;
	if (!self.is_open && self.offset < (float)logos::screen_height - 50) self.offset += 20;	 
}


struct MonsterUI {
  Rectangle rect;
  Rectangle toggle_rect;

  bool* value;
  
  String name;
  String time;
  String chance;
  String levels;
}
<* *>
fn MonsterUI TypedValue.new_ui(&self, Rectangle rect) {
  MonsterUI output;
  output.toggle_rect = rect;

  output.name = self.get_object("name")!!.v_string;

  TypedValue time = self.get_object("time")!!;
  for (int i; i < time.size()!!-1; i++) {
    output.time = output.time.concat(time.get_array(i)!!.v_string);

    if (i < time.size()!!-2) { output.time = output.time.concat(" | "); }
  }

  TypedValue chance = self.get_object("chance")!!;
  for (int i; i < chance.size()!!-1; i++) {
    output.time = output.time.concat(chance.get_array(i)!!.v_string);

    if (i < chance.size()!!-2) { output.time = output.time.concat(" | "); }
  }

  TypedValue levels = self.get_object("levels")!!;
  switch (levels.type) {
    case STRING:
      output.levels = levels.v_string;
    case INT:
      output.levels = string::format("%d", levels.v_int, allocator: allocator::heap());
    default:
  }


  return output;
}
<*  *>
fn void MonsterUI.draw(&self, Vector2 offset = {0,0}) {
  Rectangle rect_off = self.rect;
  rect_off.x += offset.x;
  rect_off.y += offset.y;

  Rectangle rect_tog = rect_off;
  rect_tog.y += 40;
  rect_tog.width = 20;
  rect_tog.height = 20;
  rg::guiCheckBox(rect_tog, "", self.value);

  rg::guiLabel(rect_off, self.name);
}
<*  *>
fn bool MonsterUI.within_rect(&self, Vector2 offset, Rectangle rect) {
  Rectangle rect_off = self.rect;
  rect_off.x += offset.x;
  rect_off.y += offset.y;
  return ((rect_off.x+rect_off.width > rect.x) && (rect_off.x < rect.x+rect.width) && (rect_off.y > rect.y) && (rect_off.y+rect_off.height < rect.y+rect.height));
}

