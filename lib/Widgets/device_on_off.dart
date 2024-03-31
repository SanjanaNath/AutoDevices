import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeviceOnOff extends StatelessWidget {
  DeviceOnOff({required this.iconDesign, required this.textOffOn, super.key});
  Icon iconDesign;
  String textOffOn;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // margin: EdgeInsets.only(bottom: 40),
          // padding: const EdgeInsets.only(left: 7),
          height: 25,
          width: 500,
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
              Text(textOffOn)
            ],
          ),
        ),
      ],
    );
  }
}
