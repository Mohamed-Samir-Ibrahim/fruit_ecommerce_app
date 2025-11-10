import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_ecommerce_app/feature/login/presentation/view/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingCard extends StatefulWidget {
  const OnboardingCard({
    super.key,
    required this.image,
    required this.imageOnBoarding,
    required this.title,
    required this.description,
    required this.buttonText,
  });

  final String image;
  final String imageOnBoarding;
  final String title;
  final String description;
  final String buttonText;

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {
  void _navigateToLogin() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: GestureDetector(
                  onTap: _navigateToLogin,
                  child: Text(
                    'تخطي',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).textScaler.scale(14),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //SizedBox(height: MediaQuery.of(context).size.height * 0.4),
          // ConstrainedBox(
          //   constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.55),
          //   child: SvgPicture.asset(widget.image, fit: BoxFit.cover, width: double.infinity,),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(widget.imageOnBoarding),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).textScaler.scale(23),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).textScaler.scale(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
