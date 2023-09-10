import 'dart:convert';

class DevicesModel {
    String? message;
    Data? data;
    String? status;

    DevicesModel({
        this.message,
        this.data,
        this.status,
    });

    factory DevicesModel.fromRawJson(String str) => DevicesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DevicesModel.fromJson(Map<String, dynamic> json) => DevicesModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
        "status": status,
    };
}

class Data {
    List<Device>? devices;

    Data({
        this.devices,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        devices: json["devices"] == null ? [] : List<Device>.from(json["devices"]!.map((x) => Device.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "devices": devices == null ? [] : List<dynamic>.from(devices!.map((x) => x.toJson())),
    };
}

class Device {
    String? deviceId;
    String? deviceName;
    String? id;

    Device({
        this.deviceId,
        this.deviceName,
        this.id,
    });

    factory Device.fromRawJson(String str) => Device.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Device.fromJson(Map<String, dynamic> json) => Device(
        deviceId: json["deviceId"],
        deviceName: json["deviceName"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "deviceName": deviceName,
        "_id": id,
    };
}
