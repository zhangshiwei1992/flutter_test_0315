class Result<T> {
  bool success;
  T value;
  String errorCode;
  String errorMsg;
  Map<String, Object> extraInfo;
  int pageSize = 20;
  int pageNum = 1;
  int totalCount = 0;

  Result({
    this.success,
    this.value,
    this.errorCode,
    this.errorMsg,
    this.extraInfo,
    this.pageSize,
    this.pageNum,
    this.totalCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      success: json['success'],
      value: json['value'],
      errorCode: json['errorCode'],
      errorMsg: json['errorMsg'],
      extraInfo: json['extraInfo'],
      pageSize: json['pageSize'],
      pageNum: json['pageNum'],
      totalCount: json['extraInfo'],
    );
  }
}
