import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:t_m_s_/Company_Device/Bottom_Navigator.dart';

import '../Provider/auth_provider.dart';

import '../utils/utils.dart';
import 'SignUp_Screen.dart';

class Otp extends StatefulWidget {
  final String verificationId;
  final String phonenumber;
  const Otp(
      {Key? key, required this.verificationId, required this.phonenumber});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  //final FirebaseAuth auth = FirebaseAuth.instance;
  String? otpCode;
  late Timer _timer;
  int _secondsLeft = 30;
  bool isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsLeft--;
      });

      if (_secondsLeft == 0) {
        setState(() {
          isResendEnabled = true;
        });

        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    // var code = "";

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color.fromARGB(255, 63, 201, 68),
            ),
          ),
        ),
        body: SafeArea(
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.lightGreen,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(left: 80, right: 80),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/tmslogo.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          'Verification',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'We have sent a otp on your number',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Pinput(
                          length: 6,
                          showCursor: true,
                          // controller: _otpController,
                          defaultPinTheme: PinTheme(
                            width: 60,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // onChanged: (value) {
                          //   code = value;

                          onCompleted: (value) {
                            setState(() {
                              otpCode = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 35,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint("OtpCODE....$otpCode");
                              if (otpCode != null) {
                                verifyOtp(context, otpCode!);
                              } else {
                                showSnackBar(context, "Enter 6-Digit code");
                              }
                              // debugPrint("otpCOde..$otpCode");
                              debugPrint('mycode...${widget.verificationId}');
                              debugPrint(
                                  'PhonenumberOTP...${widget.phonenumber}');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 63, 201, 68)),
                            child: const Text(
                              ('Verify and proceed ➔'),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, 'phone', (route) => false);
                          },
                          child: const Text(
                            "Edit Phone Number?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (isResendEnabled == true) {
                              reSendOtp();
                            } else {
                              return;
                            }
                            // _startTimer();
                            //  AuthProvider.resendOtp(context, widget.phonenumber);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isResendEnabled ? Colors.white : Colors.grey,
                              side: const BorderSide(
                                  width: 0.1, color: Colors.black)),
                          child: Text(
                            isResendEnabled
                                ? "Resend OTP"
                                : "Resend OTP in (${_secondsLeft}s)",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        // TestButton(),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  // verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    debugPrint("OTP code entered by user:$userOtp");
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          //checking weather user exists in the db
          ap.checkExistingUser().then((value) async {
            debugPrint("VALUE....$value");
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) =>
                              ap.setSignIn().then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomNavBar()),
                                  )),
                        ),
                  );
            } else {
              //new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                  (route) => false);
            }
          });
        });
  }

  // void startTimer() {
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       if (_secondsLeft > 0) {
  //         _secondsLeft--;
  //       } else {
  //         timer.cancel();
  //         onPressed:
  //         () {
  //           reSendOtp();
  //           // Code to handle the button press
  //         };
  //       }
  //     });
  //   });
  // }

  void reSendOtp() {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    ap.resendOtp(context, widget.phonenumber);
    debugPrint("MySendotp...${widget.phonenumber}");
    // String phoneNumber = phoneController.text.trim();
  }
}
