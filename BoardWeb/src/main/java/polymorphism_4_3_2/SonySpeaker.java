package polymorphism_4_3_2;

public class SonySpeaker implements Speaker {
	
	//�⺻ ������ 
	public SonySpeaker() {
		System.out.println("===> �Ҵ� ����Ŀ ��ü ���� ");
	}
	
	@Override
	public void volumUp() {
		System.out.println("SonySpeaker  --- ���� ��");
	}
	
	@Override
	public void volumDown() {
		System.out.println("SonySpeaker  --- ���� �ٿ� ");
	}

}
