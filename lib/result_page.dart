import 'package:cheers_travel_website/result_filter.dart';
import 'package:cheers_travel_website/result_view.dart';
import 'package:flutter/material.dart';
import 'footer_inner_page.dart';
import 'header_result.dart';
import 'matrix_airline.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isFilterOpen = false;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
          MediaQuery.of(context).size.width < 1024;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xfff0f2f5),
          child: Center(
            child: Column(
              children: [
                HeaderResult(),

                // Mobile Header with filter button
                if (mobile)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Flight Results',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {
                            setState(() => isFilterOpen = true);
                          },
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 20),
                SizedBox(
                  width: isDesktop(context) ? 1200 : double.infinity,
                  child: Column(
                    children: [
                      AirlineFareCard(),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!mobile)
                            const SizedBox(
                              width: 300,
                              height: 800,
                              child: FlightFilterPanel(),
                            ),
                          if (!mobile) const SizedBox(width: 20),
                          const Expanded(child: ResultView()),
                        ],
                      ),
                    ],
                  ),
                ),
                if (!mobile) FooterInnerPage(),
              ],
            ),
          ),
        ),

        // Slide-in Filter Panel (Mobile)
        if (mobile && isFilterOpen)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 0,
            left: isFilterOpen ? 0 : -300,
            bottom: 0,
            width: 300,
            child: Material(
              elevation: 8,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Filters',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() => isFilterOpen = false);
                          },
                        )
                      ],
                    ),
                  ),
                  const Expanded(child: FlightFilterPanel()),
                ],
              ),
            ),
          ),
      ],
    );
  }
}


