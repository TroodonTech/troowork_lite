class workOrder {
  final String WorkorderScheduleKey;
  final String WorkorderKey;
  final String WorkorderTypeKey;
  final String WorkorderTypeName;
  final String RoomKey;
  final String RoomId;
  final String FacilityName;
  final String FloorName;
  final String ZoneName;
  final String FacilityNameEqp;
  final String IsEquipment;
  final String EmployeeKey;
  final String FirstName;
  final String EquipmentName;
  final String EquipmentType;
  final String WorkorderTime;
  final String WorkorderNotes;
  final String WorkorderStatusKey;
  final String WorkorderStatus;
  final String IsDeleted;
  final String IsPhotoRequired;
  final String IsBarcodeRequired;
  final String ImageName;
  final String PriorityValue;
  final String Color;
  final String IntervalType;

  workOrder({
      this.WorkorderScheduleKey,
      this.WorkorderKey,
      this.WorkorderTypeKey,
      this.WorkorderTypeName,
      this.RoomKey,
      this.RoomId,
      this.FacilityName,
      this.FloorName,
      this.ZoneName,
      this.FacilityNameEqp,
      this.IsEquipment,
      this.EmployeeKey,
      this.FirstName,
      this.EquipmentName,
      this.EquipmentType,
      this.WorkorderTime,
      this.WorkorderNotes,
      this.WorkorderStatusKey,
      this.WorkorderStatus,
      this.IsDeleted,
      this.IsPhotoRequired,
      this.IsBarcodeRequired,
      this.ImageName,
      this.PriorityValue,
      this.Color,
      this.IntervalType});

  factory workOrder.fromJson(Map<String, dynamic> json) {
    return workOrder(
      WorkorderScheduleKey: json['WorkorderScheduleKey'].toString(),
      WorkorderKey: json['WorkorderKey'].toString(),
      WorkorderTypeKey: json['WorkorderTypeKey'].toString(),
      WorkorderTypeName: json['WorkorderTypeName'].toString(),
      RoomKey: json['RoomKey'].toString(),
      RoomId: json['RoomId'].toString(),
      FacilityName: json['FacilityName'].toString(),
      FloorName: json['FloorName'].toString(),
      ZoneName: json['ZoneName'].toString(),
      FacilityNameEqp: json['FacilityNameEqp'].toString(),
      IsEquipment: json['IsEquipment'].toString(),
      EmployeeKey: json['EmployeeKey'].toString(),
      FirstName: json['FirstName'].toString(),
      EquipmentName: json['EquipmentName'].toString(),
      EquipmentType: json['EquipmentType'].toString(),
      WorkorderTime: json['WorkorderTime'].toString(),
      WorkorderNotes: json['WorkorderNotes'].toString(),
      WorkorderStatusKey: json['WorkorderStatusKey'].toString(),
      WorkorderStatus: json['WorkorderStatus'].toString(),
      IsDeleted: json['IsDeleted'].toString(),
      IsPhotoRequired: json['IsPhotoRequired'].toString(),
      IsBarcodeRequired: json['IsBarcodeRequired'].toString(),
      ImageName: json['ImageName'].toString(),
      PriorityValue: json['PriorityValue'].toString(),
      Color: json['Color'].toString(),
      IntervalType: json['IntervalType'].toString(),
    );
  }
}
