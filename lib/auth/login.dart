import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/mytextformfield.dart';
import '../components/logobutton.dart';
import '../components/coustombutton.dart';
import '../components/coustomlogo.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailConrtoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Login To continue using the app",
                    style: TextStyle(color: Colors.grey),
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
                    myHintText: "Enter Your Email",
                    myController: emailConrtoller,
                    inputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == '') {
                        return "Error! the field can't be an empty";
                      }
                    },
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
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 5),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forget Password ?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CoustomButton(
              buttonText: "Login",
              backgroundColor: Colors.yellow[500]!,
              textColor: Colors.black,
              onPressed: () async {
                if (formState.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailConrtoller.text,
                      password: passwordController.text,
                    );
                    Navigator.of(context).pushReplacementNamed("HomePage");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print(
                          "==========================Error==========================");
                      // ignore: use_build_context_synchronously
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        title: 'Not Found',
                        desc: 'This user in not found',
                      ).show();
                    } else if (e.code == 'wrong-password') {
                      print(
                          "==========================Error==========================");
                      // ignore: use_build_context_synchronously
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        title: 'Wrong Password',
                        desc: 'This password is wrong',
                      ).show();
                    } else
                      print(e.code);
                  }
                } else {
                  print("=============================error");
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "OR Login With",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LogoButton(
                  logo: "images/facebook-logo.png",
                  logoColor: Colors.blue[600]!,
                  logoWidth: 40,
                ),
                LogoButton(
                  logo: "images/google-logo.png",
                  logoColor: Colors.red[400]!,
                  logoWidth: 30,
                ),
                LogoButton(
                  logo: "images/apple-logo.png",
                  logoColor: Colors.yellow[500]!,
                  logoWidth: 30,
                ),
              ],
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("SignUp");
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Don't Have An Account ? "),
                      TextSpan(
                        text: "Register Now",
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
