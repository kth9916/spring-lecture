package polymorphism_4_2_2;

import polymorphism_4_3_1.SonySpeaker;

public class SamsungTV implements TV {
	
	private Speaker speaker;    // Speaker �� �������̽� : SonySpeaker, AppleSpeaker
	private int price ; 			// ���� ���� ���� 
	
	public SamsungTV() {  //�⺻ ������ : ��ü�� �����ɶ� ȣ�� 
		
		System.out.println("===> SamsungTV ��ü ���� ");
		
	}
	
	//������ : �Ű� ������ 1���� ������ 
	public SamsungTV(Speaker speaker) {
		System.out.println("===> SamsungTV ��ü ���� 2 : ������ ��ü ����");
		this.speaker = speaker; 
	}
	
	//������ : �Ű� ������ 2���� ������ 
	public SamsungTV(Speaker speaker, int price) {
		System.out.println("===> SamsungTV ��ü ���� 3 : �Ű����� 2���� ������ ȣ��");
		this.speaker = speaker; 
		this.price = price ; 
	}
	

	
	
	
	public void initMethod() {   // ��ü ���� ���Ŀ� ���� ���� ȣ�� �Ǵ� �޼ҵ� 
		System.out.println("initMethod ȣ�� : ���� �ʱ�ȭ �Ϸ�");
	}
	
	public void destroyMethod()	{  // ��ü ������ ȣ�� �Ǵ� �޼ҵ� 
		System.out.println("destoryMethod ȣ�� : ��ü ������ ȣ��Ǵ� �޼ҵ� ");
	}
	

	@Override
	public void powerOn() {
		System.out.println("�ＺTV -- ������ �Ҵ� (���� : " + price  + " )");

	}

	@Override
	public void powerOff() {
		System.out.println("�ＺTV -- ������ ����");

	}

	//������ ���� , ���α׷� ������ ��ü�� ������ ���, ���ο� ����� ����Ŀ�� ��ü �Ҷ� �ڵ带 �����ؾ� �Ѵ�. 
	
	
	@Override
	public void volumUp() {
		
		speaker.volumUp();      //Speaker �޼ҵ� ȣ�� (AppleSpeaker, SonySpeaker) 

	}

	@Override
	public void volumDown() {

		speaker.volumDown();      

	}

}
