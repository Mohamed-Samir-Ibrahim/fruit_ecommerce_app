import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onTapped,
  });

  final bool isChecked;
  final ValueChanged<bool> onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapped(!isChecked);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: MediaQuery.of(context).size.width * 0.055,
        height: MediaQuery.of(context).size.height * 0.028,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(
              color: isChecked == true ? Color(0xff1B5E37) : Color(0xffDDDFDF),
            ),
          ),
          color: isChecked == true ? Color(0xff1B5E37) : Colors.white,
        ),
        child: isChecked == true
            ? SvgPicture.asset('assets/Check.svg')
            : SizedBox(),
      ),
    );
  }
}
