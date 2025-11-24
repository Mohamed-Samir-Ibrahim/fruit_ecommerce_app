import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_ecommerce_app/core/services/get_it_service.dart';
import 'package:fruit_ecommerce_app/core/validation/validation.dart';
import 'package:fruit_ecommerce_app/feature/login/presentation/view/login_screen.dart';
import 'package:fruit_ecommerce_app/feature/register/domain/repo/register_repo/register_repo.dart';
import 'package:fruit_ecommerce_app/feature/register/presentation/manager/signup_cubit.dart';
import 'package:fruit_ecommerce_app/feature/register/presentation/widget/custom_check_box.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  bool isPasswordObscure = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignupCubit(getIt<RegisterRepo>());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            textDirection: TextDirection.rtl,
            'حساب جديد',
            style: GoogleFonts.cairo(
              fontSize: MediaQuery.of(context).textScaler.scale(19),
              fontWeight: FontWeight.w700,
              color: Color(0xff0C0D0D),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset('assets/arrow-left.svg'),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.only(
            top: MediaQuery.of(context).size.height * 0.050,
            right: MediaQuery.of(context).size.width * 0.016,
            left: MediaQuery.of(context).size.width * 0.016,
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                        return ValidateFunctions().validationOfFullName(value);
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
                          child: Icon(Icons.person, color: Color(0xff1B5E37)),
                        ),
                        hintText: 'الاسم بالكامل',
                        hintStyle: TextStyle(color: Color(0xff1B5E37)),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                  Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                                style: GoogleFonts.cairo(
                                  fontSize: MediaQuery.of(
                                    context,
                                  ).textScaler.scale(16),
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff949D9E),
                                ),
                              ),
                              TextSpan(
                                text: 'الشروط',
                                style: GoogleFonts.cairo(
                                  fontSize: MediaQuery.of(
                                    context,
                                  ).textScaler.scale(16),
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2D9F5D),
                                ),
                              ),
                              TextSpan(
                                text: '              ',
                                style: GoogleFonts.cairo(
                                  fontSize: MediaQuery.of(
                                    context,
                                  ).textScaler.scale(13),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '        و الاحكام',
                                style: GoogleFonts.cairo(
                                  fontSize: MediaQuery.of(
                                    context,
                                  ).textScaler.scale(16),
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2D9F5D),
                                ),
                              ),
                              TextSpan(
                                text: ' الخاصة',
                                style: GoogleFonts.cairo(
                                  fontSize: MediaQuery.of(
                                    context,
                                  ).textScaler.scale(16),
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2D9F5D),
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: GoogleFonts.cairo(
                                  fontSize: MediaQuery.of(
                                    context,
                                  ).textScaler.scale(13),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'بنا',
                                style: GoogleFonts.cairo(
                                  fontSize: MediaQuery.of(
                                    context,
                                  ).textScaler.scale(16),
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2D9F5D),
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      CustomCheckBox(
                        isChecked: isChecked,
                        onTapped: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  MaterialButton(
                    shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    color: Color(0xff1B5E37),
                    minWidth: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    onPressed: () {},
                    child: Text(
                      'انشاء حساب جديد',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).textScaler.scale(16),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            LoginScreen.routeName,
                          ),
                          child: Text(
                            'تسجيل دخول',
                            style: GoogleFonts.cairo(
                              fontSize: MediaQuery.of(
                                context,
                              ).textScaler.scale(16),
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1B5E37),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ' تمتلك حساب بالفعل؟',
                        style: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).textScaler.scale(16),
                          fontWeight: FontWeight.w600,
                          color: Color(0xff949D9E),
                        ),
                      ),
                    ],
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
