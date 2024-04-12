import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../home.dart';
import 'login_page.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  bool isOTPVisible = false;
  String phone = "";
  TextEditingController txtPhoneNumber = TextEditingController();
  String otp = "";
  String verificationId = "";
  String countryCode="91";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LoginPage(),
                    ));
              },
              icon: const Icon(Icons.arrow_back)),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: Color(0xffFF683A),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Visibility(
            visible: !isOTPVisible,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                     CountryCodePicker(
                      onChanged: (value) {
                        countryCode=value.dialCode!;
                      },
                      initialSelection: 'IN',
                      favorite: const ['+91', 'IN'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    Expanded(
                      child: TextField(
                          controller: txtPhoneNumber,
                          onChanged: (val) {
                            phone = val;
                          },
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Phone Number",
                              hintStyle: TextStyle(color: Colors.black38),
                              border: InputBorder.none,
                              counterText: "")),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: isOTPVisible,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 40,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.box,
                onChanged: (val) {},
                onCompleted: (pin) {
                  otp = pin;
                },
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              if (isOTPVisible) {
                final credential = PhoneAuthProvider.credential(
                    verificationId: verificationId.toString(), smsCode: otp);
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("OTP verify successfully")));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ));
                  }).onError((error, stackTrace) {
                    debugPrint("Error:$error");
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid OTP")));
                  });
                } catch (e) {
                  debugPrint("Error:$e");
                }
              } else {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '+91 ${txtPhoneNumber.text}',
                  codeSent: (String vId, int? resendToken) {
                    isOTPVisible = true;
                    verificationId = vId;
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("OTP sent successfully")));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                  verificationCompleted:
                      (PhoneAuthCredential phoneAuthCredential) {},
                  verificationFailed: (FirebaseAuthException error) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please try again")));
                  },
                );
              }
            },
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xffFF683A),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey.shade400,
                    offset: const Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                  child: Text(
                isOTPVisible ? "Verify OTP" : "Send code",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
              child: Text(
            "OR",
            style: TextStyle(
              fontSize: 15,
            ),
          )),
          const SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context);
                    },
                    child: const Text(
                      "Login with E-mail",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff1BA1DC),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    )),
              )),
        ],
      ),
    );
  }
}
