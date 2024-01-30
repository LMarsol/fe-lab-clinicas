sealed class Either<L, R> {}

final class Left<L, R> extends Either<L, R> {
  final L value;

  Left(this.value);
}

final class Right<L, R> extends Either<L, R> {
  final R value;

  Right(this.value);
}
