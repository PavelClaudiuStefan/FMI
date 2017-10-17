using System;

class Complex {
   public double a, b;
}

class Test {
   static void Main() {
      int i=1;
      int j=i;

      j++;
      Console.WriteLine("i={0} j={1}", i, j);

      Complex x = new Complex();
      x.a = 1; x.b = 2;
      Complex y = x;
      y.b = 10;
      Console.WriteLine("x.b={0} y.b={1}", x.b, y.b); 
   }
}