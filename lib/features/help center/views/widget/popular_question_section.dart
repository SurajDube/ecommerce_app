import 'package:ecommerce_app/features/help%20center/views/widget/question_card.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PopularQuestionSection extends StatelessWidget {
  const PopularQuestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Questions',
            style: AppTextStyles.withColor(
                AppTextStyles.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 16),
          const QuestionCard(
              title: 'How to track my order?',
              icon : Icons.local_shipping_outlined,
          ),
          const SizedBox(height: 12),
          const QuestionCard(
              title: 'How to return an item?',
              icon: Icons.local_shipping_outlined,
          )
        ],
      ),
    );
  }
}
