import 'package:inventory/model/Inventory_Item.dart';

enum Gender {mens, womens}

class Boat extends InventoryItem {

  final String name;
  final String brand;
  final String wrenchSize;
  final Gender gender;

  Boat({
    required this.name,
    required this.brand,
    required this.wrenchSize,
    required this.gender,
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

