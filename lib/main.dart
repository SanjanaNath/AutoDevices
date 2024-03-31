import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:t_m_s_/Company_Device/Bottom_Navigator.dart';

import 'Company_Device/company_device.dart';
import 'Phone/SignUp_Screen.dart';
import 'Provider/auth_provider.dart';
import 'phone/phone.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        // title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          'phone': (context) => const Phone(),
          // 'otp': (context) => const Otp(
          //       verificationId: 'otp',
          //     ),
          'company_device': (context) => const CompanyDevice(),
          // 'company_device': (context) => const Device(),
          'SignUp_Screen': (context) => const SignUp()
        },
        home: const MyHomePage(title: 'TMS'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  //
  static String isLoggedIn = "isLoggedIn";
  void initiState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/tmzimg.png"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 500),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 63, 201, 68)),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  if (ap.isSignedIn == true) {
                    await ap.getDataFromSP().whenComplete(
                          () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavBar(),
                            ),
                          ),
                        );
                    // debugPrint('sanjan...${ap.uid}');
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Phone(),
                      ),
                    );
                    // debugPrint('sanj...${ap.uid}');
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
