
import '../../../../../main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ShowHomeDataUseCase extends StateNotifier<StateModel<HomeData>>{
//   final Ref ref;
//   final UserRepository _userRepository;
//   ShowHomeDataUseCase(this.ref, this._userRepository) : super(StateModel());
//
//   void showHomeData() async {
//     state = StateModel(state: DataState.LOADING);
//     ResponseModel responseModel = await _userRepository.showHomeScreen();
//     if (responseModel.status == true) {
//       state = StateModel(state: DataState.SUCCESS, data: HomeData.fromJson(responseModel.data), message: responseModel.message);
//     } else {
//       state = StateModel(state: DataState.ERROR, message: responseModel.getFullError());
//     }
//   }
//
// }
//
// class UserFCMUseCase extends StateNotifier<StateModel<bool>> {
//   final Ref ref;
//   final UserRepository _userRepository;
//   UserFCMUseCase(this.ref, this._userRepository) : super(StateModel());
//
//   void setUserFCM(String fcm) async {
//     state = StateModel(state: DataState.LOADING);
//     ResponseModel responseModel = await _userRepository.setFCM(fcm);
//     if (responseModel.status == true) {
//       state = StateModel(
//           state: DataState.SUCCESS, data: true, message: responseModel.message);
//     } else {
//       state =
//           StateModel(state: DataState.ERROR, message: responseModel.message);
//     }
//   }
// }
//
// class DeleteAccountUseCase extends StateNotifier<StateModel<bool>> {
//   final Ref ref;
//   final UserRepository _userRepository;
//   DeleteAccountUseCase(this.ref, this._userRepository) : super(StateModel());
//
//   void delete() async {
//     state = StateModel(state: DataState.LOADING);
//     ResponseModel responseModel = await _userRepository.deleteAccount();
//     if (responseModel.status == true) {
//       state = StateModel(
//           state: DataState.SUCCESS, data: true, message: responseModel.message);
//     } else {
//       state =
//           StateModel(state: DataState.ERROR, message: responseModel.message);
//     }
//   }
// }
//
// class TNCUseCase extends StateNotifier<StateModel<String>> {
//   final Ref ref;
//   final UserRepository _userRepository;
//   TNCUseCase(this.ref, this._userRepository) : super(StateModel());
//
//   void get() async {
//     state = StateModel(state: DataState.LOADING);
//     ResponseModel responseModel = await _userRepository.getTNC();
//     if (responseModel.status == true) {
//       state = StateModel(
//           state: DataState.SUCCESS, data: responseModel.data, message: responseModel.message);
//     } else {
//       state =
//           StateModel(state: DataState.ERROR, message: responseModel.message);
//     }
//   }
// }

class BottomNavState extends StateNotifier<bool> {
  final Ref ref;
  BottomNavState(this.ref) : super(true);

  void setVisible(bool isVisible) async {
    state = isVisible;
  }

  void toggle() async {
    state = !state;
  }
}
