

class DateFrameDataList{
	final List<DateFrameData> list;

  DateFrameDataList({
    required this.list,
  });

		factory DateFrameDataList.fromJson(List<dynamic> parsedJson) {

    List<DateFrameData> photos = [];
				photos = parsedJson.map(
						(i)=>DateFrameData.fromJson(i)
				).toList();

    return  DateFrameDataList(
       list: photos ,
    );
  }
}

class DateFrameData {
    DateFrameData({
       required this.number,
       required this.forename,
      	required  this.frameStartDate,
       required this.frameEndDate,
    });

    int number;
    String forename;
    DateTime frameStartDate;
    DateTime frameEndDate;

    factory DateFrameData.fromJson(Map<String, dynamic> json) => DateFrameData(
        number: json["number"] ?? -1,
        forename: json["forename"]?? '',
        frameStartDate:json['frame_start_date'] != null ?   DateTime.parse(json["frame_start_date"])  :  DateTime(2000,01,01) ,
        frameEndDate:json['frame_end_date'] != null ?  DateTime.parse(json["frame_end_date"]) : DateTime(2000,01,01),
    );


}
