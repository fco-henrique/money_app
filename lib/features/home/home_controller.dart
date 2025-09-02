import 'package:flutter/foundation.dart';
import 'package:money_app/common/models/transaction_model.dart';
import 'package:money_app/features/home/home_state.dart';
import 'package:money_app/repositories/transaction_repository.dart';
//TODO: import states

class HomeController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;
  HomeController(this._transactionRepository);

  HomeState _state = HomeInitialState();
  HomeState get state => _state;

  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getAllTransactions() async {
    _changeState(HomeLoadingState());
    try {
      _transactions = await _transactionRepository.getAllTransactions();

      _changeState(HomeSuccessState());
    } catch (e) {
      _changeState(HomeErrorState());
    }
  }
}