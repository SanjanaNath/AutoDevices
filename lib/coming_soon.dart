import 'package:flutter/material.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 340),
                  // color: Colors.white,
                  // height: 300,
                  // width: 400,
                  child: Text(
                    "Service Unavaliable",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                  )

                  // Image.asset(
                  //   'assets/images/service.jpg',
                  //   // width: 40,
                  //   // height: 40,
                  //   fit: BoxFit.cover,
                  // ),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.black, //color of border
                  //     width: 1, //width of border
                  //   ),
                  //   shape: BoxShape.circle,
                  //   // color: Color(0xFF417DF0),
                  //   // borderRadius: BorderRadius.circular(8),
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
