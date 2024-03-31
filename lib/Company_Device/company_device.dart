import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:video_player/video_player.dart';
import '../DeviceBottomDrawer/Bottom_Drawer.dart';
import '../My_Drawer/Drawer_screen.dart';
import '../My_Drawer/Profile_Screen.dart';
import '../Provider/auth_provider.dart';

class CompanyDevice extends StatefulWidget {
  const CompanyDevice({super.key});

  @override
  State<CompanyDevice> createState() => _CompanyDeviceState();
}

class _CompanyDeviceState extends State<CompanyDevice> {
  late final VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller = VideoPlayerController.asset('assets/videos/CompanyLogo.mp4');
    _controller.initialize().then((_) {
      _controller.setLooping(false);
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });
    // Future.delayed(const Duration(seconds: ))
  }

  // @override
  // void dispose() {
  //   super.dispose();

  //   if (_controller != null) {
  //     _controller.dispose();
  //   }
  // }
  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: VideoPlayer(_controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: Colors.black,

        // title: Text(ap.userModel.name),
        actions: [
          const SizedBox(
            width: 40,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            child: Text(
              ap.userModel.name,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(
            width: 90,
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 12, right: 15, top: 7, bottom: 7),
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  context: context,
                  enableDrag: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  elevation: 50,
                  builder: (context) => const BottomDrawer(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                side: const BorderSide(width: 1.3, color: Colors.grey),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'add device',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.add_circle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //************************************************************************************************************************* */
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // padding: const EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              height: 200,
              // width: 500,
              child: Stack(
                children: <Widget>[_getVideoBackground()],
              ),
            ),
            // const SizedBox(
            //   height: 260,
            // ),
            const SizedBox(
              height: 80,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 15),
                alignment: Alignment.centerLeft,
                height: 230,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.verified_user_outlined,
                          color: Colors.blue,
                          size: 33,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Register Warranty',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'bought a new product?             register your warranty here',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    SizedBox(
                      width: 90,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            // <-- Radius
                          ),
                        ),
                        child: const Text('register'),
                      ),
                    ),
                  ],
                ),
              ),

              //*******************Second add device***************************//

              Container(
                padding: const EdgeInsets.all(10),
                //  margin: const EdgeInsets.only(left: 15, right: 210),
                alignment: Alignment.centerRight,
                height: 230,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.add_circle,
                          color: Colors.greenAccent,
                          size: 40,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Add Device',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'add your new or existing                     device',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: 90,
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
                            builder: (context) => const BottomDrawer(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            // <-- Radius
                          ),
                        ),
                        child: const Text('add device'),
                      ),
                    ),
                  ],
                ),
              ),
            ]),

            const SizedBox(
              height: 20,
            ),

            //*****************third warranty **********//

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 160,
                  width: 190,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(151, 22, 23, 36),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Image.asset('assets/images/warrantyLogo.jpg'),
                ),
                //******************************************************************///
                Container(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  height: 160,
                  width: 190,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(151, 22, 23, 36),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(right: 15),
                        alignment: Alignment.topLeft,

                        child: const Text(
                          'product warranty',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'bought a new product?                     register your warranty here',
                        style: TextStyle(
                            color: Color.fromARGB(255, 214, 212, 212)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        // padding: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 190,
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const AddCamera(),
                            //   ),
                            // );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => AutomationScreen(),
                            //   ),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              // <-- Radius
                            ),
                          ),
                          child: const Text('register',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            //*******************************emergency signout************************* */
            // Container(
            //   margin: const EdgeInsets.only(left: 60, right: 60),
            //   child: SizedBox(
            //     width: 90,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         // ignore: use_build_context_synchronously
            //         ap.userSignOut().then(
            //               (value) => Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => const Phone(),
            //                 ),
            //               ),
            //             );
            //       },
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.black,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //           // <-- Radius
            //         ),
            //       ),
            //       child: const Text('signout'),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                "explore",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomDeviceexplore(
                      onpressedButton: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ComingSoon(),
                        //   ),
                        // );
                      },
                      containerColor: Colors.amber,
                      deviceName: 'lighting',
                      iconDesign: const Icon(
                        Icons.lightbulb_outline,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                    CustomDeviceexplore(
                      onpressedButton: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ComingSoon(),
                        //   ),
                        // );
                      },
                      containerColor: Colors.yellow,
                      deviceName: 'energy efficiency',
                      iconDesign: const Icon(
                        Icons.energy_savings_leaf_outlined,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ),
                    CustomDeviceexplore(
                      onpressedButton: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ComingSoon(),
                        //   ),
                        // );
                      },
                      containerColor: Colors.red.shade300,
                      deviceName: 'security',
                      iconDesign: const Icon(
                        Icons.lock_outline_rounded,
                        color: Color(0xFFE57373),
                        size: 20,
                      ),
                    ),
                    CustomDeviceexplore(
                      onpressedButton: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ComingSoon(),
                        //   ),
                        // );
                      },
                      containerColor: Colors.blue.shade300,
                      deviceName: 'home & kitchen appliances',
                      iconDesign: const Icon(
                        Icons.soup_kitchen_outlined,
                        color: Color(0xFF64B5F6),
                        size: 20,
                      ),
                    ),
                    CustomDeviceexplore(
                      onpressedButton: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ComingSoon(),
                        //   ),
                        // );
                      },
                      containerColor: Colors.green,
                      deviceName: 'electric power & solar',
                      iconDesign: const Icon(
                        Icons.solar_power_outlined,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // _buildScreen(_currentIndex),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  // Widget _buildScreen(int index) {
  //   switch (index) {
  //     case 0:
  //       return ComingSoon();
  //     case 1:
  //       return CompanyDevice();
  //     case 2:
  //     // return AutomationScreen();
  //     default:
  //       return Container();
  //   }
  // }

  // ignore: non_constant_identifier_names
  Widget CustomDeviceexplore({
    required VoidCallback onpressedButton,
    required String deviceName,
    required Icon iconDesign,
    required Color containerColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 8, right: 8),
      // alignment: Alignment.centerRight,
      height: 140,
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 0),
            blurRadius: 3,
          )
        ],
      ),

      child: MaterialButton(
        splashColor: Colors.white,
        onPressed: onpressedButton,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              // padding: EdgeInsets.only(top: 30),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: containerColor,
                      //  Colors.amber,
                      width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                onPressed: () {},
                icon: iconDesign,
                //  const Icon(
                //   Icons.lightbulb_outline,
                //   color: Colors.amber,
                //   size: 40,
                // ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              deviceName,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
