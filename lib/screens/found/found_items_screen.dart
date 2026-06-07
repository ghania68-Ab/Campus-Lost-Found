import 'package:flutter/material.dart';
import '../details/item_details_screen.dart';

class FoundItemsScreen extends StatefulWidget {
  const FoundItemsScreen({super.key});

  @override
  State<FoundItemsScreen> createState() => _FoundItemsScreenState();
}

class _FoundItemsScreenState extends State<FoundItemsScreen> {
  String selectedCategory = "All";

  final List<Map<String, String>> allItems = [

    {
      "category": "IDs & Cards",
      "image": "assets/images/card.png",
      "title": "Student ID Card",
      "description": "Found a student ID near the Gym.",
      "location": "Near Gym",
      "date": "Jun 1",
    },
    {
      "category": "Accessories",
      "image": "assets/images/bottle.png",
      "title": "Blue Water Bottle",
      "description": "Found near student seating area.",
      "location": "Block A Bench",
      "date": "May 31",
    },
    {
      "category": "Accessories",
      "image": "assets/images/umbrella.png",
      "title": "Umbrella",
      "description": "Found outside admin block.",
      "location": "Admin Block",
      "date": "May 29",
    },
  ];

  List<Map<String, String>> get filteredItems {
    if (selectedCategory == "All") {
      return allItems;
    }
    if (selectedCategory == "Keys") {
      return []; // no found items in keys
    }
    if (selectedCategory == "Electronics") {
      return []; // no electronics found items
    }
    return allItems
        .where((item) => item["category"] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Found Items",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 10),

          /// SEARCH BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "search found items...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.tune),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          /// CHIPS (CLICKABLE)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                _chip("All"),
                _chip("Electronics"),
                _chip("Accessories"),
                _chip("Keys"),
                _chip("IDs & Cards"),
              ],
            ),
          ),

          const SizedBox(height: 15),

          /// LIST
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [

                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 15),

                        Text(
                          "No items found",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 8),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Try selecting a different category and search item",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _itemCard(
                          image: item["image"]!,
                          title: item["title"]!,
                          description: item["description"]!,
                          location: item["location"]!,
                          date: item["date"]!,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  /// CHIP WITH FILTER
  Widget _chip(String text) {
    final bool isActive = selectedCategory == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.green : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black87,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  /// ITEM CARD (UNCHANGED UI)
  Widget _itemCard({
  required String image,
  required String title,
  required String description,
  required String location,
  required String date,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(18),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemDetailsScreen(
            image: image,
            title: title,
            status: "Found",
            category: "Accessories",
            location: location,
            date: date,
            description: description,
            ownerName: "Ali Ahmed",
            phone: "+92 300 1234567",
            email: "ali@example.com",
          ),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.grey,
                    ),

                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
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
}