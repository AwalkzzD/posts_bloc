

/*extension AutoDisposeRefCache on AutoDisposeRef {
  void cacheFor(int minutesDuration) {
    final link = keepAlive();
    final timer = Timer(Duration(minutes: minutesDuration), () => link.close());
    onDispose(() => timer.cancel());
  }
}*/
