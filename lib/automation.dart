import 'package:flutter/material.dart';

class AutomationScreen extends StatefulWidget {
  const AutomationScreen({super.key});

  @override
  State<AutomationScreen> createState() => _AutomationScreenState();
}

class _AutomationScreenState extends State<AutomationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            ' automation',
            style: TextStyle(fontSize: 20, color: Colors.black),
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
          child: Column(
            children: [
              const Divider(
                thickness: 1,
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  // padding: EdgeInsets.all(20),
                  height: 170,
                  width: 350,
                  color: Colors.grey.shade50,
                  child: const Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 30)),
                      Text(
                        "you don't have ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        " any active automation",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "you can schedule all your smart devices                                      with your sleep and wake up pattern ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "how to set up?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(2.5),
                margin: const EdgeInsets.symmetric(horizontal: 65),
                height: 43,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        7,
                      ),
                      color: Colors.black),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'smart alarm',
                    ),
                    Tab(
                      text: 'light-lock',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // tab bar view here
              Column(
                children: [
                  SizedBox(
                    height: 270,
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                // height: 200,
                                width: 200,
                                margin: const EdgeInsets.only(bottom: 40),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 241, 240, 251),
                                ),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, top: 20),
                                        alignment: Alignment.topLeft,
                                        child: const Text(
                                          "SCHEDULE",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: const Text(
                                          "set sleep &                                 wake-up time                                                          then select day",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.bottomLeft,
                                      margin: const EdgeInsets.only(
                                          right: 90, top: 20, left: 10),
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 235, 229, 229),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/automation_alarm.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 200,
                                margin: const EdgeInsets.only(bottom: 40),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 235, 229, 229),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, top: 20),
                                        alignment: Alignment.topLeft,
                                        child: const Text(
                                          "SELECT DEVICE",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: const Text(
                                          "select applicable                                                         smart device",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.bottomLeft,
                                      margin: const EdgeInsets.only(
                                          right: 90, top: 40, left: 10),

                                      // padding: EdgeInsets.all(10),

                                      // width: 50,
                                      decoration: const BoxDecoration(
                                        // color: Color.fromARGB(255, 255, 255, 255),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/automation_watchs.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          child: Row(
                            children: [
                              Container(
                                // height: 200,
                                width: 200,
                                margin: const EdgeInsets.only(bottom: 40),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 241, 240, 251),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, top: 20),
                                        alignment: Alignment.topLeft,
                                        child: const Text(
                                          "SELECT DEVICE",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: const Text(
                                          "select light,                                 lock and lock state                                                          (open or close)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.bottomLeft,
                                      margin: const EdgeInsets.only(
                                        right: 100,
                                        top: 20,
                                      ),
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 235, 229, 229),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/automation_watch.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 200,
                                margin: const EdgeInsets.only(bottom: 40),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 252, 245, 240),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, top: 20),
                                        alignment: Alignment.topLeft,
                                        child: const Text(
                                          "SCHEDULE",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: const Text(
                                          "select applicable                                                         days",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.bottomLeft,
                                      margin: const EdgeInsets.only(
                                          right: 90, top: 40, left: 10),

                                      // padding: EdgeInsets.all(10),

                                      // width: 50,
                                      decoration: const BoxDecoration(
                                        // color: Color.fromARGB(255, 255, 255, 255),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/automation_calenders.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),

              // SizedBox(
              //   height: 45,
              //   width: 340,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.black,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),

              //         // <-- Radius
              //       ),
              //       elevation:
              //           8, // Adjust the value to control the shadow intensity
              //       shadowColor: Colors.grey, // Customize the shadow color
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         const Text(
              //           'add new automation',
              //           style: TextStyle(fontSize: 15),
              //         ),
              //         const SizedBox(width: 160),
              //         Container(
              //           height: 25,
              //           width: 25,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: Colors.teal,
              //           ),
              //           child: const Icon(
              //             Icons.add,
              //             color: Colors.white,
              //             size: 20,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
