import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jaankari/domains/agriculture_screen.dart';
import 'package:jaankari/domains/electronics_screen.dart';
import 'package:jaankari/domains/fashion_screen.dart';
import 'package:jaankari/domains/grocery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  final List<String> _imagePaths = [
    'assets/images/homescreen.png',
    'assets/images/homescreen1.png',
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    // Start timer to switch images every 5 seconds
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < _imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget _buildCategoryButton(String imagePath, String text, Widget screen) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 29,
          width: 43,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return Colors.blue.shade50;
              },
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color(0xFF007CC2),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF007CC2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        flexibleSpace: Center(
          child: Image.asset(
            'assets/images/jaankari_logo.png',
            width: 113, // Adjust the width as needed
            height: 100, // Adjust the height as needed
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_home.png'),
            opacity: 0.35,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: SizedBox(
                height: 204,
                width: 349,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _imagePaths.length,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 1.0, // Set the aspect ratio
                      child: Image.asset(
                        _imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _imagePaths.length; i++)
                  Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == _currentPage ? Colors.blue : Colors.grey,
                    ),
                  ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Color(0xFF007CC2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
              ),
              child: const Text(
                "Generalised Rules",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCategoryButton(
                    'assets/icons/agri_logo.png',
                    "Agriculture",
                    AgricultureScreen(),
                  ),
                  _buildCategoryButton(
                    'assets/icons/elec_logo.png',
                    "Electronics",
                    ElectronicsScreen(),
                  ),
                  _buildCategoryButton(
                    'assets/icons/fashion_logo.png',
                    "Textile",
                    FashionScreen(),
                  ),
                  _buildCategoryButton(
                    'assets/icons/fastfood_logo.png',
                    "Food & Beverages",
                    GroceryScreen(),
                  ),
                  _buildCategoryButton(
                    'assets/icons/grocery_logo.png',
                    "Grocery",
                    GroceryScreen(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            )
          ],
        ),
      ),
    );
  }
}
