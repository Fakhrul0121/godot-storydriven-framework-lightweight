class_name BaseItem extends Resource

enum ITEM_TYPE {
	
}

@export var item_name: String
@export_multiline var item_description: String
@export var item_icon: Texture
@export var item_type: ITEM_TYPE
