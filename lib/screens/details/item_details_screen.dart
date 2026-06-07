import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String status;
  final String category;
  final String location;
  final String date;
  final String description;
  final String ownerName;
  final String email;
  final String phone;

  const ItemDetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.status,
    required this.category,
    required this.location,
    required this.date,
    required this.description,
    required this.ownerName,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLost = status == "Lost";

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// IMAGE
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: InteractiveViewer(
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
              child: Hero(
                tag: image,
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isLost
                              ? Colors.red.shade100
                              : Colors.green.shade100,
                          borderRadius:
                              BorderRadius.circular(
                                  20),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: isLost
                                ? Colors.red
                                : Colors.green,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _infoTile(
                    Icons.category,
                    "Category",
                    category,
                  ),

                  _infoTile(
                    Icons.location_on,
                    "Location",
                    location,
                  ),

                  _infoTile(
                    Icons.calendar_month,
                    "Date",
                    date,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Contact Owner",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(18),
                    ),

                    child: Column(
                      children: [

                        Row(
                          children: [

                            const CircleAvatar(
                              child:
                                  Icon(Icons.person),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Text(
                                ownerName,
                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceAround,
                          children: [

                            _contactButton(
                              Icons.call,
                              "Call",
                              Colors.blue,
                            ),

                            _contactButton(
                              Icons.message,
                              "WhatsApp",
                              Colors.green,
                            ),

                            _contactButton(
                              Icons.email,
                              "Email",
                              Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF2563EB)),
          const SizedBox(width: 10),
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _contactButton(
    IconData icon,
    String text,
    Color color,
  ) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor:
              color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 5),
        Text(text),
      ],
    );
  }
}