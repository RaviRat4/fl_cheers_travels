import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../footer.dart';
import '../footer_above.dart';
import '../header.dart';
import '../usb_section.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1200;

    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderSection(),
          _buildHeroBanner(context),
          UsbSection(),
          Container(
            constraints: BoxConstraints(maxWidth: 1200),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 16 : 24,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('About Us', context),
                _buildParagraph(
                  "Cheers Travel Partners is an Australian based company.",
                  isBold: true,
                  context: context,
                ),
                _buildParagraph(
                  "Cheers Travel stands as one of the largest retail and online travel agencies. Accessing budget-friendly flights is easy; you can visit us at our office in Murray Bridge, call our contact centre, or simply explore our website.",
                  context: context,
                ),
                // ... Keep other paragraphs similar with _buildParagraph calls
                _buildSectionTitle('Mission', context),
                _buildParagraph(
                  "Cheers Travel Partners is set up to with the Mission to make travel fun easy and affordable by providing personal service. With the sheer range of destinations and superb leisure facilities and an unparalleled selection of flights. We customize requirements to give our customers and their families not only holidays but memories. We have exclusive rights to sell all the different destinations of the world.",
                  context: context,
                ),
                _buildSectionTitle('Vision', context),
                _buildParagraph(
                  "We look beyond the horizon to anticipate change. We’re passionate about shaping the next generation of travel.",
                  context: context,
                ),
                // ... Rest of the vision paragraphs
                _buildSectionTitle('What Inspires You To Approach Us', context),
                _buildParagraph(
                  "Business and leisure travelers from across the globe seek our assistance because of the trust we create. We guarantee that our flight deals are relatively competitive and as a result, you can fly on a budget. In addition, our travel experts have hands-on experience in designing itineraries that can enhance your travel experience. Our people are also driven to do their very best for our customers. We blend experience with knowledge and our large network of domestic and international flights can help you make your trip thrilling and memorable.",
                  isBold: false,
                  context: context,
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          _buildInspirationSection(context),
          _buildContactSection(context),
          FooterSection(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String text, BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isSmallScreen ? 20 : 24,
          fontWeight: FontWeight.bold,
          color: Colors.indigo[900],
        ),
      ),
    );
  }

  Widget _buildParagraph(String text,
      {bool isBold = false, required BuildContext context}) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isSmallScreen ? 14 : 16,
          height: 1.6,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildInspirationSection(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Container(
      width: isSmallScreen ? double.infinity : 1200,
      padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
      color: Colors.indigo[50],
      child: Column(
        children: [
          Text("Why Choose Us?",
              style: TextStyle(
                  fontSize: isSmallScreen ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900])),
          SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: constraints.maxWidth > 600 ? 4 : 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildFeatureItem(Icons.thumb_up, "Trusted Service"),
                  _buildFeatureItem(Icons.attach_money, "Best Prices"),
                  _buildFeatureItem(Icons.access_time, "24/7 Support"),
                  _buildFeatureItem(Icons.map, "Global Network"),
                ],
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 16 : 24, vertical: 16),
            child: Text(
              "Business and leisure travelers from across the globe seek our assistance because of the trust we create...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallScreen ? 14 : 16,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.indigo[900]),
          SizedBox(height: 8),
          Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900])),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
      child: Column(
        children: [
          Text("Get in Touch",
              style: TextStyle(
                  fontSize: isSmallScreen ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900])),
          SizedBox(height: 20),
          isSmallScreen
              ? Column(
            children: [
              _buildContactButton(Icons.phone, "Call Us"),
              SizedBox(height: 20),
              _buildContactButton(Icons.email, "Email"),
              SizedBox(height: 20),
              _buildContactButton(Icons.location_on, "Visit"),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactButton(Icons.phone, "Call Us"),
              SizedBox(width: 40),
              _buildContactButton(Icons.email, "Email"),
              SizedBox(width: 40),
              _buildContactButton(Icons.location_on, "Visit"),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 24),
            child: Text(
              "Akash Travel Pty Ltd with ABN: 59631570806 is trading as Cheers Travel Partners in Australia.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: isSmallScreen ? 12 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.indigo[900],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        SizedBox(height: 8),
        Text(label,
            style: TextStyle(
                color: Colors.indigo[900], fontWeight: FontWeight.w500)),
      ],
    );
  }
}

Widget _buildHeroBanner(context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  final isSmallScreen = screenWidth < 600;

  return Stack(
    children: [
      Image.asset(
        'assets/images/homebanner.jpg',
        width: double.infinity,
        height: screenHeight * 0.3,
        fit: BoxFit.cover,
      ),
      Container(
        width: double.infinity,
        height: screenHeight * 0.3,
        color: Colors.black.withOpacity(0.4),
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 16 : 40,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "About Us",
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 28 : 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 0 : screenWidth * 0.2),
              child: Text(
                "We are a company of trusted and passionate travel specialists.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 16 : 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}