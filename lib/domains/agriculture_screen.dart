import 'package:flutter/material.dart';
import 'package:jaankari/response_screen.dart';
import 'package:http/http.dart' as http;

class AgricultureScreen extends StatefulWidget {
  const AgricultureScreen({super.key});

  @override
  State<AgricultureScreen> createState() => _AgricultureScreenState();
}

class _AgricultureScreenState extends State<AgricultureScreen> {
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
          "AGRICULTURE",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w500,
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
                "Agricultural Marketing",
                "Transparency, competition, consumer protection.",
                "What are the rules, regulations, amendments and acts related to agricultural marketing. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Agricultural Nutrient Management",
                "Balanced use of fertilizers, soil testing, organic matter management.",
                "What are the rules, regulations, amendments and acts related to Agricultural Nutrient Management. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Mechanization and Technology",
                "Safety standards, emission regulations, responsible technology adoption.",
                "What are the rules, regulations, amendments and acts related to Mechanization and Technology. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Cooperation",
                "Cooperative societies, fair trade practices, democratic decision-making.",
                "What are the rules, regulations, amendments and acts related to Cooperation. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Natural Resource Management",
                "Soil conservation measures, water management practices, biodiversity protection.",
                "What are the rules, regulations, amendments and acts related to Natural Resource Management. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Crops & NFSM",
                "Crop-specific regulations, minimum support prices, quality standards.",
                "What are the rules, regulations, amendments and acts related to Crops & NFSM. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Oilseeds Divisions",
                "Import-export regulations, quality control standards, oilseed development schemes.",
                "What are the rules, regulations, amendments and acts related to Oilseeds Divisions. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Drought Management",
                "Water conservation measures, drought-resistant crop varieties, emergency action plans.",
                "What are the rules, regulations, amendments and acts related to Drought Management. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Economic Administration",
                "Market regulations, fair trade practices, financial assistance programs.",
                "What are the rules, regulations, amendments and acts related to Economic Administration. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Plant Protection",
                "Pesticide regulations, integrated pest management (IPM) practices, quarantine measures.",
                "What are the rules, regulations, amendments and acts related to Plant Protection. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Extension",
                "Extension services, training programs, information dissemination strategies.",
                "What are the rules, regulations, amendments and acts related to Extension. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Policy",
                "Land use policies, agricultural subsidies, trade agreements.",
                "What are the rules, regulations, amendments and acts related to Policy. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Farmer Welfare",
                "Minimum wages, social security schemes, farmer education programs.",
                "What are the rules, regulations, amendments and acts related to Farmer Welfare. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "General Administration",
                "Regulatory framework, budget allocation, monitoring & evaluation mechanisms.",
                "What are the rules, regulations, amendments and acts related to General Administration. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Seeds",
                "Seed certification standards, variety registration, quality control checks.",
                "What are the rules, regulations, Seeds to General Administration. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Horticulture",
                "Good agricultural practices (GAP) guidelines, post-harvest management protocols, market standards.",
                "What are the rules, regulations, amendments and acts related to Horticulture. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Digital Agriculture",
                "Cybersecurity measures, data privacy regulations, responsible technology use.",
                "What are the rules, regulations, amendments and acts related to Digital Agriculture. List them in separate bullet points",
              ),

              // Add more buttons as needed
            ],
          ),
        ),
      ),
    );
  }
}
