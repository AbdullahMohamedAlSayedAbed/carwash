class RememberMeState {
  final bool isRemembered;

  RememberMeState({required this.isRemembered});

  RememberMeState copyWith({bool? isRemembered}) {
    return RememberMeState(isRemembered: isRemembered ?? this.isRemembered);
  }
}
