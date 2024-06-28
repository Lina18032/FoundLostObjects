import 'package:flutter/material.dart';
import 'package:objects_found_lost/profile.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isFilterVisible = false; // Track visibility of filter section
  List<int> _selectedCategoryIndices = [-1, -1]; // Track selected indices for each category
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          Navigator.pushNamed(context, '/home'); // Navigate to home page
          break;
        case 1:
          Navigator.pushNamed(context, '/message'); // Navigate to message page
          break;
        case 2:
          Navigator.pushNamed(context, '/profile'); // Navigate to profile page
          break;
        default:
          break;
      }
    });
  }



  void _toggleFilterVisibility() {
    setState(() {
      _isFilterVisible = !_isFilterVisible; // Toggle visibility
    });
  }

  void _selectCategory(int categoryIndex, int selectedIndex) {
    setState(() {
      // Deselect the previous selection in this category
      _selectedCategoryIndices[categoryIndex] = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color for the page
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0, // Increase height to add space
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.symmetric( vertical: 30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF6BBCEA),
                          Color(0xFF1A70E6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LOGO',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7 * 0.9,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Search for the item',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: GestureDetector(
                                  onTap: _toggleFilterVisibility,
                                  child: Icon(
                                    Icons.filter_alt_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // Your main content here
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9, // Set to 90% of screen width
                      // height: 200,
                      margin: EdgeInsets.symmetric( vertical: 5), // Margin for spacing at the top
                    ),
                    // Filter section
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      height: _isFilterVisible ? 150 : 0,
                      child: Visibility(
                        visible: _isFilterVisible,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Items Category',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              // First row of small rectangles
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildSmallRectangle('lost', 0, 0),
                                  _buildSmallRectangle('found', 0, 1),
                                ],
                              ),
                              SizedBox(height: 15),
                              // Second row of scrollable rectangles
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    6,
                                        (index) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: _buildSmallRectangle(
                                        index == 0 ? 'keys' :
                                        index == 1 ? 'pack' :
                                        index == 2 ? 'money' :
                                        index == 3 ? 'charger' :
                                        index == 4 ? 'book' :
                                        'friend',
                                        1,
                                        index + 2,
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
                    // Scrollable section with rectangles
                    Container(
                      //margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //SizedBox(height: 20),
                          // List of rows with two rectangles each
                          Column(
                            children: [
                              _buildRowWithTwoRectangles(),
                              SizedBox(height: 20),
                              _buildRowWithTwoRectangles(),
                              SizedBox(height: 20),
                              _buildRowWithTwoRectangles(),
                              // Add more rows as needed
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20, // Position above the BottomNavigationBar
            right: 20,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0B6EFE),
                    Color(0xFF6BBCEA),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle tap on BottomNavigationBar
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildSmallRectangle(String text, int categoryIndex, int index) {
    bool isSelected = _selectedCategoryIndices[categoryIndex] == index; // Check if index is selected
    return GestureDetector(
      onTap: () {
        _selectCategory(categoryIndex, index);
      },
      child: Container(
        width: 80,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: isSelected
              ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6DBEEA),
              Color(0xFF1067E6),
            ],
          )
              : LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFCCCCCC),
              Color(0xFFBBBBBB),
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRectangle(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 190,
              height: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('images/keys.png'), // Ensure this path is correct
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Keys',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 12, top: 0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xFF5292ED),
                    size: 12,
                  ),
                  Text(
                    'la Bibliothèque',
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFF5292ED),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 12, top: 5, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'found in the 2nd floor near the prayer corner and the key has a charm on it',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/fullDescription');
                        },
                        child: Container(
                          width: 70,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xFF5292ED),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'See More',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }





  Widget _buildRowWithTwoRectangles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRectangle(
          (MediaQuery.of(context).size.width - 60) / 2, // Set width based on screen size
          260,
        ),
        _buildRectangle(
          (MediaQuery.of(context).size.width - 60) / 2, // Set width based on screen size
          260,
        ),
      ],
    );
  }
}
