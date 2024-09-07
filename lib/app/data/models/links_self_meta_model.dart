/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

class Meta {
  int? pageCount;
  int? totalResults;
  int? currentPageNo;
  int? limit;
  bool? lastPage;

  Meta(
      {this.pageCount,
      this.totalResults,
      this.currentPageNo,
      this.limit,
      this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    pageCount = json['page_count'];
    totalResults = json['total_results'];
    currentPageNo = json['current_page_no'];
    limit = json['limit'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_count'] = this.pageCount;
    data['total_results'] = this.totalResults;
    data['current_page_no'] = this.currentPageNo;
    data['limit'] = this.limit;
    data['last_page'] = this.lastPage;
    return data;
  }
}
