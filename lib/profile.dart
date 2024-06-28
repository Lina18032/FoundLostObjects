import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          Positioned(
            top: 0,
            child: Image.asset(
              'images/waves.png', // Replace with your image path
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              //fit: BoxFit.cover,
            ),
          ),
          // Navigation Row
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: kToolbarHeight,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop(); // Handle back button action
                    },
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: Icon(Icons.share_outlined, color: Colors.white),
                    onPressed: () {
                      // Handle share button action
                    },
                  ),
                ],
              ),
            ),
          ),
          // Text Positioned in Center
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3 / 2.5, // Adjust position based on image height
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'AIT IDIR Celia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          // CircleAvatar Positioned at Bottom Center
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3/1.5,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'images/woman.jpeg', // Replace with your image path in your project
              ),
              backgroundColor: Colors.transparent, // Ensure CircleAvatar background is transparent
              foregroundColor: Colors.transparent, // Ensure CircleAvatar foreground is transparent
              child: ClipOval(
                child: Image.asset(
                  'images/woman.jpeg', // Replace with your image path in your project
                  fit: BoxFit.cover, // Adjust the fit as needed
                  width: 100, // Adjust width as needed
                  height: 100, // Adjust height as needed
                ),
              ),
            ),
          ),
          // Rows in the Middle (at 70% of the screen)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle button tap
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    margin: EdgeInsets.only(top: 20), // Adjust margin as needed
                    decoration: BoxDecoration(
                      color: Color(0xFF65B6EA),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                // First Row: Settings Text
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20), // Spacer between rows

                // Second Row: Languages Icon and Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    children: [
                      Icon(Icons.language),
                      SizedBox(width: 8),
                      Text('Languages'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Spacer between rows

                // Third Row: Moon Icon and Darkmode Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    children: [
                      Icon(Icons.nightlight_round),
                      SizedBox(width: 8),
                      Text('Darkmode'),
                      Spacer(),
                      Icon(Icons.toggle_off_outlined),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
