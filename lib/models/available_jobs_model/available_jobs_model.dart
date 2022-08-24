class AvailableJobsResponse {
  AvailableJobsResponse({
    this.status,
    this.meta,
    this.availableJobsList,
  });

  final bool? status;
  final Meta? meta;
  final AvailableJobsList? availableJobsList;

  factory AvailableJobsResponse.fromJson(Map<String, dynamic> json) => AvailableJobsResponse(
    status: json["status"] == null ? null : json["status"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    availableJobsList: json["availableJobsList"] == null ? null : AvailableJobsList.fromJson(json["availableJobsList"]),
  );

}

class AvailableJobsList {
  AvailableJobsList({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  final num? currentPage;
  final List<Datum>? data;
  final String? firstPageUrl;
  final num? from;
  final num? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic? nextPageUrl;
  final String? path;
  final String? perPage;
  final dynamic? prevPageUrl;
  final num? to;
  final num? total;

  factory AvailableJobsList.fromJson(Map<String, dynamic> json) => AvailableJobsList(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
    from: json["from"] == null ? null : json["from"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
    links: json["links"] == null ? null : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"] == null ? null : json["path"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"] == null ? null : json["to"],
    total: json["total"] == null ? null : json["total"],
  );

}

class Datum {
  Datum({
    this.jobId,
    this.path,
    this.displayImage,
    this.company,
    this.companyLocation,
    this.profession,
    this.reportTo,
    this.companyRateForJobseeker,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.totalDuration,
    this.activeJobStatus,
  });

  final num? jobId;
  final String? path;
  final String? displayImage;
  final String? company;
  final String? companyLocation;
  final String? profession;
  final String? reportTo;
  final num? companyRateForJobseeker;
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final num? totalDuration;
  final bool? activeJobStatus;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    jobId: json["jobId"] == null ? null : json["jobId"],
    path: json["path"] == null ? null : json["path"],
    displayImage: json["display_image"] == null ? null : json["display_image"],
    company: json["company"] == null ? null : json["company"],
    companyLocation: json["company_location"] == null ? null : json["company_location"],
    profession: json["profession"] == null ? null : json["profession"],
    reportTo: json["report_to"] == null ? null : json["report_to"],
    companyRateForJobseeker: json["company_rate_for_jobseeker"] == null ? null : json["company_rate_for_jobseeker"],
    startDate: json["startDate"] == null ? null : json["startDate"],
    endDate: json["endDate"] == null ? null : json["endDate"],
    startTime: json["start_time"] == null ? null : json["start_time"],
    endTime: json["end_time"] == null ? null : json["end_time"],
    totalDuration: json["total_duration"] == null ? null : json["total_duration"],
    activeJobStatus: json["activeJobStatus"] == null ? null : json["activeJobStatus"],
  );


}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"] == null ? null : json["label"],
    active: json["active"] == null ? null : json["active"],
  );


}

class Meta {
  Meta({
    this.currentPage,
    this.perPage,
    this.lastPage,
    this.totalRecords,
    this.nextPage,
    this.isRecordsAvailable,
  });

  final num? currentPage;
  final String? perPage;
  final num? lastPage;
  final num? totalRecords;
  final num? nextPage;
  final bool? isRecordsAvailable;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    totalRecords: json["total_records"] == null ? null : json["total_records"],
    nextPage: json["next_page"] == null ? null : json["next_page"],
    isRecordsAvailable: json["is_records_available"] == null ? null : json["is_records_available"],
  );


}
