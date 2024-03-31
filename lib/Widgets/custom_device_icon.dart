import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDeviceIcon extends StatelessWidget {
  final EdgeInsets? padding;

  CustomDeviceIcon(
      {required this.containerColor,
      required this.devicename,
      required this.iconDesign,
      required this.onpressed,
      required this.padding,
      super.key});
  VoidCallback onpressed;
  Color containerColor;
  Icon iconDesign;
  String devicename;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.only(right: 3),
          //alignment: Alignment.topLeft,
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            // color: Colors.blueAccent[700],
            color: containerColor,
            borderRadius: BorderRadius.circular(
              40,
            ),
          ),

          child: Center(
            child: IconButton(
              // padding: const EdgeInsets.only(left: 1.8),
              padding: padding,
              onPressed: onpressed,
              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const CameraAccess(),
              //     ),
              //   );
              //   //action coe when button is pressed
              // },
              // ignore: prefer_const_constructors
              icon: iconDesign,
              // Icons.video_camera_front,

              color: Colors.white,
              iconSize: 50,
            ),
          ),
        ),

        // ignore: prefer_const_constructors
        SizedBox(
          height: 5,
        ),
        Text(
          devicename,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
