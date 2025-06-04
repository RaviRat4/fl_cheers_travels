import 'package:flutter/material.dart';

class FlightInfoCard extends StatelessWidget {
  const FlightInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;

    final items = [
      {'date': 'Thu, 27 Feb', 'price': 'AU\$1,202'},
      {'date': 'Fri, 28 Feb', 'price': 'AU\$1,349'},
      {'date': 'Sat, 1 Mar', 'price': 'AU\$1,017'},
      {'date': 'Sun, 2 Mar', 'price': 'AU\$1,200', 'selected': true},
      {'date': 'Mon, 3 Mar', 'price': 'AU\$956', 'highlight': true},
      {'date': 'Tue, 4 Mar', 'price': 'AU\$980'},
      {'date': 'Wed, 5 Mar', 'price': 'AU\$996'},
      {'date': 'Tue, 4 Mar', 'price': 'AU\$980'},
    ];

    return Column(
      children: [
        // Blue Header & Detail Section
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: Color(0xFF0A4ABF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 3),
                    child: Text(
                      '2. Returning to Sydney',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 13 : 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 3),
                    child: Row(
                      children: [
                        Text(
                          '*Last updated: 12:48:56 ',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: isMobile ? 10 : 12),
                        ),
                        const Icon(Icons.info_outline, color: Colors.white, size: 14),
                      ],
                    ),
                  ),
                ],
              ),

              // Details Card
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FB),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Depart Button
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1565C0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Depart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 12 : 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Flight Info Row
                        Expanded(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10,
                            runSpacing: 4,
                            children: [
                              Text('Thu, Feb 20', style: TextStyle(fontSize: isMobile ? 12 : 14)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('20:30 – 03:50',
                                      style: TextStyle(fontSize: isMobile ? 12 : 14)),
                                  const SizedBox(width: 5),
                                  const Text(
                                    '+1d',
                                    style: TextStyle(color: Colors.orange, fontSize: 12),
                                  ),
                                ],
                              ),
                              Text('Sydney – New Delhi',
                                  style: TextStyle(fontSize: isMobile ? 12 : 14)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.access_time, size: 16),
                                  const SizedBox(width: 5),
                                  Text('12h 50m', style: TextStyle(fontSize: isMobile ? 12 : 14)),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Change Flight Link
                        if (!isMobile) ...[
                          const SizedBox(width: 10),
                          Text(
                            'Change Flight',
                            style: TextStyle(
                              color: const Color(0xff0c44ac),
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 12 : 14,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Date & Price Scroll Section
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: items.map((item) {
                final isSelected = item['selected'] == true;
                final isHighlight = item['highlight'] == true;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFE3F2FD) : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.grey.shade300,
                      width: 1,
                    ),
                    boxShadow: isSelected
                        ? [const BoxShadow(color: Colors.black12, blurRadius: 4)]
                        : [],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['date'] as String,
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        item['price'] as String,
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          color: isHighlight ? Colors.green : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
