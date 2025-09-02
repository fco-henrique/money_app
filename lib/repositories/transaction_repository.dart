import 'package:money_app/common/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addTransaction();
  Future<List<TransactionModel>> getAllTransactions();
}

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<void> addTransaction() {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      TransactionModel(title: "Bolsa", value: 700, date: DateTime.now().millisecondsSinceEpoch),
      TransactionModel(title: "Mesada", value: 150, date: DateTime.now().subtract(Duration(days: 4)).millisecondsSinceEpoch),
      TransactionModel(title: "Academia", value: -80, date: DateTime.now().subtract(Duration(days: 4)).millisecondsSinceEpoch),
    ];
  }
  
}