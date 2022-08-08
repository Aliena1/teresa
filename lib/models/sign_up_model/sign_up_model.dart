class SignUpResponse {
  SignUpResponse({
    this.email,
    this.firstName,
    this.status,
    this.title,
    this.message,
    this.errors
  });

  final String? email;
  final String? firstName;
  final String? status;
  final String? title;
  final String? message;
  var errors;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    email: json["email"] == null ? null : json["email"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    status: json["status"] == null ? null : json["status"],
    title: json["title"] == null ? null : json["title"],
    message: json["message"] == null ? null : json["message"],
    errors: json["errors"] == null ? null :  json["errors"],
  );

}


class Errors {
  Errors({
    this.username,
    this.c_password,
    this.email,
    this.mobileNumber,
  });

  final List? username;
  final List? c_password;
  final List? email;
  final List? mobileNumber;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    username: json["username"] == null ? null : List.from(json["username"].map((x) => x)),
    c_password: json["c_password"] == null ? null : List.from(json["c_password"].map((x) => x)),
    email: json["email"] == null ? null : List.from(json["email"].map((x) => x)),
    mobileNumber: json["mobile_number"] == null ? null : List.from(json["mobile_number"].map((x) => x)),
  );


}
