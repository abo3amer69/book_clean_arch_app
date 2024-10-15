import 'package:bookcleanarch_app/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookcleanarch_app/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookcleanarch_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookcleanarch_app/Features/home/domain/entites/book_entity.dart';
import 'package:bookcleanarch_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookcleanarch_app/Features/home/domain/use_cases/fetch_newst_books_use_case.dart';
import 'package:bookcleanarch_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookcleanarch_app/Features/home/presentation/manager/newest-Books_cubit/newest_books_cubit.dart';
import 'package:bookcleanarch_app/constants.dart';
import 'package:bookcleanarch_app/core/utils/api_services.dart';
import 'package:bookcleanarch_app/core/utils/app_router.dart';
import 'package:bookcleanarch_app/core/utils/function/setup_services_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Features/Splash/presentation/views/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());

  setupServicesLocator();
  await Hive.openBox<BookEntity>(KFeaturedbox);
  await Hive.openBox<BookEntity>(KNewestbox);
  runApp(const Bookly());
}

final getIt = GetIt.instance;

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCse(
                getIt.get<HomeRepoImol>(),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCse(
                getIt.get<HomeRepoImol>(),
              ),
            );
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
