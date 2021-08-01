import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Ui/appDrawer.dart';
import 'package:news_app/Ui/articleList.dart';
import 'package:news_app/data_model/article_data.dart';
import 'package:news_app/Ui/bubbleBottom.dart';
import 'package:news_app/Screens/category.dart';
import 'package:news_app/Ui/ui.dart';
import 'package:news_app/screens/search.dart';
import 'package:news_app/screens/bookmark.dart';

bool drawerStatus;

class Home extends StatefulWidget {
  final FirebaseUser firebaseUser;
  Home({@required this.firebaseUser});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  void find(bool status) {
    drawerStatus = status;
  }

  void changePage(int currentIndex) {
    this.setState(() {
      this.currentIndex = currentIndex;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => onPressedBack(context),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          drawer: Kdrawer(
              find: find,
              displayUserName: widget.firebaseUser.displayName,
              displayUserPhoto: widget.firebaseUser.photoUrl),
          appBar: kAppBar,
          body: <Widget>[
            ArticleList(
              users: widget.firebaseUser,
              articleData: ArticleData(
                  url:
                      "https://newsapi.org/v2/top-headlines?country=in&apiKey=5ecab461359242c7a2193f9ab6194ec0"),
            ),
            Search(
              user: widget.firebaseUser,
            ),
            Category(
              user: widget.firebaseUser,
            ),
            BookMark(),
          ][currentIndex],
          bottomNavigationBar: BottomBar(changePage: this.changePage),
        ),
      ),
    );
  }

  Future<bool> onPressedBack(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("You Can Use Log Out Option in App Drawer"),
      action: SnackBarAction(label: "OK", onPressed: () => {}),
    );
    if (drawerStatus) {
      Navigator.of(context).pop();
      drawerStatus = false;
      return null;
    } else {
      return showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text("Are You Sure"),
                    content: Text("Do you want to Exit withOut Log Out"),
                    actions: [
                      TextButton(
                        onPressed: () => {
                          Navigator.of(context).pop(false),
                          ScaffoldMessenger.of(context).showSnackBar(snackBar)
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      TextButton(
                          onPressed: () => SystemNavigator.pop(),
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ))
                    ],
                  )) ??
          false;
    }
  }
}
