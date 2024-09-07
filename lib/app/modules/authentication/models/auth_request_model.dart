import 'package:EarlybazeWallet/app/export.dart';

class RequestModal {
  //*===================================================================== login request Modal  ==========================================================*

  static loginRequestModel({
    required String? userName,
    required String? password,
    required String deviceType,
    required String? deviceToken,
    required String? deviceName,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = userName;
    data["password"] = password;
    data["device_type"] = deviceType;
    data["device_name"] = deviceName;
    data["device_token"] = deviceToken;

    return data;
  }

  //*===================================================================== signIN RequestModal  ==========================================================*

  static signInRequestModal({
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? password,
    required String? conPassword,
    required String? deviceType,
    required String? deviceName,
    required String? deviceToken,
  }) {
    final Map<String, dynamic> data = Map();

    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['confirm_password'] = conPassword;
    data["device_type"] = deviceType;
    data["device_name"] = deviceName;
    data["device_token"] = deviceToken;

    return data;
  }

  //*===================================================================== ResetPassword RequestModal  ==========================================================*

  static resetPasswordRequestModel({
    required String? password,
    required String? confirmPassword,
  }) {
    final Map<String, dynamic> data = Map();
    data['User[password]'] = password;
    data['User[confirm_password]'] = confirmPassword;
    return data;
  }

  //*===================================================================== OTP Verify RequestModal  ==========================================================*

  static otpVerifyRequestMOdel({
    required String? otp,
  }) {
    final Map<String, dynamic> data = Map();
    data['otp'] = otp;

    return data;
  }

//*===================================================================== forgetPassword Request Modal  ==========================================================*

  static forgetPasswordRequestModal({required String? emailAddress}) {
    final Map<String, dynamic> data = Map();
    data['email'] = emailAddress;
    return data;
  }

//*=====================================================================   ==========================================================*

  static loadChatRequestModal({required String? receiver_id, required String? service_id, var page, required String? per_page}) {
    final Map<String, dynamic> data = Map();
    data['receiver_id'] = receiver_id;
    data['service_id'] = service_id;
    data['page'] = page;
    data['per_page'] = per_page;
    return data;
  }

  static messageWindowRequestModal({
    required String? chat_id,
  }) {
    final Map<String, dynamic> data = Map();
    data['chat_id'] = chat_id;

    return data;
  }

  static sendMessageRequestModal(
      {required String? message_type, required String? message, required MultipartFile? messageFile, required String? receiverId, required String? serviceId}) {
    final Map<String, dynamic> data = Map();
    data['message_type'] = message_type;
    data['message'] = message;
    data['message_file'] = messageFile;
    data['receiver_id'] = receiverId;
    data['service_id'] = serviceId;
    return data;
  }

  static notificationToggle({
    required var notificationStatus,
  }) {
    final Map<String, dynamic> data = Map();
    data['notification_status'] = notificationStatus;

    return data;
  }

  static chatEndRequestMOdel({
    required String? chatId,
    required String? endChat,
  }) {
    final Map<String, dynamic> data = Map();
    data['chat_id'] = chatId;
    data['end_chat'] = endChat;

    return data;
  }
}
