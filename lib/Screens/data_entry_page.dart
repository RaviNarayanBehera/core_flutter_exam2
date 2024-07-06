import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/globals.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Student Data',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ...List.generate(
                  studentList.length,
                      (index) => Container(
                    margin: EdgeInsets.all(10),
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  studentList.removeAt(index);
                                });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        CircleAvatar(
                          maxRadius: 50,
                          backgroundImage: (studentList[index].img != null)
                              ? FileImage(studentList[index].img!)
                              : null,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  XFile? xfile = await picker.pickImage(
                                      source: ImageSource.camera);
                                  setState(() {
                                    studentList[index].img = File(xfile!.path);
                                  });
                                },
                                icon: Icon(
                                  Icons.camera,
                                  color: Colors.black,
                                )),
                            IconButton(
                                onPressed: () async {
                                  XFile? xfile = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    studentList[index].img = File(xfile!.path);
                                  });
                                },
                                icon: Icon(
                                  Icons.photo,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: studentList[index].name,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    label: Text(
                                      'Student Name',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: studentList[index].grid,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  label: Text(
                                    'Student Grid',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: studentList[index].std,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  label: Text(
                                    'Student Standard',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/');
                              // setState(() {
                              //   if (formkey.currentState!.validate()) {
                              //     Navigator.of(context).pushNamed('/');
                              //   }
                              // });
                            },
                            child: const Text(
                              'Submit',
                              style:
                              TextStyle(color: Colors.black, fontSize: 22),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}