class ActiveJobResponse {
  ActiveJobResponse({
    this.status,
    this.meta,
    this.activeJobsList,
  });

  final bool? status;
  final Meta? meta;
  final ActiveJobsList? activeJobsList;

  factory ActiveJobResponse.fromJson(Map<String, dynamic> json) => ActiveJobResponse(
    status: json["status"] == null ? null : json["status"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    activeJobsList: json["activeJobsList"] == null ? null : ActiveJobsList.fromJson(json["activeJobsList"]),
  );

}

class ActiveJobsList {
  ActiveJobsList({
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

  final int? currentPage;
  final List<Datum>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic? nextPageUrl;
  final String? path;
  final String? perPage;
  final dynamic? prevPageUrl;
  final int? to;
  final int? total;

  factory ActiveJobsList.fromJson(Map<String, dynamic> json) => ActiveJobsList(
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
    this.id,
    this.jobId,
    this.path,
    this.displayImage,
    this.company,
    this.companyLocation,
    this.startDate,
    this.endDate,
    this.companyShiftStatus,
    this.startTime,
    this.endTime,
    this.totalDays,
    this.reportTo,
    this.companyInfoId,
    this.attendance,
    this.activeJobStatus,
    this.applyLeave,
  });

  final int? id;
  final int? jobId;
  final String? path;
  final String? displayImage;
  final String? company;
  final String? companyLocation;
  final String? startDate;
  final String? endDate;
  final bool? companyShiftStatus;
  final String? startTime;
  final String? endTime;
  final int? totalDays;
  final String? reportTo;
  final int? companyInfoId;
  final bool? attendance;
  final bool? activeJobStatus;
  final bool? applyLeave;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    jobId: json["jobId"] == null ? null : json["jobId"],
    path: json["path"] == null ? null : json["path"],
    displayImage: json["display_image"] == null ? null : json["display_image"],
    company: json["company"] == null ? null : json["company"],
    companyLocation: json["company_location"] == null ? null : json["company_location"],
    startDate: json["startDate"] == null ? null : json["startDate"],
    endDate: json["endDate"] == null ? null : json["endDate"],
    companyShiftStatus: json["company_shift_status"] == null ? null : json["company_shift_status"],
    startTime: json["start_time"] == null ? null : json["start_time"],
    endTime: json["end_time"] == null ? null : json["end_time"],
    totalDays: json["total_days"] == null ? null : json["total_days"],
    reportTo: json["report_to"] == null ? null : json["report_to"],
    companyInfoId: json["companyInfoId"] == null ? null : json["companyInfoId"],
    attendance: json["attendance"] == null ? null : json["attendance"],
    activeJobStatus: json["activeJobStatus"] == null ? null : json["activeJobStatus"],
    applyLeave: json["applyLeave"] == null ? null : json["applyLeave"],
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

  final int? currentPage;
  final String? perPage;
  final int? lastPage;
  final int? totalRecords;
  final int? nextPage;
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
