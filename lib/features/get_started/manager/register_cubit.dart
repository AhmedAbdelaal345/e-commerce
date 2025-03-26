import 'package:final_projects/features/get_started/data/repo/register_repo.dart';
import 'package:final_projects/features/get_started/manager/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super((OnboardingInitialState()));
  static OnboardingCubit get(context) => BlocProvider.of(context);
  OnboardingRepo save = OnboardingRepo();
  LoginRepo log = LoginRepo();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conforimcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  void onboardingOnpressed() async {
    emit(OnboardingInitialState());

    emit(await OnboardingLoadingState());
    var response = await save.regist(
      fullname: namecontroller.text,
      email: emailcontroller.text,
      phone: phonecontroller.text,
      password: passwordcontroller.text,
      confirm: conforimcontroller.text,
    );
    response.fold(
      //left
      (String error) {
        emit(OnboardingErrorState(error: error));
      },
      //right
      (r) {
        emit(OnboardingSucessState(msg: r));
      },
    );
  }

  void Login() async {
    emit(OnboardingInitialState());
    emit(await OnboardingLoadingState());
    var response = await log.login(
      email: namecontroller.text,
      password: passwordcontroller.text,
    );
    response.fold(
      (String error) {
        emit(OnboardingErrorState(error: error));
      },
      (r) {
        emit(OnboardingSucessState());
      },
    );
  }
}
