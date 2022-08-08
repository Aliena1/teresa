class AcceptJobResponse {
  AcceptJobResponse({
    this.status,
    this.message,
  });

  final bool? status;
  final String? message;

  factory AcceptJobResponse.fromJson(Map<String, dynamic> json) => AcceptJobResponse(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

}
