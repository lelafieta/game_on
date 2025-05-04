import 'package:dartz/dartz.dart';
import 'package:game_on/src/core/error/failure.dart';
import 'package:game_on/src/features/competitions/domain/repositories/i_prizes_repository.dart';

import '../../../../core/usecases/base_usecases.dart';
import '../entities/prizes_entity.dart';

class SavePrizesUseCase extends BaseUseCases<Unit, PrizesEntity> {
  final IPrizesRepository prizesRepository;

  SavePrizesUseCase({required this.prizesRepository});

  @override
  Future<Either<Failure, Unit>> call(PrizesEntity params) async {
    return await prizesRepository.savePrizes(prizes: params);
  }
}
