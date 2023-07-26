class UrlString {
  static const baseurl = "http://192.168.100.57:8090/api/";
  // static const baseurl_2 = "http://192.168.100.57:8090/api/";

  static const baseurl_feedback = "http://192.168.100.57:8092/";

  static const point_cardtrack = "${baseurl}point_by_date_cardtrack";
  // static const point_cardtrack_fullinfor = "${baseurl}point_by_date_cardtrack_fullinfor";
  static const point_cardtrack_range =
      "${baseurl}point_by_date_cardtrack/range";
  static const point_cardtrack_number = "${baseurl}point_by_date_number/range";
  static const cardtrack_by_number = "${baseurl}card_number/";
  static const search_customer_name = "${baseurl}search_customer_name/";
  static const active_voucher = "${baseurl}active_voucher";

  static const all_vouchers = "https://crm.vegasegamingclub.com:8443/rest/v10/vouchers/search/";
  static const customer_in_casino = "${baseurl}customer_in_casino";
  static const customer_image = "${baseurl}customer_image";
  static const machine_player = "${baseurl}machine_player";
  static const machine_player_by_machinenumber = "${baseurl}machine_player_by_machine_number";

  static const point_dates = "${baseurl}point_by_date";
  static const point_dates_range = "${baseurl}point_by_date/range";
  static const point_id = "point/"; //WITH ID BEHIND
  static const point_cardnumber = "card_number/"; //WITH ID BEHIND

  static const create_feedBack = "${baseurl_feedback}add_rate";
  static const list_feedback = "${baseurl_feedback}list_rate";

  static const findDateFrame = "${baseurl}dateframe_by_number";
  static const findcustomerFrame = "${baseurl}dateframe_list";
}
