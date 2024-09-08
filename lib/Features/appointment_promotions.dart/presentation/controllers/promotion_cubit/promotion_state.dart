part of 'promotion_cubit.dart';

@immutable
sealed class PromotionState {}

final class PromotionInitial extends PromotionState {}

final class PromotionLoading extends PromotionState {}
final class PromotionFailure extends PromotionState {
  final String errMessage;

  PromotionFailure(this.errMessage);
}
final class PromotionSuccess extends PromotionState {
  final List<PromotionsEntity> data;

  PromotionSuccess({required this.data});
}

