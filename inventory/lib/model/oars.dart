import 'package:inventory/model/Inventory_Item.dart';

class Oars extends InventoryItem {
  final String name;
  final String pairing;

  Oars({
    required this.name,
    required this.pairing,
    required super.type,
    required super.subCategory,
    required super.location
  });
  
  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
  