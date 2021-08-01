import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/data_model/article_data.dart';
import 'package:news_app/Ui/articlesAtCategories.dart';
import 'package:news_app/Ui/ui.dart';

class Category extends StatefulWidget {
  final FirebaseUser user;
  Category({this.user});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: <Widget>[
        Categorytile(business, "Business", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlesCategories(
                      fuser: widget.user,
                      categoryName: "Business",
                      articleData: ArticleData(
                          url:
                              "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=5ecab461359242c7a2193f9ab6194ec0"))));
        }),
        Categorytile(entertainment, "Entertainment", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlesCategories(
                      fuser: widget.user,
                      categoryName: "Entertainment",
                      articleData: ArticleData(
                          url:
                              "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=5ecab461359242c7a2193f9ab6194ec0"))));
        }),
        Categorytile(health, "Health", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlesCategories(
                      fuser: widget.user,
                      categoryName: "Health",
                      articleData: ArticleData(
                          url:
                              "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=5ecab461359242c7a2193f9ab6194ec0"))));
        }),
        Categorytile(science, "Science", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlesCategories(
                      fuser: widget.user,
                      categoryName: "Science",
                      articleData: ArticleData(
                          url:
                              "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=5ecab461359242c7a2193f9ab6194ec0"))));
        }),
        Categorytile(sports, "Sports", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlesCategories(
                      fuser: widget.user,
                      categoryName: "Sports",
                      articleData: ArticleData(
                          url:
                              "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=5ecab461359242c7a2193f9ab6194ec0"))));
        }),
        Categorytile(technology, "Technology", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlesCategories(
                      fuser: widget.user,
                      categoryName: "Technology",
                      articleData: ArticleData(
                          url:
                              "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=5ecab461359242c7a2193f9ab6194ec0"))));
        }),
      ],
    );
  }
}

class Categorytile extends StatefulWidget {
  final image, text, onPress;
  Categorytile(this.image, this.text, this.onPress);

  @override
  _CategorytileState createState() => _CategorytileState();
}

class _CategorytileState extends State<Categorytile> {
  Image preloadImage;
  @override
  void initState() {
    super.initState();
    preloadImage = Image.asset(widget.image);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(preloadImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.fill)),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black26),
            child: Text(widget.text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))),
      ),
    );
  }
}
