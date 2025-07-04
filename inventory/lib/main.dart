import 'package:flutter/material.dart';
import 'package:inventory/Widgets/pages.dart';
import 'package:inventory/Widgets/widgets.dart';
import 'package:inventory/service/ape_service.dart';
import 'package:inventory/service/inventory_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


main() {
  runApp(login()); 
}

// ignore: camel_case_types
class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      );
  }
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  List<Widget> _pages = [];
  Ape ape = Ape(Service());
  bool initialised = false; 


  @override
  void initState() {
    super.initState();
    _initializeService(); // Initialize the service
    
  }

  Future<void> _initializeService() async {
  await ape.initialize(); 

  setState(() {
    _pages = [
      Boathouse(ape: ape), 
      Center(child: Text('Search Page')),
      Bellefield(ape: ape),
    ];
    initialised = true; 
  });
}


  Future<String?> _getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email'); // Get the saved email
  }

  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_pages.isEmpty || initialised == false) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } 


    return Scaffold (
      appBar: AppBar(
        title: const Text('Crew Inventory',
        style: TextStyle(color: Color(0xffFFB81C))),
        backgroundColor: Color(0xff003594 ),
        iconTheme: IconThemeData(
          color: Color(0xffFFB81C),
        ),
      ),
      // Using FutureBuilder to asynchronously fetch the email
      drawer: FutureBuilder<String?>(
        future: _getEmail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Drawer(); 
          }
          String username = snapshot.data!;
          return MyDrawer(username: username); // Pass the email to MyDrawer
        },
      ),
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: _selectedIndex,  // Bind the selected index
        onTap: _onItemTapped,  // Call the function when a tab is tapped
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.rowing),
            label: 'Boat House',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Bellefield',
          ),
        ],
      ),
      body: _pages[_selectedIndex],  // Display the selected page
    );
  }
}





