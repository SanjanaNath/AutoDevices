import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_m_s_/Automation_Schedule/scheduel.dart';

class DeviceOnlineScreen extends StatefulWidget {
  String code;

  DeviceOnlineScreen({required this.code, Key? key}) : super(key: key);

  @override
  State<DeviceOnlineScreen> createState() => _DeviceOnlineScreenState();
}

class _DeviceOnlineScreenState extends State<DeviceOnlineScreen>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  late TabController _tabController;
  bool _switch1Value = false;
  bool _switch2Value = false;
  bool _switch3Value = false;
  List<ScheduleScreen> _schedules = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _listenToSwitchValues();
    _initPrefs();
    _startTimer();
  }

  void _loadSchedules() {
    // Load the saved schedules from wherever they are stored (e.g., SharedPreferences, database, etc.)
    // Assign the loaded schedules to the _schedules list
    // ...
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final currentWeekday = now.weekday;

      for (final schedule in _schedules) {
        if (schedule.repeatDays.contains(currentWeekday)) {
          if (schedule.onTime.hour == now.hour &&
              schedule.onTime.minute == now.minute) {
            // Switch on
            setState(() {
              _switch1Value = true;
              _updateSwitchValues();
            });
          } else if (schedule.offTime.hour == now.hour &&
              schedule.offTime.minute == now.minute) {
            // Switch off
            setState(() {
              _switch1Value = false;
              _updateSwitchValues();
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _initPrefs() async {
    // Initialize shared preferences and set the switch values
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _switch1Value = prefs.getBool('${widget.code}_switch1') ?? false;
      _switch2Value = prefs.getBool('${widget.code}_switch2') ?? false;
      _switch3Value = prefs.getBool('${widget.code}_switch3') ?? false;
    });
  }

  void _updateSwitchValues() async {
    final DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child('smart switch')
        .child(widget.code);

    Map<String, dynamic> switchValues = {
      '_switch1': _switch1Value,
      '_switch2': _switch2Value,
      '_switch3': _switch3Value,
    };

    await ref.update(switchValues);

    // Save the switch state to local storage
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${widget.code}_switch1', _switch1Value);
    await prefs.setBool('${widget.code}_switch2', _switch2Value);
    await prefs.setBool('${widget.code}_switch3', _switch3Value);
  }

  void _listenToSwitchValues() {
    final DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child('smart switch')
        .child(widget.code);

    ref.onValue.listen((event) {
      final snapshot = event.snapshot;
      final value = snapshot.value;

      if (value is Map<String, dynamic>) {
        setState(() {
          _switch1Value = value['switch 1'];
          _switch2Value = value['switch 2'];
          _switch3Value = value['switch 3'];
        });
      } else {
        debugPrint('Invalid snapshot value: $value/ ${widget.code}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.code),
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey.shade800,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Control'),
            Tab(text: 'Schedule'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 37),
              ),
              ListTile(
                title: const Text(
                  'Switch 1',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                trailing: Transform.scale(
                  scale: 1.3,
                  child: Switch(
                    value: _switch1Value,
                    onChanged: (value) {
                      setState(() {
                        _switch1Value = value;
                        _updateSwitchValues();
                      });
                    },
                    activeTrackColor: Colors.black,
                    activeColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ListTile(
                title: const Text(
                  'Switch 2',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                trailing: Transform.scale(
                  scale: 1.3,
                  child: Switch(
                    value: _switch2Value,
                    onChanged: (value) {
                      setState(() {
                        _switch2Value = value;
                        _updateSwitchValues();
                      });
                    },
                    activeTrackColor: Colors.black,
                    activeColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ListTile(
                title: const Text(
                  'Switch 3',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                trailing: Transform.scale(
                  scale: 1.3,
                  child: Switch(
                    value: _switch3Value,
                    onChanged: (value) {
                      setState(() {
                        _switch3Value = value;
                        _updateSwitchValues();
                      });
                    },
                    activeTrackColor: Colors.black,
                    activeColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          ScheduleScreen( onTime: _selectedOnTime,
            offTime: _selectedOffTime,
            repeatDays: _selectedRepeatDays, ),
        ],
      ),
    );
  }
  TimeOfDay _selectedOnTime = TimeOfDay.now();
  TimeOfDay _selectedOffTime = TimeOfDay.now();
  List<int> _selectedRepeatDays = [];
}
