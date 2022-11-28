import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: "BMI Calculator",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var weightController =TextEditingController();
var feetController =TextEditingController();
var inchController =TextEditingController();
var result="";
var bgColor=Colors.indigo.shade100;

  get totalCm => null;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text("BMI Calculator")),
      ),
      body:Center(
        child: Container(
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 11,bottom: 36),
                child: Text("Body Mass Index ",style: TextStyle(
                    fontSize:34,
                  fontWeight:FontWeight.w700

                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,bottom: 14),
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter Your Weight ( int Kg) ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    prefixIcon: Icon(Icons.line_weight),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                        width: 4,
                      ),

                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 4,
                        )

                    ),
                    enabledBorder: OutlineInputBorder(//................................
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 4,
                        )
                    ),

                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,bottom: 14),
                child: TextField(
                  controller: feetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter Your height  ( in feet) ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                        width: 4
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 4,
                      )
                    ),
                    enabledBorder: OutlineInputBorder(//................................
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 4,
                        )
                    ),


                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,bottom: 14),
                child: TextField(
                  controller: inchController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter Your height (in inch)",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                        width: 4,
                      ),

                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 4,
                        )

                    ),
                    enabledBorder: OutlineInputBorder(//................................
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 4,
                        )
                    ),



                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              ElevatedButton(onPressed: (){
                var wt=weightController.text.toString();
                var feet=feetController.text.toString();
                var inch=inchController.text.toString();
                if(feet.isEmpty && inch.isEmpty && wt.isEmpty){
                  setState(() {
                    result="Please fill details";
                  });
                }
               else if(feet.isEmpty && inch.isEmpty){
                  setState(() {
                    result="Please fill the height  ";
                  });
                }

                else if(wt.isEmpty){
                  setState(() {
                    result="Please fill the weight ";

                  });
                }
                else{
                  //bmi calculation
                  setState(() {
                    var intWt=int.parse(wt);
                    if(feet.isNotEmpty) {
                      // var totalCm=0.0;
                      var intFeet = int.parse(feet);
                      var   totalCm=intFeet*30.38;
                      var totalM=totalCm/100;
                      var bmi=intWt/(totalM*totalM);
                     String msg= change_bg_color(bmi);
                      setState((){
                        result=" $msg \n Your BMI is :${bmi.toStringAsFixed(4)}";
                      });
                    }
                    else if(inch.isNotEmpty) {
                      var intInch = int.parse(inch);
                      var totalCm=intInch*2.54;
                      var totalM=totalCm/100;
                      var bmi=intWt/(totalM*totalM);
                      String msg= change_bg_color(bmi);
                      setState((){
                        result="$msg \n Your BMI is :${bmi.toStringAsFixed(4)}";
                      });
                    }






                  });
                }
              }, child: Text("Calculate")),
              SizedBox(
                height: 11,
              ),

              Text(result,style: TextStyle(fontSize: 20),)

            ],
          ),
        ),
      )

    );
  }

  String change_bg_color(double bmi) {
    var msg="";
    if(bmi>25){
      msg="You're overweight !!";
      bgColor=Colors.deepOrange.shade200;
    }
    else if(bmi<18){
      msg="You're underweight !!";
      bgColor=Colors.red.shade200;
    }
    else{
      msg="You're healthy !!";
      bgColor=Colors.green.shade200;
    }
    return msg;
  }
}

