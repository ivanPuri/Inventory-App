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
  int _selectedIndex = 0;
  

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(

      // AppBar
      appBar: AppBar(

          title: GestureDetector(
            child: Center(
              child: Text(
                "Boats",
                style: TextStyle(color: Color(0xffFFB81C))
              )
            ),
            onTap: () => {
              // Go back to Home Page 
            },
          ),

          backgroundColor: Color(0xff003594),
          iconTheme: IconThemeData(
            color: Color(0xffFFB81C),
          ),

          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //! Implement search functionality here
              },
            ),
            IconButton(
              icon: Icon(_isList ? Icons.grid_view_outlined : Icons.list),
              onPressed: () {
                setState(() {
                  _isList = !_isList;
                });
              },
            )
          ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,  // Bind the selected index
        onTap: _onItemTapped,  // Call the function when a tab is tapped
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'Mens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.houseboat),
            label: 'Fleet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'Womens',
          )
        ],  
      ),

       

    );
  }


  // @override

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Boats',
  //       style: TextStyle(color: Color(0xffFFB81C))),
  //       backgroundColor: Color(0xff003594 ),
  //       iconTheme: IconThemeData(
  //         color: Color(0xffFFB81C),
  //       ),
  //       actions: [
  //         IconButton(
  //           icon: Icon(_isList ? Icons.grid_view_outlined : Icons.list),
  //           onPressed: () {
  //             setState(() {
  //               _isList = !_isList;
  //             });
  //           },
  //         ),
  //       ]), 
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: _selectedIndex,  // Bind the selected index
  //       onTap: _onItemTapped,  // Call the function when a tab is tapped
  //       items:  const <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.man),
  //           label: 'Mens',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.search),
  //           label: 'Search',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.elderly_woman),
  //           label: 'Womens',
  //         ),
  //       ],
  //       ),
  //     body: _boats.isEmpty 
            // ? Center(child: CircularProgressIndicator()) 
  //           : _isList ? 
  //               // List View
  //              ListView.builder(
  //                 itemCount: _boats.length,
  //                 itemBuilder: (context, index) {
  //                   final boat = _boats[index];
  //                   return Card(
  //                     margin: EdgeInsets.all(10),
  //                     child: ListTile(
  //                       leading: boat["Brand"] == "Vespoli" ? Image.asset("assets/vespoli.png")
  //                       : boat["Brand"] == "King" ? Image.asset("assets/king.png")
  //                       : boat["Brand"] == "Wintech" ? Image.asset("assets/wintech.png")
  //                       : boat["Brand"] == "Kaschper" ? Image.asset("assets/kaschper.png")
  //                       : boat["Brand"] == "Empacher" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/empacher.png"))
  //                       : SizedBox(),
  //                       title: Text("${ boat["name"] ?? 'Null Name' }"),
  //                       trailing: Text(" ${boat["Wrench-Size"] ?? 'Null Price'}"),
  //                     ),
  //                   );
  //                 }
  //               ) 
  //               // Grid View Needs Work
  //               : GridView.builder(
  //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                     crossAxisCount: 2,
  //                     childAspectRatio: 1.1
  //                 ),
  //                 itemCount: _boats.length,
  //                 itemBuilder: (context, index) {
  //                 final boat = _boats[index];
  //                 return Card(
  //                   margin: EdgeInsets.all(10),
  //                   child: Center(
  //                       child: Column(
  //                         children: [
  //                           SizedBox(height: 20),
  //                           boat["Brand"] == "Vespoli" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/vespoli.png"))
  //                         : boat["Brand"] == "King" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/king.png"))
  //                         : boat["Brand"] == "Wintech" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/wintech.png"))
  //                         : boat["Brand"] == "Kaschper" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/kascpher.png"))
  //                         : boat["Brand"] == "Empacher" ? SizedBox(height: 90, width: 90, child: Image.asset("assets/empacher.png"))
  //                         : SizedBox(),                      
  //                           Text("${ boat["name"] ?? 'Null Name' }",
  //                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
  //                           Text(" ${boat["Wrench-Size"] ?? 'Null Price'}"
  //                             , style: TextStyle(fontSize: 15)),                           
  //                         ],                      
  //                     )
  //                   )                  
  //                 );
  //               }
  //               )
  //   );
  // }

}








