import 'package:alpha/modules/champ_rotation/bloc/champ_rotation_bloc.dart';
import 'package:alpha/modules/champ_rotation/view/widgets/champion_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChampRotationScreen extends StatefulWidget {
  const ChampRotationScreen({Key? key}) : super(key: key);

  @override
  State<ChampRotationScreen> createState() => _ChampRotationScreenState();
}

class _ChampRotationScreenState extends State<ChampRotationScreen> {
  @override
  void initState() {
    context.read<ChampRotationBloc>().add(GetChampionRotation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Champion Rotation'),
      ),
      body: BlocBuilder<ChampRotationBloc, ChampRotationState>(
        builder: (context, state) {
          print(state);
          if (state is ChampRotationLoaded) {
            if (state.champs.isEmpty) {
              return const Center(
                child: Text('No Champions Available'),
              );
            }
            return ListView.builder(
                itemCount: state.champs.length,
                itemBuilder: (c, i) =>
                    ChampionListItem(champion: state.champs[i]));
          } else if (state is ChampRotationError) {
            return Center(child: state.errorMessage);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
