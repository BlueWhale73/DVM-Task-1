import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';


const bottomContainerheight = 80.0;
const bottomContainercolor = Color(0xFFEB1555);
const inactiveCardcolor = Color(0xFF111328);
const activeCardcolor = Color(0xFF1D1E33);


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    Color maleCardColor = inactiveCardcolor;
    Color femaleCardColor = inactiveCardcolor;

    void updateColour(int gender){
      //female card was pressed
      if(gender == 1){
        if(femaleCardColor == inactiveCardcolor){
          femaleCardColor = activeCardcolor;
          maleCardColor = inactiveCardcolor;
        }
        else{
          femaleCardColor = inactiveCardcolor;
        }
      }
      if(gender == 2){
        if(maleCardColor == inactiveCardcolor){
          maleCardColor = activeCardcolor;
          femaleCardColor = inactiveCardcolor;
        }
        else{
          maleCardColor = inactiveCardcolor;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('CGPA Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColour(1);
                    });
                  },
                  child: ReuseableCard(
                    color: femaleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColour(2);
                    });
                  },
                  child: ReuseableCard(
                    color: maleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(child: Container(
            margin: EdgeInsets.all(15.0),
            height: 200.0,
            decoration: BoxDecoration(
              color: activeCardcolor,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                height: 200.0,
                width: 170.0,
                decoration: BoxDecoration(
                  color: activeCardcolor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),),
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                height: 200.0,
                width: 170.0,
                decoration: BoxDecoration(
                  color: activeCardcolor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),),
            ],
          )),
          Container(
            color: bottomContainercolor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerheight,
          ),
        ],
      )

      // floatingActionButton: Theme(
      //   data: ThemeData(colorScheme: ColorScheme.fromSwatch()
      //       .copyWith(secondary: Colors.red)),
      //   child: FloatingActionButton(
      //     onPressed: () {  },
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}





//Google ReusableCard. imp
//FlatButton, TextButton and ElevatedButton for clicking a button