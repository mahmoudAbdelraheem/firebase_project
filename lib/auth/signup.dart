import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/components/coustombutton.dart';
import 'package:firebase_project/components/coustomlogo.dart';
import 'package:flutter/material.dart';
import '../components/mytextformfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailConrtoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    emailConrtoller.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const CoustomLogo(),
                  const SizedBox(height: 20),
                  const Text(
                    "Sing Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Enter Your Personal Information",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "User Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    validator: (value) {
                      if (value == '') {
                        return "Error! the field can't be an empty";
                      }
                    },
                    myHintText: "Enter Your Name",
                    myController: usernameController,
                    inputType: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    validator: (value) {
                      if (value == '') {
                        return "Error! the field can't be an empty";
                      }
                    },
                    myHintText: "Enter Your Email",
                    myController: emailConrtoller,
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    validator: (value) {
                      if (value == '') {
                        return "Error! the field can't be an empty";
                      }
                    },
                    myHintText: "Enter Your Password",
                    myController: passwordController,
                    inputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            CoustomButton(
              buttonText: "Sign Up",
              backgroundColor: Colors.yellow[500]!,
              textColor: Colors.black,
              onPressed: () async {
                if (formState.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailConrtoller.text,
                      password: passwordController.text,
                    );
                    Navigator.of(context).pushReplacementNamed("Login");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                } else {
                  print("=============================error");
                }
              },
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("Login");
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Have An Account ? "),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
