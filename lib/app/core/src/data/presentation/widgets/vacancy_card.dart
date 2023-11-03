import 'package:easy_parking_app/app/core/src/data/models/vacancy_model.dart';
import 'package:flutter/material.dart';

class VacancyCard extends StatelessWidget {
  const VacancyCard({
    super.key,
    required this.vaga,
  });
  final VacancyModel vaga;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vaga ${vaga.number}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ocupada: ${vaga.occupied}',
            ),
          ],
        ),
      ),
    );
  }
}
