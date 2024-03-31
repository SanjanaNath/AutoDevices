import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as per;
import 'package:permission_handler/permission_handler.dart';

import '../utils/utils.dart';
import 'add_plug.dart';

class PlugScreen extends StatefulWidget {
  const PlugScreen({super.key});

  @override
  State<PlugScreen> createState() => _PlugScreenState();
}

class _PlugScreenState extends State<PlugScreen> {
  bool isChecked = false;
  void printmessage() {
    debugPrint('reset done by user');
  }

  late per.PermissionStatus _status;
  // final getlocation =
  //     Provider.of<AuthProvider>(context, listen: false).getLocation();

  locationPermission() async {
    _status = await Permission.location.request();
    if (_status == PermissionStatus.granted) {
      debugPrint("location permission granted");
    } else {
      _status = await Permission.location.request();
      if (_status == PermissionStatus.denied) {
        openAppSettings();
      }
    }
  }

  @override
  void initState() {
    locationPermission();
    super.initState();

    //  per.PermissionHandler()
    //       .checkPermissionStatus(PermissionGroup.locationWhenInUse)
    //       .then(_updateStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          ' add plug',
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            // padding: EdgeInsets.all(25),
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
                //  mainAxisAlignment: MainAxisAlignment.,

                children: [
                  Container(
                    // alignment: Alignment.Center,

                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[500],
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        padding: const EdgeInsets.only(right: 10),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.power,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    'reset your plug',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    // 'make sure the device is powered on. "long press the                               smart plug button for few seconds " until the blue light starts blinking',
                    "make sure the device is connected to the circuit                                      then reset the device",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 420,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                        //activeColor: Colors.black,
                      ),
                      const Text('reset done'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    width: 350,
                    child: ElevatedButton(
                      // onPressed: isChecked ? printmessage : null,

                      onPressed: () {
                        if (isChecked && _status == PermissionStatus.granted) {
                          print(PermissionStatus.granted);
                          printmessage();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QrPlugScreen(),
                            ),
                          );
                        } else {
                          if (_status == PermissionStatus.denied) {
                            showSnackBar(context, 'Enable location');
                          }
                          openAppSettings();
                        }
                      },
                      autofocus: true,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isChecked && _status == PermissionStatus.granted
                                ? Colors.black
                                : const Color.fromARGB(255, 223, 217, 217),
                        side: const BorderSide(
                          width: 1.0,
                        ),
                      ),
                      child: const Text(
                        'next',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  // void check() {
  //   isChecked ? printmessage : null;
  // }
}
