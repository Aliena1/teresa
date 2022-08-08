class FinanceListResponse {
  FinanceListResponse({
    this.status,
    this.meta,
    this.jobseekerFinanceList,
  });

  final bool? status;
  final Meta? meta;
  final JobseekerFinanceList? jobseekerFinanceList;

  factory FinanceListResponse.fromJson(Map<String, dynamic> json) => FinanceListResponse(
    status: json["status"] == null ? null : json["status"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    jobseekerFinanceList: json["jobseekerFinanceList"] == null ? null : JobseekerFinanceList.fromJson(json["jobseekerFinanceList"]),
  );


}

class JobseekerFinanceList {
  JobseekerFinanceList({
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
  final String? nextPageUrl;
  final String? path;
  final String? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  factory JobseekerFinanceList.fromJson(Map<String, dynamic> json) => JobseekerFinanceList(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
    from: json["from"] == null ? null : json["from"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
    links: json["links"] == null ? null : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"] == null ? null : json["next_page_url"],
    path: json["path"] == null ? null : json["path"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    prevPageUrl: json["prev_page_url"] == null ? null : json["prev_page_url"],
    to: json["to"] == null ? null : json["to"],
    total: json["total"] == null ? null : json["total"],
  );

}

class Datum {
  Datum({
    this.id,
    this.dataId,
    this.path,
    this.displayImage,
    this.company,
    this.companyLocation,
    this.position,
    this.dateCompleted,
    this.shiftHour,
    this.breakHour,
    this.totalHours,
    this.amount,
  });

  final int? id;
  final int? dataId;
  final String? path;
  final String? displayImage;
  final String? company;
  final String? companyLocation;
  final String? position;
  final String? dateCompleted;
  final int? shiftHour;
  final double? breakHour;
  final double? totalHours;
  final double? amount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    dataId: json["dataId"] == null ? null : json["dataId"],
    path: json["path"] == null ? null : json["path"],
    displayImage: json["display_image"] == null ? null : json["display_image"],
    company: json["company"] == null ? null : json["company"],
    companyLocation: json["company_location"] == null ? null : json["company_location"],
    position: json["position"] == null ? null : json["position"],
    dateCompleted: json["date_completed"] == null ? null : json["date_completed"],
    shiftHour: json["shift_hour"] == null ? null : json["shift_hour"],
    breakHour: json["break_hour"] == null ? null : json["break_hour"].toDouble(),
    totalHours: json["total_hours"] == null ? null : json["total_hours"].toDouble(),
    amount: json["amount"] == null ? null : json["amount"].toDouble(),
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
