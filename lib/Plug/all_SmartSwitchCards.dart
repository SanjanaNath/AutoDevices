import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'device_online_screen.dart';

class AllSmartSwitchCard extends StatefulWidget {
  String code;
  AllSmartSwitchCard({required this.code, Key? key}) : super(key: key);

  @override
  State<AllSmartSwitchCard> createState() => _AllSmartSwitchCardState();
}

class _AllSmartSwitchCardState extends State<AllSmartSwitchCard> {
  List<String> cards = [];
  bool isLoading = true;
  // void addCardValueAgain() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     // ignore: prefer_collection_literals

  //     List<String> storedcard = prefs.getStringList("QRCodelist") ?? [];
  //     debugPrint('mycardsGriddddddd...$storedcard');
  //     cards.add(widget.code);
  //     cards = storedcard.toSet().toList();
  //     // cards = [...storedcard, widget.code];
  //   });
  //   debugPrint('mycodeGrid...${widget.code}');
  //   debugPrint('cards codes Grid...$cards');

  //   await prefs.setStringList('QRCodelist', cards);

  //   debugPrint('mycardsGrid...$cards');
  // }

  void addCardValueAgain() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String> storedCard = prefs.getStringList("QRCodelist") ?? [];
      if (!storedCard.contains(widget.code)) {
        storedCard.add(widget.code);
      }
      cards = storedCard;
    });
    await prefs.setStringList('QRCodelist', cards);
    debugPrint('mycodeGrid...${widget.code}');
    debugPrint('cards codes Grid...$cards');
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedCard = prefs.getStringList("QRCodelist") ?? [];
    setState(() {
      cards = storedCard;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Smart Switch'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              // padding: EdgeInsets.only(top: 20, bottom: 50),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(bottom: 50, top: 10),
                    child: GridView.builder(
                        itemCount: cards.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.2,
                        ),
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.vertical,

                        itemBuilder: (context, index) {
                          return CustomDeviceWidget(
                            // key: Key(cards[index]),
                            code: cards[index],

                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeviceOnlineScreen(
                                          code: cards[index],
                                        )),
                              );
                            },
                            containercolor: const Color.fromARGB(180, 0, 0, 0),
                            deviceName: 'smart plug',
                            iconDesign: const Icon(Icons.power),
                            textcolor: Colors.grey,
                            // codeText: getdata().toString(),
                            // iconbuttonTap: () => const DeviceControl(),
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomDeviceWidget({
    required VoidCallback onPressed,
    required Color containercolor,
    required String deviceName,
    required Icon iconDesign,
    required Color textcolor,
    required String code,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 120, right: 120, bottom: 80),
      // padding: EdgeInsets.all(50),
      // height: 260,
      // width: 180,
      // height: 100,
      // width: 1,
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
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: containercolor,
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              child: Center(
                child: IconButton(
                  padding: const EdgeInsets.only(right: 8, left: 5),
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
                  iconSize: 30,
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
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              deviceName,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: textcolor),
            ),
            const SizedBox(
              height: 80,
            ),
            CustomDeviceOnOffWidget(
                iconDesign: const Icon(
                  Icons.circle,
                  color: Color.fromARGB(255, 44, 193, 52),
                  size: 10,
                ),
                textOffOn: 'device is online')
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomDeviceOnOffWidget({
    required Icon iconDesign,
    required String textOffOn,
  }) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // margin: EdgeInsets.only(bottom: 40),
          // padding: const EdgeInsets.only(left: 7),
          height: 25,
          width: 130,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 234, 234),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 0),
                blurRadius: 2,
              )
            ],
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Icon(Icons.wifi_off_outlined),
              IconButton(
                padding: const EdgeInsets.only(bottom: 2, left: 15, top: 3.5),
                onPressed: () {},
                icon: iconDesign,
                // alignment: Alignment.center,
              ),
              // const SizedBox(
              //   width: 3,
              // ),
              Text(
                textOffOn,
                style: const TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ],
    );
  }
}
