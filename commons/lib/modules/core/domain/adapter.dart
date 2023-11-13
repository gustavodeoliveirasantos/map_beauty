abstract class Adapter<T, I> {
  T adapt(I dto);
  I adaptToDTO(T value);
}
