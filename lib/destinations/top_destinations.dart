import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../footer.dart';
import '../footer_above.dart';
import '../header.dart';
import '../search_widget.dart';
import '../usb_section.dart';

class DiscountedFlightsSection extends StatelessWidget {
  final flights = [
    {
      'depDate': 'Mon, May 19',
      'depCode': 'SNA',
      'depCity': 'Santa Ana',
      'retDate': 'Fri, May 30',
      'arrCode': 'LAS',
      'arrCity': 'Las Vegas',
      'price': 55.29,
    },
    {
      'depDate': 'Fri, May 23',
      'depCode': 'LAS',
      'depCity': 'Las Vegas',
      'retDate': 'Sun, May 25',
      'arrCode': 'LAX',
      'arrCity': 'Los Angeles',
      'price': 59.98,
    },
    {
      'depDate': 'Wed, Jul 02',
      'depCode': 'FLL',
      'depCity': 'Fort Lauderdale',
      'retDate': 'Mon, Jul 14',
      'arrCode': 'ATL',
      'arrCity': 'Atlanta',
      'price': 93.96,
    },
    {
      'depDate': 'Fri, May 30',
      'depCode': 'CAK',
      'depCity': 'Akron Canton',
      'retDate': 'Wed, Jun 04',
      'arrCode': 'SRQ',
      'arrCity': 'Sarasota',
      'price': 96.00,
    },
    {
      'depDate': 'Thu, May 29',
      'depCode': 'DTW',
      'depCity': 'Detroit',
      'retDate': 'Sun, Jun 01',
      'arrCode': 'BNA',
      'arrCity': 'Nashville',
      'price': 134.98,
    },
    {
      'depDate': 'Fri, Sep 19',
      'depCode': 'PHX',
      'depCity': 'Phoenix',
      'retDate': 'Tue, Sep 23',
      'arrCode': 'SEA',
      'arrCity': 'Seattle',
      'price': 177.60,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 900
        ? 2
        : screenWidth > 600
        ? 2
        : 1;
    return Center(
      child: Column(
      children: [
        HeaderSection(),
        SearchWidget(),
        UsbSection(),
    SizedBox(
    width: 1200,
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    children: [
      SizedBox(height: 20,),
    Text(
    "Your best value Flights to Brisbane",
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 8),
    Text(
    "Our airfares include all our service fees, taxes and fees. Bonuses apply to certain airfares. Read n\ our baggage policy for details on baggage charges.",
    textAlign: TextAlign.center, style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 24),
    GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: flights.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: crossAxisCount,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    childAspectRatio: 5.5,
    ),
    itemBuilder: (context, index) {
    final flight = flights[index];
    return FlightCard(flight: flight);
    },
    ),
    ],
    ),
    ),
    ),

        SizedBox(height: 40,),
        HelpSection(),
        FooterSection(),
    ],
    ),
    );
  }
}

class FlightCard extends StatelessWidget {
  final Map flight;
  const FlightCard({required this.flight});

  Widget dashedBorderContainer({required Widget child}) {
    return DottedBorder(
      color: Color(0xffd3d3d3),
      strokeWidth: 1,
      dashPattern: [3, 2],
      borderType: BorderType.RRect,
      radius: Radius.circular(0),
      padding: EdgeInsets.all(0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return dashedBorderContainer(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Departure Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dep: ${flight['depDate']}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(flight['depCode'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1)),
                    Tooltip(
                      message: flight['depCity'],
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          flight['depCity'] ?? '',
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 1,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Flight path visual
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.flight, size: 20, color: Colors.grey),
                          SizedBox(width: 4),
                          Transform.rotate(
                            angle: 0.8,
                            child: Icon(Icons.flight, size: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                            CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Arrival Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Ret: ${flight['retDate']}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(flight['arrCode'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1)),
                    Tooltip(
                      message: flight['arrCity'],
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          flight['arrCity'] ?? '',
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 1,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Round Trip",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${flight['price'].toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
