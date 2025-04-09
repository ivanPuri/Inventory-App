import 'package:flutter/material.dart';
import 'package:inventory/service/inventory_service.dart';

class Boats extends StatefulWidget {
  const Boats({super.key});

  @override
  State<Boats> createState() => _BoatsState();
}

class _BoatsState extends State<Boats> {

  final _service = Service();
  List<dynamic> _boats = [];

   @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _service.fetchInventory();
    setState(() {
      _boats = _service.getBoats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Boats')),
      body: _boats.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _boats.length,
              itemBuilder: (context, index) {
                final boat = _boats[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(boat['name'] ?? 'Unnamed Boat'),
                    subtitle: Text(boat['condition'] ?? 'No condition info'),
                  ),
                );
              },
            ),
    );
  }
}