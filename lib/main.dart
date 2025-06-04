import 'package:cheers_travel_website/result_page.dart';
import 'package:cheers_travel_website/static_pages/about_us.dart';
import 'package:cheers_travel_website/static_pages/contact_us.dart';
import 'package:cheers_travel_website/static_pages/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'destinations/top_destinations.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheers Travel',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Cheers Travel'),
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             /* HomePage(),*/
              /*AboutUsPage(),*/
              /*ContactUsPage(),*/
              /*PrivacyPolicyContent(),*/
              /*DiscountedFlightsSection(),*/
              ResultPage(),
            ],
          ),
        ),
      ),
    );
  }
}
