import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/app_theme.dart';

class CategoryModel {
  CategoryModel(this.icon, this.name);
  var icon;
  var name;
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme[AppTheme.values[0]],
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double mainXOffset = 0.0;
  double mainYOffset = 0.0;
  double mainScaleFactor = 1.0;

  int drawerIndex = 0;
  bool isDrawerOn = false;

  bool isLoggedIn = false;

  var categoryIndex = [0, 1, 2, 3];
  List<CategoryModel> categoryList = new List();

  @override
  void initState() {
    super.initState();
    categoryList.add(CategoryModel(Icons.looks_one, "Item 1"));
    categoryList.add(CategoryModel(Icons.looks_two, "Item 2"));
    categoryList.add(CategoryModel(Icons.looks_3, "Item 3"));
    categoryList.add(CategoryModel(Icons.looks_4, "Item 4"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.shade700,
      body: Stack(
        children: [
          Container(
            color: color.shade700,
            padding: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isLoggedIn
                    ? Container(
                        padding: EdgeInsets.all(4.0),
                        height: 80.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: color.shade50,
                              child: CircleAvatar(
                                radius: 24.0,
                                backgroundImage:
                                    //AssetImage('assets/images/ic_user.png'),
                                    NetworkImage(
                                        'https://raw.githubusercontent.com/phjethva/assets/master/images/512/ic_user.png'),
                                backgroundColor: color.shade300,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pratik Jethva',
                                  style: TextStyle(
                                      color: color.shade50,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '@pratikjethva',
                                  style: TextStyle(
                                      color: color.shade50,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 80.0,
                      ),
                Column(
                  children: [
                    for (var index in categoryIndex)
                      InkWell(
                        onTap: () {
                          setState(() {
                            mainXOffset = 0.0;
                            mainYOffset = 0.0;
                            mainScaleFactor = 1.0;
                            isDrawerOn = false;
                            drawerIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                categoryList[index].icon,
                                color: color.shade50,
                                size: 35.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                categoryList[index].name,
                                style: TextStyle(
                                    color: color.shade50,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                Container(
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isLoggedIn
                            ? Icon(
                                Icons.lock,
                                color: color.shade50,
                                size: 35.0,
                              )
                            : Icon(
                                Icons.lock_open,
                                color: color.shade50,
                                size: 35.0,
                              ),
                        SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (isLoggedIn) {
                                isLoggedIn = false;
                              } else {
                                isLoggedIn = true;
                              }
                            });
                          },
                          child: Text(
                            isLoggedIn ? 'Logout' : 'Login',
                            style: TextStyle(
                                color: color.shade50,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          AnimatedContainer(
            transform: Matrix4.translationValues(mainXOffset, mainYOffset, 0)
              ..scale(mainScaleFactor),
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
                color: color.shade100,
                borderRadius: BorderRadius.circular(isDrawerOn ? 40.0 : 0.0)),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: isDrawerOn
                          ? EdgeInsets.all(2.0)
                          : EdgeInsets.all(0.0),
                      decoration: BoxDecoration(
                          color: color.shade500,
                          borderRadius:
                              BorderRadius.circular(isDrawerOn ? 40.0 : 0.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                isDrawerOn
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.arrow_back_ios,
                                          color: color.shade50,
                                          size: 35.0,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            mainXOffset = 0.0;
                                            mainYOffset = 0.0;
                                            mainScaleFactor = 1.0;
                                            isDrawerOn = false;
                                          });
                                        })
                                    : IconButton(
                                        icon: Icon(
                                          Icons.menu,
                                          color: color.shade50,
                                          size: 35.0,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            mainXOffset = 280.0;
                                            mainYOffset = 150.0;
                                            mainScaleFactor = 0.7;
                                            isDrawerOn = true;
                                          });
                                        }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
