// Abstracted Parser for Equipment

import 'package:inventory/model/boat.dart';
import 'package:inventory/model/count_item.dart';
import 'package:inventory/model/oar.dart';
import 'package:inventory/service/inventory_service.dart';
import 'package:inventory/model/inventory_item.dart';


class Ape{
  
  final Service _service;

  late final Map<String, Boat> boats;
  late final Map<String, List<InventoryItem>> countsByInventoryType;

  Ape(this._service){
    countsByInventoryType = {};
    boats = {};
  }

  Future<void> initialize() async {
    await _service.fetchInventory();
    _parseBoats();
    _parseRiggors();
    _parseRiggING();
    _parseCox();
    _parseMaintenance();
    _parseStorage();
    _parseConcept2();
    _parseRP3();
    _parseWeights();
    _parseOars();
  }
  
  _parseBoats() {
      List<Boat> allBoats = [];
      final mens = _service.boathouse?["Boats"]!['Mens'];
      final womens = _service.boathouse?["Boats"]!['Womens'];
      final smallboats = _service.boathouse?["Boats"]!['Smallboats'];

      allBoats.addAll(_extractBoats(mens, Gender.mens));
      allBoats.addAll(_extractBoats(womens, Gender.womens));
      allBoats.addAll(_extractBoats(smallboats, Gender.smallboats));
      
      for (Boat boat in allBoats) {
        boats[boat.name] = boat;
      }

        
  }

  List<List<Oar>> _parseOars() {

    final List<dynamic> oars = _service.getOars();
    final List<Oar> mensList = [];
    final List<Oar> womensList = [];
    final List<Oar> sculling = [];
    final List<InventoryItem> inventoryAdd = [];
    countsByInventoryType["Oars"] = inventoryAdd;

    for (int i = 0; i < oars.length; i++) {
      
      switch (i) {
        case 0:
          for (final oar in oars[i]) {
            Oar newOar = Oar(name: oar["name"], gender: Gender.mens , type: InventoryType.oar, location: LocationType.boatHouse, count: 1);
            inventoryAdd.add(newOar);
            mensList.add(newOar);
          }
          break;

        case 1:
        for (final oar in oars[i]) {
            Oar newOar = Oar(name: oar["name"], gender: Gender.womens , type: InventoryType.oar, location: LocationType.boatHouse, count: 1);
            inventoryAdd.add(newOar);
            womensList.add(newOar);

          }
          break;

        case 2:
        for (final oar in oars[i]) {
            Oar newOar = Oar(name: oar["name"], gender: Gender.smallboats , type: InventoryType.oar, location: LocationType.boatHouse, count: oar["SetCount"]);
            inventoryAdd.add(newOar);
            sculling.add(newOar);
          }
          break;
      }
      
    }
  

    return [mensList, womensList, sculling];

  }

  _parseRiggors(){

    final List<dynamic> riggors = _service.getRiggors();
    final List<InventoryItem> inventoryAdd = [];
    countsByInventoryType["Rigging"] = inventoryAdd;

    for (Map<String,dynamic> riggor in riggors) {
      String label = riggor["Label"]!;
      String pairing = riggor["pairing"]!;

      Boat boat = boats[pairing]!;
      boat.riggors = label;

      CountItem newRiggor = CountItem(type: InventoryType.rigging, location: LocationType.boatHouse, count: 1, name: label, pairing: pairing);
      inventoryAdd.add(newRiggor);
    }
    
  }

  List<Boat> _extractBoats(Map<dynamic, dynamic> mws, Gender gender) {
  final List<Boat> allBoats = [];
  final List<List<Oar>> allOars = _parseOars();

  mws.forEach((category, mapList) {
    mapList.forEach((boat) {
        Boat newBoat = Boat(
          brand: boat['Brand'],
          name: boat['name'],
          wrenchSize: boat['Wrench-Size'],
          gender: gender, 
          shellType: category == "Eights" ? ShellType.eight : category == "Fours" ? ShellType.four : category == "Singles" ? ShellType.single :category == "Eights" ? ShellType.eight : ShellType.double, 
          oars: gender == Gender.mens ? allOars[0]: gender == Gender.womens ? allOars[1]: allOars[2],
        );
        allBoats.add(newBoat);
    });
  });

  return allBoats;
}

  _parseRiggING(){
    final Map<String,dynamic> dict = _service.getRestofRigging();
    final keys = dict.keys;
    final List<InventoryItem> inventoryAdd = countsByInventoryType["Rigging"]!;

    for(String key in keys){
      if (key != "Riggors"){
        List<dynamic> list = dict[key]!;
        for (dynamic item in list){
          CountItem newItem = CountItem(name: key, type: InventoryType.rigging, location: LocationType.boatHouse, count: item["Count"], brand: item["Brand"]);

          inventoryAdd.add(newItem);
        }
      }
    }

  }

  _parseCox(){
    final Map<String,dynamic> dict = _service.getCox();
    final keys = dict.keys;
    final List<InventoryItem> inventoryAdd = [];
    countsByInventoryType["Cox"] = inventoryAdd;

    for(String key in keys){
      List<dynamic> list = dict[key]!;
      if (key != "Lights"){
        for (dynamic item in list){
          CountItem newItem = CountItem.name(type: InventoryType.coxing, location: LocationType.boatHouse, count: item["Count"], name: key);
          inventoryAdd.add(newItem);
        }
      }else{
        for (dynamic item in list){
          CountItem newItem = CountItem.name(type: InventoryType.coxing, location: LocationType.boatHouse, count: item["Count"], name: item["Name"] + " Lights");
          inventoryAdd.add(newItem);
        }

      }
    }
  }

  _parseMaintenance(){
    final Map<String,dynamic> dict = _service.getMaintenance();
    final keys = dict.keys;
    final List<InventoryItem> inventoryAdd = [];
    countsByInventoryType["Maintenance"] = inventoryAdd;

    for(String key in keys){
      if(key == "10"){
          CountItem newItem = CountItem.name(type: InventoryType.maintenance, location: LocationType.boatHouse, count: dict[key]!, name: "10mm Wrench");
          inventoryAdd.add(newItem);
      }else{
          CountItem newItem = CountItem.name(type: InventoryType.maintenance, location: LocationType.boatHouse, count: dict[key]!, name: "7/16in Wrench");  
          inventoryAdd.add(newItem);
      }
    }
    
  }
  
  _parseStorage(){
    final Map<String,dynamic> dict = _service.getStorage();
    final keys = dict.keys;
    final List<InventoryItem> inventoryAdd = [];
    countsByInventoryType["Storage"] = inventoryAdd;

    for(String key in keys){
      List list = dict[key];
      if (key == "BoatCovers"){
        for (dynamic item in list){
          // Add Pairing Logic
          CountItem newItem = CountItem.name(type: InventoryType.storage, location: LocationType.boatHouse, count: 1, name: key, pairing: item["Pairing"]);
          inventoryAdd.add(newItem);
        }
      }else{
        for (dynamic item in list){
          // Add Pairing Logic
          CountItem newItem = CountItem.name(type: InventoryType.storage, location: LocationType.boatHouse, count: item["Count"]!, name: key);
          inventoryAdd.add(newItem);
        }
      }

    }

  } 

  _parseErgRoom(){
    final Map<String, dynamic> dict = _service.getErgRoom()!;
    final keys = dict.keys;
    final List<InventoryItem> inventoryAdd = [];
    countsByInventoryType["ErgRoom"] = inventoryAdd; 

    for (String key in keys){
      if (key != "Weights"){
        Map<String,dynamic> item = dict[key]!;
        CountItem newItem = CountItem.name(type: InventoryType.ergRoom, location: LocationType.ergRoom, count: item["count"]?? 0 , name: key); 
        inventoryAdd.add(newItem);
      }else{
        List<dynamic> item = dict[key]!;
        for (dynamic weight in item){
          String lb = weight["Weight"];
          CountItem newItem = CountItem.name(type: InventoryType.ergRoom, location: LocationType.ergRoom, count: weight["count"] ?? 0, name: "$lb lb plate");
          inventoryAdd.add(newItem);
        }
        
      }


    }
    
  }

  _parseConcept2(){
    final Map<String,dynamic> dict = _service.getErgRoom()!;
    final keys = dict.keys;
    final List<InventoryItem> inventoryAdd = [];
    countsByInventoryType["C2"] = inventoryAdd;

    for(String key in keys){
      if (key == "C2" || key == "Berg"){
        Map<String,dynamic> list = dict[key]!;
        CountItem newItem = CountItem.name(type: InventoryType.ergRoom, location: LocationType.ergRoom, count: list["Count"], name: key);
        inventoryAdd.add(newItem);
        
      }
    }

  }

  _parseRP3(){
    final Map<String,dynamic> dict = _service.getErgRoom()!;
    final keys = dict.keys;
    final List<InventoryItem> inventoryAdd = [];
    countsByInventoryType["RP3"] = inventoryAdd;

    for(String key in keys){
      if (key == "RP3"){
        Map<String,dynamic> list = dict[key]!;
        print(list["Count"].runtimeType);

        CountItem newItem = CountItem.name(type: InventoryType.ergRoom, location: LocationType.ergRoom, count: list["Count"], name: key);
        inventoryAdd.add(newItem);
        
      }
    }
  }

  _parseWeights(){
    final Map<String,dynamic> dict = _service.getErgRoom()!;
    final keys = dict.keys;
    final List<InventoryItem> inventoryAdd = [];
    countsByInventoryType["Weights"] = inventoryAdd;

    for(String key in keys){
      if (key == "Weights"){
        Map<String, dynamic> weightDict = dict[key]!;
        final weightkeys = weightDict.keys;
        for (String weightKey in weightkeys){
          CountItem newItem = CountItem.name(type: InventoryType.ergRoom, location: LocationType.ergRoom, count: weightDict[weightKey]["Count"], name: weightKey);
          inventoryAdd.add(newItem);
        }
      }
    }
  }

  List<Boat> getMensBoats(){
    List<Boat> mensBoats = [];
    final keys = boats.keys;
    for(String key in keys){
      if (boats[key]?.gender == Gender.mens){
        mensBoats.add(boats[key]!);
      }
    }
    return mensBoats;
  }

  List<Boat> getWomensBoats(){
    List<Boat> womensBoats = [];
    final keys = boats.keys;
    for(String key in keys){
      if (boats[key]?.gender == Gender.womens){
        womensBoats.add(boats[key]!);
      }
    }
    return womensBoats;
  }

  List<Boat> getAllBoats(){
    List<Boat> allBoats = [];
    final keys = boats.keys;
    for(String key in keys){
        allBoats.add(boats[key]!);
    }
    return allBoats;
  }

  List<InventoryItem> getOars(){
    return countsByInventoryType["Oars"]!;

  }

  List<InventoryItem> getRigging(){
    return countsByInventoryType["Rigging"]!;
  }

  List<InventoryItem> getCox(){
    return countsByInventoryType["Cox"]!;
  }

  List<InventoryItem> getMaintenance(){
    return countsByInventoryType["Maintenance"]!;
  }

  List<InventoryItem> getStorage(){
    return countsByInventoryType["Storage"]!;
  }

  List<InventoryItem> getC2(){
    return countsByInventoryType["ErgRoom"]!;
  }

}
