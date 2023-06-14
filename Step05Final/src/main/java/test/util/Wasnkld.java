package test.util;

import java.util.ArrayList;

public class Wasnkld {
	public static void main(String[] args) {

		String b = "18883333333333333333333333333322";
		String a = "341310957130948019357013409109213";

		int aDvi = a.length() / 9;
		int bDvi = b.length() / 9;
		ArrayList<String> aList = new ArrayList<>();
		ArrayList<Integer> aListInt = new ArrayList<>();

		for (int i = 0; i < a.length() / 9 + a.length() % 9; i++) {
			aList.add(a.substring(i * 9, i * 9 + 8));
			aListInt.add(Integer.parseInt(aList.get(i)));

		}
		System.out.println(aListInt);

		String a0 = a.substring(0, 15);
		String a1 = a.substring(16, 31);

	}

}
