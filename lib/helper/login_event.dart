// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:payd/model/login_model.dart';
// import 'package:payd/services/login_service.dart';
// import 'package:flutter_session/flutter_session.dart';

// class LoginEvent extends Equatable{
//   @override
//   // TODO: implement props
//   List<Object> get props => [];
// }

// class LoginState extends Equatable{
//   @override
//   // TODO: implement props
//   List<Object> get props => [];
// }

// class LoginBloc extends Bloc<LoginEvent, LoginState>{
//   LoginService loginRepo;
//   LoginBloc(this.loginRepo) : super(null);
//   @override
//   Stream<LoginState> mapEventToState(LoginEvent event) async*{
//     // TODO: implement mapEventToState
//       try {
//         Login fetchResponse = await loginRepo.getLogin(event._email,event._password, event._ipAddress);
//         if(fetchResponse.successCode == true) {

//              //This method will prompt ios push notification prompt***
//             // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//             OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
//               print("Accepted permission: $accepted");
//             });
           
//            //check whether the app is subscribed to onesignal****
//             OneSignal.shared.getDeviceState().then((deviceState) async{
//               if(deviceState?.subscribed == true) {
//                 var session = FlutterSession();
                
//                 //add externalId to onesignal****
//                 //I will create some unique ID for a user when they register to our app's account. Then I will store it in DB. After logging, I will get that user's unique id from the login API and store it in the session as well. Like that you can create a unique id for a user & use it as an external id for onesignal.
//                 var externalUserId = await session.get("oneSignalId");

//                 await OneSignal.shared.setExternalUserId(externalUserId);
//               }
//             });
//           } 
//       } catch (_) {
//         print('Error $_');
//         print('Something went wrong');
//       }
//   }

// }