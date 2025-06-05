// ignore_for_file: file_names

enum LocationType {boatHouse, ergRoom}
enum InventoryType {boat, oar, rigging, coxing, maintenance, storage, c2, rp3, weights, tablet, bars}

abstract class InventoryItem {
  final InventoryType type;          
  final LocationType location;  

  InventoryItem({
    required this.type,
    required this.location,
  });

  Map<String, dynamic> toMap(); 
}
