import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_virus/core/model/survivor.dart';
import 'package:t_virus/ui/shared/app_colors.dart';
import 'package:t_virus/ui/widgets/custom_outline_text_field.dart';

class StepSurvivorInformation extends StatefulWidget {
  Survivor survivor;

  TextEditingController survivorName = TextEditingController();
  TextEditingController survivorAge = TextEditingController();


  StepSurvivorInformation(this.survivor, this.survivorName, this.survivorAge);

  @override
  _StepSurvivorInformationState createState() =>
      _StepSurvivorInformationState();
}

class _StepSurvivorInformationState extends State<StepSurvivorInformation> {
  bool maleCheck = false;
  bool femaleCheck = false;


  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: circleRadius / 2.0),
                child: Card(
                  child: ColoredBox(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: <Widget>[
                          showMaterialTextFiel(widget.survivorName, "Name", heigth: 50),
                          showMaterialTextFiel(widget.survivorAge, "Age",
                              heigth: 50,
                              inputType: TextInputType.number,
                              maxLength: 3),
                          _divider(),
                          _genderCheckBox()
                        ],
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
              Container(
                width: circleRadius,
                height: circleRadius,
                decoration:
                    ShapeDecoration(shape: CircleBorder(), color: primaryColor),
                child: Padding(
                  padding: EdgeInsets.all(circleBorderWidth),
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'images/ic_zombie_circular.png',
                            ))),
                  ),
                ),
              )
            ],
          ),



        ],
      ),
    );

  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: accentColor,
                thickness: 1,
              ),
            ),
          ),
          Text(
            'Gender',
            style: TextStyle(color: accentColor),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: accentColor,
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _genderCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset(
              "images/ic_zombie_male.png",
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Male",
                style: TextStyle(color: textsColor, fontFamily: "ZOMBIE"),
              ),
            ),
            CircularCheckBox(
                value: maleCheck,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                onChanged: (bool touched) {
                  setState(() {
                    if (touched) {
                      maleCheck = touched;
                      widget.survivor.gender = "M";

                      femaleCheck = false;
                    } else {
                      maleCheck = touched;
                      widget.survivor.gender = "F";

                      femaleCheck = true;
                    }
                  });
                }),
          ],
        ),
        Column(
          children: [
            Image.asset(
              "images/ic_zombie_female.png",
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Female",
                style: TextStyle(color: textsColor, fontFamily: "ZOMBIE"),
              ),
            ),
            CircularCheckBox(
                value: femaleCheck,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                onChanged: (bool touched) {
                  setState(() {
                    if (touched) {
                      femaleCheck = touched;
                      widget.survivor.gender = "F";

                      maleCheck = false;
                    } else {
                      femaleCheck = touched;
                      widget.survivor.gender = "M";
                      maleCheck = true;
                    }
                  });
                }),
          ],
        ),
      ],
    );
  }
}
