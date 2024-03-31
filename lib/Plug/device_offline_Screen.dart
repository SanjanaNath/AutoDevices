import 'package:flutter/material.dart';

class DeviceOfflineScreen extends StatefulWidget {
  const DeviceOfflineScreen({super.key});

  @override
  State<DeviceOfflineScreen> createState() => _DeviceOfflineScreenState();
}

class _DeviceOfflineScreenState extends State<DeviceOfflineScreen> {
  static const List<Widget> _views = [
    Center(child: Text('Your device is offline')),
    Center(child: Text('Content of Tab Two')),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            ' smart plug ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                // indicator:
                // BoxDecoration(
                //     borderRadius: BorderRadius.circular(
                //       9,
                //     ),
                //     color: Colors.black),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey[400],
                tabs: const [
                  Tab(
                    child: Text('control'),
                  ),
                  Tab(
                    child: Text('schedual'),
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  color: Colors.pink[100],
                  child: const Center(
                      child: Text(
                    'Your device is offline',
                    style: TextStyle(fontSize: 30),
                  )),
                ),
                const Center(child: Text('Content of Tab Two')),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
