extends Node

# Each index is a day, we have 5 days
var levels = []

var reference_pages = {}

func _ready() -> void:
	define_reference_pages()
	
	var day_one = DayLevel.new()
	day_one.available_fish.append(Plaice)
	day_one.available_reference_pages.append(reference_pages.get("Welcome"))
	day_one.available_reference_pages.append(reference_pages.get(Plaice))
	day_one.available_reference_pages.append(reference_pages.get("Tools"))
	day_one.available_reference_pages.append(reference_pages.get("Lens"))
	day_one.available_reference_pages.append(reference_pages.get("Aura"))
	day_one.available_reference_pages.append(reference_pages.get("Mouth"))
	day_one.available_reference_pages.append(reference_pages.get("Scale"))
	levels.append(day_one)
	
	var day_two = DayLevel.new()
	day_two.available_fish.append(Plaice)
	day_two.available_fish.append(Cheese)
	day_two.available_reference_pages.append(reference_pages.get("Welcome"))
	day_two.available_reference_pages.append(reference_pages.get(Plaice))
	day_two.available_reference_pages.append(reference_pages.get(Cheese))
	day_two.available_reference_pages.append(reference_pages.get("Tools"))
	day_two.available_reference_pages.append(reference_pages.get("Lens"))
	day_two.available_reference_pages.append(reference_pages.get("Aura"))
	day_two.available_reference_pages.append(reference_pages.get("Mouth"))
	day_two.available_reference_pages.append(reference_pages.get("Scale"))
	levels.append(day_two)
	
	var day_three = DayLevel.new()
	day_three.available_fish.append(Plaice)
	day_three.available_fish.append(Cheese)
	day_three.available_fish.append(FogNose)
	day_three.available_reference_pages.append(reference_pages.get("Welcome"))
	day_three.available_reference_pages.append(reference_pages.get(Plaice))
	day_three.available_reference_pages.append(reference_pages.get(Cheese))
	day_three.available_reference_pages.append(reference_pages.get(FogNose))
	day_three.available_reference_pages.append(reference_pages.get("Tools"))
	day_three.available_reference_pages.append(reference_pages.get("Lens"))
	day_three.available_reference_pages.append(reference_pages.get("Aura"))
	day_three.available_reference_pages.append(reference_pages.get("Mouth"))
	day_three.available_reference_pages.append(reference_pages.get("Scale"))
	levels.append(day_three)
	
	var day_four = DayLevel.new()
	day_four.available_fish.append(Plaice)
	day_four.available_fish.append(Cheese)
	day_four.available_fish.append(FogNose)
	day_four.available_fish.append(BiImp)
	day_four.available_reference_pages.append(reference_pages.get("Welcome"))
	day_four.available_reference_pages.append(reference_pages.get(Plaice))
	day_four.available_reference_pages.append(reference_pages.get(Cheese))
	day_four.available_reference_pages.append(reference_pages.get(FogNose))
	day_four.available_reference_pages.append(reference_pages.get(BiImp))
	day_four.available_reference_pages.append(reference_pages.get("Tools"))
	day_four.available_reference_pages.append(reference_pages.get("Lens"))
	day_four.available_reference_pages.append(reference_pages.get("Aura"))
	day_four.available_reference_pages.append(reference_pages.get("Mouth"))
	day_four.available_reference_pages.append(reference_pages.get("Scale"))
	levels.append(day_four)
	
	var day_five = DayLevel.new()
	day_five.available_fish.append(Plaice)
	day_five.available_fish.append(Cheese)
	day_five.available_fish.append(FogNose)
	day_five.available_fish.append(BiImp)
	day_five.available_fish.append(Lank)
	day_five.available_reference_pages.append(reference_pages.get("Welcome"))
	day_five.available_reference_pages.append(reference_pages.get(Plaice))
	day_five.available_reference_pages.append(reference_pages.get(Cheese))
	day_five.available_reference_pages.append(reference_pages.get(FogNose))
	day_five.available_reference_pages.append(reference_pages.get(BiImp))
	day_five.available_reference_pages.append(reference_pages.get(Lank))
	day_five.available_reference_pages.append(reference_pages.get("Tools"))
	day_five.available_reference_pages.append(reference_pages.get("Lens"))
	day_five.available_reference_pages.append(reference_pages.get("Aura"))
	day_five.available_reference_pages.append(reference_pages.get("Mouth"))
	day_five.available_reference_pages.append(reference_pages.get("Scale"))
	levels.append(day_five)
	
func define_reference_pages() -> void:
	var reference_page_welcome = ReferenceBookPage.new()
	reference_page_welcome.page_layout = 0
	reference_page_welcome.title_text = TextRepo.reference_book_page_welcome_title
	reference_page_welcome.page_body_text = TextRepo.reference_book_page_welcome_text
	reference_pages.set("Welcome", reference_page_welcome)
	
	var reference_page_plaice = ReferenceBookPage.new()
	reference_page_plaice.page_layout = 1
	reference_page_plaice.fish = Plaice.new().spawn(true)
	reference_pages.set(Plaice, reference_page_plaice)
	
	var reference_page_cheese = ReferenceBookPage.new()
	reference_page_cheese.page_layout = 1
	reference_page_cheese.fish = Cheese.new().spawn(true)
	reference_pages.set(Cheese, reference_page_cheese)
	
	var reference_fish_fog_nose = ReferenceBookPage.new()
	reference_fish_fog_nose.page_layout = 1
	reference_fish_fog_nose.fish = FogNose.new().spawn(true)
	reference_pages.set(FogNose, reference_fish_fog_nose)
	
	var reference_bi_imp_nose = ReferenceBookPage.new()
	reference_bi_imp_nose.page_layout = 1
	reference_bi_imp_nose.fish = BiImp.new().spawn(true)
	reference_pages.set(BiImp, reference_bi_imp_nose)
	
	var reference_lank_nose = ReferenceBookPage.new()
	reference_lank_nose.page_layout = 1
	reference_lank_nose.fish = Lank.new().spawn(true)
	reference_pages.set(Lank, reference_lank_nose)
	
	var reference_tools = ReferenceBookPage.new()
	reference_tools.page_layout = 0
	reference_tools.title_text = "Tools"
	reference_tools.page_body_text = TextRepo.tools_description
	reference_pages.set("Tools", reference_tools)
	
	var reference_tool_lens = ReferenceBookPage.new()
	reference_tool_lens.page_layout = 2
	reference_tool_lens.title_text = "Lens"
	reference_tool_lens.tool_texture = load("res://resources/images/tools/tool_lens.png")
	reference_tool_lens.tool_description = TextRepo.lens_description
	reference_pages.set("Lens", reference_tool_lens)
	
	var reference_tool_aura = ReferenceBookPage.new()
	reference_tool_aura.page_layout = 2
	reference_tool_aura.title_text = "Aura"
	reference_tool_aura.tool_texture = load("res://resources/images/tools/tool_aura.png")
	reference_tool_aura.tool_description = TextRepo.aura_description
	reference_pages.set("Aura", reference_tool_aura)
	
	var reference_tool_mouth = ReferenceBookPage.new()
	reference_tool_mouth.page_layout = 2
	reference_tool_mouth.title_text = "Mouth"
	reference_tool_mouth.tool_texture = load("res://resources/images/tools/tool_mouth.png")
	reference_tool_mouth.tool_description = TextRepo.mouth_description
	reference_pages.set("Mouth", reference_tool_mouth)
	
	var reference_tool_scale = ReferenceBookPage.new()
	reference_tool_scale.page_layout = 2
	reference_tool_scale.title_text = "Scale"
	reference_tool_scale.tool_texture = load("res://resources/images/tools/tool_scales.png")
	reference_tool_scale.tool_description = TextRepo.scales_description
	reference_pages.set("Scale", reference_tool_scale)
