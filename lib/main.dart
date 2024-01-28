import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:main_project/search.dart';
import 'bloc/api_events.dart';
import 'bloc/api_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => NavBloc(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Tasty Trails',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFFFFFF)),
    //       useMaterial3: true,
    //     ),
    //     home: MyHomePage(),
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasty Trails',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFFFFFF)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: ListView(
          children: <Widget>[
            firstpageDetails(context),
          ],
        ));
  }
}

Widget firstpageDetails(BuildContext context) {
  return Container(
      color: Color(0xffFFFFFF),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            titleGroup(),
            textGroup(),
            imageGroup(),
            textwoGroup(),
            buttonGroup(context),
          ],
        ),
      ));
}

Widget titleGroup() {
  return Container(
    margin: EdgeInsets.only(top: 55),
    child: Stack(
      //margin: EdgeInsets.only(top: 40),
      children: [
        Container(
            height: 76,
            decoration: BoxDecoration(
              color: Color(0xffFFD3B8),
            )),
        Container(
          margin: EdgeInsets.only(top: 14),
          alignment: Alignment.center,
          child: Text(
            "Welcome",
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
    padding: EdgeInsets.only(top: 33, left: 26),
    child: Wrap(
      //margin: EdgeInsets.only(top: 40),
      children: [
        Container(
          child: Text(
            "We have:",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Montserrat-Black",
                color: Color(0xffFF9B77)),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            width: 351,
            child: Wrap(
              children: [
                Container(
                  child: Text(
                    "• Healthly food",
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Montserrat-Regular",
                        color: Color(0xff000000)),
                  ),
                ),
                Container(
                  child: Text(
                    "• Counted calories",
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Montserrat-Regular",
                        color: Color(0xff000000)),
                  ),
                ),
                Container(
                  child: Text(
                    "• Reasons for cooking",
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Montserrat-Regular",
                        color: Color(0xff000000)),
                  ),
                ),
                Container(
                  child: Text(
                    "• Cooking time",
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Montserrat-Regular",
                        color: Color(0xff000000)),
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}

Widget imageGroup() {
  return Container(
    padding: EdgeInsets.only(top: 50, left: 26, right: 26),
    child: Wrap(
      //margin: EdgeInsets.only(top: 40),
      children: [
        Container(
          child: Text(
            "Delicious recipes",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Montserrat-Black",
                color: Color(0xffFF9B77)),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 20),
            child: Container(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 26.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          "assets/img/1s.jpg",
                          fit: BoxFit.cover,
                          width: 233,
                          height: 195,
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 26.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          "assets/img/2s.jpg",
                          fit: BoxFit.cover,
                          width: 233,
                          height: 195,
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 26.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          "assets/img/3s.jpg",
                          fit: BoxFit.cover,
                          width: 233,
                          height: 195,
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 26.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          "assets/img/4s.jpg",
                          fit: BoxFit.cover,
                          width: 233,
                          height: 195,
                        ),
                      )),
                  Container(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "assets/img/5s.jpg",
                      fit: BoxFit.cover,
                      width: 233,
                      height: 195,
                    ),
                  )),
                ],
              ),
            ))),
      ],
    ),
  );
}

Widget textwoGroup() {
  return Container(
      margin: EdgeInsets.only(top: 30),
      child: Container(
        margin: EdgeInsets.only(),
        alignment: Alignment.center,
        child: Text(
          "Wanna it?",
          style: TextStyle(
              fontSize: 35,
              fontFamily: "Montserrat-Black",
              color: Color(0xffFF6933)),
        ),
      ));
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
              //context.read<NavBloc>().add(GoToPageEvent());
             // Navigator.push(
               // context,
              // MaterialPageRoute(builder: (context) => SearchPage()),
              //);
            },
            child: Container(
              child: Text("LET’S START",
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
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SearchPage()));
}
