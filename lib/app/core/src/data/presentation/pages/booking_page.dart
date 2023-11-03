import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:easy_parking_app/app/core/src/data/models/car_model.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_cubit.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_event.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_state.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/components/parking_lot.dart';
import 'package:easy_parking_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, required this.vacancy});
  final VacancyEntity vacancy;

  @override
  // ignore: library_private_types_in_public_api
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  String _carPlate = '';
  String _carModel = '';

  @override
  void initState() {
    context.read<ParkingLotCubit>().setVacancy(widget.vacancy);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservar vaga'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.blueberry,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.vacancy.slotName ?? '',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Placa do carro',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a placa do carro';
                  }
                  return null;
                },
                onSaved: (value) {
                  _carPlate = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Modelo do carro',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o modelo do carro';
                  }
                  return null;
                },
                onSaved: (value) {
                  _carModel = value!;
                },
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       _formKey.currentState!.save();
              //       context.read<ParkingLotCubit>().add(
              //             VacancyOccupied(
              //               VacancyEntity(
              //                 id: widget.vacancy.id,
              //                 slotName: widget.vacancy.slotName,
              //                 occupied: widget.vacancy.occupied,
              //                 car: CarModel(
              //                   plate: _carPlate,
              //                   model: _carModel,
              //                 ),
              //               ),
              //             ),
              //           );
              //       Navigator.pop(context);
              //     }
              //   },
              //   child: const Text('Reservar'),
              // ),
              BlocBuilder<ParkingLotCubit, ParkingLotState>(
                builder: (context, state) {
                  return ParkingLot(
                    isFavorited: state.vacancy!.occupied ?? false,
                    size: 50,
                    padding: 20,
                    onTap: () {
                      BlocProvider.of<ParkingLotCubit>(context).add(
                        VacancyOccupied(
                          state.vacancy ??
                              VacancyEntity(
                                id: 0,
                                slotName: '',
                                occupied: null,
                              ),
                        ),
                      );

                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<ParkingLotCubit>().add(
                              VacancyOccupied(
                                VacancyEntity(
                                  id: widget.vacancy.id,
                                  slotName: widget.vacancy.slotName,
                                  occupied: widget.vacancy.occupied,
                                  car: CarModel(
                                    plate: _carPlate,
                                    model: _carModel,
                                  ),
                                ),
                              ),
                            );
                        Navigator.pop(context);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
