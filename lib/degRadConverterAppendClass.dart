import 'package:flutter/material.dart';

TextEditingController controller= TextEditingController();

class DegRadConverterAppendClass extends ChangeNotifier{

  String readController(){
    return controller.text;
  }

  void degRadConverterAppend(
      BuildContext context,
      TextEditingController degController,
      TextEditingController radController
      ){

    try{
      if (degController.text!=""){

        var degValue= double.parse(degController.text);
        var radValue= degValue*(3.14159/180);

        radController.text= radValue.toStringAsFixed(2);
      }

      else if (radController.text!=""){

        var radValue= double.parse(radController.text);
        var degValue= radValue*(180/3.14159);

        degController.text= degValue.toStringAsFixed(2);
        controller.text= degController.text;
        notifyListeners();
      }
    }

    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blueGrey[900],
          content: const Text("Lütfen sayı dışında bir sembol girmeyiniz!"),
        ),
      );
    }
  }
}