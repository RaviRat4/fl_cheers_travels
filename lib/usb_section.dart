import 'package:flutter/material.dart';

class UsbSection extends StatelessWidget {
  const UsbSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1240,
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            UsbCard(
              imagePath: 'assets/images/quality.png',
              title: 'Assured Quality',
              description:
              'We pride ourselves to provide all our customers with an unmatched high-quality booking and travel experience.',
            ),
            UsbCard(
              imagePath: 'assets/images/support.png',
              title: '24 x 7 Support',
              description:
              'Get all your doubts cleared and questions answered by our dedicated travel experts anytime, anywhere.',
            ),
            UsbCard(
              imagePath: 'assets/images/airfare.png',
              title: 'Low Airfare Promise',
              description:
              'If you can find a cheaper deal than the one you\'ve booked with us, we duly refund the difference.',
            ),
            UsbCard(
              imagePath: 'assets/images/secure.png',
              title: 'Easy & Secure',
              description:
              'Get your bookings confirmed within seconds via one phone call and avail of top-level security for all payments.',
            ),
          ],
        ),
      ),
    );
  }
}

class UsbCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const UsbCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 55,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Container(height: 1, color: Colors.black26),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
