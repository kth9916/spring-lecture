package polymorphism_2_3_2;

public class SamsungTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("�ＺTV -- ������ �Ҵ�");

	}

	@Override
	public void powerOff() {
		System.out.println("�ＺTV -- ������ ����");

	}

	@Override
	public void volumUp() {
		System.out.println("�ＺTV -- �Ҹ��� ���δ�");

	}

	@Override
	public void volumDown() {
		System.out.println("�ＺTV -- �Ҹ��� �����");

	}

}
