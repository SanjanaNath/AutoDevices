import 'package:flutter/material.dart';
import 'package:t_m_s_/icon_first_screen.dart';

import '../Plug/add_plug_first.dart';
import '../Widgets/custom_device_icon.dart';

class Wifi extends StatefulWidget {
  const Wifi({super.key});

  @override
  State<Wifi> createState() => _WifiState();
}

class _WifiState extends State<Wifi> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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

                  CustomDeviceIcon(
                      containerColor: Colors.deepPurple.shade500,
                      devicename: 'plug',
                      iconDesign: const Icon(Icons.power),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlugScreen(),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                  const SizedBox(
                    width: 40,
                  ),
                  CustomDeviceIcon(
                    containerColor: Colors.blueAccent.shade700,
                    devicename: 'camera',
                    iconDesign: const Icon(Icons.video_camera_front),
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IconFirstScreen(
                              icon: Icons.video_camera_front,
                              text:
                                  """make sure the device is powered on "remove the lid over reset button and long press the reset button" till a prompt tone is heard """,
                              appBartext: "camera",
                              iconColor: Colors.blueAccent.shade700,
                              belowText: "Reset your camera"),
                        ),
                      );
                    },
                    padding: const EdgeInsets.only(left: 3),
                  ),
                  //**********************************camera************************************* */
                  const SizedBox(
                    width: 40,
                  ),

                  CustomDeviceIcon(
                      containerColor: Colors.amberAccent.shade700,
                      devicename: 'light',
                      iconDesign: const Icon(Icons.sunny),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IconFirstScreen(
                                icon: Icons.sunny,
                                text:
                                    """switch the smart light 'on and off 3 times' then wait till it starts blinking rapidly """,
                                appBartext: "light",
                                iconColor: Colors.amberAccent.shade700,
                                belowText: "Reset your light"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                ],
              ),
              //**********************************plug*********************************** */
              //**************************************************second row *************************************************** */
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 38),
                  ),

                  CustomDeviceIcon(
                      containerColor: Colors.amberAccent.shade700,
                      devicename: 'doorbell',
                      iconDesign: const Icon(Icons.speaker),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IconFirstScreen(
                                icon: Icons.speaker,
                                text:
                                    """plug the device into power source and "long press the reset button at backside" till the indicator starts flashing or a prompt tone is heard""",
                                appBartext: "doorbell",
                                iconColor: Colors.amberAccent.shade700,
                                belowText: "Reset your doorbell"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                  //*******************************doorbell***************************************************** */
                  const SizedBox(
                    width: 40,
                  ),

                  CustomDeviceIcon(
                      containerColor: Colors.amberAccent.shade700,
                      devicename: 'smart heater',
                      iconDesign: const Icon(Icons.heat_pump_outlined),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IconFirstScreen(
                                icon: Icons.heat_pump_outlined,
                                text:
                                    """make sure the device is powered on and long press the button present on the adaptor of the device until the blue light starts blinking rapidly""",
                                appBartext: "smart heater",
                                iconColor: Colors.amberAccent.shade700,
                                belowText: "Reset your smart heater"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                  const SizedBox(
                    width: 40,
                  ),

                  CustomDeviceIcon(
                      containerColor: Colors.red,
                      devicename: 'smart switch',
                      iconDesign: const Icon(Icons.swipe_sharp),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IconFirstScreen(
                                icon: Icons.swipe_sharp,
                                text:
                                    """make sure the device is powered on , long press any switch for 5 sec and wait for rapid light blinking.""",
                                appBartext: "smart switch",
                                iconColor: Colors.red,
                                belowText: "Reset your smart switch"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              //*******************************************third row************************************************* */
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 38),
                  ),
                  CustomDeviceIcon(
                      containerColor: Colors.grey,
                      devicename: 'TV remote',
                      iconDesign: const Icon(Icons.settings_remote),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IconFirstScreen(
                                icon: Icons.settings_remote,
                                text:
                                    """make sure the device is turned on " long press the reset button for 5 seconds" till the light starts blinking rapidly""",
                                appBartext: "TV remote",
                                iconColor: Colors.grey,
                                belowText: "Reset your TV remote"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                  const SizedBox(
                    width: 40,
                  ),
                  CustomDeviceIcon(
                      containerColor: Colors.blue.shade500,
                      devicename: 'AC remote',
                      iconDesign: const Icon(Icons.settings_remote),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IconFirstScreen(
                                icon: Icons.settings_remote,
                                text:
                                    """make sure the device is turned on " long press the reset button for 5 seconds" till the light starts blinking rapidly""",
                                appBartext: "AC remote",
                                iconColor: Colors.blue.shade500,
                                belowText: "Reset your AC remote"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                  const SizedBox(
                    width: 40,
                  ),
                  CustomDeviceIcon(
                      containerColor: Colors.deepPurple.shade500,
                      devicename: 'wierd lock',
                      iconDesign: const Icon(Icons.lock_rounded),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IconFirstScreen(
                                icon: Icons.lock_rounded,
                                text:
                                    """please keep the door closed and "lock-unlock it 3 times" consecutively and lock it 4th time""",
                                appBartext: "wierd lock",
                                iconColor: Colors.deepPurple.shade500,
                                belowText: "Reset your wierd lock"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 38),
                  ),

                  //     // ignore: prefer_const_constructors
                  //     SizedBox(
                  //       height: 5,
                  //     ),
                  //     const Text(
                  //       'camera',
                  //       style: TextStyle(fontWeight: FontWeight.w600),
                  //     ),
                  //   ],
                  // ),
                  CustomDeviceIcon(
                    containerColor: Colors.blueAccent.shade700,
                    devicename: 'Aquapure',
                    iconDesign: const Icon(Icons.water_drop_sharp),
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IconFirstScreen(
                              icon: Icons.water_drop_sharp,
                              text:
                                  """once the green light starts blinking rapidly, switch to wifi connection on your mobile and connect to "aquapure" as a wifi option available.""",
                              appBartext: "Aquapure",
                              iconColor: Colors.blueAccent.shade700,
                              belowText: "Reset your Aquapure"),
                        ),
                      );
                    },
                    padding: const EdgeInsets.only(),
                  ),
                  //**********************************Aquapure************************************* */
                  const SizedBox(
                    width: 35,
                  ),

                  CustomDeviceIcon(
                      containerColor: const Color.fromARGB(255, 205, 7, 7),
                      devicename: 'energy moniter',
                      iconDesign: const Icon(Icons.bolt),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IconFirstScreen(
                                icon: Icons.bolt,
                                text:
                                    """once the green light starts blinking rapidly, switch to wifi connection on your mobile and connect to "aquapure" as a wifi option available.""",
                                appBartext: "energy moniter",
                                iconColor: Color.fromARGB(255, 205, 7, 7),
                                belowText: "Reset your energy moniter"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                  //*****************************energy moniter************************************** */
                  const SizedBox(
                    width: 35,
                  ),

                  CustomDeviceIcon(
                      containerColor: const Color.fromARGB(255, 100, 185, 255),
                      devicename: 'air purifier',
                      iconDesign: const Icon(Icons.air_outlined),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IconFirstScreen(
                                icon: Icons.air_outlined,
                                text:
                                    """power ON the device and long press the reset icon until the wifi icon starts blinking rapidly""",
                                appBartext: "air purifier",
                                iconColor: Color.fromARGB(255, 100, 185, 255),
                                belowText: "Reset your air purifier"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                ],
              ),
              //**********************************air purifier*********************************** */
              //**************************************************second row *************************************************** */
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 38),
                  ),

                  CustomDeviceIcon(
                      containerColor: Colors.red,
                      devicename: 'geyser',
                      iconDesign: const Icon(Icons.camera_rear_sharp),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IconFirstScreen(
                                icon: Icons.camera_rear_sharp,
                                text:
                                    """make sure the device is powered on and long press the smart geyser button for few second until the blue light starts blinking""",
                                appBartext: "geyser",
                                iconColor: Colors.red,
                                belowText: "Reset your geyser"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                  //*******************************doorbell***************************************************** */
                  const SizedBox(
                    width: 40,
                  ),
                  // Column(
                  //   children: [
                  //     Container(
                  //       alignment: Alignment.topRight,
                  //       padding: const EdgeInsets.only(right: 1.5),
                  //       height: 65,
                  //       width: 65,
                  //       decoration: BoxDecoration(
                  //         color: Colors.amberAccent[700],
                  //         borderRadius: BorderRadius.circular(
                  //           40,
                  //         ),
                  //       ),
                  //       child: Center(
                  //         child: IconButton(
                  //           padding: const EdgeInsets.only(right: 10),
                  //           onPressed: () {
                  //             // Navigator.push(
                  //             //   context,
                  //             //   MaterialPageRoute(
                  //             //     builder: (context) => const CameraAccess(),
                  //             //   ),
                  //             // );
                  //             //action coe when button is pressed
                  //           },
                  //           // ignore: prefer_const_constructors
                  //           icon: Icon(
                  //             Icons.heat_pump_outlined,
                  //             size: 50,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     // ignore: prefer_const_constructors
                  //     SizedBox(
                  //       height: 5,
                  //     ),
                  //     const Text(
                  //       'smart heater',
                  //       style: TextStyle(fontWeight: FontWeight.w600),
                  //     ),
                  //   ],
                  // ),

                  CustomDeviceIcon(
                      containerColor: const Color.fromARGB(255, 205, 7, 7),
                      devicename: 'smart fan',
                      iconDesign: const Icon(Icons.wind_power_sharp),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IconFirstScreen(
                                icon: Icons.wind_power_sharp,
                                text:
                                    """make sure the fan is powered on and, you press the "smart mode" button on your remote for 5-seconds till the time the LED starts blinking in the circular motion of the fan""",
                                appBartext: "smart fan",
                                iconColor: Color.fromARGB(255, 205, 7, 7),
                                belowText: "Reset your smart fan"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                  const SizedBox(
                    width: 45,
                  ),

                  CustomDeviceIcon(
                      containerColor: const Color.fromARGB(255, 66, 219, 158),
                      devicename: 'ev charger',
                      iconDesign: const Icon(Icons.ev_station),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IconFirstScreen(
                                icon: Icons.ev_station,
                                text:
                                    "power ON the device and long press the reset icon until the wifi icon starts blinking rapidly",
                                appBartext: "ev charger",
                                iconColor: Color.fromARGB(255, 66, 219, 158),
                                belowText: "Reset your ev charger"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only(left: 5)),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              //*******************************************third row************************************************* */
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.only(right: 10),
                  // ),
                  // const Padding(padding: EdgeInsets.only(right: 150)),
                  // Column(
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.only(right: 1.5),
                  //       // alignment: Alignment.topLeft,
                  //       height: 65,
                  //       width: 65,
                  //       decoration: BoxDecoration(
                  //         color: Colors.grey[700],
                  //         borderRadius: BorderRadius.circular(
                  //           40,
                  //         ),
                  //       ),
                  //       child: Center(
                  //         child: IconButton(
                  //           padding: const EdgeInsets.only(right: 10),
                  //           onPressed: () {
                  //             // Navigator.push(
                  //             //   context,
                  //             //   MaterialPageRoute(
                  //             //     builder: (context) => const CameraAccess(),
                  //             //   ),
                  //             // );
                  //           },
                  //           icon: const Icon(
                  //             Icons.settings_remote,
                  //             size: 50,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 5,
                  //     ),
                  //     const Text(
                  //       'TV remote',
                  //       style: TextStyle(fontWeight: FontWeight.w600),
                  //     ),
                  //   ],
                  // ),

                  const SizedBox(
                    width: 35,
                  ),

                  CustomDeviceIcon(
                      containerColor: Colors.blue.shade500,
                      devicename: 'smart security',
                      iconDesign: const Icon(Icons.album_outlined),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IconFirstScreen(
                                icon: Icons.album_outlined,
                                text:
                                    """make sure the device is turned on "long press the reset for 5 seconds" till the light starts blinking rapidly""",
                                appBartext: "smart security",
                                iconColor: Colors.blue.shade500,
                                belowText: "Reset your smart security"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                  const SizedBox(
                    width: 40,
                  ),

                  CustomDeviceIcon(
                      containerColor: Colors.greenAccent.shade700,
                      devicename: 'retail light',
                      iconDesign: const Icon(Icons.lightbulb_circle_rounded),
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IconFirstScreen(
                                icon: Icons.lightbulb_circle_rounded,
                                text:
                                    """make sure device is powered on , to start pairing , trun the small red switch to the Compatible position and wait for about 10 seconds. The red indicator light will start flashing quickly then , turn the small red switch back to the quick position""",
                                appBartext: "retail light",
                                iconColor: Colors.greenAccent.shade700,
                                belowText: "Reset your retail light"),
                          ),
                        );
                      },
                      padding: const EdgeInsets.only()),
                ],
              ),
              // const WifiScreen(),
            ],
          )),
    );
  }
}
