import 'package:another_dashed_container/another_dashed_container.dart';
import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/pages/booking_page.dart';
import 'package:easy_parking_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ParkingSlot extends StatelessWidget {
  const ParkingSlot({
    super.key,
    required this.vacancy,
    this.onPressed,
  });
  final VacancyEntity vacancy;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DashedContainer(
      dashColor: AppColors.highlight,
      dashedLength: 10.0,
      blankLength: 9.0,
      strokeWidth: 1.0,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 165,
        height: 120,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                vacancy.time == null
                    ? const SizedBox(width: 1)
                    : SizedBox(
                        child: Text(vacancy.time.toString().split('')[0])),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue.shade100,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    vacancy.slotName.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Visibility(
                  visible: vacancy.occupied ?? false,
                  child: SizedBox(
                    child: IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.exit_to_app_outlined),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (vacancy.occupied ?? false)
              Expanded(
                child: Image.asset("assets/images/car.png"),
              )
            else if (vacancy.occupied ?? false)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BOOKED",
                      style: TextStyle(
                        color: Colors.red.shade400,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            else
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingPage(
                            vacancy: vacancy,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 30),
                      decoration: BoxDecoration(
                        color: AppColors.highlight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "SLOT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
