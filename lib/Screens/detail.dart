import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/globals.dart';

class SelectDetail extends StatefulWidget {
  const SelectDetail({super.key});

  @override
  State<SelectDetail> createState() => _SelectDetailState();
}

class _SelectDetailState extends State<SelectDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Detail Page',
          style: TextStyle(color: Colors.black, fontSize: 25,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade100
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          maxRadius: 55,
                          backgroundImage: (studentList[seleindex].img!=null) ? FileImage(studentList[seleindex].img!) : null,
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(' Name  : ',style: TextStyle(color: Colors.black ,fontSize: 20),),
                            SizedBox(width: 30,),
                            Text('${studentList[seleindex].name!.text}',style: TextStyle(color: Colors.black ,fontSize: 25),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(' Grid     : ',style: TextStyle(color: Colors.black ,fontSize: 20),),
                            SizedBox(width: 50,),
                            Text('${studentList[seleindex].grid!.text}',style: TextStyle(color: Colors.black ,fontSize: 25),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(' Std      : ',style: TextStyle(color: Colors.black ,fontSize: 20),),
                            SizedBox(width: 60,),
                            Text('${studentList[seleindex].std!.text}',style: TextStyle(color: Colors.black ,fontSize: 25),)
                          ],
                        ),
                      )
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