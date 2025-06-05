import 'package:flutter/material.dart';
import 'package:inventory/Widgets/boat_house.dart';
import 'package:inventory/service/ape_service.dart';
import 'package:inventory/model/inventory_item.dart';

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

// C2

class C2 extends StatefulWidget {
  final Ape ape;
  const C2({super.key, required this.ape});

  @override
  State<C2> createState() => _C2State();
}

class _C2State extends State<C2> {
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
                "Concept 2",
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
      body: BelfDisplay(isList: _isList, items: widget.ape.getC2()),
      );
  }
  
}


// ----------------------------------------------------------------------
// ----------------------------------------------------------------------


// RP3

class RP3 extends StatefulWidget {
  final Ape ape;
  const RP3({super.key, required this.ape});

  @override
  State<RP3> createState() => _RP3State();
}

class _RP3State extends State<RP3> {
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
                "RP3",
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
      body: BelfDisplay(isList: _isList, items: widget.ape.getRP3()),
      );
  }
  
}


// ----------------------------------------------------------------------
// ----------------------------------------------------------------------


// Weights

class Weights extends StatefulWidget {
  final Ape ape;
  const Weights({super.key, required this.ape});

  @override
  State<Weights> createState() => _WeightsState();
}

class _WeightsState extends State<Weights> {
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
                "Weights",
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
      body: BelfDisplay(isList: _isList, items: widget.ape.getWeights()),
      );
  }
  
}


// ----------------------------------------------------------------------
// ----------------------------------------------------------------------


// Bars

class Bars extends StatefulWidget {
  final Ape ape;
  const Bars({super.key, required this.ape});

  @override
  State<Bars> createState() => _BarsState();
}

class _BarsState extends State<Bars> {
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
                "Barbell",
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
      body: BelfDisplay(isList: _isList, items: widget.ape.getBars()),
      );
  }
  
}


// ----------------------------------------------------------------------
// ----------------------------------------------------------------------


// Tablet

class Tablet extends StatefulWidget {
  final Ape ape;
  const Tablet({super.key, required this.ape});

  @override
  State<Tablet> createState() => _TabletState();
}

class _TabletState extends State<Tablet> {
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
                "Tablets",
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
      body: BelfDisplay(isList: _isList, items: widget.ape.getTablet()),
      );
  }
  
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------


// ErgRoomDisplay

class BelfDisplay extends StatefulWidget {
  final bool isList;
  final List<dynamic> items;

  const BelfDisplay({super.key, required this.isList, required this.items});

  @override
  State<BelfDisplay> createState() => _BelfDisplayState();
}

class _BelfDisplayState extends State<BelfDisplay> {
  late List<dynamic> input;
  late bool isList;


  @override
  void initState(){
    super.initState();
    input = List.from(widget.items);
    isList = widget.isList;
  }

  @override
  void didUpdateWidget(covariant BelfDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items || oldWidget.isList != widget.isList) {
      setState(() {
        input = List.from(widget.items);
        isList = widget.isList;
      });
    }
  }

  void _c2Modal(dynamic item){
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context){
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Image.asset("assets/ergdata_icon.png", height: 80,),
              SizedBox(height: 12),
              Text(item.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Name: ${item.name}", style: TextStyle(fontSize: 15),),
              Text("Inventory Count: ${item.count}", style: TextStyle(fontSize: 15),),
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
      }
    );
  }

  void _rp3Modal(dynamic item){
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context){
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Image.asset("assets/rp3logo.png", height: 80,),
              SizedBox(height: 12),
              Text(item.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Name: ${item.name}", style: TextStyle(fontSize: 15),),
              Text("Inventory Count: ${item.count}", style: TextStyle(fontSize: 15),),
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
      }
    );
  }

  void _weightModal(dynamic item){
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context){
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Image.asset("assets/ergdata_icon.png", height: 80,),
              SizedBox(height: 12),
              Text(item.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Name: ${item.name}", style: TextStyle(fontSize: 15),),
              Text("Inventory Count: ${item.count}", style: TextStyle(fontSize: 15),),
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
      }
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return 

    isList == true ?
    ListView.builder(
      itemCount: input.length,
      itemBuilder: (context, index) {
        final item = input[index];
        InventoryType inventoryType = item.type;
        

        
          // C2 Display
          if (inventoryType == InventoryType.c2){
            return Card(
                      margin: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: ListTile(
                          leading: Image.asset("assets/ergdata_icon.png"),
                          title: Text("${item.name}"),
                          trailing: Text("Count: ${item.count}"),
                        ),
                        onTap: (){
                          _c2Modal(item);
                        }
                      )
                       
                    );
          }

          // RP3 Display
          if (inventoryType == InventoryType.rp3){
            return Card(
                      margin: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: ListTile(
                          leading: Image.asset("assets/rp3logo.png"),
                          title: Text("${item.name}"),
                          trailing: Text("Count: ${item.count}"),
                        ),
                        onTap: (){
                          _rp3Modal(item);
                        }
                      )
                    );
          }

          // Weights Display
          if (inventoryType == InventoryType.weights){
            return Card(
                      margin: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: ListTile(
                          leading: Image.asset("assets/pitt.png"),
                          title: Text("Weight: ${item.name}"),
                          trailing: Text("Count: ${item.count}"),
                        ),
                        onTap: (){
                          _weightModal(item);
                        }
                      )
                    );
          }

          // Bars Display
          if (inventoryType == InventoryType.bars){
            return Card(
                      margin: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: ListTile(
                          leading: Image.asset("assets/pitt.png"),
                          title: Text("Size: ${item.name}"),
                          trailing: Text("Count: ${item.count}"),
                        )
                      )
                    );
          }      

      }
    )
        
        : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1
              ),
              itemCount: input.length,
              itemBuilder: (context, index) {
              final item = input[index];
              final inventoryType = item.type;


              // C2 Display
              if (inventoryType == InventoryType.c2) {
                return Card(
                            margin: EdgeInsets.all(7),
                            child: Center(
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Image.asset("assets/ergdata_logo.png",
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text(item.name,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                                    Text("Count: ${item.count}")
                                  ]      
                              ),
                                onTap: (){
                                    _c2Modal(item);
                                },
                            )
                            
                            )
                          );
              }

              // RP3 Display
              else if (inventoryType == InventoryType.rp3) {
                return Card(
                            margin: EdgeInsets.all(7),
                            child: Center(
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Image.asset("assets/rp3logo.png",
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text(item.name,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                                    Text("Count: ${item.count}")
                                  ]      
                              ),
                                onTap: (){
                                    _c2Modal(item);
                                },
                            )
                            
                            )
                          );
              }

              // Weights Display
              else if (inventoryType == InventoryType.weights) {
                return Card(
                            margin: EdgeInsets.all(7),
                            child: Center(
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Image.asset("assets/pitt.png",
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text("Weight: ${item.name}",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                                    Text("Count: ${item.count}")
                                  ]      
                              ),
                                onTap: (){
                                    _c2Modal(item);
                                },
                            )
                            
                            )
                          );
              }

              // Bars Display
              else if (inventoryType == InventoryType.bars) {
                return Card(
                            margin: EdgeInsets.all(7),
                            child: Center(
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Image.asset("assets/pitt.png",
                                      height: 70,
                                      width: 70,
                                    ),
                                    Text("Size: ${item.name}",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                                    Text("Count: ${item.count}")
                                  ]      
                              ),
                                onTap: (){
                                    _c2Modal(item);
                                },
                            )
                            
                            )
                          );
              }


              
              
              return null;
              }
        );

        

    


  }
}
