fun int[] filter ( int[] a, Function f ) {
  int b[]
  for (0 => int i; i < a.size(); i++) {
    if (f.apply(a[i])) {
      b[b.size()] = a[i];
    }
  }
  return b;
}

public class Function {
  fun void apply() { }
}