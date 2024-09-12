import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../app/app_colors.dart';

enum LetterStatus { initial, correct, inWord, notInWord }

class Letter extends Equatable{
  const Letter({
    required this.val,
    this.status = LetterStatus.initial,
  });

  factory Letter.empty() => const Letter(val: '');

  final String val;

  final LetterStatus status;

  Color get backgroundColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.transparent;
      case LetterStatus.inWord:
        return inWordColor;
      case LetterStatus.notInWord:
        return notInWordColor;
      case LetterStatus.correct:
        return correctColor;
    }
  }

  Color get borderColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }

  Letter CopyWith({
    String? val,
    LetterStatus? status,
  }) {
    return Letter(
      val: val ?? this.val,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [val, status];
}