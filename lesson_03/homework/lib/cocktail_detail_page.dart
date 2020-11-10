import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homework/models/models.dart';

const String SF_PRO_FONT = "SF Pro";

class CocktailDetailPage extends StatelessWidget {
  static int rating = 3;

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
            Header(),
            InfoCocktail(cocktail),
            IngredientCocktail(cocktail),
            InstructionCocktail(cocktail),
            Footer(rating)
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 343.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/mohito.jpg", fit: BoxFit.fill),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: 58.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: SvgPicture.asset("assets/images/back.svg",
                      width: 16.0, height: 15.0, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 19.0),
                  child: SvgPicture.asset("assets/images/open_cocktail.svg",
                      width: 18.0, height: 18.0, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InfoCocktail extends StatelessWidget {
  final Cocktail cocktail;

  InfoCocktail(this.cocktail);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 322.0,
      decoration: BoxDecoration(color: HexColor("#1A1927")),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 33.0),
                child: Text(
                  cocktail.name,
                  style: TextStyle(
                      fontFamily: SF_PRO_FONT,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 34.0, top: 38.0),
                child: SvgPicture.asset("assets/images/like_icon.svg",
                    width: 20.0, height: 18.0, color: Colors.white),
              )
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 10.0),
              child: Text(
                "Id: ${cocktail.id}",
                style: TextStyle(
                    fontFamily: SF_PRO_FONT,
                    fontSize: 13.0,
                    color: HexColor("#848396")),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 20.0,
          ),
          Tag("Категория коктейля", cocktail.category.value),
          Tag("Тип коктейля", cocktail.cocktailType.value),
          Tag("Тип стекла", cocktail.glassType.value),
        ],
      ),
    );
  }
}

class IngredientCocktail extends StatelessWidget {
  final Cocktail cocktail;

  IngredientCocktail(this.cocktail);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 273.0,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              "Ингредиенты:",
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: SF_PRO_FONT,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#B1AFC6")),
            ),
          ),
          SizedBox(height: 24.0),
          Ingredients(cocktail.ingredients),
        ],
      ),
    );
  }
}

class InstructionCocktail extends StatelessWidget {
  final Cocktail cocktail;

  InstructionCocktail(this.cocktail);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 273.0,
      width: double.infinity,
      decoration: BoxDecoration(color: HexColor("#201F2C")),
      child: Instruction(cocktail.instruction),
    );
  }
}

class Footer extends StatelessWidget {
  final int rating;

  Footer(this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 113.0,
      width: double.infinity,
      decoration: BoxDecoration(color: HexColor("#1A1927")),
      child: Rating(rating),
    );
  }
}

///Rating of Cocktail
class Rating extends StatelessWidget {
  final icons;

  Rating(int rating)
      : icons = List<Widget>.generate(
            5,
            (index) => Container(
                decoration: BoxDecoration(
                    color: HexColor("#2A293A"), shape: BoxShape.circle),
                padding: const EdgeInsets.all(8.0),
                child: (rating > index)
                    ? Icon(
                        Icons.star,
                        size: 40.0,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.star,
                        size: 40.0,
                        color: HexColor("#1A1927"),
                      )));

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 16.0,
      children: icons,
    );
  }
}

///Description of cocktail
class Instruction extends StatelessWidget {
  final List<String> list;

  Instruction(String text) : list = text.replaceAll("- ", "").split("\n");

  List<Widget> _buildRowList() {
    List<Widget> rows = [];
    rows.add(Padding(
        padding: const EdgeInsets.only(left: 32.0, top: 24.0, bottom: 24.0),
        child: Text(
          "Инструкция для приготовления",
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: SF_PRO_FONT,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        )));
    for (var line in list) {
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 8.0, top: 6.0),
              child: Container(
                height: 4.0,
                width: 4.0,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 26.0, bottom: 16.0),
                child: Text(
                  line,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: SF_PRO_FONT,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildRowList(),
    );
  }
}

///Ingredient of cocktail
class Ingredients extends StatelessWidget {
  final List<IngredientDefinition> ingredients;

  Ingredients(this.ingredients);

  @override
  Widget build(BuildContext context) {
    return _createTable();
  }

  Widget _createTable() {
    List<TableRow> rows = [];
    ingredients.forEach((element) {
      rows.add(TableRow(children: [
        TableCell(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 32.0),
          child: Text(
            element.ingredientName,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: SF_PRO_FONT,
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          ),
        )),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.only(right: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  element.measure,
                  style: TextStyle(
                      fontFamily: SF_PRO_FONT,
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ]));
    });

    return Table(
        border: TableBorder.all(style: BorderStyle.none), children: rows);
  }
}

///Cocktail's category, type and type of glass
class Tag extends StatelessWidget {
  final String category, name;

  Tag(this.category, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                  fontFamily: SF_PRO_FONT,
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 8.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                padding: EdgeInsets.only(
                    top: 6.0, bottom: 6.0, left: 16.0, right: 16.0),
                decoration: BoxDecoration(color: HexColor("#15151C")),
                child: Text(name,
                    style: TextStyle(
                        fontFamily: SF_PRO_FONT,
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
