import 'package:flutter/material.dart';
import '../lost/lost_items_screen.dart';
import '../found/found_items_screen.dart';
import '../profile/profile_screen.dart';
import '../lost/lost_report_screen.dart';
import '../found/found_report_screen.dart';
import 'all_items_screen.dart';
import '../details/item_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2563EB),
        elevation: 8,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const LostReportScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

            bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [

              InkWell(
                onTap: () {},
                child: const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Color(0xFF2563EB),
                    ),
                    Text("Home"),
                  ],
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LostItemsScreen(),
                    ),
                  );
                },
                child: const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    Text("Lost"),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const FoundItemsScreen(),
                    ),
                  );
                },
                child: const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline),
                    Text("Found"),
                  ],
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProfileScreen(),
                    ),
                  );
                },
                child: const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_outline),
                    Text("Profile"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

            body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Stack(
                clipBehavior: Clip.none,
                children: [

                  Container(
                    height: 240,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2563EB),
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(35),
                        bottomRight:
                            Radius.circular(35),
                      ),
                    ),

                    child: Column(
                      children: [

                        Row(
                          children: [

                            const CircleAvatar(
                              radius: 24,
                              backgroundColor:
                                  Colors.white,
                              child: Icon(
                                Icons.person,
                                color:
                                    Color(0xFF2563EB),
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [

                                  Text(
                                    "Good Morning,",
                                    style: TextStyle(
                                      color: Colors
                                          .white70,
                                    ),
                                  ),

                                  SizedBox(height: 2),

                                  Text(
                                    "Ghania Jawed",
                                    style: TextStyle(
                                      color:
                                          Colors.white,
                                      fontSize: 20,
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Icon(
                              Icons
                                  .notifications_none,
                              color: Colors.white,
                              size: 28,
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        TextField(
                          decoration:
                              InputDecoration(
                            filled: true,
                            fillColor:
                                Colors.white,
                            hintText:
                                "Search lost or found items...",
                            prefixIcon:
                                const Icon(
                              Icons.search,
                            ),
                            border:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          16),
                              borderSide:
                                  BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: -40,
                    child: Row(
                      children: [

                        Expanded(
                          child: _statCard(
                            title:
                                "Active Lost",
                            count: "2",
                            color:
                                Colors.red,
                          ),
                        ),

                        const SizedBox(
                            width: 15),

                        Expanded(
                          child: _statCard(
                            title:
                                "Active Found",
                            count: "1",
                            color:
                                Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Quick Actions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LostReportScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.report_problem_outlined,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Report Lost",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FoundReportScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 40,
                                    color: Colors.green,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Report Found",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        const Text(
                          "Recent Activity",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AllItemsScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              color: Color(0xFF2563EB),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    _activityCard(
                      image: 'assets/images/wallet.png',
                      title: 'Black Leather Wallet',
                      type: 'Lost',
                      location: 'Library Entrance',
                      date: 'May 31',
                      color: Colors.red,
                    ),

                    const SizedBox(height: 12),

                    _activityCard(
                      image: 'assets/images/keys.png',
                      title: 'Dorm Keys',
                      type: 'Lost',
                      location: 'Mid Cafeteria & Block C',
                      date: 'Jun 1',
                      color: Colors.red,
                    ),

                    const SizedBox(height: 12),

                    _activityCard(
                      image: 'assets/images/card.png',
                      title: 'Student ID Card',
                      type: 'Found',
                      location: 'Near Gym',
                      date: 'Jun 1',
                      color: Colors.green,
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
static Widget _statCard({
  required String title,
  required String count,
  required Color color,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
        ),
      ],
    ),
    child: Column(
      children: [

        Text(
          count,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),

        const SizedBox(height: 5),

        Text(title),
      ],
    ),
  );
}
static Widget _activityCard({
  required String image,
  required String title,
  required String type,
  required String location,
  required String date,
  required Color color,
}) {
  return Builder(
    builder: (context) {
      return InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemDetailsScreen(
                image: image,
                title: title,
                status: type,
                category: type == "Lost"
                    ? "Accessories"
                    : "IDs & Cards",
                location: location,
                date: date,
                description:
                    "This item was reported through the Campus Lost & Found system. If this item belongs to you, please contact the owner using the details below.",
                ownerName: "Ghania Jawed",
                email: "ghania@example.com",
                phone: "+92 300 1234567",
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
              ),
            ],
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
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      location,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          color.withOpacity(0.15),
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        color: color,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
}
