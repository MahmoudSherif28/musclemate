import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musclemate/views/login/helper/custom_text_form_field.dart';
import 'package:musclemate/views/login/helper/emial_and_password_validet_function.dart';
import 'package:musclemate/views/login/register.dart';
import '../menu/menu_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? password;

  String? email;

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                        color: const Color(0xff442712),
                        fontWeight: FontWeight.bold,
                        fontSize: 45.sp),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    "Hey!, Enter your details to sign in to your account",
                    style: TextStyle(
                        color: const Color(0xff442712), fontSize: 13.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 80.h),
                  SizedBox(
                    width: 350.w,
                    height: 60.h,
                    child: CustomTextFormField(
                      onChange: (value) => password = value,
                      validator: (value) => validatePassword(value!),
                      hientText: 'Enter your email',
                      lable: 'Email',
                      iconField: Icon(Icons.email),
                      onPressedIcon: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 350.w,
                    height: 60.h,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff442712),
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: const OutlineInputBorder(),
                      ),
                      validator: (Value) => validatePassword(Value!),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fixedSize: Size(300.w, 40.h),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenuView()),
                        );
                      }
                    },
                    child: const Text("Login"),
                  ),
                  SizedBox(height: 40.h),
                  const Text(
                    "... or sign in with ...",
                    style: TextStyle(color: Color(0xff442712)),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fixedSize: Size(40.w, 20.h),
                        ),
                        onPressed: () {},
                        child: Image.asset("assets/img/new/googleicon.webp"),
                      ),
                      SizedBox(width: 25.w),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fixedSize: Size(40.w, 20.h),
                        ),
                        onPressed: () {},
                        child: Image.asset("assets/img/new/facebook.webp"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Register now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
