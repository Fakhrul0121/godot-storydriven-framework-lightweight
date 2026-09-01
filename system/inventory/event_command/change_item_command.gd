class_name ChangeItemCommand extends BaseEventCommand

@export var item: BaseItem
@export var count: int

@export var next_id: String

func emit_command() -> String:
	InventoryManager.current_inventory[item] += count
	if InventoryManager.current_inventory[item] <= 0:
		InventoryManager.current_inventory.erase(item)
	
	return next_id
