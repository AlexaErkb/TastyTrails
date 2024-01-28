import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mysql1/mysql1.dart';
import 'package:main_project/Recipe.dart';
import 'package:main_project/mySql.dart';

import 'RecipesData.dart';
import 'recipes_one.dart';
class RecipesFindPage extends StatefulWidget {
  final String desc1;
  final String desc2;
  final String desc3;
  final String desc4;

  const RecipesFindPage({
    Key? key,
    required this.desc1,
    required this.desc2,
    required this.desc3,
    required this.desc4
  }) : super(key: key);


  @override
  _RecipesFindPageState createState() => _RecipesFindPageState(desc1: this.desc1, desc2: this.desc2, desc3: this.desc3, desc4: this.desc4);

}

class _RecipesFindPageState extends State<RecipesFindPage> {

  String desc1;
  String desc2;
  String desc3;
  String desc4;

  _RecipesFindPageState({required this.desc1, required this.desc2, required this.desc3, required this.desc4});

  late ScrollController _scrollController;
  void scrollToBottom() {
    final bottomOffset = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(
      bottomOffset,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  Future<List<Recipe>> getSQLData() async {
    final mySql db = mySql();
    List<Recipe> recipeList=[];
    await db.getConnection().then((conn) async {
      await conn.query("SELECT RecipeId, Name, TotalTime, Images, RecipeIngredientParts, Calories, FatContent, ProteinContent, CarbohydrateContent, RecipeInstructions FROM recipes WHERE ${this.desc1} AND IngredientsQuantity ${this.desc2} AND Causine = '${this.desc3}' AND TotalTime ${this.desc4}").then((results) {
        for (var res in results) {
          final recipeModel = Recipe(RecipeId: res['RecipeId'], Name: res['Name'].toString(), TotalTime: res['TotalTime'], Images: res['Images'].toString(), RecipeIngredientParts: res['RecipeIngredientParts'].toString(), Calories: res['Calories'], FatContent: res['FatContent'], CarbohydrateContent: res['CarbohydrateContent'], ProteinContent: res['ProteinContent'], RecipeInstructions: res['RecipeInstructions'].toString());
          recipeList.add(recipeModel);
        }
      }).onError((error, stackTrace) {
        print(error);
        return null;
      });
      final results = await conn.query("SELECT RecipeId, Name, TotalTime, Images, RecipeIngredientParts, Calories, FatContent, ProteinContent, CarbohydrateContent, RecipeInstructions FROM recipes WHERE ${this.desc1} AND IngredientsQuantity ${this.desc2} AND Causine = '${this.desc3}' AND TotalTime ${this.desc4}");
      for (var res in results) {
        final recipeModel = Recipe(RecipeId: res['RecipeId'], Name: res['Name'].toString(), TotalTime: res['TotalTime'], Images: res['Images'].toString(), RecipeIngredientParts: res['RecipeIngredientParts'].toString(), Calories: res['Calories'], FatContent: res['FatContent'], CarbohydrateContent: res['CarbohydrateContent'], ProteinContent: res['ProteinContent'], RecipeInstructions: res['RecipeInstructions'].toString());
        recipeList.add(recipeModel);
      }
      conn.close();
    });
    return recipeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: ListView(
        children: <Widget>[
          titleGroup(),
          textGroup(),
          cardGroup(),
          buttonGroup(context),
        ],
      ),
    );
  }

  Widget titleGroup() {
    return Container(
      child:
      Container(
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
              "WHAT WE FOUND",
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  fontSize: 40,

                  fontFamily: "Montserrat-Black",
                  color: Color(0xffFF6933)),
            ),
          ),),
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
                  "Here's what we found, considering your needs and wishes",
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

  FutureBuilder<List<Recipe>> cardGroup() {
    return FutureBuilder<List<Recipe>> (
        future: getSQLData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Material(child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10);
                  },
                  scrollDirection: Axis.vertical,
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = snapshot.data as List<Recipe>;
                    return Material(child: ListTile(
                      shape: RoundedRectangleBorder(
                        //side: BorderSide(width: 2, color: Color(0xFFFF9B77)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RecipeDetailsPage(
                                name: "${data[index].Name.toString()}",
                                totalTime: '${data[index].TotalTime}',
                                image: '${data[index].Images.toString()}',
                                ingredients: '${data[index].RecipeIngredientParts.toString()}',
                                instruction: '${data[index].RecipeInstructions.toString()}',
                                calories: '${data[index].Calories}',
                                fat: '${data[index].FatContent}',
                                carbo: '${data[index].CarbohydrateContent}',
                                protein: '${data[index].ProteinContent}')));},
                      tileColor: Color(0xffFFD3B8),
                      hoverColor: Color(0xFFFF9B77),
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network('${data[index].Images}', height: 60, width: 70, fit: BoxFit.fill)),
                      title: Text("${data[index].Name.toString()}"),
                    ));
                  }
              ))
          );
          // return Expanded(child: ListView.builder(itemCount: snapshot.data!.length,
          //   itemBuilder: (context, index) {
          //     final data = snapshot.data as List<Recipe>;
          //     return Container(
          //         margin: EdgeInsets.only(top:30, left: 28, right: 27),
          //         child: InkWell(
          //           onTap: () {
          //             Navigator.push(context, RecipeDetailsPage.getRoute());
          //           },
          //           child: Card(
          //             child:  Container(
          //               width: 169,
          //               height: 169,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(25),
          //                 color: Color(0xffFF9B77),
          //               ),
          //               child: Column(
          //                 children: [
          //                   Container(
          //                       child: ClipRRect(
          //                         borderRadius: BorderRadius.circular(25),
          //                         child: Image.asset(
          //                           "assets/img/1s.jpg",
          //                           fit: BoxFit.cover,
          //
          //                         ),
          //                       )
          //                   ),
          //                   Container(
          //                     padding: EdgeInsets.only(
          //                       top: 8,
          //                     ),
          //                     child: Text("BORSCH",  style: TextStyle(
          //                         fontSize: 14,
          //                         fontFamily: "Montserrat-Bold",
          //                         color: Color(0xff000000))),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //           // );
          //         )
          //       //}),
          //     );
          // }));
        }

      //   margin: EdgeInsets.only(top:30, left: 28, right: 27),
      // // child: GridView.builder(
      // //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      // //       crossAxisCount: 2,
      // //       childAspectRatio: 0.70,
      // //     ),
      // //     itemCount: 1, //RecipesList.length
      // //     itemBuilder: (BuildContext context, int index) {
      //       child: InkWell(
      //         onTap: () {
      //           Navigator.push(context, RecipeDetailsPage.getRoute());
      //         },
      //         child: Card(
      //
      //
      //           child:  Container(
      //             width: 169,
      //             height: 169,
      //
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(25),
      //               color: Color(0xffFF9B77),
      //             ),
      //             child: Column(
      //               children: [
      //                 Container(
      //                     child: ClipRRect(
      //                       borderRadius: BorderRadius.circular(25),
      //                       child: Image.asset(
      //                         "assets/img/1s.jpg",
      //                         fit: BoxFit.cover,
      //
      //                       ),
      //                     )
      //                 ),
      //                 Container(
      //                   padding: EdgeInsets.only(
      //                     top: 8,
      //                   ),
      //                   child: Text("BORSCH",  style: TextStyle(
      //                       fontSize: 14,
      //                       fontFamily: "Montserrat-Bold",
      //                       color: Color(0xff000000))),
      //                 )
      //               ],
      //             ),
      //
      //
      //           ),
      //
      //
      //
      //         ),
      //      // );
      //       )
      //     //}),
      //     );
    );}

  Widget buttonGroup(BuildContext context) {
    return Container(
      //bottom: 20,
      //\\alignment: Alignment.bottomCenter,
      //margin: EdgeInsets.only(top:100),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: 324,
            height: 73,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(25),
            ),
            child: ElevatedButton(
              onPressed: () {
                // print("on Pressed");
                Navigator.pop(context);
              },
              child: Container(
                child: Text("CHANGE FILTERS",
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
}
