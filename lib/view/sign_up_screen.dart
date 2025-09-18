import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:ecommerce_app/view/main_screen.dart';
import 'package:ecommerce_app/view/signin_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //back button
                IconButton(
                    onPressed: ()=> Get.back(),
                    icon: Icon(Icons.arrow_back_ios,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                ),
                const SizedBox(
                    height:20),
                Text('Create Account',
                    style: AppTextStyles.withColor(
                        AppTextStyles.h1,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                ),
                const SizedBox(height:8),

                Text('Signup to get started',
                  style: AppTextStyles.withColor(
                    AppTextStyles.bodyLarge,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                const SizedBox(
                    height:40),

                // full name text field
                CustomTextfield(
                  label: 'Full Name',
                  prefixIcon: Icons.person_outline,
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  validator: (value){
                    if (value==null  || value.isEmpty){
                      return 'Please Enter Your Name';
                    }
                    return null;
                  },
                ),
                // email textfield
                const SizedBox(height: 16),
                CustomTextfield(
                  label: 'Email',
                  prefixIcon: Icons.person_outline,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value){
                    if (value==null  || value.isEmpty){
                      return 'Please Enter Your Email';
                    }
                    if (!GetUtils.isEmail(value)){
                      return 'Please Enter valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // password Text field
                CustomTextfield(
                  label: 'Password',
                  prefixIcon: Icons.lock_outline,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value){
                    if (value==null  || value.isEmpty){
                      return 'Please Enter Your password';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                // confirm password  textfield
                CustomTextfield(
                  label: 'Confirm Password',
                  prefixIcon: Icons.lock_outline,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  controller: _confirmPasswordController,
                  validator: (value){
                    if (value==null  || value.isEmpty){
                      return 'Please Confirm Your password';
                    } if (value!= _passwordController.text){
                      return 'Password do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24,),
                //sign up button
                SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: ()=> Get.off(()=> const MainScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Sign Up',
                      style: AppTextStyles.withColor(AppTextStyles.buttonMedium,
                          Colors.white,
                          )
                    ),
                ),
                  ),
                const SizedBox(height: 24),
                // sign in text button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? ',
                    style: AppTextStyles.withColor(
                        AppTextStyles.bodyMedium,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                    ),
                    TextButton(
                      onPressed: () => Get.to(()=>SigninScreen(),),
                      child: Text('Sign In',
                        style: AppTextStyles.withColor(
                          AppTextStyles.bodyMedium,
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
}