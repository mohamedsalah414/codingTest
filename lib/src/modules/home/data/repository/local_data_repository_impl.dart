import 'package:dartz/dartz.dart';
import 'package:codingtest/src/core/error/exception.dart';
import 'package:codingtest/src/core/error/failure.dart';
import 'package:codingtest/src/core/utils/app_strings.dart';
import 'package:codingtest/src/modules/home/data/datasource/forecast_datasource.dart';
import 'package:codingtest/src/modules/home/data/models/forecast_model.dart';
import 'package:codingtest/src/modules/home/domain/entities/foercast_entity.dart';
import 'package:codingtest/src/modules/home/domain/repository/forecast_repository.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastWebServices apiProvider;

  ForecastRepositoryImpl({required this.apiProvider});
@override
Future<Either<Failure, ForecastEntity>> fetchForecastLatLon(
      {required double lat,
        required double lon,
       }) async {
  try {
    final response = await  apiProvider.getMainForecastByLatLon(lat: lat, lon: lon);
    return Right(response);
  }
  on NoInternetConnectionException catch (_) {
    return const Left(
        ServerFailure(message: AppStrings.noInternetConnection));
  } on InternalServerErrorException catch (_) {
    return const Left(ServerFailure(message: AppStrings.internalServerError));
  } on FormatException catch (_) {
    return const Left(
        ServerFailure(message: AppStrings.errorOccurredDuringReadingData));
  } catch (exception) {
    return const Left(ServerFailure(message: AppStrings.somethingWentWrong));
  }
  }

  @override
  Future<Either<Failure, ForecastEntity>> fetchForecastByCityName(
      {    required String cityName,

      }) async {
    try {
      final response = await     apiProvider.getMainForecastByCityName(
          cityName: cityName);
      return Right(response);
    }
    on NoInternetConnectionException catch (_) {
      return const Left(
          ServerFailure(message: AppStrings.noInternetConnection));
    } on InternalServerErrorException catch (_) {
      return const Left(ServerFailure(message: AppStrings.internalServerError));
    } on FormatException catch (_) {
      return const Left(
          ServerFailure(message: AppStrings.errorOccurredDuringReadingData));
    } catch (exception) {
      return const Left(ServerFailure(message: AppStrings.somethingWentWrong));
    }
  }

}
