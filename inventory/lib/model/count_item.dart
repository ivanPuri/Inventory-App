import 'package:inventory/model/Inventory_Item.dart';

class CountItem extends InventoryItem {

  String name;
  int count;

  CountItem({
    this.name = "",
    required super.type,
    required super.location,
    required this.count
  });

  CountItem.name({
    required this.name,
    required super.type,
    required super.location,
    required this.count
  });
  
  
  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
  