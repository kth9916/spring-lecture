package polymorphism_4_1_2;

public class TVUser02 {

	public static void main(String[] args) {

		
		System.out.println("===================================");
		//������ ��ü�� ���� �� ��� : �޸��� ���� �ʷ��� 
			TV tv1 = new SamsungTV(); 
			TV tv2 = new SamsungTV(); 
			TV tv3 = new SamsungTV(); 
			TV tv4 = new SamsungTV(); 
			
			System.out.println(tv1);
			System.out.println(tv2);
			System.out.println(tv3);
			System.out.println(tv4);
		
		System.out.println("====================================");
		//�ּҸ� �����ؼ� ����ϸ� �޸��� ���� �ٿ� �� �� �ִ�. 
			TV tv5 = new SamsungTV(); 
			TV tv6 = tv5; 			//tv6�� tv5�� �ּҸ� ������. 
			TV tv7 = tv6; 
			
			System.out.println(tv5);
			System.out.println(tv6);
			System.out.println(tv7);
	}

}
