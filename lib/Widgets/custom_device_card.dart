import 'package:flutter/material.dart';

import 'device_on_off.dart';

// ignore: must_be_immutable
class CustomDevice extends StatelessWidget {
  CustomDevice(
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
              deviceName,
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
            // DeviceOnOff(
            //     iconDesign: const Icon(
            //       Icons.wifi_off_outlined,
            //       size: 20,
            //     ),
            //     textOffOn: 'device is offline'),
            //
            //
            DeviceOnOff(
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
}
