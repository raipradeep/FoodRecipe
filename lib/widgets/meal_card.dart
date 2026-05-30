
class Meal {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strYoutube;
  final String? strCountry;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strYoutube,
    this.strCountry,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
      strCategory: json['strCategory'] ?? '',
      strArea: json['strArea'] ?? '',
      strInstructions: json['strInstructions'] ?? '',
      strYoutube: json['strYoutube'] ?? '',
      strCountry: json['strCountry'] ?? '',
    );
  }
}