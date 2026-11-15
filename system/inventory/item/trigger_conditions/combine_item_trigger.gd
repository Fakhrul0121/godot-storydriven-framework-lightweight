class_name CombineItemTrigger extends BaseItemTrigger

@export_category("Combine Trigger Conditions")
@export var required_items: Dictionary[BaseItem, int]


func check_trigger_conditions() -> bool:
    return check_required_items_in_inventory()

func check_required_items_in_inventory() -> bool:
    for item in required_items:
        if not InventoryManager.check_item_requirement(item.key, item.value):
            return false
    return true