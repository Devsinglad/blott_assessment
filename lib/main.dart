import 'package:blott_assessment/routes.dart';
import 'package:blott_assessment/theme.dart';
import 'package:blott_assessment/view-model/home-view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'helpers/repository.dart';

void main() {
  runApp(const MyApp());
  Repository.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      ScreenUtil.init(
        context,
        minTextAdapt: true,
        splitScreenMode: true,
      );
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeNewsViewModel(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: Routes.router,
          title: 'Blott Assessment',
          theme: AppTheme.lightTheme(context),
        ),
      );
    });
  }
}
