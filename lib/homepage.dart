import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("AddCategory");
        },
        child: const Icon(
          Icons.category,
          color: Colors.orangeAccent,
        ),
      ),
      appBar: AppBar(
        title: const Text("HomePage Notes"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushNamedAndRemoveUntil(
                "Login",
                (route) => true,
              );
            },
            icon: const Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          FirebaseAuth.instance.currentUser!.emailVerified
              ? Expanded(
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 160),
                    children: [
                      InkWell(
                        onLongPress: () {
                          AwesomeDialog(
                            context: context,
                            desc: "Are you sure..",
                            title: "Error",
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            btnOkOnPress: () {
                              print("Ok....");
                            },
                          ).show();
                        },
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/folder.png",
                                  height: 100,
                                ),
                                const Text("company"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/folder.png",
                                height: 100,
                              ),
                              const Text("company"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  color: Colors.yellow,
                  child: MaterialButton(
                    onPressed: () {
                      FirebaseAuth.instance.currentUser!
                          .sendEmailVerification();
                    },
                    child: const Text("Please Vreified your email"),
                  ),
                ),
        ],
      ),
    );
  }
}
