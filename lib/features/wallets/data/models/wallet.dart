import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'wallet.g.dart';

@immutable
@Collection()
class Wallet {
  @Id()
  final int id;
  final String name;
  final int balance;

  const Wallet({
    required this.id,
    required this.name,
    required this.balance,
  });
}
