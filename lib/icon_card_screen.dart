import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DeviceBottomDrawer/Bottom_Drawer.dart';
import 'My_Drawer/Drawer_screen.dart';
import 'My_Drawer/Profile_Screen.dart';
import 'Provider/auth_provider.dart';
import 'Widgets/device_on_off.dart';

class IconCardScreen extends StatefulWidget {
  String code;
  final IconData icon;
  final String devicetext;

  IconCardScreen(
      {required this.code,
      required this.icon,
      required this.devicetext,
      super.key});

  @override
  State<IconCardScreen> createState() => _IconCardScreenState();
}

class _IconCardScreenState extends State<IconCardScreen> {
  List<String> cards = [];

  //  ListData listData = Provider.of<ListData>(context, listen: false);

  void addCardValue() async {
    // context.read<AuthProvider>().isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cards = prefs.getStringList("QRCodelist") ?? [];
      cards.add(widget.code);
      cards = cards.toSet().toList();
    });

    // cards = prefs.getStringList("QRCodelist") ?? [];
    // cards.add(widget.code);
    debugPrint('mycode...${widget.code}');
    debugPrint('cards codes...$cards');
    // cards.add(widget.code);
    await prefs.setStringList('QRCodelist', cards);

    debugPrint('mycards...$cards');

    // Future.delayed(const Duration(seconds: 5), () {
    //   // context.read<AuthProvider>().isLoading = false;
    // });
  }

  @override
  void initState() {
    addCardValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const DrawerScreen(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          // title: Text(ap.userModel.name),
          actions: [
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
              width: 120,
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 12, right: 15, top: 7, bottom: 7),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    // ignore: prefer_const_constructors
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(30)),
                    ),

                    // backgroundColor: Colors.transparent,

                    context: context,
                    enableDrag: true,
                    isScrollControlled: true,
                    useSafeArea: true,
                    elevation: 50,

                    builder: (context) => const BottomDrawer(),
                  );
                },
                // ignore: sort_child_properties_last
                child: const Row(
                  mainAxisSize: MainAxisSize.min,

                  // ignore: prefer_const_literals_to_create_immutables
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: const BorderSide(width: 1.3, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        //********************************************************************** */
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 200,
            ),
            // Container(
            //   padding: const EdgeInsets.all(2.5),
            //   margin: const EdgeInsets.symmetric(horizontal: 42),
            //   height: 45,
            //   decoration: BoxDecoration(
            //     color: Colors.grey[300],
            //     borderRadius: BorderRadius.circular(
            //       9,
            //     ),
            //   ),
            //   child: TabBar(
            //     indicator: BoxDecoration(
            //         borderRadius: BorderRadius.circular(
            //           9,
            //         ),
            //         color: Colors.black),
            //     labelColor: Colors.white,
            //     unselectedLabelColor: Colors.black,
            //     tabs: const [
            //       Tab(
            //         text: 'device',
            //       ),
            //       Tab(
            //         text: 'room',
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(
              height: 15,
            ),
            // tab bar view here
            Column(
              children: [
                SizedBox(
                  height: 290,
                  // child: TabBarView(
                  //   children: [
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: _list.length,

                    itemCount: cards.length,

                    // ignore: non_constant_identifier_names
                    itemBuilder: (context, index) {
                      return CustomIconDevice(
                        code: cards[index],

                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DeviceOnlineScreen(
                          //             code: cards[index],
                          //           )),
                          // );
                        },
                        containercolor: const Color.fromARGB(180, 0, 0, 0),
                        deviceName: widget.devicetext,
                        iconDesign: Icon(widget.icon),
                        textcolor: Colors.grey,
                        // codeText: getdata().toString(),
                        // iconbuttonTap: () => const DeviceControl(),
                      );
                    },
                  ),
                  // const SizedBox(
                  //   child: Padding(
                  //     padding: EdgeInsets.only(top: 100),
                  //     child: Text(
                  //       "You don't have any room",
                  //       style: TextStyle(
                  //         fontSize: 30,
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // )
                  //   ],
                  // ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                  width: 75,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      debugPrint('code Grid card...$cards');
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => AllSmartSwitchCard(
                      //             code: widget.code,
                      //           )),
                      // );
                    },
                    child: const Text('View All'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),

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
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(151, 22, 23, 36),
                    // ignore: prefer_const_constructors
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(10),
                      bottomRight: const Radius.circular(10),
                    ),
                  ),

                  child: Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(right: 15),
                        alignment: Alignment.topLeft,
                        // ignore: prefer_const_constructors
                        child: Text(
                          'product warranty',
                          // ignore: prefer_const_constructors
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
                      // ignore: prefer_const_constructors
                      SizedBox(
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
                            //     builder: (context) =>
                            //         const DeviceOnlineScreen(),
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
            )
          ]),
        ),
        // bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}

//
// ignore: must_be_immutable
class CustomIconDevice extends StatelessWidget {
  CustomIconDevice(
      {required this.onPressed,
      required this.containercolor,
      required this.deviceName,
      required this.iconDesign,
      required this.textcolor,
      required this.code,
      Key? key})
      : super(key: key);
  VoidCallback onPressed;
  Color containercolor;
  Icon iconDesign;
  String deviceName;
  Color textcolor;
  String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 100, right: 100, bottom: 15),
      // height: 260,
      // width: 180,
      // height: 100,
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        splashColor: Colors.white,
        onPressed: onPressed,

        // () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => const DeviceOnlineScreen(code :)),
        //   );
        // },
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(15)),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(right: 1.5),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: containercolor,
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              child: Center(
                child: IconButton(
                  padding: const EdgeInsets.only(right: 11, left: 8),
                  onPressed: onPressed,
                  //  () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const DeviceControl(),
                  //     ),
                  //   );
                  //   //action coe when button is pressed
                  // },
                  // ignore: prefer_const_constructors
                  icon: iconDesign,

                  color: Colors.white,
                  iconSize: 50,
                  // iconSize: 1,
                  //   color: Colors.white,
                  //  Icon(
                  //   Icons.power,
                  //   size: 50,
                  //   color: Colors.white,
                  // ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              code,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "smart $deviceName",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: textcolor),
            ),

            const SizedBox(
              height: 100,
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            // Text(codeText),
            DeviceOnOff(
                iconDesign: const Icon(
                  Icons.wifi_off_outlined,
                  size: 20,
                ),
                textOffOn: 'device is offline'),

            // DeviceOnOff(
            //     iconDesign: const Icon(
            //       Icons.circle,
            //       color: Color.fromARGB(255, 44, 193, 52),
            //       size: 10,
            //     ),
            //     textOffOn: 'device is online')
          ],
        ),
      ),
    );
  }
}
