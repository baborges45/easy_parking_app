// class RegistrarEntradaUseCase {
//   final EstacionamentoRepository repository;

//   RegistrarEntradaUseCase(this.repository);

//   Future<bool> registrarEntrada(VagaModel vaga, Veiculo veiculo) async {
//     // Verifica se a vaga está disponível
//     if (!repository.isVagaDisponivel(vaga)) {
//       return false;
//     }

//     // Registra a entrada do veículo
//     await repository.registrarEntrada(vaga, veiculo);

//     return true;
//   }
// }
