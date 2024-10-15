import 'package:bookcleanarch_app/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookcleanarch_app/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookcleanarch_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookcleanarch_app/core/utils/api_services.dart';
import 'package:bookcleanarch_app/main.dart';
import 'package:dio/dio.dart';

void setupServicesLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImol>(
    HomeRepoImol(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
