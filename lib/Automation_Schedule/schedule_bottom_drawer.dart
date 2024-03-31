import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_m_s_/Automation_Schedule/scheduel.dart';

class ScheduleBottomDrawer extends StatefulWidget {
  const ScheduleBottomDrawer({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomDrawer> createState() => _ScheduleBottomDrawerState();
}

class _ScheduleBottomDrawerState extends State<ScheduleBottomDrawer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showTimePicker = false;
  bool repeat = false;
  bool showDays = false;
  List<bool> selectedDays = [false, false, false, false, false, false, false];
  late DateTime onTime = DateTime.now();
  late DateTime offTime = DateTime.now();
  TimeOfDay _selectedOnTime = TimeOfDay.now();
  TimeOfDay _selectedOffTime = TimeOfDay.now();
  List<int> _selectedRepeatDays = [];

  void _saveSchedule() {
    final schedule = ScheduleScreen(
      onTime: _selectedOnTime,
      offTime: _selectedOffTime,
      repeatDays: _selectedRepeatDays,
    );

    // Pass the schedule back to the ScheduleScreen
    Navigator.of(context).pop(schedule);
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _loadSavedTime(); // Load saved time on initialization
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  String getDayAbbreviation(int index) {
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[index];
  }

  String getDayName(int index) {
    final weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return weekdays[index];
  }

  void toggleSelectedDay(int index) {
    setState(() {
      selectedDays[index] = !selectedDays[index];
    });
  }

  void onTimeChanged(DateTime time) {
    setState(() {
      onTime = time;
    });
    _saveTime(); // Save the selected "on" time
  }

  void offTimeChanged(DateTime time) {
    setState(() {
      offTime = time;
    });
    _saveTime(); // Save the selected "off" time
  }

  void _saveTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('onTime', onTime.toIso8601String());
    await prefs.setString('offTime', offTime.toIso8601String());
  }

  void _loadSavedTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? onTimeStr = prefs.getString('onTime');
    String? offTimeStr = prefs.getString('offTime');
    if (onTimeStr != null && offTimeStr != null) {
      setState(() {
        onTime = DateTime.parse(onTimeStr);
        offTime = DateTime.parse(offTimeStr);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.8,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        child: DraggableScrollableSheet(
          initialChildSize: 1.0,
          maxChildSize: 1.0,
          builder: (_, controller) => Scaffold(
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 15),
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'cancel',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    "schedule to",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(2.5),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.black,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'on',
                      ),
                      Tab(
                        text: 'off',
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 25)),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // On Tab Screen
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Set On Time',
                              style: TextStyle(fontSize: 20),
                            ),
                            TimePickerSpinner(
                              is24HourMode: false,
                              normalTextStyle: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                              highlightedTextStyle: const TextStyle(
                                fontSize: 30,
                                color: Colors.red,
                              ),
                              spacing: screenWidth * 0.15,
                              itemHeight: 60,
                              isForce2Digits: true,
                              onTimeChange: onTimeChanged,
                              time: onTime, // Pass the selected "on" time
                            ),
                          ],
                        ),
                      ),

                      // Off Tab Screen
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Set Off Time',
                              style: TextStyle(fontSize: 20),
                            ),
                            TimePickerSpinner(
                              is24HourMode: false,
                              normalTextStyle: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                              highlightedTextStyle: const TextStyle(
                                fontSize: 30,
                                color: Colors.red,
                              ),
                              spacing: screenWidth * 0.15,
                              itemHeight: 60,
                              isForce2Digits: true,
                              onTimeChange: offTimeChanged,
                              time: offTime, // Pass the selected "off" time
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth * 0.7,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'repeat ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 100),
                      Transform.scale(
                        scale: 1.2,
                        child: Switch(
                          value: showDays,
                          onChanged: (value) {
                            setState(() {
                              showDays = value;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 30)),
                AnimatedOpacity(
                  opacity: showDays ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 7; i++)
                        GestureDetector(
                          onTap: () => toggleSelectedDay(i),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedDays[i]
                                  ? Colors.grey
                                  : Colors.transparent,
                            ),
                            child: Text(
                              getDayAbbreviation(i),
                              style: TextStyle(
                                color: showDays ? Colors.black : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: screenWidth * 0.6,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _saveSchedule();
                      // Perform the required logic with the selected times and days

                      debugPrint('Selected On Time: $onTime');
                      debugPrint('Selected Off Time: $offTime');
                      debugPrint('Selected Days: $selectedDays');
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
