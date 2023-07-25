package test.util;

import java.util.ArrayList;
import java.util.List;

public class Wasnkld {
	public static void main(String[] args) {
		int[] arr = { 3, 1, 2, 3, 4, 5, 5, 4, 3, 1, 2, 3, 4, 3, 5 };
		int[] query = { 10, 1, 8, 6, 4, 1, 2, 3 };
		col(arr, query);
		System.out.println(col(arr, query));
	}

	public static int[] col(int[] arr, int[] query) {

		List<Integer> list = new ArrayList<>();
		// list에 int[] arr 넣기
		for (int i = 0; i < arr.length; i++) {
			list.add(arr[i]);
		}
		// query.length 만큼
		for (int j = 0; j < query.length; j++) {
			// query[j] 가 짝수일경우
			if (j % 2 == 0) {
				// query[j] +1 부터 그뒤를 싹 지움
				int size = list.size();
				for (int i = query[j] + 1; i < size; i++) {
					list.remove(query[j] + 1);

				}
				// query[j]가 홀수일경우
			} else {
				// remove(0) query[j]번 실행 ex ) 1,2,3,4,5,6,7 이고 query[j]가 3일경우 0 1 2 를 지우는게 맞는데?
				for (int i = query[j] - 1; i >= 0; i--) {
					list.remove(i);
				}
			}
		}

		int[] answer = new int[list.size()];
		for (int i = 0; i < list.size(); i++) {
			answer[i] = list.get(i);
		}

		return answer;
	}
}
