class OrderItemModel {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final String quantity;
  final String total;

  OrderItemModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.total,
  });
}
