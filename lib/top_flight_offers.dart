import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: TopFlightOffers(),
    ),
  ));
}

class TopFlightOffers extends StatelessWidget {
  const TopFlightOffers({super.key});

  final List<Map<String, String>> destinations = const [
    {
      'image': 'assets/images/sydney_delhi.jpg',
      'title': 'Sydney to Delhi',
      'price': 'A\$267.99',
    },
    {
      'image': 'assets/images/washington_boston.jpg',
      'title': 'Washington to Boston',
      'price': 'A\$267.99',
    },
    {
      'image': 'assets/images/orlando_newyork.jpg',
      'title': 'Orlando to New York',
      'price': 'A\$267.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(
              width: 1200,
              child: Column(
                children: [
                  const Text(
                    'Top Destinations Deals',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                            'Fares on this page are updated as of May 02, 2025 at 9:26 AM EST. They are for One Way or Round Trips as indicated alongside and are inclusive of all ',
                          ),
                          TextSpan(
                            text: 'taxes and fees',
                            style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' and our '),
                          TextSpan(
                            text: 'service fees',
                            style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                            '. These fares based on historical data, may change without prior notice, and cannot be guaranteed until booking confirmation. Please read our ',
                          ),
                          TextSpan(
                            text: 'terms and conditions',
                            style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' carefully.'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, height: 1.7, color: Colors.black87),
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
            Row(
              children: destinations.map((destination) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 395,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
                        child: Image.asset(
                          destination['image']!,
                          height: 410,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Destination Title
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          destination['title']!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      // Bottom Section: Flight Icon + Price
                      Container(
                        color: Color(0xfff5f5f5),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Return", style: TextStyle(fontSize: 14)),
                                Text("Flights", style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Image.asset('assets/images/plainIcon.png', height: 35,),
                            const SizedBox(width: 12),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: destination['price'],
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'per\n person',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.normal,
                                        height: 1
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
