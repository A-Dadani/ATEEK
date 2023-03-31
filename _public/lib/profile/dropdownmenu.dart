
import 'package:flutter/material.dart';
import '../constants.dart';



class DropDown extends StatefulWidget {
  const DropDown ({superkey});

  @override
  State<DropDown > createState() => RrightSideState();
}

class RrightSideState extends State<DropDown> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;

    return Expanded(
      flex: 7,
      child: Container(
        decoration: const BoxDecoration(
           gradient: LinearGradient(
              colors: <Color>[
            kBgColor, // yellow sun
          kLabelColor,
           // blue sky
    ],
            ),
          //  color: Color.fromARGB(250, 250, 250, 250),
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        child: Column(
          children: [
            appBar(),
            
          ],
        ),
      ),
    );
  }


  Container appBar(
     {dynamic backgroundColor= kLabelColor}
    
  ) {
    
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
     String dropdownValue = 'Option 1';
    return Container(
      
           
    // gradient: LinearGradient(
    //   colors: [kDarkBlackColor, kPrimaryColor, kDarkBlackColor])
  
          
      child: Column(
        children: [
          
       AppBar(
        title: const Text('Flutter DropdownMenu Demo'),
        actions: [
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
  
  
        ],
      ),
    );
  }
}
