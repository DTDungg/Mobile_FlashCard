import 'package:flutter/material.dart';
import 'package:mobile_flash_card/model/user_from_client.dart';
import 'package:mobile_flash_card/screen/home_screen.dart';
import 'package:mobile_flash_card/service/login_service.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscured = true;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      UserFromClient user = UserFromClient(
          userName: "no name",
          email: _emailController.text,
          password: _passwordController.text);

      try {
        int userId = await LoginService().login(user);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Đăng nhập thành công',
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Define.strongPurple),
          ),
          backgroundColor: Define.lightPurple,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ));
        Get.offAll(BottomBar(selectedIndex: 2, userID: userId));
      } catch (e) {
        Get.snackbar('Đăng nhập thất bại', 'Kiểm tra lại email và mật khẩu');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: Image(image: AssetImage('assets/images/sign-in.png')),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 40),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.rubikBubbles(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Define.strongPurple),
                          hintText: 'example@gmail.com',
                          hintStyle: const TextStyle(color: Define.lightPurple),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Define.strongPurple, width: 1))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Bạn chưa nhập email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 10),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: GoogleFonts.rubikBubbles(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Define.strongPurple),
                          hintText: '************',
                          hintStyle: const TextStyle(color: Define.lightPurple),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                            child: Icon(_isObscured
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Define.strongPurple, width: 1))),
                      obscureText: _isObscured,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Bạn chưa nhập pass';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Define.lightPurple,
                        side: const BorderSide(
                            color: Define.strongPurple, width: 1),
                        elevation: 5),
                    child: Text('Sign In',
                        style: GoogleFonts.rubikBubbles(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Define.strongPurple)),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
