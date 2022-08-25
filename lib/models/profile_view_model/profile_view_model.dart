class ProfileViewModel {
  JobseekerUserProfile? jobseekerUserProfile;
  bool? status;
  String? message;

  ProfileViewModel({this.jobseekerUserProfile, this.status, this.message});

  ProfileViewModel.fromJson(Map<String, dynamic> json) {
    jobseekerUserProfile = json['jobseekerUserProfile'] != null
        ? new JobseekerUserProfile.fromJson(json['jobseekerUserProfile'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobseekerUserProfile != null) {
      data['jobseekerUserProfile'] = this.jobseekerUserProfile!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class JobseekerUserProfile {
  int? id;
  String? fullName;
  String? username;
  int? starRating;
  String? jobType;
  String? address;
  String? profileImage;
  String? profession;
  String? walletAmount;

  JobseekerUserProfile(
      {this.id,
        this.fullName,
        this.username,
        this.starRating,
        this.jobType,
        this.address,
        this.profileImage,
        this.profession,
        this.walletAmount});

  JobseekerUserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    username = json['username'];
    starRating = json['star_rating'];
    jobType = json['job_type'];
    address = json['address'];
    profileImage = json['profile_image'];
    profession = json['profession'];
    walletAmount = json['wallet_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['star_rating'] = this.starRating;
    data['job_type'] = this.jobType;
    data['address'] = this.address;
    data['profile_image'] = this.profileImage;
    data['profession'] = this.profession;
    data['wallet_amount'] = this.walletAmount;
    return data;
  }
}
