import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_m_s_/privacy_policy.dart';

import '../Phone/phone.dart';
import '../Provider/auth_provider.dart';
import 'Profile_Screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  get drawerMenuListname => null;

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return SafeArea(
      child: SizedBox(
        width: 300,
        child: Drawer(
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: ListView(
              children: [
                // ListTile(
                //   leading: Center(
                //     child: Image.network(
                //       'assets/images/TMSimg.png',
                //       width: 100,
                //       height: 100,
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(
                      bottom: 100, left: 50, right: 50, top: 20),

                  // padding: EdgeInsets.all(10),
                  height: 200,
                  // width: 50,
                  decoration: const BoxDecoration(
                    // color: Color.fromARGB(255, 255, 255, 255),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/images/TMSimg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                ListTile(
                  title: const Text('Profile'),
                  leading: const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                  },
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                // const ListTile(
                //   title: Text('Tutorials'),
                //   leading: Icon(
                //     Icons.video_library_outlined,
                //     color: Colors.black,
                //   ),
                //   trailing: Icon(Icons.arrow_forward_ios_outlined),
                // ),
                const ListTile(
                  title: Text('Warranty registration'),
                  leading: Icon(
                    Icons.verified_user_outlined,
                    color: Colors.black,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
                ListTile(
                  title: const Text('Privacy Policy'),
                  leading: const Icon(
                    Icons.security_outlined,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicy(),
                      ),
                    );
                  },
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                ListTile(
                  title: const Text('Delete account'),
                  leading: const Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.black,
                  ),
                  onTap: () {
                    showDeleteAccountConfirmation(context);
                  },
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                // const ListTile(
                //   title: Text('Chat support'),
                //   leading: Icon(
                //     Icons.chat_outlined,
                //     color: Colors.black,
                //   ),
                //   trailing: Icon(Icons.arrow_forward_ios_outlined),
                // ),
                const SizedBox(
                  height: 130,
                ),
                const Divider(
                  thickness: 1,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.favorite_outlined,
                    color: Color.fromARGB(255, 230, 92, 82),
                  ),
                  title: Text('Made in India'),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 60, right: 60),
                  child: SizedBox(
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {
                        // ignore: use_build_context_synchronously
                        ap.userSignOut().then((value) =>
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Phone()),
                                (route) => false));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          // <-- Radius
                        ),
                      ),
                      child: const Text('signout'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDeleteAccountConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                final ap = Provider.of<AuthProvider>(context, listen: false);
                await ap.deleteAccount(context); // Pass the context here
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Phone()),
                    (route) => true);
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
