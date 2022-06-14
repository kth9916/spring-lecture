package polymorphism_4_3_2;

public class SamsungTV implements TV {
	
	private Speaker speaker;    // Speaker �� �������̽� : SonySpeaker, AppleSpeaker
	private int price ; 			// ���� ���� ���� 
	
	public SamsungTV() {  //�⺻ ������ : ��ü�� �����ɶ� ȣ�� 
		
		System.out.println("===> SamsungTV ��ü ���� ");
		
	}
	
	
	public void setSpeaker (Speaker speaker) {
		System.out.println("=====> setSpeaker () ȣ�� : Setter ȣ��");
		this.speaker = speaker; 
	}
	public void setPrice(int price) {
		System.out.println("====> setPrice() ȣ�� : Setter ȣ��");
		this.price = price; 
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
