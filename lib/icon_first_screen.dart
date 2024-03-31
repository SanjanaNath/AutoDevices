import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as per;
import 'package:permission_handler/permission_handler.dart';
import 'package:t_m_s_/icon_QR_second.dart';

import 'Utils/utils.dart';

class IconFirstScreen extends StatefulWidget {
  final IconData icon;
  final String text;
  final String appBartext;
  final Color iconColor;
  final String belowText;

  const IconFirstScreen({
    required this.icon,
    required this.text,
    required this.appBartext,
    required this.iconColor,
    required this.belowText,
    Key? key,
  }) : super(key: key);

  @override
  _IconFirstScreenState createState() => _IconFirstScreenState();
}

class _IconFirstScreenState extends State<IconFirstScreen> {
  bool isChecked = false;
  late per.PermissionStatus _status;

  @override
  void initState() {
    super.initState();
    locationPermission();
  }

  void locationPermission() async {
    _status = await Permission.location.request();
    if (_status == PermissionStatus.granted) {
      debugPrint("Location permission granted");
    } else if (_status == PermissionStatus.denied) {
      openAppSettings();
    }
  }

  void printMessage() {
    debugPrint('Reset done by user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "add ${widget.appBartext}",
          style: const TextStyle(fontSize: 20, color: Colors.black),
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
            // padding: const EdgeInsets.only(
            //   right: 11,
            // ),
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.only(
                    right: 2,
                  ),
                  decoration: BoxDecoration(
                    color: widget.iconColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: IconButton(
                      padding: const EdgeInsets.only(
                        right: 11,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        widget.icon,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                Text(
                  widget.belowText,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54, fontSize: 15),
                ),
                const SizedBox(height: 420),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      },
                    ),
                    const Text('Reset done'),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 45,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isChecked && _status == PermissionStatus.granted) {
                        print(PermissionStatus.granted);
                        printMessage();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IconSecondScreen(
                                  icon: widget.icon,
                                  text: widget.text,
                                  appBartext: widget.appBartext,
                                  iconColor: widget.iconColor)),
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
                      'Next',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
