abstract class UseCase<T> {
  Future<T> execute();
}

abstract class InputUseCase<T, I> {
  Future<T> execute(I input);
}
