import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc_state_management/switch_example/bloc/switch_bloc.dart';
import 'package:testapp/bloc_state_management/switch_example/bloc/switch_event.dart';
import 'package:testapp/bloc_state_management/switch_example/bloc/switch_states.dart';


class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Example'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Notifications'),
                  BlocBuilder<SwitchBloc , SwitchStates>(
                      builder: (context , state){
                        return Switch(value: state.isSwitch, onChanged: (newValue){
                          print(newValue);
                          context.read<SwitchBloc>().add(EnableOrDisableNotification());
                        },);
                      }

                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              BlocBuilder<SwitchBloc , SwitchStates>(
                  builder: (context , state){
                    return Container(
                      height: 200,
                      color: Colors.red.withOpacity(state.slider),
                    );
                  }

              ),

              const SizedBox(height: 50,),

              BlocBuilder<SwitchBloc , SwitchStates>(
                  builder: (context , state){
                    return Slider(
                        value: state.slider,
                        onChanged: (value){
                          context.read<SwitchBloc>().add(SliderEvent(slider: value));
                    });

                  }

              )
            ],
          )
      ),
    );
  }
}
