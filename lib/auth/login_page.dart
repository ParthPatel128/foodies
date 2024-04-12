import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodies/auth/phone_number_page.dart';
import 'package:foodies/constant/vars.dart';
import 'package:foodies/home.dart';
import 'package:get_storage/get_storage.dart';

import '../constant/assets_path.dart';
import 'first_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FirstPage(),
                        ));
                  },
                  icon: const Icon(Icons.arrow_back)),
              const SizedBox(
                height: 35,
              ),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintStyle: const TextStyle(color: Colors.black38),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:
                          const BorderSide(color: Color(0xffFF683A), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a E-mail";
                    } else if (value.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid E-mail!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    hintStyle: const TextStyle(color: Colors.black38),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:
                          const BorderSide(color: Color(0xffFF683A), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else if (value.length < 6) {
                      return "Password required at least 6 characters";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage(),
                              ));
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff1BA1DC),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        )),
                  )),
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    QuerySnapshot<Map<String, dynamic>> data =
                        await FirebaseFirestore.instance
                            .collection("users")
                            .where("email_address", isEqualTo: email.text)
                            .where("password", isEqualTo: password.text)
                            .get();
                    if (data.docs.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Invalid username or Password")));
                    } else {
                      userDetails=data.docs[0].data();
                      box.write("isLogin", true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ));
                    }
                  }
                },
                child: Container(
                  width: double.maxFinite,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffFF683A),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            offset: const Offset(0, 2),
                            color: Colors.grey.shade400)
                      ]),
                  child: const Center(
                      child: Text(
                    "Log In",
                    style: TextStyle(
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
              Container(
                width: double.maxFinite,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: const Color(0xff425892),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                          color: Colors.grey.shade400)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(facebookIcon,
                        color: Colors.white, width: 30, height: 30),
                    const SizedBox(width: 30),
                    const Text(
                      "Facebook Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneNumberPage(),
                        ));
                  },
                  child: Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffFF683A)),
                        borderRadius: BorderRadius.circular(40)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.call, color: Color(0xffFF683A), size: 25),
                        SizedBox(width: 10),
                        Text(
                          "Login with phone number",
                          style: TextStyle(
                              color: Color(0xffFF683A),
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
