import 'package:flutter/material.dart';
import 'models/flight_suggestion.dart';
import 'services/flight_service.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

enum TripType { returnTrip, oneWay, multiCity }

class TravellersClassPicker extends StatefulWidget {
  const TravellersClassPicker({Key? key}) : super(key: key);

  @override
  State<TravellersClassPicker> createState() => _TravellersClassPickerState();
}

class _TravellersClassPickerState extends State<TravellersClassPicker> {
  int travellers = 1;
  String travelClass = 'Economy';

  Widget _travellerRow(String label, void Function(void Function()) setSheetState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  if (travellers > 1) {
                    setSheetState(() => travellers--);
                  }
                },
              ),
              Text(travellers.toString(), style: const TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  setSheetState(() => travellers++);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _openTravellersClassPicker() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Traveller Class Picker",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15,
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: 16,
            right: 16,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              child: StatefulBuilder(builder: (context, setSheetState) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 600,
                    maxHeight: MediaQuery.of(context).size.height * 0.7,
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),

                          LayoutBuilder(
                            builder: (context, constraints) {
                              if (constraints.maxWidth > 500) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          _travellerRow("Adults", setSheetState),
                                          Divider(height: 20, thickness: 1, color: Color(0xffdbdbdb)),
                                          _travellerRow("Children (2 - 11 Years)", setSheetState),
                                          Divider(height: 20, thickness: 1, color: Color(0xffdbdbdb)),
                                          _travellerRow("Infant (Under 2 Years)", setSheetState),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Container(
                                      width: 1,
                                      height: 150,
                                      color: Color(0xffdbdbdb),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Select Class",
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 8),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 8,
                                            children: ['Economy', 'Premium Economy', 'Business', 'First']
                                                .map((value) => ChoiceChip(
                                              label: Text(value),
                                              selected: travelClass == value,
                                              onSelected: (selected) {
                                                if (selected) {
                                                  setSheetState(() => travelClass = value);
                                                }
                                              },
                                            ))
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        _travellerRow("Adults", setSheetState),
                                        Divider(height: 20, thickness: 1, color: Color(0xffdbdbdb)),
                                        _travellerRow("Children (2 - 11 Years)", setSheetState),
                                        Divider(height: 20, thickness: 1, color: Color(0xffdbdbdb)),
                                        _travellerRow("Infant (Under 2 Years)", setSheetState),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "Select Class",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: ['Economy', 'Premium Economy', 'Business', 'First']
                                          .map((value) => ChoiceChip(
                                        label: Text(value),
                                        selected: travelClass == value,
                                        onSelected: (selected) {
                                          if (selected) {
                                            setSheetState(() => travelClass = value);
                                          }
                                        },
                                      ))
                                          .toList(),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),

                          const SizedBox(height: 16),
                          Divider(height: 1, thickness: 1, color: Color(0xffdbdbdb)),
                          const SizedBox(height: 16),
                          Center(
                            child: SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: const Text("Done"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return GestureDetector(
      onTap: _openTravellersClassPicker,
      child: Container(
        width: isSmallScreen ? double.infinity : 180,
        constraints: isSmallScreen
            ? const BoxConstraints(maxWidth: 180)
            : null,
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xff767b8e), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: isSmallScreen ? 20 : 36),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Travellers & Class",
                      style: TextStyle(
                          fontSize: isSmallScreen ? 10 : 12,
                          color: Color(0xff494949)),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down,
                      color: Color(0xff494949), size: 20),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 5),
                const Icon(Icons.account_circle,
                    color: Color(0xff494949), size: 26),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "$travellers Traveller${travellers > 1 ? 's' : ''}",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: isSmallScreen ? 30 : 37),
              child: Text(
                travelClass,
                style: TextStyle(
                  fontSize: isSmallScreen ? 10 : 12,
                  color: Color(0xff0c223f),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchWidgetState extends State<SearchWidget> {
  DateTime? _startDate;
  DateTime? _endDate;
  final List<MultiCityFlight> _multiCityFlights = [];
  int _activeMultiCityIndex = 0;

  void _openDateRangePicker() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 350,
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,
              showActionButtons: true,
              onSubmit: (Object? val) {
                if (val is PickerDateRange) {
                  setState(() {
                    _startDate = val.startDate;
                    _endDate = val.endDate;
                  });
                }
                Navigator.pop(context);
              },
              onCancel: () => Navigator.pop(context),
              initialSelectedRange: PickerDateRange(
                _startDate ?? DateTime.now(),
                _endDate ?? DateTime.now().add(const Duration(days: 2)),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "Date";
    return "${date.day}/${date.month}/${date.year}";
  }

  String _formatDay(DateTime? date) {
    if (date == null) return "Day";
    return ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][date.weekday % 7];
  }

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  List<FlightSuggestion> _fromSuggestions = [];
  List<FlightSuggestion> _toSuggestions = [];
  bool _isLoadingFrom = false;
  bool _isLoadingTo = false;
  bool _isFromFocused = false;
  bool _isToFocused = false;
  TripType _selectedTrip = TripType.returnTrip;
  bool isChecked = false;
  FlightSuggestion? _selectedFromSuggestion;
  FlightSuggestion? _selectedToSuggestion;

  @override
  void initState() {
    super.initState();
    _multiCityFlights.add(MultiCityFlight());
    _startDate = DateTime.now();
    _endDate = DateTime.now().add(const Duration(days: 2));
  }

  void _onFromTextChanged(String text) async {
    if (text.length < 2) {
      setState(() => _fromSuggestions = []);
      return;
    }

    setState(() => _isLoadingFrom = true);
    try {
      final results = await FlightService.fetchSuggestions(text);
      setState(() {
        _fromSuggestions = results;
        _isLoadingFrom = false;
      });
    } catch (e) {
      setState(() {
        _fromSuggestions = [];
        _isLoadingFrom = false;
      });
    }
  }

  void _onToTextChanged(String text) async {
    if (text.length < 2) {
      setState(() => _toSuggestions = []);
      return;
    }

    setState(() => _isLoadingTo = true);
    try {
      final results = await FlightService.fetchSuggestions(text);
      setState(() {
        _toSuggestions = results;
        _isLoadingTo = false;
      });
    } catch (e) {
      setState(() {
        _toSuggestions = [];
        _isLoadingTo = false;
      });
    }
  }

  void _selectFromSuggestion(FlightSuggestion suggestion) {
    _fromController.text = suggestion.cityCode;
    setState(() {
      _selectedFromSuggestion = suggestion;
      _fromSuggestions = [];
      _isFromFocused = false;
    });
  }

  void _selectToSuggestion(FlightSuggestion suggestion) {
    _toController.text = suggestion.cityCode;
    setState(() {
      _selectedToSuggestion = suggestion;
      _toSuggestions = [];
      _isToFocused = false;
    });
  }

  void _addMultiCityFlight() {
    setState(() {
      _multiCityFlights.add(MultiCityFlight());
      _activeMultiCityIndex = _multiCityFlights.length - 1;
    });
  }

  void _removeMultiCityFlight(int index) {
    if (_multiCityFlights.length > 1) {
      setState(() {
        _multiCityFlights.removeAt(index);
        if (_activeMultiCityIndex >= _multiCityFlights.length) {
          _activeMultiCityIndex = _multiCityFlights.length - 1;
        }
      });
    }
  }

  void _setActiveMultiCityIndex(int index) {
    setState(() {
      _activeMultiCityIndex = index;
    });
  }

  void _updateMultiCityFlight(int index, MultiCityFlight flight) {
    setState(() {
      _multiCityFlights[index] = flight;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 768;
    final isMediumScreen = screenWidth >= 768 && screenWidth < 1024;

    return Stack(
      children: [
        Image.asset(
          'assets/images/homebanner.jpg',
          width: double.infinity,
          height: isSmallScreen ? 650 : 440,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: isSmallScreen ? 650 : 440,
          color: Colors.black.withOpacity(0.4),
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 10 : 20,
            vertical: isSmallScreen ? 20 : 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: isSmallScreen ? 10 : 30),
              Text(
                "Where Every Journey",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 18 : 25,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                "Become An Adventure",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 24 : 34,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: isSmallScreen ? 10 : 20),
              Container(
                width: isSmallScreen
                    ? screenWidth * 0.95
                    : isMediumScreen
                    ? screenWidth * 0.9
                    : 1230,
                padding: EdgeInsets.all(isSmallScreen ? 10 : 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: isSmallScreen ? 5 : 10),
                      child: isSmallScreen
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              buildRadioOption(TripType.returnTrip, 'Return'),
                              SizedBox(width: 8),
                              buildRadioOption(TripType.oneWay, 'One Way'),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              buildRadioOption(TripType.multiCity, 'Multi-City'),
                              SizedBox(width: 8),
                              Container(height: 17, width: 1, color: Colors.black54),
                              SizedBox(width: 8),
                              Row(
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                    fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return Color(0xff0c44ac);
                                      }
                                      return Colors.white;
                                    }),
                                  ),
                                  Text("Direct"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildRadioOption(TripType.returnTrip, 'Return'),
                          SizedBox(width: 16),
                          buildRadioOption(TripType.oneWay, 'One Way'),
                          SizedBox(width: 16),
                          buildRadioOption(TripType.multiCity, 'Multi-City'),
                          SizedBox(width: 20),
                          Container(height: 17, width: 1, color: Colors.black54),
                          SizedBox(width: 15),
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Color(0xff0c44ac);
                                  }
                                  return Colors.white;
                                }),
                              ),
                              Text("Direct flights"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    _selectedTrip == TripType.multiCity
                        ? _buildMultiCityFields(isSmallScreen)
                        : isSmallScreen
                        ? Column(
                      children: [
                        _buildFromField(isSmallScreen),
                        SizedBox(height: 8),
                        _buildToField(isSmallScreen),
                        SizedBox(height: 8),
                        _buildDateFields(isSmallScreen),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(child: TravellersClassPicker()),
                            SizedBox(width: 8),
                            Expanded(child: _buildSearchButton(isSmallScreen)),
                          ],
                        ),
                      ],
                    )
                        : Row(
                      children: [
                        Expanded(child: _buildFromField(isSmallScreen)),
                        SizedBox(width: 8),
                        Expanded(child: _buildToField(isSmallScreen)),
                        SizedBox(width: 8),
                        _buildDateFields(isSmallScreen),
                        SizedBox(width: 8),
                        TravellersClassPicker(),
                        SizedBox(width: 8),
                        _buildSearchButton(isSmallScreen),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: isSmallScreen ? screenWidth * 0.50 : 1230,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/reviewImg.png',
                      height: isSmallScreen ? screenWidth * 0.03 : 34,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMultiCityFields(bool isSmallScreen) {
    return Column(
      children: [
        ..._multiCityFlights.asMap().entries.map((entry) {
          final index = entry.key;
          final flight = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: MultiCityFlightCard(
              flight: flight,
              isActive: index == _activeMultiCityIndex,
              onTap: () => _setActiveMultiCityIndex(index),
              onRemove: _multiCityFlights.length > 1
                  ? () => _removeMultiCityFlight(index)
                  : null,
              onChanged: (updatedFlight) => _updateMultiCityFlight(index, updatedFlight),
              isSmallScreen: isSmallScreen,
            ),
          );
        }).toList(),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: _addMultiCityFlight,
            icon: Icon(Icons.add, color: Color(0xff0c44ac)),
            label: Text(
              'Add another flight',
              style: TextStyle(color: Color(0xff0c44ac)),
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: TravellersClassPicker()),
            SizedBox(width: 8),
            Expanded(child: _buildSearchButton(isSmallScreen)),
          ],
        ),
      ],
    );
  }

  Widget _buildFromField(bool isSmallScreen) {
    return Stack(
      children: [
        Container(
          width: isSmallScreen ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3.8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Color(0xff767b8e),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  "From",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff494949),
                  ),
                ),
              ),
              const SizedBox(height: 0),
              Row(
                children: [
                  SizedBox(width: 5),
                  const Icon(Icons.local_airport, color: Color(0xff313541), size: 25),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          _isFromFocused = hasFocus;
                        });
                      },
                      child: TextField(
                        controller: _fromController,
                        onChanged: _onFromTextChanged,
                        decoration: InputDecoration(
                          hintText: "Flying From",
                          hintStyle: TextStyle(
                              fontSize: isSmallScreen ? 14 : 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold
                          ),
                          border: InputBorder.none,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                            fontSize: isSmallScreen ? 14 : 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_selectedFromSuggestion != null)
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedFromSuggestion!.cityName,
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xff494949),
                        ),
                      ),
                      Text(
                        _selectedFromSuggestion!.airportName,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff767b8e),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    "Airport/City Name",
                    style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff494949),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (_isFromFocused && (_fromSuggestions.isNotEmpty || _isLoadingFrom))
          Positioned(
            top: 57,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: _isLoadingFrom
                  ? Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xff0c44ac),
                ),
              )
                  : Column(
                children: _fromSuggestions.map((suggestion) {
                  return InkWell(
                    onTap: () => _selectFromSuggestion(suggestion),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${suggestion.cityName}, ${suggestion.countryName}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            suggestion.airportName,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildToField(bool isSmallScreen) {
    return Stack(
      children: [
        Container(
          width: isSmallScreen ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3.8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Color(0xff767b8e),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  "To",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff494949),
                  ),
                ),
              ),
              const SizedBox(height: 0),
              Row(
                children: [
                  SizedBox(width: 5),
                  const Icon(Icons.local_airport, color: Color(0xff313541), size: 25),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          _isToFocused = hasFocus;
                        });
                      },
                      child: TextField(
                        controller: _toController,
                        onChanged: _onToTextChanged,
                        decoration: InputDecoration(
                          hintText: "Flying To",
                          hintStyle: TextStyle(
                              fontSize: isSmallScreen ? 14 : 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold
                          ),
                          border: InputBorder.none,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                            fontSize: isSmallScreen ? 14 : 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_selectedToSuggestion != null)
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedToSuggestion!.cityName,
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xff494949),
                        ),
                      ),
                      Text(
                        _selectedToSuggestion!.airportName,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff767b8e),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    "Airport/City Name",
                    style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff494949),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (_isToFocused && (_toSuggestions.isNotEmpty || _isLoadingTo))
          Positioned(
            top: 57,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: _isLoadingTo
                  ? Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xff0c44ac),
                ),
              )
                  : Column(
                children: _toSuggestions.map((suggestion) {
                  return InkWell(
                    onTap: () => _selectToSuggestion(suggestion),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${suggestion.cityName}, ${suggestion.countryName}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            suggestion.airportName,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDateFields(bool isSmallScreen) {
    if (isSmallScreen) {
      return Column(
        children: [
          GestureDetector(
            onTap: _openDateRangePicker,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xff767b8e), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Row(
                      children: [
                        Text(
                          "Departure",
                          style: TextStyle(fontSize: 12, color: Color(0xff494949)),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff494949)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                      const SizedBox(width: 5),
                      Text(
                        _formatDate(_startDate),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text(
                      _formatDay(_startDate),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xff494949),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          if (_selectedTrip == TripType.returnTrip)
            GestureDetector(
              onTap: _openDateRangePicker,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xff767b8e), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Row(
                        children: [
                          Text(
                            "Return",
                            style: TextStyle(fontSize: 12, color: Color(0xff494949)),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff494949)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                        const SizedBox(width: 5),
                        Text(
                          _formatDate(_endDate),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 36),
                      child: Text(
                        _formatDay(_endDate),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff0c223f),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
    } else {
      return Row(
        children: [
          GestureDetector(
            onTap: _openDateRangePicker,
            child: Container(
              width: 170,
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xff767b8e), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Row(
                      children: [
                        Text(
                          "Departure",
                          style: TextStyle(fontSize: 12, color: Color(0xff494949)),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff494949)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                      const SizedBox(width: 5),
                      Text(
                        _formatDate(_startDate),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text(
                      _formatDay(_startDate),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xff494949),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_selectedTrip == TripType.returnTrip) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _openDateRangePicker,
              child: Container(
                width: 170,
                padding: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xff767b8e), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Row(
                        children: [
                          Text(
                            "Return",
                            style: TextStyle(fontSize: 12, color: Color(0xff494949)),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff494949)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                        const SizedBox(width: 5),
                        Text(
                          _formatDate(_endDate),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 36),
                      child: Text(
                        _formatDay(_endDate),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff0c223f),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      );
    }
  }

  Widget _buildSearchButton(bool isSmallScreen) {
    return TextButton(
      onPressed: (){},
      style: TextButton.styleFrom(
        backgroundColor: Color(0xff0c44ac),
        padding: EdgeInsets.symmetric(
          vertical: isSmallScreen ? 15 : 31,
          horizontal: isSmallScreen ? 10 : 27,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, color: Colors.white, size: isSmallScreen ? 20 : 27),
          SizedBox(width: 5),
          Text(
            'Search'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: isSmallScreen ? 17 : 17,
            ),
          )
        ],
      ),
    );
  }

  Widget buildRadioOption(TripType value, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<TripType>(
          value: value,
          groupValue: _selectedTrip,
          activeColor: Color(0xff005dad),
          onChanged: (TripType? newValue) {
            setState(() {
              _selectedTrip = newValue!;
            });
          },
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class MultiCityFlight {
  String from = '';
  String to = '';
  DateTime? date;

  MultiCityFlight();
}

class MultiCityFlightCard extends StatefulWidget {
  final MultiCityFlight flight;
  final bool isActive;
  final VoidCallback onTap;
  final VoidCallback? onRemove;
  final Function(MultiCityFlight) onChanged;
  final bool isSmallScreen;

  const MultiCityFlightCard({
    required this.flight,
    required this.isActive,
    required this.onTap,
    this.onRemove,
    required this.onChanged,
    required this.isSmallScreen,
    Key? key,
  }) : super(key: key);

  @override
  _MultiCityFlightCardState createState() => _MultiCityFlightCardState();
}

class _MultiCityFlightCardState extends State<MultiCityFlightCard> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  List<FlightSuggestion> _fromSuggestions = [];
  List<FlightSuggestion> _toSuggestions = [];
  bool _isLoadingFrom = false;
  bool _isLoadingTo = false;
  bool _isFromFocused = false;
  bool _isToFocused = false;
  FlightSuggestion? _selectedFromSuggestion;
  FlightSuggestion? _selectedToSuggestion;

  @override
  void initState() {
    super.initState();
    _fromController.text = widget.flight.from;
    _toController.text = widget.flight.to;
  }

  void _onFromTextChanged(String text) async {
    if (text.length < 2) {
      setState(() => _fromSuggestions = []);
      return;
    }

    setState(() => _isLoadingFrom = true);
    try {
      final results = await FlightService.fetchSuggestions(text);
      setState(() {
        _fromSuggestions = results;
        _isLoadingFrom = false;
      });
    } catch (e) {
      setState(() {
        _fromSuggestions = [];
        _isLoadingFrom = false;
      });
    }
  }

  void _onToTextChanged(String text) async {
    if (text.length < 2) {
      setState(() => _toSuggestions = []);
      return;
    }

    setState(() => _isLoadingTo = true);
    try {
      final results = await FlightService.fetchSuggestions(text);
      setState(() {
        _toSuggestions = results;
        _isLoadingTo = false;
      });
    } catch (e) {
      setState(() {
        _toSuggestions = [];
        _isLoadingTo = false;
      });
    }
  }

  void _selectFromSuggestion(FlightSuggestion suggestion) {
    _fromController.text = suggestion.cityCode;
    setState(() {
      _selectedFromSuggestion = suggestion;
      _fromSuggestions = [];
      _isFromFocused = false;
    });
    widget.onChanged(MultiCityFlight()
      ..from = suggestion.cityCode
      ..to = widget.flight.to
      ..date = widget.flight.date
    );
  }

  void _selectToSuggestion(FlightSuggestion suggestion) {
    _toController.text = suggestion.cityCode;
    setState(() {
      _selectedToSuggestion = suggestion;
      _toSuggestions = [];
      _isToFocused = false;
    });
    widget.onChanged(MultiCityFlight()
      ..from = widget.flight.from
      ..to = suggestion.cityCode
      ..date = widget.flight.date
    );
  }

  void _openDatePicker() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.flight.date ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (selectedDate != null) {
      setState(() {
        widget.flight.date = selectedDate;
      });
      widget.onChanged(MultiCityFlight()
        ..from = widget.flight.from
        ..to = widget.flight.to
        ..date = selectedDate
      );
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "Select Date";
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: widget.isActive ? Color(0xff0c44ac) : Color(0xff767b8e),
            width: 1,
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Flight ${widget.isSmallScreen ? '' : 'Segment'} ${_getFlightNumber()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.isActive ? Color(0xff0c44ac) : Colors.black87,
                  ),
                ),
                if (widget.onRemove != null)
                  IconButton(
                    icon: Icon(Icons.close, size: 20),
                    onPressed: widget.onRemove,
                  ),
              ],
            ),
            SizedBox(height: 8),
            if (widget.isSmallScreen)
              Column(
                children: [
                  _buildFromField(),
                  SizedBox(height: 8),
                  _buildToField(),
                  SizedBox(height: 8),
                  _buildDateField(),
                ],
              )
            else
              Row(
                children: [
                  Expanded(child: _buildFromField()),
                  SizedBox(width: 8),
                  Expanded(child: _buildToField()),
                  SizedBox(width: 8),
                  _buildDateField(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  String _getFlightNumber() {
    // This would need to be adjusted based on how you track flight numbers
    return '1'; // Placeholder
  }

  Widget _buildFromField() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3.8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: _isFromFocused ? Color(0xff0c44ac) : Color(0xff767b8e),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  "From",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff494949),
                  ),
                ),
              ),
              const SizedBox(height: 0),
              Row(
                children: [
                  SizedBox(width: 5),
                  const Icon(Icons.local_airport, color: Color(0xff313541), size: 25),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          _isFromFocused = hasFocus;
                        });
                      },
                      child: TextField(
                        controller: _fromController,
                        onChanged: (text) {
                          _onFromTextChanged(text);
                          widget.onChanged(MultiCityFlight()
                            ..from = text
                            ..to = widget.flight.to
                            ..date = widget.flight.date
                          );
                        },
                        decoration: InputDecoration(
                          hintText: "City or Airport",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold
                          ),
                          border: InputBorder.none,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_selectedFromSuggestion != null)
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedFromSuggestion!.cityName,
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xff494949),
                        ),
                      ),
                      Text(
                        _selectedFromSuggestion!.airportName,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff767b8e),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    "Airport/City Name",
                    style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff494949),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (_isFromFocused && (_fromSuggestions.isNotEmpty || _isLoadingFrom))
          Positioned(
            top: 57,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: _isLoadingFrom
                  ? Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xff0c44ac),
                ),
              )
                  : Column(
                children: _fromSuggestions.map((suggestion) {
                  return InkWell(
                    onTap: () => _selectFromSuggestion(suggestion),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${suggestion.cityName}, ${suggestion.countryName}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            suggestion.airportName,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildToField() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3.8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: _isToFocused ? Color(0xff0c44ac) : Color(0xff767b8e),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  "To",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff494949),
                  ),
                ),
              ),
              const SizedBox(height: 0),
              Row(
                children: [
                  SizedBox(width: 5),
                  const Icon(Icons.local_airport, color: Color(0xff313541), size: 25),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          _isToFocused = hasFocus;
                        });
                      },
                      child: TextField(
                        controller: _toController,
                        onChanged: (text) {
                          _onToTextChanged(text);
                          widget.onChanged(MultiCityFlight()
                            ..from = widget.flight.from
                            ..to = text
                            ..date = widget.flight.date
                          );
                        },
                        decoration: InputDecoration(
                          hintText: "City or Airport",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold
                          ),
                          border: InputBorder.none,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_selectedToSuggestion != null)
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedToSuggestion!.cityName,
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xff494949),
                        ),
                      ),
                      Text(
                        _selectedToSuggestion!.airportName,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff767b8e),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    "Airport/City Name",
                    style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff494949),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (_isToFocused && (_toSuggestions.isNotEmpty || _isLoadingTo))
          Positioned(
            top: 57,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: _isLoadingTo
                  ? Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xff0c44ac),
                ),
              )
                  : Column(
                children: _toSuggestions.map((suggestion) {
                  return InkWell(
                    onTap: () => _selectToSuggestion(suggestion),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${suggestion.cityName}, ${suggestion.countryName}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            suggestion.airportName,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: _openDatePicker,
      child: Container(
        width: widget.isSmallScreen ? double.infinity : 120,
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: widget.isActive ? Color(0xff0c44ac) : Color(0xff767b8e),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: Row(
                children: [
                  Text(
                    "Date",
                    style: TextStyle(fontSize: 12, color: Color(0xff494949)),
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff494949)),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 5),
                const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    _formatDate(widget.flight.date),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}