import 'package:flutter/material.dart';
import 'package:multi_converter/widget.dart';

List<String> speedList=[];
bool converterButtonControl= false;

class SpeedPageMain extends StatefulWidget{
  @override
  SpeedPage createState() => SpeedPage();
}

void positionConverterAppend(
    BuildContext context,
    TextEditingController kmController,
    TextEditingController knotController,
    TextEditingController msController,
    ){

  try{

    if(msController.text!=""){

      var msValue= double.parse(msController.text);
      var knotValue= msValue*1.94384;
      var kmhValue= msValue*3.6;

      knotController.text= knotValue.toStringAsFixed(2);
      kmController.text= kmhValue.toStringAsFixed(2);
    }

    else if(knotController.text!=""){

      var knotValue= double.parse(knotController.text);
      var msValue= knotValue*0.51444;
      var kmValue= knotValue*1.852;

      msController.text= msValue.toStringAsFixed(2);
      kmController.text= kmValue.toStringAsFixed(2);
    }

    else if(kmController.text!=""){

      var kmValue= double.parse(kmController.text);
      var knotValue= kmValue*0.53996;
      var msValue= kmValue*0.27778;

      msController.text= msValue.toStringAsFixed(2);
      knotController.text= knotValue.toStringAsFixed(2);

    }

  }
  catch (e){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blueGrey[900],
        content: Text("Lütfen sayı dışında bir sembol girmeyiniz!"),
      ),
    );
  }

}

class SpeedPage extends State<SpeedPageMain>{

  var kmController= TextEditingController();
  var knotController= TextEditingController();
  var msController= TextEditingController();

  void appendSpeedList(){
    
    int control= 0;
    String speedValue= "${msController.text},${knotController.text},${kmController.text}";
    
    if(speedList.isEmpty)
    {
      speedList.add(speedValue);
    }

    for(var item in speedList){
      if(item==speedValue)
      {
        control=1;
        break;
      }
    }

    if(control==0){
      speedList.add(speedValue);
    }
  }

  void clearTextEditingController(TextEditingController controller){
    if (controller== kmController){
      knotController.clear();
      msController.clear();
    }

    else if(controller==knotController){
      kmController.clear();
      msController.clear();
    }

    else {
      knotController.clear();
      kmController.clear();
    }
  }

  Future _displayBottomSheet(BuildContext context, var screenWidth, var screenHeight){
    return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.blueGrey[100],
      context: context, 
      builder: (context)=> ShowModalBottomSheetWidgetStack(
        contextt: context,
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        list: speedList,
        pageController: "speed",
      ),
      );
  }
  
  @override
  Widget build(BuildContext context) {

    var screenInformations= MediaQuery.of(context).size;
    var screenWidth= screenInformations.width;
    var screenHeight= screenInformations.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: TextWidget(data: "Speed Converter", color: Colors.white),
      ),
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                ),
                child: TextWidget(data: "m/s:", fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight/16,
                width: screenWidth/5,
                child: TextField(
                  onChanged: (_)=>clearTextEditingController(msController),
                  controller: msController,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                ),
                child: TextWidget(data: "knots:", fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight/16,
                width: screenWidth/5,
                child: TextField(
                  onChanged: (_)=>clearTextEditingController(knotController),
                  controller: knotController,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                ),
                child: TextWidget(data: "km/h:", fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight/16,
                width: screenWidth/5,
                child: TextField(
                  onChanged: (_)=>clearTextEditingController(kmController),
                  controller: kmController,
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
                    backgroundColor: Colors.blueGrey[900],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        )
                    )
                ),
                onPressed: (){
                  converterButtonControl=true;
                  positionConverterAppend(context, kmController, knotController, msController);
                },
                child: TextWidget(data: "Convert", color: Colors.white),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        )
                    )
                ),
                onPressed: (){
                  if(converterButtonControl)
                  {
                    appendSpeedList();
                    converterButtonControl=false;
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.blueGrey[900],
                      content: TextWidget(
                      data: "Lütfen öncelikle 'Converter' butonuna tıklayınız!",
                      color: Colors.white,),
                    ),
                  );
                  }
                },
                child: TextWidget(data: "Save", color: Colors.white),),
                IconButton(
                    onPressed: (){
                      _displayBottomSheet(context, screenWidth, screenHeight);
                    }, 
                    icon: Icon(
                      color: Colors.blueGrey[900],
                      Icons.history_edu_outlined,
                    size: screenWidth/9,))
            ],
          )
        ],
      ),
    );
  }
}