import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies/auth/signup_page.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../home.dart';

class SighupPhoneNumber extends StatefulWidget {
  const SighupPhoneNumber({super.key});

  @override
  State<SighupPhoneNumber> createState() => _SighupPhoneNumberState();
}

class _SighupPhoneNumberState extends State<SighupPhoneNumber> {
  bool isOTPVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController countryCode = TextEditingController(text: "+91");
  String verificationId = "";
  String otp = "";
  String phone2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "Create new account",
                      style: TextStyle(
                          color: Color(0xffFF683A),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Visibility(
                    visible: !isOTPVisible,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 15),
                          child: TextFormField(
                            controller: fName,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintText: "First Name",
                              hintStyle: const TextStyle(color: Colors.black38),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                    color: Color(0xffFF683A), width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "nameIsRequired";
                              }
                              return null;
                            },
                          ),
                        ),
                        Visibility(
                          visible: !isOTPVisible,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: TextFormField(
                              controller: lName,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Last Name",
                                hintStyle:
                                    const TextStyle(color: Colors.black38),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                      color: Color(0xffFF683A), width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "nameIsRequired";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            children: [
                              CountryCodePicker(
                                onChanged: (country) {
                                  countryCode.text = country.dialCode!;
                                },
                                initialSelection: 'IN',
                                favorite: const ['+91', 'IN'],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: phone,
                                  onChanged: (value) {
                                    phone2 = value;
                                  },
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: "Phone Number",
                                      hintStyle:
                                          TextStyle(color: Colors.black38),
                                      border: InputBorder.none,
                                      counterText: ""),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "mobileNumberIsRequried";
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: TextField(
                              decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            hintText: "Referral Code(Optional)",
                            hintStyle: const TextStyle(color: Colors.black38),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: Color(0xffFF683A), width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isOTPVisible,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 20),
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
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      if (isOTPVisible) {
                        final credential = PhoneAuthProvider.credential(
                            verificationId: verificationId.toString(),
                            smsCode: otp);
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(credential)
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("OTP verify successfully")));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ));
                          }).onError((error, stackTrace) {
                            debugPrint("Error:$error");
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Invalid OTP")));
                          });
                        } catch (e) {
                          debugPrint("Error:$e");
                        }
                      } else {
                      if (_formKey.currentState!.validate()) {
                        QuerySnapshot<Map<String, dynamic>> data= await FirebaseFirestore.instance
                            .collection("users")
                            .where("phone", isEqualTo: phone.text)
                            .get();
                        if (data.docs.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content:
                                  Text("Mobile number is already logedin")));
                          return;
                        }



                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+91 ${phone.text}',
                          codeSent: (String vId, int? resendToken) {
                            isOTPVisible = true;
                            verificationId = vId;
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("OTP sent successfully")));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                          verificationCompleted:
                              (PhoneAuthCredential phoneAuthCredential) {},
                          verificationFailed: (FirebaseAuthException error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Please try again")));
                          },
                        );
                      }
                        FirebaseFirestore.instance.collection("users").add({
                          "first_name": fName.text,
                          "last_name": lName.text,
                          "phone": countryCode.text + phone.text
                        });
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(),));
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
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
                        isOTPVisible ? "Verify OTP" : "Sign Up",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
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
                  Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Sign up with E-mail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, letterSpacing: 1),
                          )))
                ],
              ),
            ),
          ],
        ));
  }
}















