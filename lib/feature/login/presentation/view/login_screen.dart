import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_ecommerce_app/core/validation/validation.dart';
import 'package:fruit_ecommerce_app/feature/forget_password/presentation/view/forget_password_screen.dart';
import 'package:fruit_ecommerce_app/feature/register/presentation/view/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final email = TextEditingController();
  final password = TextEditingController();
  bool isPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          textDirection: TextDirection.rtl,
          'تسجيل الدخول',
          style: GoogleFonts.cairo(
            fontSize: MediaQuery
                .of(context)
                .textScaler
                .scale(19),
            fontWeight: FontWeight.w700,
            color: Color(0xff0C0D0D),
          ),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () => SystemNavigator.pop(),
        //     icon: SvgPicture.asset('assets/arrow-left.svg'),
        //   ),
        // ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          top: MediaQuery
              .of(context)
              .size
              .height * 0.050,
          right: MediaQuery
              .of(context)
              .size
              .width * 0.016,
          left: MediaQuery
              .of(context)
              .size
              .width * 0.016,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: email,
                    validator: (value) {
                      return ValidateFunctions().validationOfEmail(value);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xff1B5E37)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xff1B5E37)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xff1B5E37)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 5),
                        child: Icon(
                          Icons.mail_outline,
                          color: Color(0xff1B5E37),
                        ),
                      ),
                      hintText: 'البريد الالكتروني',
                      hintStyle: TextStyle(color: Color(0xff1B5E37)),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: password,
                    obscuringCharacter: "*",
                    obscureText: isPasswordObscure,
                    validator: (value) {
                      return ValidateFunctions().validationOfPassword(value);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xff1B5E37)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xff1B5E37)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xff1B5E37)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 5),
                        child: Icon(
                          Icons.lock_outlined,
                          color: Color(0xff1B5E37),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordObscure = !isPasswordObscure;
                          });
                        },
                        icon: Icon(
                          isPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xff1B5E37),
                        ),
                      ),
                      hintText: 'كلمة المرور',
                      hintStyle: TextStyle(color: Color(0xff1B5E37)),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ForgetPasswordScreen.routeName,
                      );
                    },
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff2D9F5D),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.03),
                MaterialButton(
                  shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  color: Color(0xff1B5E37),
                  minWidth: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.06,
                  onPressed: () {},
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery
                          .of(context)
                          .textScaler
                          .scale(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName),
                        child: Text(
                          'قم بانشاء حساب',
                          style: GoogleFonts.cairo(
                            fontSize: MediaQuery
                                .of(context)
                                .textScaler
                                .scale(16),
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1B5E37),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      ' لا تمتلك حساب؟',
                      style: GoogleFonts.cairo(
                        fontSize: MediaQuery
                            .of(context)
                            .textScaler
                            .scale(16),
                        fontWeight: FontWeight.w600,
                        color: Color(0xff949D9E),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.033),
                Row(
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.4,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.002,
                      color: Colors.grey,
                    ),
                    SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .height * 0.03),
                    Text(
                      'او',
                      style: GoogleFonts.cairo(
                        fontSize: MediaQuery
                            .of(context)
                            .textScaler
                            .scale(16),
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0C0D0D),
                      ),
                    ),
                    SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .height * 0.03),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.4,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.002,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.031),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.070,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'تسجيل بواسطة جوجل',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery
                              .of(context)
                              .textScaler
                              .scale(16),
                          color: Color(0xff0C0D0D),
                        ),
                      ),
                      SizedBox(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.21),
                      SvgPicture.asset('assets/google.svg'),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.019,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.016),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.070,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'تسجيل بواسطة ابل',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery
                              .of(context)
                              .textScaler
                              .scale(16),
                          color: Color(0xff0C0D0D),
                        ),
                      ),
                      SizedBox(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.21),
                      SvgPicture.asset('assets/apple.svg'),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.019,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.016),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.070,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'تسجيل بواسطة فيسبوك',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery
                              .of(context)
                              .textScaler
                              .scale(16),
                          color: Color(0xff0C0D0D),
                        ),
                      ),
                      SizedBox(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.21),
                      SvgPicture.asset('assets/facebook.svg'),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.019,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
