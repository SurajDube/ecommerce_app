import 'package:ecommerce_app/features/my%20orders/model1/order/order.dart';

class OrderRepository{
  List<Order> getOrders(){
return [
  Order(
    OrderNumber: '123454',
    itemCount: 2,
    totalAmount: 2938.8,
    status: OrderStatus.active,
    imageUrl: 'assets/images/shoe.jpg',
    orderDate: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  Order(
    OrderNumber: '323232',
    itemCount: 2,
    totalAmount: 432.8,
    status: OrderStatus.active,
    imageUrl: 'assets/images/laptop.jpg',
    orderDate: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  Order(
    OrderNumber: '64535',
    itemCount: 2,
    totalAmount: 1499.8,
    status: OrderStatus.active,
    imageUrl: 'assets/images/shoe2.jpg',
    orderDate: DateTime.now().subtract(const Duration(hours: 7)),
  ),
  Order(
    OrderNumber: '61135',
    itemCount: 2,
    totalAmount: 499.8,
    status: OrderStatus.active,
    imageUrl: 'assets/images/shoes2.jpg',
    orderDate: DateTime.now().subtract(const Duration(hours: 7)),
  ),
];
  }
  List<Order> getOrdersbyStatus(OrderStatus status){
    return getOrders().where((order)=> order.status == status).toList();
  }
}