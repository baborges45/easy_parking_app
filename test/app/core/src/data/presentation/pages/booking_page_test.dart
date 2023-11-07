import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_cubit.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_state.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/pages/booking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockParkingLotCubit extends MockCubit<ParkingLotState>
    implements ParkingLotCubit {}

ParkingLotCubit? _parkingLotCubit;

void main() {
  setUp(() => _parkingLotCubit = MockParkingLotCubit());
  setUpAll(() => registerFallbackValue(const ParkingLotStateInitial()));

  testWidgets('BookingPage Widget Test', (WidgetTester tester) async {
    final cubit =
        MockParkingLotCubit(); // Substitua MockParkingLotCubit com o seu mock real.

    final vacancy = VacancyEntity(id: 1, slotName: 'Vaga 1', occupied: false);
    await tester.pumpWidget(
      BlocProvider<ParkingLotCubit>(
        create: (context) => cubit,
        child: MaterialApp(
          home: BookingPage(vacancy: vacancy),
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
        ),
      ),
    );

    // Verifique se a página foi renderizada corretamente.
    expect(find.text('Reservar vaga'), findsOneWidget);
    expect(find.text('Placa do carro'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('carPlateField')), 'ABC123');
    await tester.enterText(
        find.byKey(const Key('carModelField')), 'ModeloCarro');
    await tester.tap(find.byKey(const Key('parkingLotWidget')));

    await tester.pumpAndSettle();
  });
}
