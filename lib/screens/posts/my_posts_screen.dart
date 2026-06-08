import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../details/item_details_screen.dart';

class MyPostsScreen extends StatefulWidget {
  const MyPostsScreen({super.key});

  @override
  State<MyPostsScreen> createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  String selectedTab = "Active";

  final userId = FirebaseAuth.instance.currentUser?.uid;

  Stream<QuerySnapshot> getPosts(String status) {
    return FirebaseFirestore.instance
        .collection("posts")
        .where("userId", isEqualTo: userId)
        .where("status", isEqualTo: status)
        .snapshots();
  }

  Stream<QuerySnapshot> getTypePosts(String type, String status) {
    return FirebaseFirestore.instance
        .collection("posts")
        .where("userId", isEqualTo: userId)
        .where("type", isEqualTo: type)
        .where("status", isEqualTo: status)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Posts",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

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

          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _tab(String title) {
    bool isSelected = selectedTab == title;

    return GestureDetector(
      onTap: () => setState(() => selectedTab = title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedTab == "Active") {
      return StreamBuilder(
        stream: getPosts("active"),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return const Center(child: Text("No active posts"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, i) {
              var data = docs[i];

              return _postCard(
                image: data["imageUrl"],
                title: data["title"],
                subtitle: data["description"],
                location: data["location"],
                date: data["date"],
                status: data["type"],
                statusColor:
                    data["type"] == "lost" ? Colors.red : Colors.green,
              );
            },
          );
        },
      );
    }

    if (selectedTab == "Returned") {
      return const Center(child: Text("Returned posts (future feature)"));
    }

    return const Center(child: Text("Closed posts (future feature)"));
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: image.isNotEmpty
                ? Image.network(image, width: 70, height: 70, fit: BoxFit.cover)
                : const Icon(Icons.image, size: 70),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 4),

                Text(subtitle,
                    style: TextStyle(color: Colors.grey.shade600)),

                const SizedBox(height: 8),

                Text(location,
                    style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),

          Column(
            children: [
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(date, style: const TextStyle(fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}