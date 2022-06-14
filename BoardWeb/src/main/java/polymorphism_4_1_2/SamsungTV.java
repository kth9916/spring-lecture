package polymorphism_4_1_2;

public class SamsungTV implements TV {
	
	private SonySpeaker speaker;    // ��ü ���� ���� 
	
	public SamsungTV() {  //�⺻ ������ : ��ü�� �����ɶ� ȣ�� 
		
		System.out.println("===> SamsungTV ��ü ���� ");
		
	}
	
	public void initMethod() {   // ��ü ���� ���Ŀ� ���� ���� ȣ�� �Ǵ� �޼ҵ� 
		System.out.println("initMethod ȣ�� : ���� �ʱ�ȭ �Ϸ�");
	}
	
	public void destroyMethod()	{  // ��ü ������ ȣ�� �Ǵ� �޼ҵ� 
		System.out.println("destoryMethod ȣ�� : ��ü ������ ȣ��Ǵ� �޼ҵ� ");
	}
	

	@Override
	public void powerOn() {
		System.out.println("�ＺTV -- ������ �Ҵ�");

	}

	@Override
	public void powerOff() {
		System.out.println("�ＺTV -- ������ ����");

	}

	//������ ���� , ���α׷� ������ ��ü�� ������ ���, ���ο� ����� ����Ŀ�� ��ü �Ҷ� �ڵ带 �����ؾ� �Ѵ�. 
	
	
	@Override
	public void volumUp() {
		speaker = new SonySpeaker(); 	//SonySpeaker ��ü ���� 
		speaker.volumUp();              //SonySpeaker �޼ҵ� ȣ�� 

	}

	@Override
	public void volumDown() {
		speaker = new SonySpeaker(); 
		speaker.volumDown();      

	}

}
