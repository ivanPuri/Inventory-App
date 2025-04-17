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
  bool _loading = true;
  int _selectedIndex = 1;
  

   @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _service.fetchInventory();
    setState(() {
      _boats = _service.getBoats();
      _loading = false;

    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // update the boats list based on the selected tab
      if (index == 0) {
        _boats = _service.getMensBoats();
      } else if (index == 1) {
        _boats = _service.getBoats();
      } else {
        _boats = _service.getWomensBoats();
      }
    });
  }
  
  @override
  Widget build(BuildContext context){

    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

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

      // Body
      body: _selectedIndex == 0 ?  BoatsDisplay(boats: _boats, isList: _isList)
            : _selectedIndex == 1 ?  BoatsDisplay(boats: _boats, isList: _isList)
            : BoatsDisplay(boats: _boats, isList: _isList)

     
     
     
       

    );
  }

}

class BoatsDisplay extends StatefulWidget {
  final List<dynamic> boats;
  final bool isList;
  const BoatsDisplay({super.key, required this.boats, required this.isList});

  @override
  State<BoatsDisplay> createState() => _BoatsDisplayState();
}

class _BoatsDisplayState extends State<BoatsDisplay> {
  late List<dynamic> input;
  late bool isList;


  @override
  void initState(){
    super.initState();
    input = List.from(widget.boats);
    isList = widget.isList;
  }

  @override
  void didUpdateWidget(covariant BoatsDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.boats != widget.boats || oldWidget.isList != widget.isList) {
      setState(() {
        input = List.from(widget.boats);
        isList = widget.isList;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return 
    // List View
    isList == true ? 
      ListView.builder(
          itemCount: input.length,
          itemBuilder: (context, index) {
          final boat = input[index];
          return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: boat["Brand"] == "Vespoli" ? Image.asset("assets/vespoli.png")
                        : boat["Brand"] == "King" ? Image.asset("assets/king.png")
                        : boat["Brand"] == "Wintech" ? Image.asset("assets/wintech.png")
                        : boat["Brand"] == "Kaschper" ? Image.asset("assets/kaschper.jpeg")
                        : boat["Brand"] == "Empacher" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/empacher.png"))
                        : SizedBox(),
                        title: Text("${ boat["name"] ?? 'Null Name' }"),
                        trailing: Text(" ${boat["Wrench-Size"] ?? 'Null Wrench'}"),
                      ),
                    );
          }
      ) 

      // GridView
      : 
      GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1
                  ),
                  itemCount: input.length,
                  itemBuilder: (context, index) {
                  final boat = input[index];
                  return Card(
                    margin: EdgeInsets.all(7),
                    child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            boat["Brand"] == "Vespoli" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/vespoli.png"))
                          : boat["Brand"] == "King" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/king.png"))
                          : boat["Brand"] == "Wintech" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/wintech.png"))
                          : boat["Brand"] == "Kaschper" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/kascpher.jpeg"))
                          : boat["Brand"] == "Empacher" ? SizedBox(height: 90, width: 90, child: Image.asset("assets/empacher.png"))
                          : SizedBox(),                      
                            Text("${ boat["name"] ?? 'Null Name'}",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            Text(" ${boat["Wrench-Size"] ?? 'Null Wrench'}"
                              , style: TextStyle(fontSize: 15)),                           
                          ],                      
                      )
                    )                  
                  );
                }
              );

    
  }
}








