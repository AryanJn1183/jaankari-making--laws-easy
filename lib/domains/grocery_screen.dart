import 'package:flutter/material.dart';
import 'package:jaankari/response_screen.dart';
import 'package:http/http.dart' as http;

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class ApiService {
  static Future<String> fetchData(String prompt) async {
    // Simulating an API call, replace this with your actual API call
    await Future.delayed(Duration(seconds: 2));
    return "Response for prompt: $prompt";
  }
}

class _GroceryScreenState extends State<GroceryScreen> {
  // Future<void> _onButtonPressed(BuildContext context, String prompt) async {
  //   String response = await ApiService.fetchData(prompt);
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ResponseScreen(response: response),
  //     ),
  //   );
  // }
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
          "GROCERY | F&B",
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
                "Licensing & Registration",
                "Hygiene, capacity, license types.",
                "What are the rules, regulations, amendments and acts related to Licensing & Registration. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Food Standards & Additives",
                "Ingredients, limits, labeling.",
                "What are the rules, regulations, amendments and acts related to Food Standards & Additives. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Prohibited & Restricted Sales",
                "Banned substances, specific limits.",
                "What are the rules, regulations, amendments and acts related to Prohibited & Restricted Sales. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Contaminants & Residues",
                "Maximum limits, testing protocols.",
                "What are the rules, regulations, amendments and acts related to Contaminants & Residues. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Speciality Foods",
                "Specific definitions, labeling, claims.",
                "What are the rules, regulations, amendments and acts related to Speciality Foods. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Food Recall Procedure",
                "Timely action, consumer notification.",
                "What are the rules, regulations, amendments and acts related to Food Recall Procedure. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Import",
                "Hygiene certificates, labeling requirements.",
                "What are the rules, regulations, amendments and acts related to Import. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Non-Specific Food Approval",
                "Predefined criteria, simplified approval.",
                "What are the rules, regulations, amendments and acts related to Non-Specific Food Approval. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Organic Food",
                "Certification standards, traceability.",
                "What are the rules, regulations, amendments and acts related to Organic Food. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Alcoholic Beverages",
                "Regulates production, sale & consumption of alcohol. Licensing, labeling, age restrictions",
                "What are the rules, regulations, amendments and acts related to Alcoholic Beverages. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Food Fortification",
                "Enriches staple foods with essential nutrients.    Specific nutrients, levels, monitoring.",
                "What are the rules, regulations, amendments and acts related to Food Fortification. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Food Safety Auditing",
                "Independent assessment of food safety practices.   HACCP compliance, corrective actions.",
                "What are the rules, regulations, amendments and acts related to Food Safety Auditing. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Advertising & Claims",
                "Truthful, substantiated claims, no health exploitation.",
                "What are the rules, regulations, amendments and acts related to Advertising & Claims. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Packaging",
                "Protects food, provides information & prevents tampering.  Labeling requirements, material safety..",
                "What are the rules, regulations, amendments and acts related to Packaging. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Surplus Food Management",
                "Hygiene standards, donation criteria, traceability.",
                "What are the rules, regulations, Surplus Food Management to Packaging. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Children's School Food",
                "Nutritional guidelines, hygiene standards, age-appropriate portions.",
                "What are the rules, regulations, amendments and acts related to Children's School Food. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Infant Nutrition",
                "Sets strict standards for infant formula & food.   Specific nutrient composition, safety testing, labeling.",
                "What are the rules, regulations, amendments and acts related to Infant Nutrition. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Ayurveda Aahara",
                "Regulates claims & safety of Ayurveda-based food products. Science-based claims, no harmful ingredients.",
                "What are the rules, regulations, amendments and acts related to Ayurveda Aahara. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Vegan Foods",
                "Defines & protects integrity of vegan food labels. No animal-derived ingredients, clear labeling.",
                "What are the rules, regulations, amendments and acts related to Vegan Foods. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Meeting Procedures",
                "Ensures transparency & efficiency in conducting business.  Defined roles, quorum requirements, voting procedures.",
                "What are the rules, regulations, amendments and acts related to Meeting Procedures. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Central Advisory Committee",
                "Expertise, stakeholder representation, meeting protocols.",
                "What are the rules, regulations, amendments and acts related to Central Advisory Committee. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Employee Compensation",
                "Defines fair & transparent compensation structure. Competitive salaries, performance-based incentives.",
                "What are the rules, regulations, amendments and acts related to Employee Compensation. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Scientific Committee & Panel",
                "Expert composition, meeting procedures, conflict of interest rules.",
                "What are the rules, regulations, amendments and acts related to Scientific Committee & Panel. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Recruitment & Appointment",
                "Merit-based selection, documented procedures.",
                "What are the rules, regulations, amendments and acts related to Recruitment & Appointment. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Financial",
                "Governs financial management & accountability. Budgetary control, audit mechanisms, transparency.",
                "What are the rules, regulations, amendments and acts related to Financial. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Labelling & Display",
                "Informs consumers about food contents & safety.    Clear, accurate, mandatory information.",
                "What are the rules, regulations, amendments and acts related to Labelling & Display. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Lab Recognition & Notification",
                "Ensures labs meet quality & competency standards.  Accreditation, specific tests, government approval.",
                "What are the rules, regulations, amendments and acts related to Lab Recognition & Notification. List them in separate bullet points",
              ),
              _buildCategoryButton(
                "Laboratory & Sampling Analysis",
                "Tests food for safety, quality & compliance with regulations.  Standardized methods, qualified personnel, data integrity.",
                "What are the rules, regulations, amendments and acts related to Laboratory & Sampling Analysis. List them in separate bullet points",
              ),

              // Add more buttons as needed
            ],
          ),
        ),
      ),
    );
  }
}
