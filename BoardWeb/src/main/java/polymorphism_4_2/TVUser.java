package polymorphism_4_2;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {

	public static void main(String[] args) {
		
		//TVUser Ŭ�������� ��ü�� �������� �ʰ� �ܺ� Ŭ�������� ��ü�� ������ ������ ��ü�� ������ �´�. 
			//���յ��� ���ߴ� ��� , ���� ������ ���� ���� ���ش�. 
		
		// ���յ� ���ߴ� 2 ���� ��� 
			//1. �������̽��� ���. (������ �޼ҵ�)
			//2. ������ ���� Factory ���� 
				// -- ��ü�� �����ϴ� ������ Ŭ������ ����(BeanFactory) <== ��ü ����, ���� 
			//3. Spring �����ӿ�ũ���� ��ü�� ������ �����ϴ� ��� 
					// - IoC (������ ����) : ��ü (������) ===> ��ü (Spring �����ӿ�ũ) 
					// - DI (������ ����) : ��ü�� �ڹ��ڵ� ���ο��� �������� �ʰ� Spring �����ӿ�ũ����
							//��ü�� ������ ��ü�� �ڹ��ڵ� ���η� ���� �Ѵ�. 
		
		
		AbstractApplicationContext factory = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
			//GenericXmlApplicationContext : Bean ���� ������ �ε��� 
		
		
		//������ �����̳ʿ��� ��ü�� ��û 
	
		TV tv = (TV) factory.getBean("tv");   //������ ��ü�� TV Ÿ������ ��ĳ���� 
		
		tv.powerOn();			//TV�� �޼ҵ� ȣ�� ==> ������ ��ü�� �޼ҵ带 ȣ�� 
		tv.powerOff();
		tv.volumUp();
		tv.volumDown();
		
		
		//������ �����̳ʷ� ���� �ϳ��� ��ü�� ������  ��û �� �� �ִ�.  :   ��
		System.out.println("=====================");
		
		TV tv10 = (TV) factory.getBean("tv"); 
		TV tv11 = (TV) factory.getBean("tv"); 
		TV tv12 = (TV) factory.getBean("tv"); 
		TV tv13 = (TV) factory.getBean("tv");
		
		System.out.println(tv10);
		System.out.println(tv11);
		System.out.println(tv12);
		System.out.println(tv13);
		
		factory.close();     //�޸𸮿��� ��ü ����
		
		

				

	}

}
