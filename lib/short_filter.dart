import 'package:flutter/material.dart';

class FlightFilterBar extends StatelessWidget {
  final List<Map<String, String>> filters = [
    {'title': 'Direct First', 'price': 'AU\$ 2,546'},
    {'title': 'Recommended', 'price': 'AU\$ 2,546'},
    {'title': 'Cheapest', 'price': 'AU\$ 2,546'},
    {'title': 'Alternate date', 'price': 'AU\$ 2,546'},
    {'title': 'Near By Airports', 'price': 'AU\$ 2,546'},
  ];

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 400;
    final bool isMediumScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      color: Colors.white,
      height: isSmallScreen ? 72 : 48, // Taller on small screens
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 8 : 16, // Less padding on small screens
        ),
        itemCount: filters.length,
        separatorBuilder: (_, __) => VerticalDivider(
          width: 1,
          color: Colors.grey.shade300,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          final item = filters[index];
          final isSelected = index == 0; // Highlight first one

          return _buildFilterItem(
            context,
            item,
            isSelected,
            isSmallScreen,
            isMediumScreen,
          );
        },
      ),
    );
  }

  Widget _buildFilterItem(
      BuildContext context,
      Map<String, String> item,
      bool isSelected,
      bool isSmallScreen,
      bool isMediumScreen,
      ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 12 : 24, // Less padding on small screens
        vertical: isSmallScreen ? 8 : 4,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title row
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  item['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 12 : 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (item['title'] == 'Recommended')
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(Icons.info_outline,
                    size: isSmallScreen ? 12 : 14,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),

          SizedBox(height: isSmallScreen ? 4 : 0),

          // Price row
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  item['price']!,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 11 : 12,
                    color: isSelected ? Colors.black : const Color(0xff8592a9),
                    decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (item['title'] == 'Alternate date' || item['title'] == 'Near By Airports')
                Icon(
                  Icons.keyboard_arrow_down,
                  size: isSmallScreen ? 16 : 20,
                  color: const Color(0xff8592a9),
                ),
            ],
          ),
        ],
      ),
    );
  }
}