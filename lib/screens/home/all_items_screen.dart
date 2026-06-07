import 'package:flutter/material.dart';

class AllItemsScreen extends StatelessWidget {
  const AllItemsScreen({super.key});

  Widget _itemCard({
    required String image,
    required String title,
    required String location,
    required String date,
    required String type,
    required Color color,
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
            child: Image.asset(
              image,
              width: 65,
              height: 65,
              fit: BoxFit.cover,
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
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                date,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "All Items",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          _itemCard(
            image: 'assets/images/wallet.png',
            title: 'Black Leather Wallet',
            location: 'Library Entrance',
            date: 'May 31',
            type: 'Lost',
            color: Colors.red,
          ),

          _itemCard(
            image: 'assets/images/keys.png',
            title: 'Dorm Keys',
            location: 'Block C',
            date: 'Jun 1',
            type: 'Lost',
            color: Colors.red,
          ),

          _itemCard(
            image: 'assets/images/card.png',
            title: 'Student ID Card',
            location: 'Gym Area',
            date: 'Jun 1',
            type: 'Found',
            color: Colors.green,
          ),

          _itemCard(
            image: 'assets/images/bottle.png',
            title: 'Water Bottle',
            location: 'Block A',
            date: 'May 30',
            type: 'Found',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}