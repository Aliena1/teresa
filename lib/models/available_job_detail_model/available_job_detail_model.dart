class AvailableJobDetailResponse {
  AvailableJobDetailResponse({
    this.jobId,
    this.displayImage,
    this.company,
    this.companyLocation,
    this.position,
    this.companyMobileNumber,
    this.companyTelephoneNumber,
    this.companyReportPerson,
    this.baseRateForJobseeker,
    this.jobDetailPdfFile,
    this.path,
    this.companyLatitude,
    this.companyLongitude,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.totalDuration,
    this.companyFlowMap,
    this.companyEntryDetail,
    this.status,
    this.message,
    this.error,
  });

  final int? jobId;
  final String? displayImage;
  final String? company;
  final String? companyLocation;
  final String? position;
  final String? companyMobileNumber;
  final String? companyTelephoneNumber;
  final String? companyReportPerson;
  final int? baseRateForJobseeker;
  final dynamic? jobDetailPdfFile;
  final String? path;
  final String? companyLatitude;
  final String? companyLongitude;
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final num? totalDuration;
  final List<dynamic>? companyFlowMap;
  final List<dynamic>? companyEntryDetail;
  final bool? status;
  final String? message;
  final String? error;

  factory AvailableJobDetailResponse.fromJson(Map<String, dynamic> json) => AvailableJobDetailResponse(
    jobId: json["jobId"] == null ? null : json["jobId"],
    displayImage: json["display_image"] == null ? null : json["display_image"],
    company: json["company"] == null ? null : json["company"],
    companyLocation: json["company_location"] == null ? null : json["company_location"],
    position: json["position"] == null ? null : json["position"],
    companyMobileNumber: json["company_mobile_number"] == null ? null : json["company_mobile_number"],
    companyTelephoneNumber: json["company_telephone_number"] == null ? null : json["company_telephone_number"],
    companyReportPerson: json["company_reportPerson"] == null ? null : json["company_reportPerson"],
    baseRateForJobseeker: json["base_rate_for_jobseeker"] == null ? null : json["base_rate_for_jobseeker"],
    jobDetailPdfFile: json["job_detail_pdf_file"],
    path: json["path"] == null ? null : json["path"],
    companyLatitude: json["companyLatitude"] == null ? null : json["companyLatitude"],
    companyLongitude: json["companyLongitude"] == null ? null : json["companyLongitude"],
    startDate: json["startDate"] == null ? null: json["startDate"],
    endDate: json["endDate"] == null ? null : json["endDate"],
    startTime: json["start_time"] == null ? null : json["start_time"],
    endTime: json["end_time"] == null ? null : json["end_time"],
    totalDuration: json["total_duration"] == null ? null : json["total_duration"],
    companyFlowMap: json["companyFlowMap"] == null ? null : List<dynamic>.from(json["companyFlowMap"].map((x) => x)),
    companyEntryDetail: json["companyEntryDetail"] == null ? null : List<dynamic>.from(json["companyEntryDetail"].map((x) => x)),
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    error: json["error"] == null ? null : json["error"],
  );


}
