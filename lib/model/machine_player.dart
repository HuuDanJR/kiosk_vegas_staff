import 'dart:convert';

MachinePlayer machinePlayerFromJson(String str) => MachinePlayer.fromJson(json.decode(str));

class MachinePlayer {
    MachinePlayer({
       required this.status,
       required this.message,
       required this.data,
    });

    bool status;
    String message;
    List<DatumMachinePlayer> data;

    factory MachinePlayer.fromJson(Map<String, dynamic> json) => MachinePlayer(
        status: json["status"],
        message: json["message"],
        data: List<DatumMachinePlayer>.from(json["data"].map((x) => DatumMachinePlayer.fromJson(x))),
    );
}

class DatumMachinePlayer {
    DatumMachinePlayer({
      required  this.machinePlayerSessionId,
      required  this.customerNumber,
      required  this.machineNumber,
      required  this.game,
      required  this.startDateTime,
      required  this.endDateTime,
      required  this.buyin,
      required  this.coinOut,
      required  this.gamesPlayed,
      required  this.jackpots,
    });

    int machinePlayerSessionId;
    int customerNumber;
    String machineNumber;
    String game;
    DateTime? startDateTime;
    DateTime? endDateTime;
    double buyin;
    double coinOut;
    int gamesPlayed;
    int jackpots;

    factory DatumMachinePlayer.fromJson(Map<String, dynamic> json) => DatumMachinePlayer(
        machinePlayerSessionId: json["MachinePlayerSessionID"] == null ? null: json["MachinePlayerSessionID"],
        customerNumber:json["Customer_Number"] == null ? null:  json["Customer_Number"],
        machineNumber:json["Machine_Number"] == null ? null:  json["Machine_Number"],
        game:json["Game"] == null ? null:  json["Game"],
        startDateTime: json["StartDateTime"] == null ? null: DateTime.parse(json["StartDateTime"]),
        endDateTime:json["EndDateTime"] == null ? null: DateTime.parse(json["EndDateTime"]),
        buyin:json["Buyin"] == null ? null: json["Buyin"].toDouble(),
        coinOut:json["CoinOut"] == null ? null: json["CoinOut"].toDouble(),
        gamesPlayed:json["GamesPlayed"] == null ? null: json["GamesPlayed"],
        jackpots:json["Jackpots"] == null ? null: json["Jackpots"],
    );
}
