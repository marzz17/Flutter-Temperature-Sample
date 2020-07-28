class EmpTemperature {
  int id;
  int fkuserid;
  String temperature;
  bool q1;
  bool q2;
  bool q3;
  String dateregister;
  bool accept;

  EmpTemperature(this.id, this.fkuserid, this.temperature, this.q1, this.q2,
      this.q3, this.dateregister, this.accept);
  EmpTemperature.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkuserid = json['fkuserid'];
    temperature = json['temperature'];
    q1 = json['q1'];
    q2 = json['q2'];
    q3 = json['q3'];
    dateregister = json['dateregister'];
    accept = json['accept'];
  }
}
