import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user_model.dart';
import '../Provider/auth_provider.dart';
import '../cards_screen.dart';

class QrPlugScreen extends StatefulWidget {
  const QrPlugScreen({super.key});

  @override
  State<QrPlugScreen> createState() => _QrPlugScreenState();
}

class _QrPlugScreenState extends State<QrPlugScreen> {
  // String isScanned = ' ';
  // void printmessage() {

  //   debugPrint('Scanned done by user');
  // }
  String _scanBarcode = ' ';
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  DatabaseReference? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Smart Switch');
    getDataFromSP();
    // getdata();
  }

  void createCards() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.checkUser().then((value) async {
      if (value == true) {
        getdata();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const CardScreen(),
        //   ),
        // );
      } else {
        //user not exist
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Alert"),
            content: const Text("User not exist"),
            actions: <Widget>[
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("okay"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          ' add plug',
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
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            // padding: EdgeInsets.all(25),
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
                //  mainAxisAlignment: MainAxisAlignment.,

                children: [
                  Container(
                    // alignment: Alignment.Center,

                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[500],
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        padding: const EdgeInsets.only(right: 10),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.power,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    'Scan the device',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    // 'make sure the device is powered on. "remove the lid                               over reset button and long press the reset button "                                till a prompt tone is heard',
                    "make sure the device is connected to the circuit                                      then you can scan the code on the plug                                           and on your switch",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 360,
                  ),
                  // const QRScanner(),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 170,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.qr_code_2),

                          onPressed: () => scanQR(),
                          // {
                          // scanQRCode();
                          // },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),

                          label: const Text('Scan Code'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('$_scanBarcode\n',
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  //*********************************Qr Scanner************************************** */
                  SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                      // onPressed: isChecked ? printmessage : null,

                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const CardScreen(),
                        //   ),
                        // );
                        createCards();

                        // if (isScanned!= null) {
                        //   printmessage();
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const CardScreen(),
                        //     ),
                        //   );
                        // } else {
                        //   return;
                        // }
                      },
                      autofocus: true,
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: isScanned
                        //     ? Colors.black
                        //     : const Color.fromARGB(255, 223, 217, 217),
                        backgroundColor: Colors.black,
                        side: const BorderSide(
                          width: 1.0,
                        ),
                      ),
                      child: const Text(
                        'next',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => debugPrint(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
//barcode scanner flutter ant
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  int count = 0;

  Future getdata() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final collectionRef = FirebaseFirestore.instance.collection("Purchase");
    final documentSnapshot = await collectionRef.doc(_uid).get();
    debugPrint("_uid....$_uid");
    debugPrint("documentSnapshot....${documentSnapshot.data()}");
    final data = documentSnapshot.data();
    debugPrint("Data....$data");
    // Map<String, dynamic> data = documentSnapshot.data()!;
    final a = data!['Device Id'] as List<dynamic>;

    print(a);

    for (int i = 0; i < a.length; i++) {
      debugPrint('A[i]...${a[i]}');
      debugPrint('_scanBarcode...$_scanBarcode');

      if (a[i] == _scanBarcode) {
        debugPrint(a[i]);
        ap.countplus();
        debugPrint("Matched for ${a[i]}");
        // ignore: use_build_context_synchronously
        // dbRef!.push().set(a[i]).whenComplete(() {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => CardScreen(
        //         code: _scanBarcode,
        //         codeData: a.toString(),
        //       ),
        //     ),
        //   );
        // });
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardScreen(
              code: _scanBarcode,
            ),
          ),
        );
      } else {
        debugPrint("Did not match for ${a[i]}");
        //code not match
        debugPrint("code is");
        debugPrint(AuthProvider.code);
        debugPrint('not match');
        // ignore: use_build_context_synchronously
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     title: const Text("Alert"),
        //     content: const Text("Code not match"),
        //     actions: <Widget>[
        //       OutlinedButton(
        //         onPressed: () {
        //           Navigator.of(context).pop();
        //         },
        //         child: const Text("okay"),
        //       ),
        //     ],
        //   ),
        // );
      }
    }
  }

  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    debugPrint("Data.....$data");
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
  }
}
