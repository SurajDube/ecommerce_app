import 'package:ecommerce_app/features/privacy%20policy/views/widget/info_section.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_forward_ios,
              color: isDark ? Colors.white : Colors.black,
            ),
        ),
        title: Text(
            'Privacy Policy',
          style: AppTextStyles.withColor(
              AppTextStyles.h3,
              isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection(
                  title: 'Information We Collect',
                  content: 'we collect information that you provide directly to us, including name, email address and shipping information.',
              ),
              InfoSection(
                title: 'How We Use Your Information ',
                content: 'we use the information we collect to provide, maintain and improve our services, process your transaction and send you update',
              ),
              InfoSection(
                title: 'Information Sharing',
                content: 'we collect information that you provide directly to us, including name, email address and shipping information.',
              ),
              InfoSection(
                title: 'Data Security',
                content: 'we collect information that you provide directly to us, including name, email address and shipping information.',
              ),
              InfoSection(
                title: 'Your Rights',
                content: 'we collect information that you provide directly to us, including name, email address and shipping information.',
              ),
              InfoSection(
                title: 'Cookie Policy',
                content: 'we collect information that you provide directly to us, including name, email address and shipping information.',
              ),
              const SizedBox(height: 24),
              Text(
                'Last updated: September 2025',
                style: AppTextStyles.withColor(
                    AppTextStyles.bodySmall,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
