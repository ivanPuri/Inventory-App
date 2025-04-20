import 'package:flutter/material.dart';
import 'package:inventory/Widgets/BoatHouse.dart';

class Boathouse extends StatelessWidget {

  const Boathouse({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildGridItem(context, 'Boats', Boats()),
        _buildGridItem(context, 'Oars/Sculls', Placeholder()),
        _buildGridItem(context, 'Rigging', Placeholder()), 
        _buildGridItem(context, 'Maintenance', Placeholder()),
        _buildGridItem(context, 'Cox Equipment', Placeholder()),
        _buildGridItem(context, 'Storage', Placeholder()),
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
  const Bellefield({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildGridItem(context, 'Concept2', Placeholder()),
        _buildGridItem(context, 'RP3', Placeholder()),
        _buildGridItem(context, 'Lifting', Placeholder()),
        _buildGridItem(context, 'Technology', Placeholder()),
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