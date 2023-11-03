// ignore_for_file: library_private_types_in_public_api

import 'package:easy_parking_app/app/core/src/data/models/car_model.dart';
import 'package:easy_parking_app/app/core/src/data/models/vacancy_model.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_cubit.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_event.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_state.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/components/parking_slot.dart';
import 'package:easy_parking_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

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
    return BlocProvider(
      create: (context) => ParkingLotCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Parking App'),
        ),
        body: BlocBuilder<ParkingLotCubit, ParkingLotState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Estacionamento",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
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
                              Navigator.pushNamed(context, '/history');
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
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: parkingSpots.length,
                      itemBuilder: (context, index) {
                        final spot = parkingSpots[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
