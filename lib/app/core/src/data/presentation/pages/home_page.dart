// ignore_for_file: library_private_types_in_public_api

import 'package:easy_parking_app/app/core/src/data/models/car_model.dart';
import 'package:easy_parking_app/app/core/src/data/models/vacancy_model.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_cubit.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_event.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_state.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/components/parking_slot.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/pages/history_page.dart';
import 'package:easy_parking_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final parkingSpots = List<ParkingSlot>.generate(
    10,
    (index) => ParkingSlot(
      vacancy: VacancyModel(
        id: index,
        slotName: 'Vaga $index',
        occupied: null,
        time: DateTime.now(),
        car: CarModel(
          plate: '',
          model: '',
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estacionamento"), // Título da AppBar
      ),
      body: BlocConsumer<ParkingLotCubit, ParkingLotState>(
        listener: (context, state) {
          if (state.vacancy != null) {
            final index = parkingSpots
                .indexWhere((spot) => spot.vacancy.id == state.vacancy!.id);
            parkingSpots[index] = ParkingSlot(
              vacancy: state.vacancy!,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Histórico",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HistoryPage(
                                  vacancy: state.vacancy!,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.list_alt_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: parkingSpots.length,
                    itemBuilder: (context, index) {
                      final spot = parkingSpots[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                ParkingSlot(
                                  vacancy: spot.vacancy,
                                  onPressed: () {
                                    BlocProvider.of<ParkingLotCubit>(context)
                                        .add(
                                      VacancyUnoccupied(spot.vacancy),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: VerticalDivider(
                                    color: AppColors.blueberry,
                                    thickness: 1,
                                  ),
                                ),
                                ParkingSlot(
                                  vacancy: spot.vacancy,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
