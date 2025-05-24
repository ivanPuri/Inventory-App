import 'package:inventory/model/inventory_item.dart';

class CountItem extends InventoryItem {

  String name;
  int count;
  String brand;

  CountItem({
    this.name = "",
    this.brand = "",
    required super.type,
    required super.location,
    required this.count
  });

  CountItem.name({
    this.brand = "",
    required this.name,
    required super.type,
    required super.location,
    required this.count
  });

  CountItem.brand({
    required this.name,
    required this.brand,
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
  