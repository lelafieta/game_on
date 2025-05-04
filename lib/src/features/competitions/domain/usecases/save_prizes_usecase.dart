import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecases.dart';
import '../entities/prizes_entity.dart';
import '../repositories/i_prizes_repository.dart';

class SavePrizesUseCase extends BaseUseCases<Unit, PrizesEntity> {
  final IPrizesRepository prizesRepository;

  SavePrizesUseCase({required this.prizesRepository});

  @override
  Future<Either<Failure, Unit>> call(PrizesEntity params) async {
    return await prizesRepository.savePrizes(prizes: params);
  }
}
