import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import '../Provider/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    // bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    nameController.text = ap.userModel.name;
    emailController.text = ap.userModel.email;
    numberController.text = ap.userModel.phoneNumber;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // ignore: prefer_const_constructors
        title: Text(
          'Profile',
          style: const TextStyle(fontSize: 23, color: Colors.black),
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
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                // padding: EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),

                // ignore: prefer_const_constructors
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Name',
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                // padding: EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),

                // ignore: prefer_const_constructors
                child: TextField(
                  controller: numberController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, labelText: 'Mobile Number'),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                // padding: EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),

                // ignore: prefer_const_constructors
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, labelText: 'Email Id'),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              Container(
                // padding: EdgeInsets.all(5),
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),

                // ignore: prefer_const_constructors
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none, labelText: 'Address'),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 120,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    // ignore: prefer_const_constructors
                    child: TextField(
                      decoration: const InputDecoration(
                          border: InputBorder.none, labelText: 'City'),
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Container(
                    width: 170,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    // ignore: prefer_const_constructors
                    child: TextField(
                      decoration: const InputDecoration(
                          border: InputBorder.none, labelText: 'State'),
                    ),
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 50,
              ),
              // Text(ap.userModel.name),
              // Text(ap.userModel.email),
              // Text(ap.userModel.phoneNumber),
            ],
          ),
        ),
      ),
    );
  }
}
