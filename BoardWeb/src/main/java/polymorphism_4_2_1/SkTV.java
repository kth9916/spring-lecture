package polymorphism_4_2_1;

public class SkTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("SkTV - ������ �Ҵ�.");

	}

	@Override
	public void powerOff() {
		System.out.println("SkTV - ������ �Ҵ�.");

	}

	@Override
	public void volumUp() {
		System.out.println("SkTV - ������ �ø���.");

	}

	@Override
	public void volumDown() {
		System.out.println("SkTV - ������ ���δ�.");

	}

}
