import 'package:flutter/material.dart';
import 'package:inventory/model/boat.dart';
import 'package:inventory/model/inventory_item.dart';
import 'package:inventory/service/ape_service.dart';

class Boats extends StatefulWidget {
  final Ape ape;

  const Boats({super.key, required this.ape});

  @override
  State<Boats> createState() => _BoatsState();
}

class _BoatsState extends State<Boats> {
  final List<dynamic> _boats = [1,2,3];
  bool _isList = true;
  bool _loading = true;
  int _selectedIndex = 1;
  

   @override
  void initState() {
    super.initState();
    _loading = false;
    _boats[0] = widget.ape.getMensBoats();
    _boats[1] = widget.ape.getAllBoats();
    _boats[2] = widget.ape.getWomensBoats();
  }

  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
              //! Go back to Home Page 
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
      body: _selectedIndex == 0 ?  BoatsDisplay(boats: _boats[_selectedIndex], isList: _isList)
            : _selectedIndex == 1 ?  BoatsDisplay(boats: _boats[_selectedIndex], isList: _isList)
            : BoatsDisplay(boats: _boats[_selectedIndex], isList: _isList)

     
     
     
       

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
                      margin: EdgeInsets.all(9),
                      child: GestureDetector(
                        child: ListTile(
                          leading: boat.brand == "Vespoli" ? Image.asset("assets/vespoli.png")
                          : boat.brand == "King" ? Image.asset("assets/king.png")
                          : boat.brand == "Wintech" ? Image.asset("assets/wintech.png")
                          : boat.brand == "Kaschper" ? Image.asset("assets/kaschper.jpeg")
                          : boat.brand == "Empacher" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/empacher.png"))
                          : SizedBox(),
                          title: Text("${ boat.name ?? 'Null Name' }"),
                          trailing: Text(boat.shellType == ShellType.eight ? "8+" : boat.shellType == ShellType.four ? "4+" : boat.shellType == ShellType.double ? "2x" : boat.shellType == ShellType.single ? "1x" : "Null Type",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ),
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                            ),
                            backgroundColor: Colors.white,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min, // Makes it wrap content height
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                    ),
                                    Image.asset("assets/carhart.png", height: 80),
                                    SizedBox(height: 12),
                                    Text(boat.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    Text("Brand: ${boat.brand!}", style: TextStyle(fontSize: 15),),
                                    Text("Wrench Size: ${boat.wrenchSize!}", style: TextStyle(fontSize: 15),),
                                    Text("Gender: ${boat.gender == Gender.mens ? "Mens" : "Womens"}", style: TextStyle(fontSize: 15),),
                                    Text("Shell Size: ${boat.shellType == ShellType.eight ? "8+" : boat.shellType == ShellType.four ? "4+": boat.shellType == ShellType.double ? "2x" : "1x"}", style: TextStyle(fontSize: 15),),
                                    Text("Riggers: ${boat.riggors == "" ? "N/A": boat.riggors}", style: TextStyle(fontSize: 15),),
                                    Text("Oars: ${boat.oars}", style: TextStyle(fontSize: 15),),



                                    SizedBox(height: 25),
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff003594),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      ),
                                      child: Text("Close"),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      )
                       
                    );
          }
      )  

      // GridView
      : 
      GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      

                  ),
                  itemCount: input.length,
                  itemBuilder: (context, index) {
                  final boat = input[index];
                  return Card(
                    margin: EdgeInsets.all(7),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            boat.brand == "Vespoli" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/vespoli.png"))
                          : boat.brand == "King" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/king.png"))
                          : boat.brand == "Wintech" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/wintech.png"))
                          : boat.brand == "Kaschper" ? SizedBox(height: 50, width: 50, child: Image.asset("assets/kaschper.jpeg"))
                          : boat.brand == "Empacher" ? SizedBox(height: 50, width: 90, child: Image.asset("assets/empacher.png"))
                          : SizedBox(),                      
                            Text("${ boat.name ?? 'Null Name'}",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            Text(style: TextStyle(fontSize: 15),
                            boat.shellType == ShellType.eight ? "8+" : boat.shellType == ShellType.four ? "4+" : boat.shellType == ShellType.double ? "2x" : boat.shellType == ShellType.single ? "1x" : "Null Type"
                            ),


                            Text(" ${boat.wrenchSize ?? 'Null Wrench'}", style: TextStyle(fontSize: 12)), 
                                                        
                          ],                      
                      )
                    )                  
                  );
                }
              );

    
  }
}

class Oars extends StatefulWidget {
  final Ape ape;

  const Oars({super.key, required this.ape});

  @override
  State<Oars> createState() => _OarsState();
}

class _OarsState extends State<Oars> {
  bool _isList = true;
  bool _loading = true;

   @override
  void initState() {
    super.initState();
    _loading = false;
  }


  @override
  Widget build(BuildContext context) {
    if (_loading){
       return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(

          title: GestureDetector(
            child: Center(
              child: Text(
                "Oars",
                style: TextStyle(color: Color(0xffFFB81C))
              )
            ),
            onTap: () => {
              //! Go back to Home Page 
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

      // Body
      body: InventoryItemDisplay(items: widget.ape.getOars(), isList: _isList,)
      );
  }
}

// !----------------------------------------------------------------------

class InventoryItemDisplay extends StatefulWidget {
  final bool isList;
  final List<dynamic> items;
  
  const InventoryItemDisplay({super.key, required this.items, required this.isList});

  @override
  State<InventoryItemDisplay> createState() => _InventoryItemDisplayState();
}

// !----------------------------------------------------------------------

class _InventoryItemDisplayState extends State<InventoryItemDisplay> {
  late List<dynamic> input;
  late bool isList;


  @override
  void initState(){
    super.initState();
    input = List.from(widget.items);
    isList = widget.isList;
  }

  @override
  void didUpdateWidget(covariant InventoryItemDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items || oldWidget.isList != widget.isList) {
      setState(() {
        input = List.from(widget.items);
        isList = widget.isList;
      });
    }
  }
  


  @override
  Widget build(BuildContext context) {
    return  
    // !List View
    isList == true ? 
      ListView.builder(
          itemCount: input.length,
          itemBuilder: (context, index) {
          final item = input[index];
          InventoryType inventoryType = item.type;

          if (inventoryType == InventoryType.oar){
            return Card(
                      margin: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: ListTile(
                          leading: Image.asset("assets/carhart.png"),
                          title: Text("${item.name}"),
                          trailing: Text(item.gender == Gender.mens ? "Mens" : item.gender == Gender.womens ? "Womens" : "Sculling"),
                        ),
                        onTap: (){
                          //  Add functionality
                        }
                      )
                       
                    );
          }else{
            return Text("Shiiiii man");
          }
          //Rest of inventoryTypes
                        



          }
      )  




      // !GridView
      : 
      GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1
                  ),
                  itemCount: input.length,
                  itemBuilder: (context, index) {
                  final item = input[index];
                  final inventoryType = item.type;
                  
                   if (inventoryType == InventoryType.oar){
                      return Card(
                                margin: EdgeInsets.all(7),
                                child: Center(
                                  child: GestureDetector(
                                    child: Column(
                                      children: [
                                        // SizedBox(height: ),
                                        Image.asset("assets/carhart.png",
                                          height: 70,
                                          width: 70,
                                        ),
                                        Text(item.name,
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                                        Text(
                                          item.gender == Gender.mens ? "Mens" : item.gender == Gender.womens ? "Womens" : "SmallBoats"
                                        ),
                                        Text(
                                          (item.gender == Gender.mens || item.gender == Gender.womens) ? "Sweeping" : "Sculling"
                                        )
                                         
                                      ]      
                                  ),
                                    onTap: (){
                                      //  Add functionality
                                    },
                                )
                                
                                )
                              );
                    }
                }
              );

  }
}

                                 