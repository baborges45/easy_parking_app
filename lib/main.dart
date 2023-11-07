import 'package:easy_parking_app/app/core/services/injection_container.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_cubit.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ParkingLotCubit()),
      ],
      child: MaterialApp(title: 'Estacionamento', routes: {
        '/': (context) => const HomePage(),
      }),
    );
  }
}
