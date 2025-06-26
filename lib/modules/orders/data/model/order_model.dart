import 'package:fluttertask/core/constants/app_assets.dart';
import 'package:fluttertask/modules/orders/data/model/order_item_model.dart';

class OrderModel {
  final String status;
  final String date;
  final List<OrderItemModel> items;

  OrderModel({required this.status, required this.date, required this.items});

  static List<OrderModel> staticOrders = [
    OrderModel(
      status: 'Delivered',
      date: 'May 15',
      items: [
        OrderItemModel(
          imageUrl: AppAssets.serenityImage,
          title: 'Serenity Nightstand',
          description:
              'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices...',
          price: '\$7.50',
          quantity: '1x uds.',
          total: '\$7.50',
        ),
      ],
    ),
    OrderModel(
      status: 'Canceled',
      date: 'May 22',
      items: [
        OrderItemModel(
          imageUrl: AppAssets.lampImage,
          title: 'Blue Table Lamp',
          description:
              'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices...',
          price: '\$25',
          quantity: '2x uds.',
          total: '\$50',
        ),
      ],
    ),
    OrderModel(
      status: 'Delivered',
      date: 'June 04',
      items: [
        OrderItemModel(
          imageUrl: AppAssets.dresserImage,
          title: 'Bedroom Dresser',
          description:
              'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices...',
          price: '\$285',
          quantity: '1x uds.',
          total: '\$285',
        ),
      ],
    ),
    OrderModel(
      status: 'Delivered',
      date: 'June 12',
      items: [
        OrderItemModel(
          imageUrl: AppAssets.bedImage,
          title: 'Green Bed',
          description:
              'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices...',
          price: '\$285',
          quantity: '2x uds.',
          total: '\$285',
        ),
        OrderItemModel(
          imageUrl: AppAssets.bedImage,
          title: 'Green Bed',
          description:
              'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices...',
          price: '\$285',
          quantity: '2x uds.',
          total: '\$285',
        ),
      ],
    ),
  ];
}
