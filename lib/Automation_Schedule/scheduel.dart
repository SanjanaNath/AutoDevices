import 'package:flutter/material.dart';
import 'package:t_m_s_/Automation_Schedule/schedule_bottom_drawer.dart';

class ScheduleScreen extends StatefulWidget {
  TimeOfDay onTime;
  TimeOfDay offTime;
  List<int> repeatDays;
  ScheduleScreen(
      {required this.onTime,
      required this.offTime,
      required this.repeatDays,
      super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<ScheduleScreen> _schedules = [];

  void _addSchedule(ScheduleScreen schedule) {
    setState(() {
      _schedules.add(schedule);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Container(
            // alignment: Alignment.topCenter,
            height: 45,
            width: 340,
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  elevation: 50,
                  builder: (context) => const ScheduleBottomDrawer(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),

                  // <-- Radius
                ),
                elevation:
                    8, // Adjust the value to control the shadow intensity
                shadowColor: Colors.grey, // Customize the shadow color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'add new schedule',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(width: 160),
                  Container(
                    height: 27,
                    width: 27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            itemCount: _schedules.length,
            itemBuilder: (context, index) {
              final schedule = _schedules[index];

              return Card(
                // Customize the card UI based on the schedule properties
                child: ListTile(
                  title: Text(
                      'On: ${schedule.onTime.format(context)} - Off: ${schedule.offTime.format(context)}'),
                  subtitle: Text('Repeat days: ${schedule.repeatDays}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
