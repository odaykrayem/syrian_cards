class CategoriesList {
  CategoriesList({
    this.imagePath = '',
  });

  String imagePath;

  static List<CategoriesList> categoriesList = [
    CategoriesList(imagePath: 'lib/assets/google_play.png'),
    CategoriesList(imagePath: 'lib/assets/apple.jpg'),
    CategoriesList(imagePath: 'lib/assets/amazon.png'),
    CategoriesList(imagePath: 'lib/assets/pubg.png'),
  ];
}
