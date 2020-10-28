import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homework/models/models.dart';

class CocktailDetailPage extends StatelessWidget {
  static const String COCKTAIL_NAME = "Арбузный мохито";

  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 343,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("assets/images/mohito.jpg", fit: BoxFit.fill),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: 58,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: SvgPicture.asset("assets/images/back.svg",
                              width: 16, height: 15.56, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 19),
                          child: SvgPicture.asset(
                              "assets/images/open_cocktail.svg",
                              width: 18,
                              height: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 322,
              decoration: BoxDecoration(color: HexColor("#1A1927")),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32, top: 33),
                        child: Text(
                          COCKTAIL_NAME,
                          style: TextStyle(
                              fontFamily: "SF Pro",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 34, top: 38),
                        child: SvgPicture.asset("assets/images/like_icon.svg",
                            width: 20, height: 18.48, color: Colors.white),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, top: 10),
                      child: Text(
                        "Id:12864",
                        style:
                            TextStyle(fontSize: 13, color: HexColor("#848396")),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Tag("Категория коктейля", "Cocktail"),
                  Tag("Тип коктейля", "Алкогольный"),
                  Tag("Тип стекла", "Хайбол"),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=20%3A590
    ///для того что бы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    ///
  }
}

class Tag extends StatelessWidget {
  final String category, name;

  Tag(this.category, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding:
                    EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                decoration: BoxDecoration(color: HexColor("#15151C")),
                child: Text(name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
