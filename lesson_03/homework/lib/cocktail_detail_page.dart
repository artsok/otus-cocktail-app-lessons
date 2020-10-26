import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homework/models/models.dart';

class CocktailDetailPage extends StatelessWidget {
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
              height: 340,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("assets/images/Rectangle 7.png",
                      fit: BoxFit.fill),
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
              decoration: BoxDecoration(
                  color: HexColor("#1A1927")),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32, top: 33),
                        child: Text(
                          "Арбузный мохито",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
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
