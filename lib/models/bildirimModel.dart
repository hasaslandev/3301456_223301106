class BildirimModel {
  final int? id;
  final String? TC;
  final int? fiyat;
  BildirimModel(
      {
        required this.id,required this.TC,required this.fiyat
      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'TC': TC,
      'fiyat': fiyat,

    };
  }

  @override
  String toString() {
    return 'BildirimModel{id: $id, TC: $TC, fiyat: $fiyat}';
  }
}

