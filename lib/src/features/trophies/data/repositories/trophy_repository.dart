import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/trophy_entity.dart';
import '../../domain/repositories/i_trophy_repository.dart';
import '../datasources/i_trophy_datasource.dart';
import '../models/trophy_model.dart';

class TrophyRepository extends ITrophyRepository {
  final IRemoteTrophyDataSource remoteTrophyDataSource;

  TrophyRepository({required this.remoteTrophyDataSource});

  @override
  Future<Either<Failure, Unit>> createTrophy(TrophyEntity trophy) async {
    try {
      await remoteTrophyDataSource.createTrophy(TrophyModel.fromEntity(trophy));
      return const Right(unit);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTrophy(String id) async {
    try {
      await remoteTrophyDataSource.deleteTrophy(id);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrophyEntity>>> getTrophies(
      {String? competitionId}) async {
    try {
      final trophies = await remoteTrophyDataSource.getTrophies(
          competitionId: competitionId);
      return Right(trophies);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrophyEntity>>> getTrophiesByTeam(
      String teamId) async {
    try {
      final trophies = await remoteTrophyDataSource.getTrophiesByTeam(teamId);
      return Right(trophies);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TrophyEntity?>> getTrophyById(String id) async {
    try {
      final trophy = await remoteTrophyDataSource.getTrophyById(id);
      return Right(trophy);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTrophy(TrophyEntity trophy) async {
    try {
      await remoteTrophyDataSource.updateTrophy(TrophyModel.fromEntity(trophy));
      return const Right(unit);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
