import 'package:cloud_firestore/cloud_firestore.dart';

class Model {
  QuerySnapshot lebanonQuery, syrianQuery;
  DocumentSnapshot lebanonOfficial, syrianOfficial;
  Model(
      {this.lebanonOfficial,
      this.syrianOfficial,
      this.lebanonQuery,
      this.syrianQuery});
  double get buySyrian => syrianQuery.documents[0].data['buy'].toDouble();
  double get buyLebanon => lebanonQuery.documents[0].data['buy'].toDouble();
}
