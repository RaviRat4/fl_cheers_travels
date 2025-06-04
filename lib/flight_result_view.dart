import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1000;

    return Column(
      children: List.generate(5, (index) {
        final hasUrgencyTag = index % 2 == 0; // Alternate cards have urgency tag
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            color: Colors.white,
            child: isMobile ? _buildMobileCard(context, hasUrgencyTag) : _buildDesktopCard(context, hasUrgencyTag),
          ),
        );
      }),
    );
  }

  Widget _buildDesktopCard(BuildContext context, bool hasUrgencyTag) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Left Section - Airline Info
          _buildAirlineInfo(hasUrgencyTag),
          const SizedBox(width: 20),

          // Center Section - Flight Times
          _buildFlightTimes(),

          // Right Section - Price and Button
          _buildPriceAndButton(context, hasUrgencyTag),
        ],
      ),
    );
  }

  Widget _buildMobileCard(BuildContext context, bool hasUrgencyTag) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row - Tags and Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (hasUrgencyTag)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Text(
                    'Cheapest',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              Text('AU\$ 2,546',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),

          const SizedBox(height: 10),

          // Airline Info
          _buildAirlineInfo(hasUrgencyTag, isMobile: true),

          const SizedBox(height: 16),

          // Flight Times - Horizontal Layout
          _buildMobileFlightTimes(),

          const SizedBox(height: 16),

          // Select Button
          _buildMobileSelectButton(context, hasUrgencyTag),
        ],
      ),
    );
  }

  Widget _buildAirlineInfo(bool hasUrgencyTag, {bool isMobile = false}) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobile) Row(
            children: [
              if (hasUrgencyTag)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Text(
                    'Cheapest',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xfffaebeb),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.luggage, size: 20, color: Color(0xff0c44ac)),
                    const SizedBox(width: 4),
                    Text('25 kg',
                        style: TextStyle(
                            fontSize: isMobile ? 12 : 12,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 0 : 10),
          Row(
            children: [
              Image.asset(
                'assets/images/ai.png',
                width: isMobile ? 50 : 70,
              ),
              const SizedBox(width: 15),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Air India', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.bolt, size: 18, color: Color(0xff0c44ac)),
                      SizedBox(width: 6),
                      Icon(Icons.restaurant, size: 15, color: Color(0xff0c44ac)),
                      SizedBox(width: 9),
                      Icon(Icons.tv, size: 15, color: Color(0xff0c44ac)),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFlightTimes() {
    return Expanded(
      child: Row(
        children: [
          // Departure
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('00:55', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('DEL T3', style: TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
          ),

          // Duration
          Expanded(
            child: Column(
              children: [
                const Text('12h 35m', style: TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(height: 4),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Divider(thickness: 1.5, color: Colors.grey.shade300, indent: 10, endIndent: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                        Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('Direct', style: TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
          ),

          // Arrival
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('19:00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('SYD T1', style: TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFlightTimes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('00:55', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text('DEL', style: TextStyle(fontSize: 12, color: Colors.black)),
          ],
        ),

        Column(
          children: [
            const Text('12h 35m', style: TextStyle(fontSize: 14, color: Colors.black)),
            const SizedBox(height: 4),
            Stack(
              alignment: Alignment.center,
              children: [
                Divider(thickness: 1.5, color: Colors.grey.shade300, indent: 10, endIndent: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                    Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text('Direct', style: TextStyle(fontSize: 12, color: Colors.black)),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('19:00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text('SYD', style: TextStyle(fontSize: 12, color: Colors.black)),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceAndButton(BuildContext context, bool hasUrgencyTag) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('AU\$ 2,546', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              )),
              const Text('Return', style: TextStyle(fontSize: 12, color: Colors.black)),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Container(
          clipBehavior: Clip.none,
          decoration: const BoxDecoration(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                  backgroundColor: const Color(0xff0c44ac),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Select', style: TextStyle(color: Colors.white, fontSize: 16)),
                    Icon(Icons.keyboard_arrow_down_outlined, size: 22, color: Colors.white),
                  ],
                ),
              ),
              if (hasUrgencyTag)
                Positioned(
                  right: 2,
                  top: -10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text('<5 left', style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMobileSelectButton(BuildContext context, bool hasUrgencyTag) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color(0xff0c44ac),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Select flight', style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down_outlined, size: 22, color: Colors.white),
              ],
            ),
          ),
          if (hasUrgencyTag)
            Positioned(
              right: 10,
              top: -10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Text('<5 left', style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
            ),
        ],
      ),
    );
  }
}