import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/view/forget_password_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_textfield.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:ecommerce_app/view/main_screen.dart';
import 'package:ecommerce_app/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome Back',
              style: AppTextStyles.withColor(
                AppTextStyles.h1,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue shopping',
                style: AppTextStyles.withColor(
                  AppTextStyles.bodyLarge,
                  isDark? Colors.grey[400]! : Colors.grey[600]!,
              ),
              ),
              const SizedBox(height: 40),
              //email Text Field
              CustomTextfield(
                  label: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null  || value.isEmpty){
                      return 'Please enter your email';
                    }
                    if(!GetUtils.isEmail(value)) {
                      return 'Please Enter a valid Email';
                    }
                    return null;
                  },
                  ),
              const SizedBox(height: 16),
              // password Text field
              CustomTextfield(
                  label: 'Password',
                  prefixIcon: Icons.lock_outlined,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value){
                    if (value==null  || value.isEmpty){
                      return 'Please Enter Your Password';
                    }
                    return null;
                  },
              ),
              const SizedBox(height: 8),
              // forget password text button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => Get.to(()=> ForgetPasswordScreen()),
                    child: Text(
                      'Forget password?',
                    style: AppTextStyles.withColor(
                    AppTextStyles.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                    ),
                ),
              ),
               const SizedBox(height: 24),
              //sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                    child: Text('Sign In',
                    style: AppTextStyles.withColor(
                      AppTextStyles.buttonMedium,
                      Colors.white,
                    ),
                    ),
                ),
              ),
              // Signup text button
              const SizedBox(height: 24),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account?",
                    style: AppTextStyles.withColor(
                        AppTextStyles.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(onPressed: () => Get.to(()=>SignUpScreen(),),
                    child: Text('Sign Up',
                      style: AppTextStyles.withColor(
                        AppTextStyles.buttonMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // sign in button on pressed
void _handleSignIn(){
    final AuthController authController = Get.find<AuthController>();
    authController.login();
    Get.offAll(()=> const MainScreen());
}
}
