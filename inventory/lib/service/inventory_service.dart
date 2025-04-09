import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  Map<String, dynamic>? _inventory;
  Map<String, dynamic>? _boathouse;
  Map<String, dynamic>? _ergroom;

  // Fetch the inventory data from the remote URL
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

  // Unfiltered search methods, returns full List<dynamic> of items

  List<dynamic> getBoats() {
    List<dynamic> allBoats = [];
    final mensBoats = _boathouse?['Boats']?['Mens'];
    final womensBoats = _boathouse?['Boats']?['Womens'];

    // Check for null before adding
    if (mensBoats != null) {
      allBoats.addAll(mensBoats['Eights'] ?? []);
      allBoats.addAll(mensBoats['Fours'] ?? []);
      allBoats.addAll(mensBoats['SmallBoats'] ?? []);
      allBoats.addAll(mensBoats['Singles'] ?? []);
    }

    if (womensBoats != null) {
      allBoats.addAll(womensBoats['Eights'] ?? []);
      allBoats.addAll(womensBoats['Fours'] ?? []);
      allBoats.addAll(womensBoats['SmallBoats'] ?? []);
      allBoats.addAll(womensBoats['Singles'] ?? []);
    }

    return allBoats;
  }

  List<dynamic> getOars() {
    List<dynamic> allOars = [];
    final sweeping = _boathouse?['Oars']?['Sweeping'] ?? [];
    final sculling = _boathouse?['Oars']?['Sculling'] ?? [];

    allOars.addAll(sweeping);
    allOars.addAll(sculling);

    return allOars;
  }

  List<dynamic> getRigging() {
    List<dynamic> allRigging = [];
    final riggors = _boathouse?['Rigging']?['Riggors'] ?? [];
    final oarlocks = _boathouse?['Rigging']?['Oarlocks'] ?? [];
    final shoes = _boathouse?['Rigging']?['Shoes'] ?? [];
    final footStretchers = _boathouse?['Rigging']?['Footstretchers'] ?? [];
    final tracks = _boathouse?['Rigging']?['Tracks'] ?? [];
    final seats = _boathouse?['Rigging']?['Seats'] ?? [];

    allRigging.addAll(riggors);
    allRigging.addAll(oarlocks);
    allRigging.addAll(shoes);
    allRigging.addAll(footStretchers);
    allRigging.addAll(tracks);
    allRigging.addAll(seats);

    return allRigging;
  }

  List<dynamic> getMaintenance() {
    List<dynamic> allMaintenance = [];
    final bolts = (_boathouse?['Maintenance']?['10mm']?['Bolts'] ?? [])..addAll(_boathouse?['Maintenance']?['7/16']?['Bolts'] ?? []);
    final nuts = (_boathouse?['Maintenance']?['10mm']?['Nuts'] ?? [])..addAll(_boathouse?['Maintenance']?['7/16']?['Nuts'] ?? []);
    final washers = (_boathouse?['Maintenance']?['10mm']?['Washers'] ?? [])..addAll(_boathouse?['Maintenance']?['7/16']?['Washers'] ?? []);
    final screws = (_boathouse?['Maintenance']?['10mm']?['Screws'] ?? [])..addAll(_boathouse?['Maintenance']?['7/16']?['Screws'] ?? []);
    final lockWashers = (_boathouse?['Maintenance']?['10mm']?['LockWashers'] ?? [])..addAll(_boathouse?['Maintenance']?['7/16']?['LockWashers'] ?? []);
    final wrenches = (_boathouse?['Maintenance']?['10mm']?['Wrenches'] ?? [])..addAll(_boathouse?['Maintenance']?['7/16']?['Wrenches'] ?? []);
    final tapes = _boathouse?['Maintenance']?['Tapes'] ?? [];

    allMaintenance.addAll(bolts);
    allMaintenance.addAll(nuts);
    allMaintenance.addAll(washers);
    allMaintenance.addAll(screws);
    allMaintenance.addAll(lockWashers);
    allMaintenance.addAll(wrenches);
    allMaintenance.addAll(tapes);

    return allMaintenance;
  }

  List<dynamic> getCox() {
    List<dynamic> allCox = [];
    final cox = _boathouse?['Coxswain']?['Lights'] ?? [];
    final coxBoxes = _boathouse?['Coxswain']?['CoxBox'] ?? [];
    final speedcoach = _boathouse?['Coxswain']?['SpeedCoach'] ?? [];

    allCox.addAll(cox);
    allCox.addAll(coxBoxes);
    allCox.addAll(speedcoach);

    return allCox;
  }

  List<dynamic> getStorage() {
    List<dynamic> allStorage = [];
    final boatBag = _boathouse?['Storage/Transport']?['BoatBag'] ?? [];
    final covers = _boathouse?['Storage/Transport']?['BoatCovers'] ?? [];
    final slings = _boathouse?['Storage/Transport']?['Slings'] ?? [];
    final straps = _boathouse?['Storage/Transport']?['Straps'] ?? [];

    allStorage.addAll(boatBag);
    allStorage.addAll(covers);
    allStorage.addAll(slings);
    allStorage.addAll(straps);

    return allStorage;
  }

  List<dynamic> getC2() {
    List<dynamic> allC2 = [];
    final c2 = _ergroom?['C2'] ?? [];
    final bergs = _ergroom?['Bergs'] ?? [];

    allC2.addAll(c2);
    allC2.addAll(bergs);

    return allC2;
  }

  List<dynamic> getRP3() {
    return _ergroom?['RP3'] ?? [];
  }

  List<dynamic> getLifting() {
    List<dynamic> allLifting = [];
    final weights = _ergroom?['Weights'] ?? [];
    final bars = _ergroom?['Bars'] ?? [];

    allLifting.addAll(weights);
    allLifting.addAll(bars);

    return allLifting;
  }

  Map<String, dynamic> getTablets() {
    return _ergroom?['tablets'] ?? {};
  }
}
