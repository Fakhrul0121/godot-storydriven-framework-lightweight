class_name CheckItemCommand extends BaseEventCommand

enum OPERATION {
	EQUAL,
	MORE_THAN,
	LESS_THAN,
	MORE_THAN_EQUAL,
	LESS_THAN_EQUAL,
	IS_NOT
}

@export var item_checked: BaseItem
@export var comparison_count: int
@export var operation: OPERATION = OPERATION.EQUAL

@export_category("next id")
@export var if_true: String
@export var if_false: String

func emit_command() -> String:
	var item_count = 0 if !InventoryManager.current_inventory.has(item_checked) else InventoryManager.current_inventory[item_checked]
	return if_true if check_item(item_count) else if_false
	
func check_item(item_count) -> bool:
	match operation:
		OPERATION.EQUAL:
			return item_count == comparison_count
		OPERATION.MORE_THAN:
			return item_count > comparison_count
		OPERATION.LESS_THAN:
			return item_count < comparison_count
		OPERATION.MORE_THAN_EQUAL:
			return item_count >= comparison_count
		OPERATION.LESS_THAN_EQUAL:
			return item_count <= comparison_count
		OPERATION.IS_NOT:
			return item_count != comparison_count
	return false
