import 'package:flutter/material.dart';
import 'CL.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Qi> Qlist=[];



  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController=TextEditingController();
    return MaterialApp(home: Scaffold(
      backgroundColor: Color(0xffdde6f1),
      appBar: AppBar(title: Text("Home",style: TextStyle(color: Colors.black),) ,backgroundColor: Colors.white,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 200 ,left:20 ,top:80 ),
            child: Container(child: Text("Today's task",style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold),)),
          ),
        ListView.separated(shrinkWrap: true, itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),

                child:Row(children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: Qlist[index].isChecked,
                    onChanged: (bool? value) {
                    setState(() {
                      Qlist[index].isChecked = value!;
                    });
                  },
                  ),
                  Text(Qlist[index].message),
                ],
                ),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10,
              );
            },
            itemCount: Qlist.length),

          Spacer(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Container(width:250,height:50,child: TextField(controller: textEditingController,decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)))
                  ,),

                ),),
              Padding(
                padding: const EdgeInsets.all(25),
                  child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: (){
                        setState(()
                        {Qlist.add(Qi(textEditingController.text,false));});
                      }),
                ),
            ],
          )
        ],
      ),
    ),
    );
  }
}
