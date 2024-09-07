class LoginDataModel {
  String? id;
  String? token;
  dynamic lastLogin;
  bool? isSuperuser;
  bool? isStaff;
  bool? isActive;
  String? dateJoined;
  dynamic username;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? mobileNo;
  dynamic countryIsoCode;
  dynamic countryCode;
  dynamic profilePic;
  dynamic idPhoto;
  int? roleId;
  int? status;
  String? isProfileSetup;
  String? tempOtp;
  bool? isMobileVerified;
  bool? accountVerified;
  bool? emailVerified;
  String? createdOn;
  String? dob;
  String? updatedOn;
  String? country;
  String? state;
  String? city;
  bool? notification;
  List<Null>? groups;
  List<Null>? userPermissions;
  List<Null>? servicesAssigned;

  LoginDataModel(
      {this.id,
      this.token,
      this.lastLogin,
      this.isSuperuser,
      this.isStaff,
      this.isActive,
      this.dateJoined,
      this.username,
      this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.mobileNo,
      this.countryIsoCode,
      this.countryCode,
      this.profilePic,
      this.idPhoto,
      this.roleId,
      this.status,
      this.tempOtp,
      this.isMobileVerified,
      this.accountVerified,
      this.emailVerified,
      this.createdOn,
      this.updatedOn,
      this.dob,
      this.groups,
      this.userPermissions,
      this.servicesAssigned,
      this.country,
        this.notification,
      this.state,
      this.isProfileSetup,
      this.city});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    mobileNo = (json['mobile_no']??"").toString();
    countryIsoCode = json['country_iso_code'];
    countryCode = json['country_code'];
    profilePic = json['profile_pic'];
    idPhoto = json['id_photo'];
    roleId = json['role_id'];
    status = json['status'];
    tempOtp = json['temp_otp'];
    isMobileVerified = json['is_mobile_verified'];
    dob = json['dob'];
    accountVerified = json['account_verified'];
    emailVerified = json['email_verified'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    country = json['country'];
    notification = json['notification'];
    state = json['state'];
    city = json['city'];
    isProfileSetup =( json['is_profile_setup']??"").toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['last_login'] = this.lastLogin;
    data['is_superuser'] = this.isSuperuser;
    data['is_staff'] = this.isStaff;
    data['is_active'] = this.isActive;
    data['date_joined'] = this.dateJoined;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['is_profile_setup'] = this.isProfileSetup;
    data['mobile_no'] = this.mobileNo;
    data['country_iso_code'] = this.countryIsoCode;
    data['country_code'] = this.countryCode;
    data['profile_pic'] = this.profilePic;
    data['id_photo'] = this.idPhoto;
    data['role_id'] = this.roleId;
    data['status'] = this.status;
    data['temp_otp'] = this.tempOtp;
    data['is_mobile_verified'] = this.isMobileVerified;
    data['account_verified'] = this.accountVerified;
    data['email_verified'] = this.emailVerified;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['dob'] = this.dob;
    data['notification'] = this.notification;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;

    return data;
  }
}
