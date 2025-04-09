class Pagination {
  final int pageIndex;
  final int pageSize;
  final int count;
  final bool hasReachedMax;

  const Pagination({
    this.pageIndex = 1,
    this.pageSize = 8,
    this.count = 0,
    this.hasReachedMax = false,
  });

  Pagination copyWith({
    int? pageIndex,
    int? pageSize,
    int? count,
    bool? hasReachedMax,
  }) {
    return Pagination(
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      count: count ?? this.count,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}