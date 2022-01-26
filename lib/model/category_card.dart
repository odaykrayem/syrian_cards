class CategoryCardList {
  CategoryCardList({
    this.imagePath = '',
    this.ammount = 0,
  });

  int? ammount;
  String imagePath;

  static List<CategoryCardList> categoryCardList = [
    CategoryCardList(imagePath: 'lib/assets/google_play.png', ammount: 5),
    CategoryCardList(imagePath: 'lib/assets/google_play.png', ammount: 10),
    CategoryCardList(imagePath: 'lib/assets/google_play.png', ammount: 15),
    CategoryCardList(imagePath: 'lib/assets/google_play.png', ammount: 25),
    CategoryCardList(imagePath: 'lib/assets/google_play.png', ammount: 50),
  ];
}
