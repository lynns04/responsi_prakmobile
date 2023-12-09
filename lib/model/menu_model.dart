class MenuItemModel {
  final String img;
  final String title;
  final String description;

  MenuItemModel({
    required this.img,
    required this.title,
    required this.description,
  });
}

List<MenuItemModel> menuItems = [
  MenuItemModel(
    img: 'assets/news.svg',
    title: 'Beef',
    description: 'Beef The Culinary',
  ),
  MenuItemModel(
    img: 'assets/blogs.svg',
    title: 'Chicken',
    description: 'Chicken Yummy',
  ),
  MenuItemModel(
    img: 'assets/reports.svg',
    title: 'Dessert',
    description: 'Dessert So Sweet',
  ),
];
