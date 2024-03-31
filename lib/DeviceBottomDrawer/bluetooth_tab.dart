import 'package:flutter/material.dart';

import '../icon_first_screen.dart';

class Bluetooth extends StatelessWidget {
  const Bluetooth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          //alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 38),
                  ),
                  Column(
                    children: [
                      Container(
                        //alignment: Alignment.topLeft,
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent[700],
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            padding: const EdgeInsets.only(right: 10),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IconFirstScreen(
                                      icon: Icons.sunny,
                                      text:
                                          """make sure the device is powered on. switch the smart light 'on and off 5 times' then please note- Keep the time interval of 10 seconds, while turning on and off""",
                                      appBartext: "bluetooth bulb",
                                      iconColor: Colors.amberAccent.shade700,
                                      belowText: "Reset your bluetooth bulb"),
                                ),
                              );
                              //action coe when button is pressed
                            },
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              Icons.sunny,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'bluetooth bulb',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  //**************wireless lock*********************** */
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 1.5),
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            padding: const EdgeInsets.only(right: 10),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IconFirstScreen(
                                      icon: Icons.wifi_password_outlined,
                                      text:
                                          """plug in the device into a power supply and on the device once, once done the indicator light will start blinking rapidly""",
                                      appBartext: "wireless lock",
                                      iconColor: Colors.grey,
                                      belowText: "Reset your wireless lock"),
                                ),
                              );
                              //action coe when button is pressed
                            },
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              Icons.wifi_password_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'wireless lock',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 1.5),
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            padding: const EdgeInsets.only(right: 10),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IconFirstScreen(
                                      icon: Icons.swipe_sharp,
                                      text:
                                          """make sure the device is powered on, long press any switch for 5 secand wait for rapid light blinking""",
                                      appBartext: "bluetooth switch",
                                      iconColor: Colors.red,
                                      belowText: "Reset your bluetooth switch"),
                                ),
                              );
                              //action coe when button is pressed
                            },
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              Icons.swipe_sharp,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'bluetooth switch',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
