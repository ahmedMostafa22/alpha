import 'package:alpha/modules/champ_rotation/bloc/champ_rotation_bloc.dart';
import 'package:alpha/modules/champ_rotation/view/screens/champ_rotation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampRotationBloc(),
      child: MaterialApp(
        title: 'Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ChampRotationScreen(),
      ),
    );
  }
}
