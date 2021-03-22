class LabelValue<T> {
  LabelValue({
    this.label,
    this.value,
    this.optional,
  });

  final String label;
  final T value;
  final Map optional;
}
