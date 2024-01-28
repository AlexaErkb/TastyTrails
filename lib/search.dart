import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'recipes_find.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedContainer = 0;
  String _selectedDescription = 'DiabeticBool';
  int _selectedIngContainer = 0;
  String _selectedIngDescription = '< 5';

  int _selectedCausinContainer = 0;
  String _selectedCausinDescription = 'russian';

  int _selectedTimeContainer = 0;
  String _selectedTimeDescription = '< 30';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        backgroundColor: Color(0xffFFFFFF),
        body: ListView(
          children: <Widget>[
            secondpageDetails(context),
          ],
        ));
  }

  Widget secondpageDetails(BuildContext context) {
    return Container(
        color: Color(0xffFFFFFF),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              titleGroup(),
              textGroup(),
              filterGroup(context),
              buttonGroup(context),
            ],
          ),
        ));
  }

  Widget titleGroup() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return Container(
          // используйте процент от максимальной ширины контейнера, чтобы обеспечить пространство для текста
          child: Container(
            //margin: EdgeInsets.only(top: 8),
            child: Container(
              // height: 76,
              // width: 450,
              constraints: BoxConstraints(
                minHeight: 0,
                maxHeight: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Color(0xffFFD3B8),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 14),
                alignment: Alignment.center,
                child: Text(
                  "THINGS TO FILTER",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Montserrat-Black",
                      color: Color(0xffFF6933)),
                ),
              ),
            ),
          ),
        );
      },
    );
    return Container(
      //margin: EdgeInsets.only(top: 8),
      child: Stack(
        //margin: EdgeInsets.only(top: 40),
        children: [
          Container(
              height: 76,
              width: 450,
              decoration: BoxDecoration(
                color: Color(0xffFFD3B8),
              )),
          Container(
            margin: EdgeInsets.only(top: 14),
            alignment: Alignment.center,
            child: Text(
              "THINGS TO FILTER",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Montserrat-Black",
                  color: Color(0xffFF6933)),
            ),
          ),
        ],
      ),
    );
  }

  Widget textGroup() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20),
      child: Stack(
        //margin: EdgeInsets.only(top: 40),
        children: [
          Container(
            alignment: Alignment.center,
            height: 89,
            width: 277,
            decoration: BoxDecoration(
              color: Color(0xffFFD3B8),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 12, top: 8),
              child: Center(
                child: Text(
                  "Tell a little about yourself and what you want to cook 😎",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat-SemiBold",
                      color: Color(0xff000000)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterGroup(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        //1text
        child: Wrap(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 28,
              ),
              child: Text(
                "ABOUT YOU 🤔",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Montserrat-Black",
                    color: Color(0xffFF9B77)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 28, top: 10, right: 27),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedContainer = 0;
                          _selectedDescription = 'DiabeticBool';
                        });
                      },
                      child: Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                            color: _selectedContainer == 0
                                ? Color(0xffFF9B77)
                                : Color(0xffFFCDBB),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Center(
                            child: Text(
                              'Diabetic',
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  color: Color(0xff000000),
                                  fontSize: 14),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedContainer = 1;
                          _selectedDescription = 'LactoseFreeBool';
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: _selectedContainer == 1
                              ? Color(0xffFF9B77)
                              : Color(0xffFFCDBB),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            'Lactose free',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                color: Color(0xff000000),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedContainer = 2;
                          _selectedDescription = 'VeganBool';
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: _selectedContainer == 2
                              ? Color(0xffFF9B77)
                              : Color(0xffFFCDBB),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            'Vegan',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                color: Color(0xff000000),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 28, top: 5),
              child: Text(
                "INGREDIENTS 🥒",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Montserrat-Black",
                    color: Color(0xffFFAC8E)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 28, top: 10, right: 27),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIngContainer = 0;
                          _selectedIngDescription = '< 5';
                        });
                      },
                      child: Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                            color: _selectedIngContainer == 0
                                ? Color(0xffFF9B77)
                                : Color(0xffFFCDBB),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Center(
                            child: Text(
                              '< 5',
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  color: Color(0xff000000),
                                  fontSize: 14),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIngContainer = 1;
                          _selectedIngDescription = '< 15';
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: _selectedIngContainer == 1
                              ? Color(0xffFF9B77)
                              : Color(0xffFFCDBB),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            '< 15',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                color: Color(0xff000000),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIngContainer = 2;
                          _selectedIngDescription = '>= 15';
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: _selectedIngContainer == 2
                              ? Color(0xffFF9B77)
                              : Color(0xffFFCDBB),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            '>= 15',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                color: Color(0xff000000),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 28, top: 5),
              child: Text(
                "CAUSINE 👨🏻‍🍳",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Montserrat-Black",
                    color: Color(0xffFFCDBB)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 28, top: 10, right: 27),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCausinContainer = 0;
                          _selectedCausinDescription = 'russian';
                        });
                      },
                      child: Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                            color: _selectedCausinContainer == 0
                                ? Color(0xffFF9B77)
                                : Color(0xffFFCDBB),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Center(
                            child: Text(
                              'Russian',
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  color: Color(0xff000000),
                                  fontSize: 14),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCausinContainer = 1;
                          _selectedCausinDescription = 'asian';
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: _selectedCausinContainer == 1
                              ? Color(0xffFF9B77)
                              : Color(0xffFFCDBB),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            'Asian',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                color: Color(0xff000000),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCausinContainer = 2;
                          _selectedCausinDescription = 'other';
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: _selectedCausinContainer == 2
                              ? Color(0xffFF9B77)
                              : Color(0xffFFCDBB),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            'Other',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                color: Color(0xff000000),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 28, top: 5),
              child: Text(
                "Time ⏱️",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Montserrat-Black",
                    color: Color(0xffFFDED2)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 28, top: 10, right: 27),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTimeContainer = 0;
                          _selectedTimeDescription = '< 30';
                        });
                      },
                      child: Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                            color: _selectedTimeContainer == 0
                                ? Color(0xffFF9B77)
                                : Color(0xffFFCDBB),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Center(
                            child: Text(
                              '< 30',
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  color: Color(0xff000000),
                                  fontSize: 14),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTimeContainer = 1;
                          _selectedTimeDescription = '< 60';
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: _selectedTimeContainer == 1
                              ? Color(0xffFF9B77)
                              : Color(0xffFFCDBB),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            '< 60',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                color: Color(0xff000000),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTimeContainer = 2;
                          _selectedTimeDescription = '>= 60';
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: _selectedTimeContainer == 2
                              ? Color(0xffFF9B77)
                              : Color(0xffFFCDBB),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            '>= 60',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                color: Color(0xff000000),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonGroup(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Align(
        alignment: Alignment.center,
        child: Container(
            width: 259,
            height: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: ElevatedButton(
              onPressed: () {
                //print("on Pressed");
                _navigateToNextScreen(context);
              },
              child: Container(
                child: Text("LET’S GO",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Montserrat-Black",
                        color: Color(0xff000000))),
              ),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), backgroundColor: Color(0xffFF6933)),
            )),
      ),
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RecipesFindPage(
            desc1: _selectedDescription,
            desc2: _selectedIngDescription,
            desc3: _selectedCausinDescription,
            desc4: _selectedTimeDescription)));
  }
}


