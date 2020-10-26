import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'cocktail_detail_page.dart';
import 'contacts_demo.dart';
import 'models/src/repository/sync_cocktail_repository.dart';

void main() {
  final cocktail = SyncCocktailRepository().getHomeworkCocktail();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    home: Material(child: CocktailDetailPage(cocktail)),
  ));
}
