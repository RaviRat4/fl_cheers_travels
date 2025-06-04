import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FlightOffersSection extends StatelessWidget {
  const FlightOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = [
      {'label': '20% Discount', 'color': Colors.red, 'tag': true},
      {'label': 'New Flight', 'color': Colors.orange, 'tag': true},
      {'label': '30% Discount', 'color': Colors.red, 'tag': true},
      {'label': 'Recommended', 'color': Colors.green, 'tag': true},
    ];

    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        color: Color(0xfff1f5f8),
        padding: EdgeInsets.only(bottom: 50),
        child: Center(
          child: SizedBox(
              width: 1200,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Offers For Flights Routes',
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
                  const SizedBox(height: 12),
                  CarouselSlider.builder(
                    itemCount: offers.length,
                    options: CarouselOptions(
                      height: 265,
                      viewportFraction: 0.30, // 4 items per view
                      enlargeCenterPage: false,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      final offer = offers[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: FlightCard(
                          label: offer['label'] as String,
                          color: offer['color'] as Color,
                          tagVisible: offer['tag'] as bool,
                        ),
                      );
                    },
                  ),
                ],
              )
          ),
        )
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  final String label;
  final Color color;
  final bool tagVisible;

  const FlightCard({
    super.key,
    required this.label,
    required this.color,
    required this.tagVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tagVisible)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DHL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 3,),
                    const Text('Delhi'),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    const Center(
                      child: Icon(Icons.flight, size: 28, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('NWK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 3,),
                    const Text('New York'),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
         Center(
           child: Column(
             children: [
               const Text(
                 'Travel Between',
                 style: TextStyle(color: Colors.grey, fontSize: 14),
               ),
               SizedBox(height: 5,),
               const Text(
                 '20 Sep, Fri - 10 Oct, Tue',
                 style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
               ),
             ],
           ),
         ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF002D72),
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text('Book Now', style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
