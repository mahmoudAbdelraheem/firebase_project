import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/components/coustombutton.dart';
import 'package:firebase_project/components/mytextformfield.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController addController = TextEditingController();

  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');
  Future<void> addCategory() {
    // Call the user's CollectionReference to add a new user
    return categories
        .add({
          'cate-name': addController.text, // John Doe
          // 42
        })
        .then((value) => print("Category Added"))
        .catchError((error) => print("Failed to add Category: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Categpory"),
      ),
      body: Form(
        key: formState,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: MyTextFormField(
                myHintText: "Enter Category Name",
                myController: addController,
                inputType: TextInputType.text,
                validator: (val) {
                  if (val == "") return "Enter Category Name";
                  return null;
                },
              ),
            ),
            CoustomButton(
              buttonText: "Add",
              backgroundColor: Colors.orangeAccent,
              onPressed: () {
                addCategory();
              },
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
