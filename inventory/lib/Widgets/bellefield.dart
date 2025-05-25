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
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
