import 'package:ecommerce_app/features/notifications/models/notifications_type.dart';

class NotificationRepository{
  List<NotificationItem> getNotifications() {
    return [
      NotificationItem(
        title: 'Order Confirmed',
        message: "Your Order #123456 has been confirmed and i being processed",
        time: "2 minutes ago", type: NotificationType.order,
      isRead: true,
    ),
      NotificationItem(
        title: 'Special Offer!',
        message: "Get 20% off on all shoes this weekend!",
        time: "1 hour ago", type: NotificationType.promo,
        isRead: true,
      ),
      NotificationItem(
        title: 'Out for Delivery',
        message: "Your Order #123456 is our for delivery",
        time: "3 hour ago", type: NotificationType.delivery,
        isRead: true,
      ),
      NotificationItem(
        title: 'Payment Successful',
        message: "Payment for order #123456 was successful.",
        time: "2 minutes ago", type: NotificationType.payment,
        isRead: true,
      ),


    ];
  }
}