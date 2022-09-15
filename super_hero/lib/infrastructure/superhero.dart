import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:super_hero/domain/api.dart';
import 'package:super_hero/domain/model/super_model/datum.dart';
import 'package:super_hero/domain/model/super_model/super_model.dart';
import 'package:super_hero/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:super_hero/infrastructure/superhero_repo.dart';

class SuperHeroService implements SuperHeroRepo {
  @override
  Future<Either<MainFailures, List<Datas>>> getSuperHeroes() async {
    try {
      final res = await Dio(BaseOptions()).get(Api.getSuperHero);
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = SuperModel.fromJson(res.data);
        log("Service Api Called");
        return Right(data.data);
      } else {
        log("server Error");
        return Left(MainFailures(failureType: FailureType.server));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailures(failureType: FailureType.client));
    }
  }

  @override
  Future clearSuperHeroData() async {
    final db = await Hive.openBox<Datas>('db');
    await db.clear();
  }

  @override
  Future<List<Datas>?> getSuperHeroData() async {
    final db = await Hive.openBox<Datas>('db');
    final datas = <Datas>[];

    if (db.values.isEmpty) {
      return null;
    } else {
      datas.addAll(db.values.toList());
      return datas;
    }
  }

  @override
  Future saveSuperHeroData(List<Datas> data) async {
    final db = await Hive.openBox<Datas>('db');
    await db.addAll(data);
  }
}
