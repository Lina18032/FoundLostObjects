import 'package:flutter/material.dart';

class FullDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Image
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/keyss.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom White Container
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Keys Text
                    Center(
                      child: Text(
                        'Keys',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // State
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'State: ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF887E7E), // Color for "State:"
                            ),
                          ),
                          TextSpan(
                            text: 'Lost',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black, // Color for "Lost"
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Full Name
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Full Name: ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF887E7E), // Color for "Full Name:"
                            ),
                          ),
                          TextSpan(
                            text: 'Lina Lalem',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black, // Color for "Lina Lalem"
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Location
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Location: ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF887E7E), // Color for "Location:"
                            ),
                          ),
                          TextSpan(
                            text: 'La Bibliothèque',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black, // Color for "La Bibliothèque"
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Description
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF887E7E),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo  consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Blue Button
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Handle the button tap
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF277CE7),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              'Click if you found your lost object',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Set the initial selected index to match the profile tab
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home'); // Navigate to home page
              break;
            case 1:
              Navigator.pushNamed(context, '/message');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile'); // Navigate to profile page
              break;
          }
        },
      ),
    );
  }
}
