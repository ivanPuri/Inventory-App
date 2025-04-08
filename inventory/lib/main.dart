import 'package:flutter/material.dart';
import 'package:inventory/service/pages.dart';
import 'package:inventory/service/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
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
      home: const Homepage(),
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

  Future<String?> _getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email'); // Get the saved email
  }

  final List<Widget> _pages = [
    Bellefield(),//replace this with the eventual bellefield page
    Center(child: Text('Search Page')),//replace this with the eventual search page
    Boathouse(),//replace this with the eventual boat house page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.home),
            label: 'Bellefield',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rowing),
            label: 'Boat House',
          ),
        ],
      ),
      body: _pages[_selectedIndex],  // Display the selected page
    );
  }
}





