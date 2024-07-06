import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Home Page',style: TextStyle(
            color: Colors.black,fontSize: 25
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ...List.generate(studentList.length, (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  tileColor: Colors.blue.shade200,
                  leading: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed('/select');
                        seleindex = index;
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: (studentList[index].img!=null)? FileImage(studentList[index].img!) : null,
                    ),
                  ),
                  title: Text('${studentList[index].name!.text}',style: TextStyle(color: Colors.black,fontSize: 25),
                  ),
                  subtitle: Row(
                    children: [
                      Text('Grid : ${studentList[index].grid!.text}',style: TextStyle(color: Colors.black),),
                      SizedBox(width: 10,),
                      Text('Std : ${studentList[index].std!.text}',style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {
                        setState(() {
                          showDialog(context: context, builder: (context) => SingleChildScrollView(
                            child: AlertDialog(
                              backgroundColor: Colors.blue.shade200,
                              content : Container(
                                margin: EdgeInsets.all(10),
                                height: 350,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage: (studentList[index].img!=null)? FileImage(studentList[index].img!) : null,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(onPressed: () {
                                          setState(() async {
                                            XFile? xfile = await picker.pickImage(source: ImageSource.camera);
                                            studentList[index].img = File(xfile!.path);
                                          });
                                        }, icon: Icon(Icons.camera,color: Colors.black,)),
                                        IconButton(onPressed: () async {
                                          XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
                                          studentList[index].img = File(xfile!.path);
                                        }, icon: Icon(Icons.photo,color: Colors.black,))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 190,
                                          child: TextFormField(
                                            controller: studentList[index].name,
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                                label: Text(
                                                  'Name',
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
                                          width: 190,
                                          child: TextFormField(
                                            controller: studentList[index].grid,
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              label: Text(
                                                'Grid',
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
                                          width: 190,
                                          child: TextFormField(
                                            controller: studentList[index].std,
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              label: Text(
                                                'Standard',
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                Center(
                                  child: ElevatedButton(onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  }, child: Text('Save',style: TextStyle(color: Colors.black,fontSize: 18),)),
                                )
                              ],
                            ),
                          ),
                          );
                        });
                      }, icon: Icon(Icons.edit,color: Colors.black,)),
                      IconButton(onPressed: () {
                        setState(() {
                          studentList.removeAt(index);
                        });
                      }, icon: Icon(Icons.delete,color: Colors.black,))
                    ],
                  ),
                ),
              ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pushNamed("/detail");
          TextEditingController txtname = TextEditingController();
          TextEditingController txtgrid = TextEditingController();
          TextEditingController txtstd = TextEditingController();
          File? txtimg;
          setState(() {
            studentList.add(StudentModel(
              name: txtname,
              grid: txtgrid,
              std: txtstd,
              img: txtimg,
            ));
          });
        },child: Icon(Icons.add,color: Colors.black,),),
    );
  }
}

