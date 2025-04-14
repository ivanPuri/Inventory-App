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
  bool _isList = true;

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
      appBar: AppBar(
        title: Text('Boats',
        style: TextStyle(color: Color(0xffFFB81C))),
        backgroundColor: Color(0xff003594 ),
        iconTheme: IconThemeData(
          color: Color(0xffFFB81C),
        ),
        actions: [
          IconButton(
            icon: Icon(_isList ? Icons.grid_view_outlined : Icons.list),
            onPressed: () {
              setState(() {
                _isList = !_isList;
              });
            },
          ),
        ],),
      body: _boats.isEmpty 
            ? Center(child: CircularProgressIndicator()) 
            : _isList ? 
               ListView.builder(
                  itemCount: _boats.length,
                  itemBuilder: (context, index) {
                    final boat = _boats[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: boat["Brand"] == "Vespoli" ? Image.asset("assets/vespoli.png")
                        : boat["Brand"] == "King" ? Image.asset("assets/king.png")
                        : boat["Brand"] == "Wintech" ? Image.asset("assets/wintech.png")
                        : boat["Brand"] == "Kaschper" ? Image.asset("assets/kaschper.png")
                        : boat["Brand"] == "Empacher" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/empacher.png"))
                        : SizedBox(),
                        title: Text("${ boat["name"] ?? 'Null Name' }"),
                        trailing: Text(" ${boat["Wrench-Size"] ?? 'Null Price'}"),
                      ),
                    );
                  }
                )
                // Grid View Needs Work
                : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1
                  ),
                  itemCount: _boats.length,
                  itemBuilder: (context, index) {
                  final boat = _boats[index];
                  return Card(
                    margin: EdgeInsets.all(6),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: ListTile(
                      title: Text("${ boat["name"] ?? 'Null Name' }")
                    )
                      )
                      
                    )
                    
                  );
                }
                )

      
      
      

    );
  }
}