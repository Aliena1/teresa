class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.userDetails,
    this.expiresIn,
    this.tokenType,
    this.accessToken,
    this.appVersionUpdateUrl,
  });

  final bool? status;
  final String? message;
  final UserDetails? userDetails;
  final int? expiresIn;
  final String? tokenType;
  final String? accessToken;
  final String? appVersionUpdateUrl;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    userDetails: json["userDetails"] == null ? null : UserDetails.fromJson(json["userDetails"]),
    expiresIn: json["expires_in"] == null ? null : json["expires_in"],
    tokenType: json["token_type"] == null ? null : json["token_type"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
    appVersionUpdateUrl: json["appVersionUpdateUrl"] == null ? null : json["appVersionUpdateUrl"],
  );


}

class UserDetails {
  UserDetails({
    this.id,
    this.guardName,
    this.fullName,
    this.username,
    this.activeStatus,
    this.starRating,
    this.approvalStatus,
    this.approvalStatusRemarks,
    this.jobType,
    this.weeklyWorkHours,
    this.weeklyWorkHoursCompleted,
    this.pushNotificationToken,
    this.address,
    this.profileImage,
    this.profession,
    this.walletAmount,
    this.phoneNumber,
  });

  final int? id;
  final String? guardName;
  final String? fullName;
  final String? username;
  final int? activeStatus;
  final int? starRating;
  final String? approvalStatus;
  final String? approvalStatusRemarks;
  final String? jobType;
  final String? weeklyWorkHours;
  final String? weeklyWorkHoursCompleted;
  final String? pushNotificationToken;
  final String? address;
  final String? profileImage;
  final String? profession;
  final String? walletAmount;
  final dynamic? phoneNumber;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"] == null ? null : json["id"],
    guardName: json["guard_name"] == null ? null : json["guard_name"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    username: json["username"] == null ? null : json["username"],
    activeStatus: json["active_status"] == null ? null : json["active_status"],
    starRating: json["star_rating"] == null ? null : json["star_rating"],
    approvalStatus: json["approval_Status"] == null ? null : json["approval_Status"],
    approvalStatusRemarks: json["approval_Status_remarks"] == null ? null : json["approval_Status_remarks"],
    jobType: json["job_type"] == null ? null : json["job_type"],
    weeklyWorkHours: json["weekly_work_hours"] == null ? null : json["weekly_work_hours"],
    weeklyWorkHoursCompleted: json["weekly_work_hours_completed"] == null ? null : json["weekly_work_hours_completed"],
    pushNotificationToken: json["push_notification_token"] == null ? null : json["push_notification_token"],
    address: json["address"] == null ? null : json["address"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
    profession: json["profession"] == null ? null : json["profession"],
    walletAmount: json["wallet_amount"] == null ? null : json["wallet_amount"],
    phoneNumber: json["phone_number"],
  );


}
