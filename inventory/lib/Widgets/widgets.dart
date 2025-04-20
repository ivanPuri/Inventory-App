import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  final String _username;

  const MyDrawer({super.key, required String username})
      : _username = username;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 260,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFFB81C),
              ),
              child: Column(
                children: [
                  ProfileImagePicker(), // Add some spacing between text and image
                  Text(_username, style: TextStyle(color: Colors.white, fontSize: 24))
                ],
              ),
            ),
          ),
          
          
          ListTile(
            title: Text('Erg Sign Out'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation to the Home page
            },
          ),
          ListTile(
            title: Text('Damage Report'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation to the Search page
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation to the Profile page
            },
          ),
        ],
      ),
    );
  }
}

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({Key? key}) : super(key: key);

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _image;  // Variable to store the selected image

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    
    // Pick an image from the gallery
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);  // Save the selected image as a File
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display the user's image if selected, otherwise a default image
        GestureDetector(
          onTap: _pickImage, // When the CircleAvatar is tapped, call _pickImage
          child: CircleAvatar(
            radius: 60,
            backgroundImage: _image == null
                ? AssetImage('assets/carhart.png')  // Default image
                : FileImage(_image!),  // Show the selected image
          ),
        ),
      ],
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isInvalidUser = false;


  Future<List<String>> _loadValidUsers() async {
  final String response = await rootBundle.loadString('assets/valid_users.json');
  final data = json.decode(response); // This decodes the JSON into a Map<String, dynamic>
  
  List<String> users = [];
  
  // Now access the 'valid_users' list and extract the 'username' field
  for (var user in data['valid_users']) {
    users.add(user['username']);  // Extract 'username' from each user object
  }
  
  return users;
}

  Future<void> _login() async {
    String email = _emailController.text;
    List<String> validUsers = await _loadValidUsers();

    if (validUsers.contains(email)) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('email', email); // Save login status
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    } else {
      setState(() {
        _isInvalidUser = true;
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFB81C),
      appBar: AppBar(title: Text('Pitt Crew Login',style: TextStyle(color: Color(0xFFFFB81C)),), backgroundColor: Color(0xff00205B),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                label: Center(child: Text('Email')),
                errorText: _isInvalidUser ? 'Invalid user' : null,
              ),
            textAlign: TextAlign.center
            ),
            
            Padding(
  padding: const EdgeInsets.only(top: 16),
  child: Theme(
    data: Theme.of(context).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff00205B), // dark blue background
          foregroundColor: Color(0xFFFFB81C), // gold text
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      ),
    ),
    child: ElevatedButton(
      onPressed: _login,
      child: Text('Log In'),
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
