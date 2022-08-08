class WithdrawListResponse {
  WithdrawListResponse({
    this.status,
    this.meta,
    this.transactionLists,
  });

  final bool? status;
  final Meta? meta;
  final TransactionLists? transactionLists;

  factory WithdrawListResponse.fromJson(Map<String, dynamic> json) => WithdrawListResponse(
    status: json["status"] == null ? null : json["status"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    transactionLists: json["transactionLists"] == null ? null : TransactionLists.fromJson(json["transactionLists"]),
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

class TransactionLists {
  TransactionLists({
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

  factory TransactionLists.fromJson(Map<String, dynamic> json) => TransactionLists(
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
    this.jobseekerUserId,
    this.withdrawFund,
    this.status,
    this.crDr,
    this.referenceNumber,
    this.remarks,
    this.fromDate,
    this.toDate,
    this.requestedDate,
    this.verifiedDate,
    this.description,
    this.createdByAdminUserId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? jobseekerUserId;
  final double? withdrawFund;
  final String? status;
  final String? crDr;
  final String? referenceNumber;
  final dynamic? remarks;
  final dynamic? fromDate;
  final String? toDate;
  final String? requestedDate;
  final dynamic? verifiedDate;
  final String? description;
  final dynamic? createdByAdminUserId;
  final dynamic? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    jobseekerUserId: json["jobseeker_user_id"] == null ? null : json["jobseeker_user_id"],
    withdrawFund: json["withdraw_fund"] == null ? null : json["withdraw_fund"].toDouble(),
    status: json["status"] == null ? null : json["status"],
    crDr: json["cr_dr"] == null ? null : json["cr_dr"],
    referenceNumber: json["reference_number"] == null ? null : json["reference_number"],
    remarks: json["remarks"],
    fromDate: json["from_date"],
    toDate: json["to_date"] == null ? null : json["to_date"],
    requestedDate: json["requested_date"] == null ? null : json["requested_date"] ,
    verifiedDate: json["verified_date"],
    description: json["description"] == null ? null : json["description"],
    createdByAdminUserId: json["created_by_admin_user_id"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
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
