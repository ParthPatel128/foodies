import 'package:flutter/material.dart';

import 'login_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              height: 35,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Reset Password",
                style: TextStyle(
                    color: Color(0xffFF683A),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
              child: TextFormField(
                  decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: "E-mail",
                hintStyle: const TextStyle(color: Colors.black38),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
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
            if(value!.isEmpty) {
            return "Enter a E-mail";
            }else if (value.isEmpty ||
            !RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
            return 'Enter a valid E-mail!';
            }
            return null;
            },
              ),
            ),
            InkWell(
              onTap: (){
                if(
                _formKey.currentState!.validate()){}
              },
              child: Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xffFF683A),
                    borderRadius: BorderRadius.circular(40)),
                child: const Center(
                    child: Text(
                  "Send Link",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
