import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_cubit.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

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
            return Column(
              children: [
                const Text('Entradas:'),
                Column(
                  children: state.history.map((entry) {
                    return Card(
                      child: ListTile(
                        title: Text('${entry.plate} - ${entry.dateTime}'),
                      ),
                    );
                  }).toList(),
                ),
                const Text('Saídas:'),
                Column(
                  children: state.exitHistory.map((exit) {
                    return Card(
                      child: ListTile(
                        title: Text('${exit.plate} - ${exit.exitTime}'),
                      ),
                    );
                  }).toList(),
                ),
              ],
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
