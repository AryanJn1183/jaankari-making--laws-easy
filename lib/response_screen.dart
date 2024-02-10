import 'package:flutter/material.dart';

class ResponseScreen extends StatelessWidget {
  // final String title;
  // final String response;
  // final String imagePath;

  const ResponseScreen({
    Key? key,
    // required this.title,
    // required this.response,
    // required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Image.asset(
            'assets/images/agri_image.png',
            height: 209,
            width: 350,
          ),
          SizedBox(height: 10),
          Text(
            "Agricultural Marketing",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Your Response",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the home screen
                  },
                  child: Image.asset(
                    'assets/icons/home_logo.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle refresh button press
                  },
                  icon: Icon(Icons.refresh),
                  label: Text('Refresh'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the chat screen
                  },
                  child: Image.asset(
                    'assets/icons/chatbot_logo.png',
                    height: 40,
                    width: 40,
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
