
class CustomerList{
	final List<Customer> list;

  CustomerList({
    required this.list,
  });

		factory CustomerList.fromJson(List<dynamic> parsedJson) {

    List<Customer> photos = [];
				photos = parsedJson.map(
						(i)=>Customer.fromJson(i)
				).toList();

    return  CustomerList(
       list: photos,
    );
  }
}

class Customer {
    Customer({
        required this.number,
        required this.preferredName,
        required this.gender,
    });

    int number;
    String preferredName;
    int gender;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        number: json["Number"] ?? "",
        preferredName: json["PreferredName"] ?? "",
        gender: json["Gender"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "Number": number,
        "PreferredName": preferredName,
        "Gender": gender,
    };
}
