  import 'package:flutter/material.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'CIS 228 Assignment 3',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
          useMaterial3: true,
        ),
        home: const ProfileScreen(),
      );
    }
  }

  class ProfileScreen extends StatefulWidget {
    const ProfileScreen({super.key});

    @override
    _ProfileScreenState createState() => _ProfileScreenState();
  }

  class _ProfileScreenState extends State<ProfileScreen> {
    final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final Map<String, bool> _interests = {
      "Music": false,
      "Sports": false,
      "Reading": false,
      "Gaming": false,
    };

    void _submitData() {
      print("First Name: ${_firstNameController.text}");
      print("Last Name: ${_lastNameController.text}");
      print("Email: ${_emailController.text}");
      print("Interests: ${_interests.entries.where((entry) => entry.value).map((entry) => entry.key).join(', ')}");
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.purpleAccent, // Changed background color to purple
        appBar: AppBar(
          title: Text("My Profile"),
          backgroundColor: Colors.purple, // Changed app bar background to deep purple
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                child: Image.asset('assets/beya.png'),
              ),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  fillColor: Colors.white,
                  filled: true, // Add white fill to make text visible against purple
                ),
              ),
              SizedBox(height: 10), // Add spacing between fields
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Select Interests',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: _interests.keys.map((String key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: _interests[key],
                          onChanged: (bool? value) {
                            setState(() {
                              _interests[key] = value!;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      );
    }
  }