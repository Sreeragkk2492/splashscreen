class Itemdetails {
  String name;
  String price;
  String color;
  int count;
  String image;
  Itemdetails(this.name, this.price, this.count, this.color, this.image);
}

List<Itemdetails> product = [
  Itemdetails('orange', '\$100', 0, 'red', 'assets/images/blue.jpg'),
  Itemdetails('apple', '\$200', 0, 'blue', 'assets/images/blue.jpg'),
  Itemdetails('banana', '\$300', 0, 'black', 'assets/images/blue.jpg'),
  Itemdetails('kiwi', '\$100', 0, 'yellow', 'assets/images/blue.jpg'),
  Itemdetails('grapes', '\$200', 0, 'pink', 'assets/images/blue.jpg'),
  Itemdetails('cherry', '\$500', 0, 'purple', 'assets/images/blue.jpg'), 
];
