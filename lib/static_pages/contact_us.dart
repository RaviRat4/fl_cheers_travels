import 'package:flutter/material.dart';
import '../footer.dart';
import '../footer_above.dart';
import '../header.dart';
import '../usb_section.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderSection(),
          _buildHeroBanner(context),
          UsbSection(),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;
                  return isMobile
                      ? Column(
                    children: [
                      _buildLeftSection(),
                      const SizedBox(height: 16),
                      _buildRightSection(),
                    ],
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildLeftSection()),
                      const SizedBox(width: 16),
                      Expanded(child: _buildRightSection()),
                    ],
                  );
                },
              ),
            ),
          ),
          FooterSection(),
        ],
      ),
    );
  }

  Widget _buildLeftSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Address"),
        _iconCards(Icons.home, "PO Box 5026 Murray Bridge South 5253 Australia.",),
        const Divider(height: 32),
        _sectionTitle("Contact Info"),
        const Text(
          "We're just a click away, offering round-the-clock support via email.",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        _iconCard(Icons.phone, "08 70952590"),
        _iconCard(Icons.phone, "61 426111112"),
        _iconCard(Icons.phone, "08 70992292"),
        _iconCard(Icons.email, "care@cheerstravel.com.au"),
        const SizedBox(height: 12),
        const Text(
          "Mon–Sun: 08:30 AM - 00:30 AM AEST",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRightSection() {
    return Container(
      padding: EdgeInsets.only(left: 40, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _sectionTitle("Contact and Support Information"),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Phone Support: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "Available Mon–Sun, 09:30 AM - 00:30 AM AEST."),
              ],
            ),
          ),
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Email Support: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                  "Our dedicated email support team is available to assist you promptly with any inquiries you may have. Kindly send your queries to ",
                ),
                TextSpan(
                  text: "care@cheerstravel.com.au",
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: " and one of our experts will get back to you promptly."),
              ],
                style: TextStyle(height: 1.8)
            ),
          ),
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Office: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "Please visit Murray Bridge office (With Appointment only)"),
              ],
                style: TextStyle(height: 1.8)
            ),
          ),
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Urgent Booking Amendments: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                  "If you notice any errors or need to make amendments to your booking, it is crucial that you email us before 8PM on the same day of your reservation. Be sure to include the Reference number starting with ",
                ),
                TextSpan(
                  text: "“CT”",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: " in the subject line to ensure prompt assistance."),
              ],
                style: TextStyle(height: 1.8)
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Please note that additional costs may apply if you report any changes after the 8PM deadline, in accordance with the Airline's policy. Time is of the essence, so I urge you to thoroughly review your booking information right away.",
              style: TextStyle(height: 1.8)
          ),
          SizedBox(height: 15),
          Text(
            "Do not hesitate to reach out to us immediately if any updates are needed. We're here to help ensure your travel experience goes as smoothly as possible.",
              style: TextStyle(height: 1.8)
          ),
        ],
      ),
    );
  }
}

class _iconCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const _iconCard(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 0),
      decoration: BoxDecoration(
        color: const Color(0xFFecf0f4),
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Color(0Xff0c44ac)),
        title: Text(
          text,
          style: const TextStyle(
            color: Color(0Xff0c44ac),
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0Xff0c44ac), size: 20),
      ),
    );
  }
}
class _iconCards extends StatelessWidget {
  final IconData icon;
  final String text;

  const _iconCards(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFecf0f4),
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Color(0Xff0c44ac), size: 29,),
        title: Text(
          text,
          style: const TextStyle(
            color: Color(0Xff0c44ac),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0Xff0c44ac), size: 19),
      ),
    );
  }
}

class _sectionTitle extends StatelessWidget {
  final String title;

  const _sectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 3,
            width: 40,
            color: Colors.red,
            margin: const EdgeInsets.only(top: 4),
          ),
        ],
      ),
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
              "Contact Us",
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
                "We're just a click away, offering round-the-clock support via email.",
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