import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/auth_provider.dart';
import '../../model/user_model.dart';
import '../Company_Device/company_device.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  // final bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    // bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.lightGreen,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 200),
                  margin: const EdgeInsets.only(left: 55, right: 55),
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
                          'Register',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          // cursorColor: Colors.lightGreen,
                          cursorColor: Colors.black,

                          controller: nameController,
                          keyboardType: TextInputType.name,
                          maxLength: 11,
                          decoration: const InputDecoration(
                            labelText: "Username",
                            hintText: "Enter your name",

                            //hint text
                            prefixIcon: Icon(Icons.person),
                            //prefix iocn

                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            labelStyle:
                                TextStyle(fontSize: 13, color: Colors.black),
                            //     enabledBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            //   borderSide: const BorderSide(
                            //     color: Colors.transparent,
                            //   ),
                            // ),
                            // focusedBorder: OutlineInputBorder(
                            //   // borderRadius: BorderRadius.circular(10),
                            //   borderSide: const BorderSide(
                            //     color: Colors.black,
                            //   ),
                            // ),
                            // alignLabelWithHint: true,
                            // border: InputBorder.none,
                            // fillColor: Colors.blueGrey.shade50,
                            // filled: true
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextField(
                          cursorColor: Colors.black,

                          // cursorHeight: 50,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email",
                            prefixIcon: Icon(
                              Icons.email_rounded,
                            ),

                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            labelStyle:
                                TextStyle(fontSize: 13, color: Colors.black),
                            // enabledBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            //   borderSide: const BorderSide(
                            //     color: Colors.transparent,
                            //   ),
                            // ),
                            // focusedBorder: OutlineInputBorder(
                            //   // borderRadius: BorderRadius.circular(10),
                            //   borderSide: const BorderSide(
                            //     color: Colors.black,
                            //   ),
                            // ),
                            // alignLabelWithHint: true,
                            // border: InputBorder.none,
                            // fillColor: Colors.blueGrey.shade50,
                            // filled: true,
                          ),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        SizedBox(
                          height: 35,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () => storeData(),
                            style: ElevatedButton.styleFrom(
                                // ignore: deprecated_member_use
                                primary:
                                    const Color.fromARGB(255, 63, 201, 68)),
                            child: const Text(
                              ('Save & Login ➔'),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget textFeld({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          cursorColor: Colors.lightGreen,
          controller: controller,
        ));
  }

  // store data to db
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      createdAt: "",
      phoneNumber: "",
      uid: "",
    );

    ap.saveUserDataToFirebase(
      context: context,
      userModel: userModel,
      onSuccess: () {
        ap.saveUserDataToSP().then(
              (value) => ap.setSignIn().then(
                    (value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CompanyDevice(),
                        ),
                        (route) => false),
                  ),
            );
      },
    );
  }
}
