import 'package:ecommerce_app/features/my%20orders/model1/order/order.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onViewDetails;
  const OrderCard({
    super.key,
    required this.order,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow:
          [
            BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
      ),
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(order.imageUrl),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order # ${order.OrderNumber}',
                          style: AppTextStyles.withColor(
                          AppTextStyles.h3,
                              Theme.of(context).textTheme.bodyLarge!.color!,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${order.itemCount} items. \$${order.totalAmount.toStringAsFixed(2)}',
                          style: AppTextStyles.withColor(
                            AppTextStyles.bodyMedium,
                            isDark? Colors.grey[400]! : Colors.grey[600]!
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildStatusChip(
                          context,
                          order.statusString,
                        ),
                      ],
                ),
                ),
              ],
            ),
          ),
          Divider(height: 1,color: Colors.grey.shade200),
          InkWell(
            onTap: onViewDetails,
              child: Padding(padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'View Details',
                style: AppTextStyles.withColor(
                    AppTextStyles.buttonMedium,
                    Theme.of(context).primaryColor,
                ),
              ),
              ),
          )
        ],
      ),
    );
  }
  Widget _buildStatusChip(BuildContext context, String type){
    Color getStatusColor(){
      switch(type){
        case 'active':
          return Colors.blue;

        case 'Completed':
          return Colors.green;
        case 'Cancelled':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
      decoration: BoxDecoration(
        color: getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        type.capitalize!,
        style: AppTextStyles.withColor(
            AppTextStyles.bodySmall,
          getStatusColor(),
        ),
      ),
    );
  }
}
