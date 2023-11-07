import 'package:easy_parking_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkingLot extends StatelessWidget {
  const ParkingLot({
    Key? key,
    this.bgColor = Colors.white,
    this.isParked = false,
    this.borderColor = Colors.transparent,
    this.radius = 30,
    this.size = 72,
    this.padding = 18,
    this.onTap,
  }) : super(key: key);

  final Color borderColor;
  final Color? bgColor;
  final bool isParked;
  final double radius;
  final double size;
  final double padding;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(padding),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: isParked ? AppColors.blueberry : bgColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: SvgPicture.asset(
          "assets/icons/carsymbol1.svg",
          colorFilter: ColorFilter.mode(
              isParked ? Colors.white : AppColors.blueberry, BlendMode.srcIn),
          width: size,
          height: size,
        ),
      ),
    );
  }
}
