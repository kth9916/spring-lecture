package polymorphism_4_2_1;

public class LgTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("LGTV -- ������ �Ҵ�");

	}

	@Override
	public void powerOff() {
		System.out.println("LGTV -- ������ ����");

	}

	@Override
	public void volumUp() {
		System.out.println("LGTV -- �Ҹ��� ���δ�");

	}

	@Override
	public void volumDown() {
		System.out.println("LGTV -- �Ҹ��� �����. ");

	}

}
