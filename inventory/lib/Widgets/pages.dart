import 'package:flutter/material.dart';
import 'package:inventory/Widgets/bellefield.dart';
import 'package:inventory/Widgets/boat_house.dart';
import 'package:inventory/service/ape_service.dart';

class Boathouse extends StatelessWidget {
  final Ape ape;

  const Boathouse({
    super.key,
    required this.ape
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildGridItem(context, 'Boats', Boats(ape: ape)),
        _buildGridItem(context, 'Oars/Sculls', Oars(ape: ape)),
        _buildGridItem(context, 'Rigging', Riggers(ape: ape)), 
        _buildGridItem(context, 'Maintenance', Maintenance(ape: ape)),
        _buildGridItem(context, 'Cox Equipment', Cox(ape: ape)),
        _buildGridItem(context, 'Storage', Storage(ape: ape)),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, String label, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFB81C),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 24, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Bellefield extends StatelessWidget {
  final Ape ape;

  const Bellefield({super.key,required this.ape});


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildGridItem(context, 'Concept2', C2(ape: ape)),
        _buildGridItem(context, 'RP3', RP3(ape: ape)),
        _buildGridItem(context, 'Weights', Weights(ape: ape)),
        _buildGridItem(context, 'Bars', Bars(ape: ape)),
        _buildGridItem(context, 'Tablets', Tablet(ape: ape)),

      ],
    );
  }

  Widget _buildGridItem(BuildContext context, String label, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFB81C),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 24, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}