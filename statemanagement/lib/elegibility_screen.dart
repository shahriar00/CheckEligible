import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'elegibility_provider.dart';

class elegibility extends StatefulWidget {
  const elegibility({Key? key}) : super(key: key);

  @override
  State<elegibility> createState() => _elegibilityState();
}

class _elegibilityState extends State<elegibility> {

  final age = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<Checkeligibilityprovider>(
      create: (context)=>Checkeligibilityprovider(),
      child: Builder(
        builder: (context){
          return Scaffold(

            appBar: AppBar(
              title: Text("Check Eligibility",style: TextStyle(fontSize: 20),),
              centerTitle: true,
            ),

            body: Center(
              child: Form(
                child:Consumer<Checkeligibilityprovider>(
                  builder: (context,provider,child){
                    return  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: provider.check? Colors.red : Colors.green
                          ),
                        ),
                        SizedBox(height: 16,),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: TextFormField(
                            controller: age,
                            decoration: InputDecoration(

                                hintText: "Enter any Value",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)
                                )

                            ),

                            keyboardType: TextInputType.number,

                          ),
                        ),
                        SizedBox(height: 16,),
                        FlatButton(onPressed: (){
                          final int agedata = int.parse(age.text.trim());
                          provider.checkdata(agedata);

                        }, child: Text("Check",style: TextStyle(fontSize: 20),),
                          color: Colors.blue,
                          textColor: Colors.white,),
                        SizedBox(height: 16,),
                        Text(provider.messege)
                      ],

                    );
                  },

                )

              ),
            ),

          );
        },
      ),

    );


  }
}

