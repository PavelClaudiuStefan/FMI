using System;

class Test {
   static void Main() {
      string s = "abc";
      string t = s;

      t += "d";
      Console.WriteLine("s={0} t={1}", s, t);
   }
}