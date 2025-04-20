// ignore_for_file: file_names
enum LocationType {boatHouse, ergRoom}
enum InventoryType {boat, oar, rigging, coxing, maintenance, ergRoom, storage}

abstract class InventoryItem {
  final InventoryType type;     
  final String subCategory;     // e.g., "Mens Eights", "Womens Fours"
  final LocationType location;  

  InventoryItem({
    required this.type,
    required this.subCategory,
    required this.location,
  });

  Map<String, dynamic> toMap(); 
}
