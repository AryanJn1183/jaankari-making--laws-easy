import 'package:flutter/material.dart';
import 'package:jaankari/response_screen.dart';
import 'package:http/http.dart' as http;

class ElectronicsScreen extends StatefulWidget {
  const ElectronicsScreen({super.key});

  @override
  State<ElectronicsScreen> createState() => _ElectronicsScreenState();
}

class _ElectronicsScreenState extends State<ElectronicsScreen> {
  Future<String> fetchResponseFromBackend(String prompt) async {
    // Make HTTP request to fetch response from the backend
    // Replace 'your-backend-url' with your actual backend URL
    final response =
        await http.get(Uri.parse('your-backend-url?prompt=$prompt'));
    if (response.statusCode == 200) {
      return response.body; // Return response if successful
    } else {
      throw Exception('Failed to load response');
    }
  }

  Widget _buildCategoryButton(
      String mainText, String oneLinerText, String prompt) {
    return Column(
      children: [
        TextButton(
          onPressed: () async {
            try {
              // Fetch response from backend
              final String response = await fetchResponseFromBackend(prompt);

              // Navigate to ResponseScreen with all parameters
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResponseScreen(
                      // response: response,
                      // title: mainText,
                      // imagePath: 'assets/images/agri_image.png',
                      ),
                ),
              );
            } catch (e) {
              // Handle error
              print('Error fetching response: $e');
            }
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return Colors.transparent;
              },
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainText,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF007CC2),
                      ),
                    ),
                    Text(
                      oneLinerText,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Divider(
          height: 0, // Remove the height to make the divider invisible
          color: Colors.grey[300],
          thickness: 1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ELECTRONICS",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xFF007CC2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            children: [
              _buildCategoryButton(
                "Jan Vishwas",
                "",
                "What are the rules, regualtions, amendments and acts related to Jan Vishwas. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "IT",
                "",
                "What are the rules, regualtions, amendments and acts related to IT. List them in separate bullet points",
              ),

              

              // Add more buttons as needed
            ],
          ),
        ),
      ),
    );
  }
}
