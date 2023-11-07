import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_cubit.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_state.dart';
import 'package:easy_parking_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
    required this.vacancy,
  });
  final VacancyEntity vacancy;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
      ),
      body: BlocBuilder<ParkingLotCubit, ParkingLotState>(
        builder: (context, state) {
          if (state is ParkingLotStateLoaded) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Entradas:', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Column(
                    children: state.addHistory.map((entry) {
                      return Card(
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${entry.model}'),
                              Text('${entry.plate} '),
                            ],
                          ),
                          subtitle: Text(
                            getFormattedDateTime(entry.dateTime!),
                          ),
                          leading: const Icon(
                            Icons.car_repair,
                            color: AppColors.highlight,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text('Saídas:', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Column(
                    children: state.exitHistory.map((exit) {
                      return Card(
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${exit.model}'),
                              Text('${exit.plate}'),
                            ],
                          ),
                          subtitle: Text(
                            getFormattedDateTime(exit.exitTime!),
                          ),
                          leading: const Icon(
                            Icons.car_crash,
                            color: AppColors.redErro,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          } else if (state is ParkingLotStateLoading) {
            return const CircularProgressIndicator();
          } else {
            return const Center(child: Text('Nenhum histórico disponível.'));
          }
        },
      ),
    );
  }
}

String getFormattedDateTime(DateTime dateTime) {
  var formatter = DateFormat('dd/MM/yyyy -  HH:mm:ss');
  String formatted = formatter.format(dateTime);
  return formatted;
}
