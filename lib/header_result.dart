import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderResult extends StatelessWidget {
  const HeaderResult({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    final isTablet = screenWidth > 600 && screenWidth <= 1200;
    final isMobile = screenWidth <= 600;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: isLargeScreen
          ? _buildDesktopLayout(context)
          : _buildMobileTabletLayout(context, isTablet: isTablet, isMobile: isMobile),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Image.asset(
            'assets/images/cheers-logo.png',
            width: 270,
          ),
        ),
        Flexible(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildInfoBlock("Sat 15 Mar", "SYD ➜ CHC"),
                  _divider(90),
                  _buildInfoBlock("Sun 6 Apr", "CHC ➜ SYD"),
                  _divider(90),
                  _buildInfoBlock("Passengers", "1 ADULT"),
                  _divider(90),
                  _buildEditSearchButton(),
                  _divider(90),
                  _buildAccountDropdown(),
                ],
              ),
              _buildPhoneInfo(context, fontSize: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTabletLayout(BuildContext context,
      {required bool isTablet, required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top row with logo and phone
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/cheers-logo.png',
              width: isTablet ? 200 : 150,
            ),
            _buildPhoneInfo(context, fontSize: isTablet ? 20 : 18),
          ],
        ),
        const SizedBox(height: 12),

        // First row of info blocks
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildInfoBlock("Sat 15 Mar", "SYD ➜ CHC"),
              _divider(60),
              _buildInfoBlock("Sun 6 Apr", "CHC ➜ SYD"),
              _divider(60),
              _buildInfoBlock("Passengers", "1 ADULT"),
              if (isTablet) ...[
                _divider(60),
                _buildEditSearchButton(),
                _divider(60),
                _buildAccountDropdown(),
              ]
            ],
          ),
        ),

        // On mobile: second row for edit + account
        if (isMobile)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                _buildEditSearchButton(),
                const SizedBox(width: 12),
                _buildAccountDropdown(),
              ],
            ),
          ),
      ],
    );
  }

  Widget _divider(double height) => Container(
    width: 1,
    height: height,
    color: const Color(0xFFd8d8d8),
    margin: const EdgeInsets.symmetric(horizontal: 12),
  );

  Widget _buildPhoneInfo(BuildContext context, {double fontSize = 24}) {
    final isMobile = fontSize < 20; // Smaller font means mobile view

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildPhoneIcon(context),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse("tel:0489994765")),
              child: Text(
                "04 89994765",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0XFF666666),
                  height: 0.9,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse("tel:0870952590")),
              child: Text(
                "08 70952590",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0XFF666666),
                  height: 1,
                ),
              ),
            ),
            Text(
              "08:30 AM - 00:30 AM AEST",
              style: TextStyle(
                color: Colors.red,
                fontSize: isMobile ? 9.5 : 11.5,
                fontWeight: FontWeight.bold,
                height: 0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPhoneIcon(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 6 : 8),
      width: isMobile ? 36 : 45,
      height: isMobile ? 36 : 45,
      decoration: const BoxDecoration(
        color: Color(0xFF003D99),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Icon(
        Icons.phone,
        color: Colors.white,
        size: isMobile ? 18 : 24,
      ),
    );
  }

  Widget _buildInfoBlock(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditSearchButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.edit, size: 16),
        label: const Text("Edit search"),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFe6ecf7),
          foregroundColor: const Color(0xff0c44ac),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.only(right: 4, top: 3, bottom: 5, left: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFe5eef4),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Row(
          children: [
            Text(
              "My Account",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
