import 'package:ecommerce_app/features/privacy%20policy/views/widget/info_section.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

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
          'Terms of Service',
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
                  title: 'Welcome to Fashion Store',
                  content: 'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement',
              ),
              InfoSection(
                title: 'Account Registration',
                content: 'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement',
              ),
              InfoSection(
                title: 'User Responsibilities',
                content: 'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement',
              ),InfoSection(
                title: 'Intellectual Property',
                content: 'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement',
              ),InfoSection(
                title: 'Termination',
                content: 'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement',
              ),
              const SizedBox(height: 24),
              Text(
                'Last updated: September 2025',
                style: AppTextStyles.withColor(
                    AppTextStyles.bodySmall,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
