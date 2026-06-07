import 'package:flutter/material.dart';
import '../details/item_details_screen.dart';

class MyPostsScreen extends StatefulWidget {
  const MyPostsScreen({super.key});

  @override
  State<MyPostsScreen> createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  String selectedTab = "Active";

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
          "My Posts",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 10),

          /// ================= TABS =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _tab("Active"),
                const SizedBox(width: 10),
                _tab("Returned"),
                const SizedBox(width: 10),
                _tab("Closed"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// ================= CONTENT =================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= TAB BUTTON =================
  Widget _tab(String title) {
    bool isSelected = selectedTab == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2563EB) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  /// ================= CONTENT SWITCH =================
  List<Widget> _buildContent() {
    if (selectedTab == "Active") {
      return [

        _sectionTitle("Lost Posts"),
        const SizedBox(height: 10),

        _postCard(
          image: "assets/images/wallet.png",
          title: "Black Leather Wallet",
          subtitle: "Lost near library entrance",
          location: "Library Entrance",
          date: "May 31",
          status: "Lost",
          statusColor: Colors.red,
        ),

        const SizedBox(height: 12),

        _postCard(
          image: "assets/images/keys.png",
          title: "Dorm Keys",
          subtitle: "Lost between cafeteria and Block C",
          location: "Campus Area",
          date: "Jun 1",
          status: "Lost",
          statusColor: Colors.red,
        ),

        const SizedBox(height: 25),

        _sectionTitle("Found Posts"),
        const SizedBox(height: 10),

        _postCard(
          image: "assets/images/card.png",
          title: "Student ID Card",
          subtitle: "Found near gym area",
          location: "Gym",
          date: "Jun 2",
          status: "Found",
          statusColor: Colors.green,
        ),

        const SizedBox(height: 12),

        _postCard(
          image: "assets/images/bottle.png",
          title: "Water Bottle",
          subtitle: "Found in classroom",
          location: "Block A",
          date: "May 30",
          status: "Found",
          statusColor: Colors.green,
        ),
      ];
    }

    /// ================= RETURNED =================
    if (selectedTab == "Returned") {
      return [

        _sectionTitle("Returned Items"),
        const SizedBox(height: 10),

        _postCard(
          image: "assets/images/macbook.png",
          title: "MacBook Pro 14\"",
          subtitle: "Successfully returned to owner",
          location: "Block A",
          date: "May 27",
          status: "Returned",
          statusColor: Colors.blue,
        ),
      ];
    }

    /// ================= CLOSED =================
    return [
      const SizedBox(height: 80),
      const Center(
        child: Column(
          children: [
            Icon(Icons.inbox, size: 60, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              "No closed posts yet",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
  Widget _postCard({
  required String image,
  required String title,
  required String subtitle,
  required String location,
  required String date,
  required String status,
  required Color statusColor,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemDetailsScreen(
            image: image,
            title: title,
            status: status,
            category: "Accessories",
            location: location,
            date: date,
            description: subtitle,
            ownerName: "Ghania Jawed",
            phone: "+92 300 1234567",
            email: "ghania@example.com",
          ),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
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

                    const SizedBox(width: 4),

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