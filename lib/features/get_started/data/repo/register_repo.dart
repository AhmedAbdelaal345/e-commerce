import 'package:dartz/dartz.dart';
import 'package:final_projects/core/fixedstrings/end_points.dart';
import 'package:final_projects/core/helper/api_helper.dart';
import 'package:final_projects/core/network/api_response.dart';
import 'package:final_projects/features/get_started/data/model/user_model.dart';

class OnboardingRepo {
  OnboardingRepo();
  late UserModel user;

  Future<Either<String, String>> regist({
    required String fullname,
    required String phone,
    required String email,
    required String password,
    required String confirm,
  }) async {
    try {
      APIHelper api = APIHelper();
      ApiResponse response = await api.postRequest(
        endPoint: EndPoints.register,
        data: {
          "name": fullname,
          "phone": phone,
          "email": email,
          "password": password,
        },
        isAuthorized: false,
        isFormData: true,
      );
      if (confirm != password) {
        throw Exception("The Confirm password is Wrong");
      }
      if (response.status) {
        return Right(response.message);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}

class LoginRepo {
  LoginRepo();
  Future<Either<String, UserModel>> login({
    required email,
    required password,
  }) async {
    try {
      APIHelper api = APIHelper();
      ApiResponse response = await api.postRequest(
        endPoint: EndPoints.login,
        data: {"email": email, "password": password},
        isAuthorized: false,
        isFormData: true,
      );
      if (response.status) {
        UserLoginModel userloginmodel = UserLoginModel.fromJson(response.data);
        return Right(userloginmodel.user!);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
