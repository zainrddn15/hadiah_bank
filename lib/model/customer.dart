class ModelsCustomer {
  String custId;
  String get getCustID => custId;

  String _name;
  String get getName => _name;

  ModelsCustomer(this.custId, this._name);

  factory ModelsCustomer.fromJson(dynamic json) {
    return ModelsCustomer(
      json['CustID'] as String,
      json['Name'] as String,
    );
  }
}
