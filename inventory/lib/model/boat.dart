import 'package:inventory/model/Inventory_Item.dart';
import 'package:inventory/model/oar.dart';

enum Gender {mens, womens, smallboats}
enum ShellType {eight, four, double, single}

class Boat extends InventoryItem {

  String name;
  String brand;
  String wrenchSize;
  Gender gender;
  ShellType shellType;
  List<Oar> oars = [];
  String riggors;

  Boat({
    required this.name,
    required this.brand,
    required this.wrenchSize,
    required this.gender,
    required this.shellType,
    this.oars = const [],
    this.riggors = "",
    super.type = InventoryType.boat,
    super.location = LocationType.boatHouse
  });


  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
 



  
}

