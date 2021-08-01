import 'package:flutter/material.dart';
import 'package:news_app/data_model/article_model.dart';
import 'package:news_app/Ui/articleWebView.dart';

List<ArticleModel> bookMarkedArticles = [];

class BookMark extends StatefulWidget {
  @override
  _BookMarkState createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        itemCount: bookMarkedArticles.length,
        itemBuilder: (BuildContext context, int index) {
          if (bookMarkedArticles.isEmpty) {
            return Center(
              child: Container(
                child: Text("No BookMarks Available"),
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticleWebView(
                            articleUrl: bookMarkedArticles[index].articleurl)));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                height: 350,
                child: Column(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    bookMarkedArticles[index].imageurl),
                                fit: BoxFit.fill))),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(bookMarkedArticles[index].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                  Container(
                    height: 30,
                    child: Text(
                      bookMarkedArticles[index].description,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton(
                      onPressed: () => remove(index),
                      child: Text(
                        "Remove Form BookMark",
                        style: TextStyle(color: Colors.black),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.blue)),
                ]),
              ),
            );
          }
        });
  }

  void remove(index) {
    setState(() {
      bookMarkedArticles.removeAt(index);
    });
  }
}
