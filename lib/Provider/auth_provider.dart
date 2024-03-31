import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_m_s_/Phone/phone.dart';
import '../model/user_model.dart';
import '../phone/otp.dart';
import '../utils/utils.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  AuthProvider() {
    checkSign();
  }

  void checkSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  // signin
  // void signInWithPhone(BuildContext context, String phoneNumber) async {
  //   try {
  //     await _firebaseAuth.verifyPhoneNumber(
  //         phoneNumber: phoneNumber,
  //         verificationCompleted:
  //             (PhoneAuthCredential phoneAuthCredential) async {
  //           await _firebaseAuth.signInWithCredential(phoneAuthCredential);
  //         },
  //         verificationFailed: (error) {
  //           throw Exception(error.message);
  //         },
  //         codeSent: (verificationId, forceResendingToken) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => Otp(verificationId: verificationId),
  //             ),
  //           );
  //         },
  //         codeAutoRetrievalTimeout: (verificationId) {});
  //   } on FirebaseAuthException catch (e) {
  //     showSnackBar(context, e.message.toString());
  //   }
  // }
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            debugPrint("PhonenumberAuth...$phoneNumber");
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Otp(
                        phonenumber: phoneNumber,
                        verificationId: verificationId,
                      )),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  // resend otp
  void resendOtp(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          debugPrint("PhonenumberAuth...$phoneNumber");
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  // verify otp
  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);

      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;

      if (user != null) {
        // carry our logic
        _uid = user.uid;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  // DATABASE OPERTAIONS
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      debugPrint("USER EXISTS");
      return true;
    } else {
      debugPrint("NEW USER");
      return false;
    }
  }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
      userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
      userModel.uid = _firebaseAuth.currentUser!.phoneNumber!;

      _userModel = userModel;

      // uploading to database
      await _firebaseFirestore
          .collection("users")
          .doc(_uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        createdAt: snapshot['createdAt'],
        uid: snapshot['uid'],
        phoneNumber: snapshot['phoneNumber'],
      );
      _uid = userModel.uid;
    });
  }

  // STORING DATA LOCALLY
  Future saveUserDataToSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModel.toMap()));
  }

  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    debugPrint("Data...$data");
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    debugPrint("UID...$_uid");

    notifyListeners();
  }

  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    s.clear();
  }

  Future<bool> checkUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("Purchase").doc(_uid).get();
    if (snapshot.exists) {
      debugPrint("user exist");
      debugPrint(uid);
      return true;
    } else {
      debugPrint("not exist");
      debugPrint(uid);
      return false;
    }
  }

  static String? code;
  Future showData() async {
    var collection = FirebaseFirestore.instance.collection('Purchase');
    var docSnapshot = await collection.doc(_uid).get();
    Map<String, dynamic> data = docSnapshot.data()!;
    code = data['Device Id'];
    // code = data['Device'];
    debugPrint(code);
  }

  int count = 0;
  void countplus() {
    count = count + 1;
  }

  void signInWithCredential(PhoneAuthCredential authCredential) {}

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    User? currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      try {
        // Delete user data from Firestore
        await _firebaseFirestore
            .collection('users')
            .doc(currentUser.uid)
            .delete();

        // Delete user account
        await currentUser.delete();

        // Clear local data and sign out
        _isSignedIn = false;
        _uid = null;
        _userModel = null;
        notifyListeners();

        SharedPreferences s = await SharedPreferences.getInstance();
        s.clear();

        // Navigate to the Login screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Phone()),
          (route) => false,
        );
      } catch (e) {
        // Handle errors
        showSnackBar(context, e.toString());
      }
    }
  }
}
