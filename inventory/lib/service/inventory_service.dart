import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {


  Map<String, dynamic>? _inventory;
  Map<String, dynamic>? _boathouse;
  Map<String, dynamic>? _ergroom;


  //? fetchInventory is being used in Ape 
  Future<void> fetchInventory() async {
    final url = "https://raw.githubusercontent.com/ivanPuri/Inventory-App/refs/heads/main/inventory/assets/inventory.json";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      _inventory = json.decode(response.body);
      _boathouse = _inventory?['Boathouse'];
      _ergroom = _inventory?['Ergroom'];
    } else {
      throw Exception('Failed to load inventory');
    }
  }

  //!getBoats will become depracated
  List<dynamic> getBoats() {
    List<dynamic> allBoats = [];
    final mensBoats = _boathouse?['Boats']?['Mens'];
    final womensBoats = _boathouse?['Boats']?['Womens'];
    final smallBoats = _boathouse?["Boats"]?["Smallboats"];

    // Check for null before adding
    if (mensBoats != null) {
      allBoats.addAll(mensBoats['Eights'] ?? []);
      allBoats.addAll(mensBoats['Fours'] ?? []);
    }

    if (womensBoats != null) {
      allBoats.addAll(womensBoats['Eights'] ?? []);
      allBoats.addAll(womensBoats['Fours'] ?? []);
    }

    if (smallBoats != null) {
      allBoats.addAll(smallBoats['Singles'] ?? []);
      allBoats.addAll(smallBoats['Doubles'] ?? []);
    }

    return allBoats;
  }

  //? Get Oars is being used in Ape 
  List<dynamic> getOars() {
    List<dynamic> allOars = [];
    final mSweeping = _boathouse?['Oars']?['Sweeping']["Mens"] ?? [];
    final wSweeping = _boathouse?['Oars']?['Sweeping']["Womens"] ?? [];
    final sculling = _boathouse?['Oars']?['sculling'] ?? [];


    allOars.add(mSweeping);
    allOars.add(wSweeping);
    allOars.add(sculling);

    return allOars;
  }

  //? Get Riggors is being used in Ape 
  List<dynamic> getRiggors() {
    return _boathouse?['Rigging']["Riggors"] ?? [];
  }

  //? Get Riggors is being used in Ape 
  Map<String,List<dynamic>> getRestofRigging(){
    return _boathouse?['Rigging'] ?? [];
  }

  //? Get Maintenance is being used in Ape
  Map<String,int> getMaintenance() {
    return _boathouse?['Maintenance']["Wrenches"] ?? [];
  }

  //? Get Cox is being used in Ape
  Map<String,dynamic> getCox() {
    return _boathouse?['Coxswain'] ?? [];
  }

  //? Get Storage is being used in Ape
  Map<String,dynamic> getStorage() {
    return _boathouse?['Storage'] ?? [];
  }

  Map<String, dynamic>? getErgRoom(){
    return _ergroom;
  }
  //! will be deprecated
  List<dynamic> getMensBoats(){
    List<dynamic> output = [];
    final mensBoats = _boathouse?['Boats']?['Mens'];
    if (mensBoats != null) {
      output.addAll(mensBoats['Eights'] ?? []);
      output.addAll(mensBoats['Fours'] ?? []);
    }

    
    return output;
  }

   List<dynamic> getWomensBoats(){
    List<dynamic> output = [];
    final womensBoats = _boathouse?['Boats']?['Womens'];
    if (womensBoats != null) {
      output.addAll(womensBoats['Eights'] ?? []);
      output.addAll(womensBoats['Fours'] ?? []);
    }
    return output;
  }

  


  // Getters for the private variables
  Map<String, dynamic>? get boathouse => _boathouse;
  Map<String, dynamic>? get ergroom => _ergroom;
  Map<String, dynamic>? get inventory => _inventory;

}
