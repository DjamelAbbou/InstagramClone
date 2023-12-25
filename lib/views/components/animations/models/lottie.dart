enum LottieAnimation {
  dataNotFound(name: 'data_not_found'),
  error(name: 'error'),
  empty(name: 'empty'),
  smallError(name: 'small_error'),
  loading(name: 'loading');

  final String name;
  const LottieAnimation({required this.name});
}
