package polymorphism_4_2_2;

public class AppleSpeaker implements Speaker {
	
	public AppleSpeaker () {
		System.out.println("====> AppleSpeaker ��ü ���� ");
	}

	@Override
	public void volumUp() {
		System.out.println("AppleSpeaker - ���� ��");

	}

	@Override
	public void volumDown() {
		System.out.println("AppleSpeaker - ���� �ٿ�");

	}

}
