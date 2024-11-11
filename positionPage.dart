// ignore: file_names
import 'package:flutter/material.dart';

class PositionPageMain extends StatefulWidget{
  @override
  PositionPage createState() => PositionPage();
}

void positionConverterAppend(firstDegreeController, secondDegreeController, secondMinitueController, thirdDegreeController, thirdMinuteontroller, thirdSecondController){

  if (firstDegreeController.text!=""){

      var degree= double.parse(firstDegreeController.text);
      var minute= (degree-degree.toInt())*60;
      var second= (minute-minute.toInt())*60;

      secondDegreeController.text= int.parse(degree.toString());
      secondMinitueController.text= minute.toStringAsFixed(2);

      thirdDegreeController.text= int.parse(degree.toString());
      thirdMinuteontroller.text= int.parse(minute.toString());
      thirdSecondController.text= second.toStringAsFixed(2);
  }

  else if(secondDegreeController.text!="" && secondMinitueController.text!=""){
    var degree= double.parse(secondDegreeController.text)+ double.parse(secondMinitueController.text)/60;
    var fullMinute= (double.parse(secondDegreeController.text)-double.parse(secondMinitueController.text));
    var second= (double.parse(secondMinitueController.text)- int.parse(secondMinitueController.text))*60;

    firstDegreeController.text= degree.toStringAsFixed(4);

    thirdDegreeController.text= int.parse(degree.toString());
    thirdMinuteontroller.text=  int.parse(fullMinute.toString());
    thirdSecondController.text= second.toStringAsFixed(2);
    
  }

  else if(thirdDegreeController.text!="" && thirdMinuteontroller.text!="" && thirdSecondController.text!=""){
    var degree= (double.parse(thirdDegreeController.text)+(double.parse(thirdMinuteontroller.text))/60)+ (double.parse(thirdSecondController.text)/3600);
    var minute= double.parse(thirdMinuteontroller.text)+(double.parse(thirdSecondController.text))/60;

    firstDegreeController.text= degree.toStringAsFixed(4);

    secondDegreeController.text= int.parse(degree.toString()).toStringAsFixed(2);
    secondMinitueController.text= int.parse(minute.toStringAsFixed(2));

  }

}

// ignore: must_be_immutable
class PositionPage extends State<PositionPageMain>{

  var firstDegreeController= TextEditingController();
  var secondDegreeController= TextEditingController();
  var secondMinitueController= TextEditingController();
  var thirdDegreeController= TextEditingController();
  var thirdMinuteontroller= TextEditingController();
  var thirdSecondController= TextEditingController();

  @override
  void initState() {
    firstDegreeController.addListener((){
      secondDegreeController.text= "";
      secondMinitueController.text= "";
      thirdDegreeController.text= "";
      thirdMinuteontroller.text= "";
      thirdSecondController.text="";
    });

    secondDegreeController.addListener((){
      thirdDegreeController.text= "";
      thirdMinuteontroller.text= "";
      thirdSecondController.text="";
    });

    thirdDegreeController.addListener((){
      firstDegreeController.text= "";
      secondDegreeController.text= "";
      secondMinitueController.text= "";
    });
  }

  @override
  Widget build(BuildContext context) {

    var screenInformations= MediaQuery.of(context).size;
    var screenWidth= screenInformations.width;
    var screenHeight= screenInformations.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text("Position Converter",
        style: TextStyle(
          color: Colors.white,
        ),),
      ),  
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                  ),
                child: const Text("Deg:", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(
                height: screenHeight/18,
                width: screenWidth/5,
                child: TextField(
                  controller: firstDegreeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                ),
                child: const Text("Deg:", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenWidth/40,
                ),
                child: SizedBox(
                  height: screenHeight/18,
                  width: screenWidth/5,
                  child: TextField(
                    controller: secondDegreeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenWidth/40,
                ),
                child: const Text("Min:", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(
                height: screenHeight/18,
                width: screenWidth/5,
                child: TextField(
                  controller: secondMinitueController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ),
           
            ],
                       ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                ),
                child: const Text("Deg:", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(
                height: screenHeight/18,
                width: screenWidth/5,
                child: TextField(
                  controller: thirdDegreeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                ),
                child: const Text("Min:", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(
                height: screenHeight/18,
                width: screenWidth/5,
                child: TextField(
                  controller: thirdMinuteontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                ),
                child: const Text("Sec:", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(
                height: screenHeight/18,
                width: screenWidth/5,
                child: TextField(
                  controller: thirdSecondController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15)
                )
              )
            ),
            onPressed: (){
              positionConverterAppend(firstDegreeController, secondDegreeController, secondMinitueController, thirdDegreeController, thirdMinuteontroller, thirdSecondController);
            }, 
            child: const Text("Convert",
            style: TextStyle(
              color: Colors.black,
            ),),),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15)
                )
              )
            ),
            onPressed: (){
              
            }, 
            child: const Text("Save",
            style: TextStyle(
              color: Colors.black,
            ),),)
            ],
          )
        ],
      ),
    );
  }
}