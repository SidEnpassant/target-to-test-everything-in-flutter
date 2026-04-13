//  ----------- CODE FOR DEPENDENCY INJECTION -----------  //

// import 'package:flutter/material.dart';
// import 'package:testapp/LayoutBuilderTesting.dart';
// import 'package:testapp/homePage.dart';
// import 'package:testapp/mediaQueryTesting.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: Homepage(),
//     );
//   }
// }



//  ----------- CODE FOR DEPENDENCY INJECTION -----------  //////////

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/dependency_injection/app_info.dart';
// import 'package:testapp/dependency_injection/locator.dart';

// import 'dependency_injection/home_view.dart';


// void main() {
//   setupLocator();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (context) => AppInfo(),
//       child: MaterialApp(
//         title: 'Dependency Injection',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: Scaffold(
//           body: HomeView(
//             appInfo: Provider.of<AppInfo>(context)
//           ),
//         ),
//       ),
//     );
//   }
// }



// // ----------- CODE FOR STATEFUL AND STATELESS WIDGETS -----------  //////////
// import 'package:flutter/material.dart';
// import 'package:testapp/stateless_and_stateful/home_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }


// ----------- CODE FOR PROVIDER STATE MANAGEMENT -----------  //////////

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/provider_state_management/provider/count_provider.dart';
// import 'package:testapp/provider_state_management/screens/count_example.dart';
// import 'package:testapp/provider_state_management/why_provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<CountProvider>(
//       create: (context) => CountProvider(),
//       child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CountExample(),
//      ),
//     );
//   }
// }


// // ------------ MULTIPROVIDER EXAMPLE -----------  //////////
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/provider_state_management/provider/auth_provider.dart';
// import 'package:testapp/provider_state_management/provider/count_provider.dart';
// import 'package:testapp/provider_state_management/provider/example_one_provider.dart';
// import 'package:testapp/provider_state_management/provider/favourite_provider.dart';
// import 'package:testapp/provider_state_management/provider/theme_changer_provider.dart';
// import 'package:testapp/provider_state_management/screens/count_example.dart';
// import 'package:testapp/provider_state_management/screens/dark_theme.dart';
// import 'package:testapp/provider_state_management/screens/favourite/favourite_screen.dart';
// import 'package:testapp/provider_state_management/screens/login.dart';
// import 'package:testapp/provider_state_management/screens/value_notify_listener.dart';
// import 'package:testapp/provider_state_management/why_provider.dart';
// import 'package:testapp/provider_state_management/screens/example_one.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//   //final themeChanger = Provider.of<ThemeChangerProvider>(context);
//     return MultiProvider(
//       providers: [
//        ChangeNotifierProvider(create: (_) => CountProvider()),
//        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
//        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
//        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
//        ChangeNotifierProvider(create: (_) => AuthProvider()),
//       ],
//       child: Builder(builder: (BuildContext context){
//         final themeChanger = Provider.of<ThemeChangerProvider>(context);
//         return MaterialApp(
//          debugShowCheckedModeBanner: false,
//          title: 'Flutter Demo',
//          themeMode:themeChanger.themeMode,
//          theme: ThemeData(
//           brightness: Brightness.light,
//          primarySwatch: Colors.red,
//          appBarTheme: AppBarTheme(
//               backgroundColor: Colors.orange,
//             ),
//           ),
//           darkTheme: ThemeData(
//             brightness: Brightness.dark,
//             primarySwatch: Colors.pink,
//             appBarTheme: AppBarTheme(
//               backgroundColor: Colors.teal,
//             ),
//             iconTheme: IconThemeData(
//               color: Colors.pink,
//             )
//           ),
//          home: LoginScreen(),
//         );
//       })
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:testapp/homePage.dart';
import 'package:testapp/rest_api_get/example_four.dart';
import 'package:testapp/rest_api_get/example_three.dart';
import 'package:testapp/rest_api_get/example_two.dart';
import 'package:testapp/rest_api_post/signup.dart';

import 'rest_api_get/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SignUpScreen(),
    );
  }
}