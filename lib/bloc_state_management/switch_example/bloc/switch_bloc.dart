import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:testapp/bloc_state_management/switch_example/bloc/switch_event.dart';
import 'package:testapp/bloc_state_management/switch_example/bloc/switch_states.dart';


class SwitchBloc extends Bloc<SwitchEvents , SwitchStates>{

  SwitchBloc():super(SwitchStates()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events , Emitter<SwitchStates>emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }


  void _slider(SliderEvent events , Emitter<SwitchStates>emit){
    emit(state.copyWith(slider: events.slider));
  }
}