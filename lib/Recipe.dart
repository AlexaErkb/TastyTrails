import 'package:flutter/foundation.dart' show immutable;

@immutable
class Recipe {
  final int RecipeId;
  final String Name;
  final int TotalTime;
  final String Images;
  final String RecipeIngredientParts;
  final double Calories;
  final double FatContent;
  final double CarbohydrateContent;
  final double ProteinContent;
  final String RecipeInstructions;

  const Recipe({
    required this.RecipeId,
    required this.Name,
    required this.TotalTime,
    required this.Images,
    required this.RecipeIngredientParts,
    required this.Calories,
    required this.FatContent,
    required this.CarbohydrateContent,
    required this.ProteinContent,
    required this.RecipeInstructions
  });
}
