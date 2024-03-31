import 'package:flutter/material.dart';
import 'package:t_m_s_/DeviceBottomDrawer/wifi_tab.dart';

import 'bluetooth_tab.dart';

class BottomDrawer extends StatefulWidget {
  const BottomDrawer({super.key});

  @override
  State<BottomDrawer> createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      builder: (_, controller) => Scaffold(
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 15),
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'cancel',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Container(
              // padding: const EdgeInsets.only(top: 10),
              alignment: Alignment.topCenter,
              child: const Text(
                "add device",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: const Text(
                "select a device which you want to add",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(2.5),
              margin: const EdgeInsets.symmetric(horizontal: 42),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  9,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      9,
                    ),
                    color: Colors.black),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'wifi',
                  ),
                  Tab(
                    text: 'bluetooth only',
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 15,
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Wifi(),
                  const Bluetooth(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
